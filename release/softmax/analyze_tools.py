# -*- coding: utf-8 -*-
import numpy as np

import matplotlib
import matplotlib.pyplot as plt
from matplotlib.font_manager import FontProperties

from sklearn.metrics import confusion_matrix

font_path = '/usr/share/fonts/truetype/takao-gothic/TakaoPGothic.ttf'
font_prop = FontProperties(fname=font_path)
matplotlib.rcParams['font.family'] = font_prop.get_name()

# 参考
# http://scikit-learn.org/stable/auto_examples/model_selection/plot_confusion_matrix.html#sphx-glr-auto-examples-model-selection-plot-confusion-matrix-py

# フォント周りの設定はここも参考
# http://qiita.com/conta_/items/4b031a44acceb137ec73

def make_confusion_matrix(y_true, y_pred, labels, image_name='confusion_matrix.png'):
  cm = confusion_matrix(y_true, y_pred)

  cmap = plt.cm.Blues
  plt.imshow(cm, interpolation='nearest', cmap=cmap)
  plt.title('confusion matrix')
  plt.colorbar()
  tick_marks = np.arange(len(labels))
  plt.xticks(tick_marks, labels, rotation=0)
  plt.yticks(tick_marks, labels)

  plt.tight_layout()
  plt.ylabel('正解')
  plt.xlabel('判定')
  plt.savefig(image_name)
  print('confusion matrix %s' % image_name)
#  plt.show()

  return cm



if __name__ == '__main__':
  y_true = [2, 0, 2, 2, 0, 1]
  y_pred = [0, 0, 2, 2, 0, 2]
  labels = ['cat', 'dog', 'bird']
  ret = make_confusion_matrix(y_true, y_pred, labels)
  print(ret)
