# -*- coding: utf-8 -*-
# Copyright 2015 The TensorFlow Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
# ==============================================================================
"""A very simple MNIST classifier.

See extensive documentation at
http://tensorflow.org/tutorials/mnist/beginners/index.md
"""
from __future__ import absolute_import
from __future__ import division
from __future__ import print_function

import argparse

# Import data
from tensorflow.examples.tutorials.mnist import input_data

import tensorflow as tf
import sys
import numpy as np
from PIL import Image
from PIL import ImageOps

from analyze_tools import *


# 夏谷追加
kana_list = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'
image_size = 28
kana_num = len(kana_list)
batch_size = 100
# max_step = 1000
max_step = 200
learning_rate =  1e-4

# 学習結果の保存関係
# 保存に使うファイル名
save_model_name = "model_cnn.ckpt"

# Trueにすると学習結果を保存
save_enable = True

# Trueにすると学習結果を読み込む
load_enable = False

# Trueにすると学習をスキップ
skip_study = False



# 各自の環境に置き換えてください
train_csv = '/media/natu/data/data/src/output/train.csv'
test_csv = '/media/natu/data/data/src/output/test.csv'

# 学習結果出力用にグローバル変数へ
W_conv1 = None
b_conv1 = None
h_conv1 = None

W_conv2 = None
b_conv2 = None
h_conv2 = None

W_fc1 = None
b_fc1 = None
h_pool2_flat = None
h_fc1 = None

W_fc2 = None
b_fc2 = None

fc_size = 128

def input_data_from_csv(file):
  """
  引数で指定されたcsvファイルから、画像データとラベルを読み込み、numpyの配列として返す。
  """
  images = []
  labels = []
  try:
    fp = open(file, 'r')
  except FileNotFoundError:
    print("Error %s がオープンできません" % file)
    sys.exit()

  for l in fp.readlines():
    l = l.rstrip()
    img_name, label = l.split(',')

    # 画像ファイルを開き、モノクロ化、リサイズ
    img_ori = Image.open(img_name)
    img_rgb = img_ori.convert('RGB')
    img_gray = ImageOps.grayscale(img_ori)
    img_resized = img_gray.resize((image_size,image_size))
#    img_resized = img_rgb.resize((image_size,image_size))

    # imageををnumpyに変更して、imagesに追加
    img_ary = np.asarray(img_resized)
    # neg pos 反転
    img_ary_inv = 255 - img_ary
    images.append(img_ary_inv.flatten().astype(np.float32) / 255.0)

    # ラベルの追加
    label_array = np.zeros(kana_num)
    label_array[int(label)] = 1
    labels.append(label_array)

  return images, labels


def inference(images_placeholder, keep_prob):
  """ 予測モデルを作成する関数

  引数:
    images_placeholder: 画像のplaceholder
    keep_prob: dropout率のplaceholder

  返り値:
    y_conv: 各クラスの確率(のようなもの)
  """
  global W_conv1, b_conv1, h_conv1
  global W_conv2, b_conv2, h_conv2
  global W_fc1, b_fc1, h_pool2_flat, h_fc1
  global W_fc2, b_fc2

  # 重みを標準偏差0.1の正規分布で初期化
  def weight_variable(shape):
    initial = tf.truncated_normal(shape, stddev=0.1)
    return tf.Variable(initial)

  # バイアスを標準偏差0.1の正規分布で初期化
  def bias_variable(shape):
    initial = tf.constant(0.1, shape=shape)
    return tf.Variable(initial)

  # 畳み込み層の作成
  def conv2d(x, W):
    return tf.nn.conv2d(x, W, strides=[1, 1, 1, 1], padding='SAME')

  # プーリング層の作成
  def max_pool_2x2(x):
    return tf.nn.max_pool(x, ksize=[1, 2, 2, 1],
                          strides=[1, 2, 2, 1], padding='SAME')

  # 入力を28x28x3に変形
#  x_image = tf.reshape(images_placeholder, [-1, 28, 28, 3])
  x_image = tf.reshape(images_placeholder, [-1, 28, 28, 1])

  # 畳み込み層1の作成
  with tf.name_scope('conv1') as scope:
