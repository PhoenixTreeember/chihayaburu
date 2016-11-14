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
from tensorflow.python.framework import graph_util
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
max_step = 1000

# 学習結果の保存関係
# 保存に使うファイル名
save_model_name = "model.ckpt"

# Trueにすると学習結果を保存
save_enable = True

# Trueにすると学習結果を読み込む
load_enable = True
#load_enable = False

# Trueにすると学習をスキップ
skip_study = True
#skip_study = False



# 各自の環境に置き換えてください
train_csv = '/media/natu/data/data/src/output/train.csv'
test_csv = '/media/natu/data/data/src/output/test.csv'


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
    img_gray = ImageOps.grayscale(img_ori)
    img_resized = img_gray.resize((image_size,image_size))

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


def main(_):
  # mnist = input_data.read_data_sets(FLAGS.data_dir, one_hot=True)
  #  2つのcsvファイルから画像データとラベルの配列を読み込む
  train_img, train_label = input_data_from_csv(train_csv)
  test_img, test_label = input_data_from_csv(test_csv)
  train_data_size = len(train_img)


  with tf.Graph().as_default() as graph:
    with tf.device('/gpu:0'):
      # Create the model
      x = tf.placeholder(tf.float32, [None, image_size * image_size], name='image')
      W = tf.Variable(tf.zeros([image_size * image_size, kana_num]), name='weight')
      b = tf.Variable(tf.zeros([kana_num]), name='bias')
      y = tf.matmul(x, W) + b

    # Define loss and optimizer
      y_ = tf.placeholder(tf.float32, [None, kana_num], name='true_label')

    # The raw formulation of cross-entropy,
    #
    #   tf.reduce_mean(-tf.reduce_sum(y_ * tf.log(tf.softmax(y)),
    #                                 reduction_indices=[1]))
    #
    # can be numerically unstable.
    #
    # So here we use tf.nn.softmax_cross_entropy_with_logits on the raw
    # outputs of 'y', and then average across the batch.
      cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_))
      train_step = tf.train.GradientDescentOptimizer(0.5).minimize(cross_entropy)

    #sess = tf.InteractiveSession()
    # Train
    #tf.initialize_all_variables().run()
    # 変数の初期化
    sess = tf.InteractiveSession(config=tf.ConfigProto(log_device_placement=False))
    saver = tf.train.Saver()
    train_writer = tf.train.SummaryWriter('data/tarin', sess.graph)

    if load_enable:
      print('load model %s' % save_model_name)
      saver.restore(sess, save_model_name)
    else:
      sess.run(tf.initialize_all_variables())

    if not skip_study:
      for step in range(max_step):
        for i in range(train_data_size//batch_size):    # //は切り捨て
          batch = batch_size * i
          sess.run(train_step, feed_dict={
            x: train_img[batch:batch + batch_size],
            y_: train_label[batch:batch + batch_size]})


        # Test trained model
        if step % 100 == 0:
          correct_prediction = tf.equal(tf.argmax(y, 1), tf.argmax(y_, 1))
          accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
          acc_summ = tf.scalar_summary('learning/Accuracy', accuracy)
          print('step=%d  :' % step, end="")
          _, train_acc_summ = sess.run([accuracy, acc_summ], feed_dict={x: test_img,
                                                 y_: test_label})

          train_writer.add_summary(train_acc_summ, step)
          print(accuracy)
    else:
      print('study skipped')

    if save_enable:
      print("saving %s" % save_model_name)
      saver.save(sess, save_model_name)


    print('final')
    correct_prediction = tf.equal(tf.argmax(y, 1), tf.argmax(y_, 1))
    accuracy = tf.reduce_mean(tf.cast(correct_prediction, tf.float32))
    y_true = tf.argmax(y_, 1)
    y_pred = tf.argmax(y, 1)

    acc, y_true, y_pred, W, b = sess.run([accuracy, y_true, y_pred, W, b], feed_dict={x: test_img, y_: test_label})
    print(acc)

    np.savetxt('W.csv', W, delimiter=',')
    np.savetxt('b.csv', b, delimiter=',')

    i = 0
    for Wn in W.T:
      img = Image.new('RGB', (28,28))
      for y in range(28):
        for x in range(28):
          v = Wn[y*28+x]
          v16 = int(v*500)
          if v < 0:
            col = (v16, 0 ,0)
          else:
            col = (v16, v16, v16)
          img.putpixel((x,y), col)
      imgx8 = img.resize((28*8, 28*8))
#      img.save('weight/w_' + str(i) + '.png')
#      imgx8.save('weight/w4_' + str(i) + '.png')

      i+=1



    graph_def = graph_util.convert_variables_to_constants(
      sess, graph.as_graph_def(), ['true_label', 'weight', 'bias'])  # 出力層の名前を指定

    tf.train.write_graph(graph_def, '.',
                         'graph.pb.txt', as_text=True)

#    print(y_true)
#    print(y_pred)

    # 上手く動かない時はここをコメントアウト
    make_confusion_matrix(y_true, y_pred, kana_list)

if __name__ == '__main__':
  parser = argparse.ArgumentParser()
  parser.add_argument('--data_dir', type=str, default='/tmp/data',
                      help='Directory for storing data')
  FLAGS = parser.parse_args()
  main('')


