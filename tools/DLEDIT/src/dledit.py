# -*- coding: utf-8 -*-
import tkinter as tk
import PIL
import os

glog = None

import gui as gui
import image as im

version = "0.01"

# サポートする画像拡張子リスト
img_ext_list = ['.bmp', '.png', 'jpg']

#------------------------------------------------------------
# 設定
#------------------------------------------------------------
# 画像領域のサイズ
image_area_width = 800
image_area_height = 600
image_dir = "C:/Users/mnatsutani/Pictures"
output_dir = "C:/Users/mnatsutani/Pictures/out"

# 固定選択モード
fixed_sel_mode = True
fixel_sel_sise = 20

#------------------------------------------------------------


class Logger():
    def __init__(self, dir, fname):
        self.dir = dir
        self.fname = fname
        self.fp = open(fname, "w")
        self.en = False

    def enable(self):
        self.en = True

    def disable(self):
        self.en = False

    def write(self, s):
        print(s)
        if self.en:
            self.fp.write(s)

glog = Logger(os.getcwd(), "dledit.log")
ims = im.ImageSelector(glog)



def main():
    global root, gopt, glog
    gui.start(glog)

if __name__ == '__main__':
    global root
    main()