#    W_conv1 = weight_variable([5, 5, 3, 32])
    W_conv1 = weight_variable([5, 5, 1, 32])

    b_conv1 = bias_variable([32])
    h_conv1 = tf.nn.relu(conv2d(x_image, W_conv1) + b_conv1)

  # プーリング層1の作成
  with tf.name_scope('pool1') as scope:
    h_pool1 = max_pool_2x2(h_conv1)

  # 畳み込み層2の作成
  with tf.name_scope('conv2') as scope:
    W_conv2 = weight_variable([5, 5, 32, 64])
    b_conv2 = bias_variable([64])
    h_conv2 = tf.nn.relu(conv2d(h_pool1, W_conv2) + b_conv2)

  # プーリング層2の作成
  with tf.name_scope('pool2') as scope:
    h_pool2 = max_pool_2x2(h_conv2)

  # 全結合層1の作成
  with tf.name_scope('fc1') as scope:
    W_fc1 = weight_variable([7 * 7 * 64, fc_size])
    b_fc1 = bias_variable([fc_size])
    h_pool2_flat = tf.reshape(h_pool2, [-1, 7 * 7 * 64])
    h_fc1 = tf.nn.relu(tf.matmul(h_pool2_flat, W_fc1) + b_fc1)
    # dropoutの設定
    h_fc1_drop = tf.nn.dropout(h_fc1, keep_prob)

  # 全結合層2の作成
  with tf.name_scope('fc2') as scope:
    W_fc2 = weight_variable([fc_size, kana_num])
    b_fc2 = bias_variable([kana_num])

  # ソフトマックス関数による正規化
  with tf.name_scope('softmax') as scope:
    y_conv = tf.nn.softmax(tf.matmul(h_fc1_drop, W_fc2) + b_fc2)

  # 各ラベルの確率のようなものを返す
  return y_conv

def loss(logits, labels):
  """ lossを計算する関数

  引数:
    logits: ロジットのtensor, float - [batch_size, NUM_CLASSES]
    labels: ラベルのtensor, int32 - [batch_size, NUM_CLASSES]

  返り値:
    cross_entropy: 交差エントロピーのtensor, float

  """

  # 交差エントロピーの計算
  cross_entropy = -tf.reduce_sum(labels * tf.log(logits))
  # TensorBoardで表示するよう指定
  tf.scalar_summary("cross_entropy", cross_entropy)
  return cross_entropy


def training(loss, learning_rate):
  """ 訓練のopを定義する関数
  引数:
    loss: 損失のtensor, loss()の結果
    learning_rate: 学習係数

  返り値:
    train_step: 訓練のop

  """

  train_step = tf.train.AdamOptimizer(learning_rate).minimize(loss)
  return train_step


def accuracy(logits, labels):
  """ 正解率(accuracy)を計算する関数

  引数:
    logits: inference()の結果
    labels: ラベルのtensor, int32 - [batch_size, NUM_CLASSES]

  返り値:
    accuracy: 正解率(float)

  """
  correct_prediction = tf.equal(tf.argmax(logits, 1), tf.argmax(labels, 1))
  accuracy = tf.reduce_mean(tf.cast(correct_prediction, "float"))
  tf.scalar_summary("accuracy", accuracy)
  return accuracy


