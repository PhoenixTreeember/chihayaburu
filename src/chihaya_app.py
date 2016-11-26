import tensorflow as tf
from tensorflow.python.framework import graph_util
import sys
import argparse
import numpy as np
from PIL import Image
from PIL import ImageOps

from analyze_tools import *

kana_list = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'
image_size = 28
kana_num = len(kana_list)

save_model_name = "model.ckpt"

img_name = "/media/natu/data/data/src/output/test/3/ARIALUNI.TTF_00.png"



def open_input_data(file):
  """
  引数で指定されたcsvファイルから、画像データを読み込む
  """
  images = []
  labels = []


    # 画像ファイルを開き、モノクロ化、リサイズ
  img_ori = Image.open(file)
  img_gray = ImageOps.grayscale(img_ori)
  img_resized = img_gray.resize((image_size,image_size))

  # imageををnumpyに変更して、imagesに追加
  img_ary = np.asarray(img_resized)
  # neg pos 反転
  img_ary_inv = 255 - img_ary
  images.append(img_ary_inv.flatten().astype(np.float32) / 255.0)

  # ラベルの追加
  label_array = np.zeros(kana_num)
  label_array[10] = 10
  labels.append(label_array)

  return images, labels


def main(_):
  print(img_name)
  # mnist = input_data.read_data_sets(FLAGS.data_dir, one_hot=True)
  #  2つのcsvファイルから画像データとラベルの配列を読み込む

  img, labels = open_input_data(img_name)


  with tf.Graph().as_default() as graph:
    # Create the model
    x = tf.placeholder(tf.float32, [None, image_size * image_size], name='image')
    W = tf.Variable(tf.zeros([image_size * image_size, kana_num]), name='weight')
    b = tf.Variable(tf.zeros([kana_num]), name='bias')
    y = tf.matmul(x, W) + b

    y_ = tf.placeholder(tf.float32, [None, kana_num], name='true_label')

    cross_entropy = tf.reduce_mean(tf.nn.softmax_cross_entropy_with_logits(y, y_))

    sess = tf.InteractiveSession(config=tf.ConfigProto(log_device_placement=False))
    saver = tf.train.Saver()
    print('load model %s' % save_model_name)
    saver.restore(sess, save_model_name)

    keep_prob = tf.placeholder("float")

#    y_pred = tf.argmax(y, 1)

    ret = sess.run([y, y_], feed_dict={x: img, y_:labels})
    print(ret[0])

if __name__ == '__main__':
  global img_name
  parser = argparse.ArgumentParser()
  parser.add_argument('--data_dir', type=str, default='/tmp/data',
                      help='Directory for storing data')
  FLAGS = parser.parse_args()
#  img_name = FLAGS.data_dir
  main('')

