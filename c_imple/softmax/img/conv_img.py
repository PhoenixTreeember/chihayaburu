import numpy as np
from PIL import Image
from PIL import ImageOps

input_dir = 'png'
output_dir = 'output'
files = ['A.png', 'I.png', 'U.png', 'E.png', 'O.png']

def write_data(f, mtx):
  fname = output_dir + '/' + f + '.txt'
  with open(fname, 'w') as fp:
    for v in mtx:
      fp.write("%02X\n" % (255 - int(v)))

  print("write %s" % fname)


for f in files:
  fname = input_dir + '/' + f
  img_ori = Image.open(fname)
  img_gray = ImageOps.grayscale(img_ori)


  # imageををnumpyに変更して、imagesに追加
  img_ary = np.asarray(img_gray)
  img_flat = img_ary.flatten().astype(np.float32)

  write_data(f, img_flat)