def main(_):
  # mnist = input_data.read_data_sets(FLAGS.data_dir, one_hot=True)
  #  2つのcsvファイルから画像データとラベルの配列を読み込む
  train_img, train_label = input_data_from_csv(train_csv)
  test_img, test_label = input_data_from_csv(test_csv)
  train_data_size = len(train_img)


  with tf.Graph().as_default():
    with tf.device('/gpu:0'):
      # Create the model
      # https://www.tensorflow.org/versions/0.6.0/tutorials/mnist/pros/index.html

      # 画像を入れる仮のTensor
      images_placeholder = tf.placeholder("float", shape=(None, image_size * image_size))
      # ラベルを入れる仮のTensor
      labels_placeholder = tf.placeholder("float", shape=(None, kana_num))
      # dropout率を入れる仮のTensor
      keep_prob = tf.placeholder("float")

      # inference()を呼び出してモデルを作る
      logits = inference(images_placeholder, keep_prob)

      # loss()を呼び出して損失を計算
      loss_value = loss(logits, labels_placeholder)
      # training()を呼び出して訓練
      train_op = training(loss_value, learning_rate)
      # 精度の計算
      acc = accuracy(logits, labels_placeholder)

      # 保存の準備
      saver = tf.train.Saver()
      # Sessionの作成
      sess = tf.Session(config=tf.ConfigProto(allow_soft_placement=True, log_device_placement=False))
      # 変数の初期化
      if load_enable:
        print('load model %s' % save_model_name)
        saver.restore(sess, save_model_name)
      else:
        sess.run(tf.initialize_all_variables())

      # TensorBoardで表示する値の設定
      summary_op = tf.merge_all_summaries()
      summary_writer = tf.train.SummaryWriter('data/tarin', sess.graph_def)

      # 訓練の実行
      if not skip_study:
        for step in range(max_step):
          for i in range(len(train_img) // batch_size):
            # batch_size分の画像に対して訓練の実行
            batch = batch_size * i
            # feed_dictでplaceholderに入れるデータを指定する
            sess.run(train_op, feed_dict={
              images_placeholder: train_img[batch:batch + batch_size],
              labels_placeholder: train_label[batch:batch + batch_size],
              keep_prob: 0.5})

          # 1 step終わるたびに精度を計算する
          train_accuracy = sess.run(acc, feed_dict={
            images_placeholder: train_img,
            labels_placeholder: train_label,
            keep_prob: 1.0})
          # print("step %d, training accuracy %g" % (step, train_accuracy))
          test_accrracy = sess.run(acc, feed_dict={
            images_placeholder: test_img,
            labels_placeholder: test_label,
            keep_prob: 1.0})

          print("step %d, training accuracy %g, test accuracy %g" % (step, train_accuracy, test_accrracy))


          # 1 step終わるたびにTensorBoardに表示する値を追加する
          summary_str = sess.run(summary_op, feed_dict={
            images_placeholder: train_img,
            labels_placeholder: train_label,
            keep_prob: 1.0})
          summary_writer.add_summary(summary_str, step)
      else:
        print('study skipped')

    if save_enable:
      print("saving %s" % save_model_name)
      saver.save(sess, save_model_name)


          # 訓練が終了したらテストデータに対する精度を表示
    train_accuracy = sess.run(acc, feed_dict={
      images_placeholder: train_img,
      labels_placeholder: train_label,
      keep_prob: 1.0})

    test_accrracy = sess.run(acc, feed_dict={
      images_placeholder: test_img,
      labels_placeholder: test_label,
      keep_prob: 1.0})

    wc1 = W_conv1.eval(session=sess)
    bc1 = b_conv1.eval(session=sess)
#    hc1 = h_conv1.eval(session=sess)

    wc2 = W_conv2.eval(session=sess)
    bc2 = b_conv2.eval(session=sess)
#    hc2 = h_conv2.eval(session=sess)

    wfc1 = W_fc1.eval(session=sess)
    bfc1 = b_fc1.eval(session=sess)
#    hp2 = h_pool2_flat.eval(session=sess)
#    hfc1 = h_fc1.eval(session=sess)

    wfc2 = W_fc2.eval(session=sess)
    bfc2 = b_fc2.eval(session=sess)

    np.save('wc1.npy', wc1)
    np.save('bc1.npy', bc1)

    np.save('wc2.npy', wc2)
    np.save('bc2.npy', bc2)

    np.save('wfc1.npy', wfc1)
    np.save('bfc1.npy', bfc1)

    np.save('wfc2.npy', wfc2)
    np.save('bfc2.npy', bfc2)



    print("FINAL, training accuracy %g, test accuracy %g" % (train_accuracy, test_accrracy))




if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('--data_dir', type=str, default='/tmp/data',
                      help='Directory for storing data')
  FLAGS = parser.parse_args()
  main('')


