# -*- coding: utf-8 -*-
import tkinter as tk
import PIL
import os

import gui as gui
import image as im
import logger
import opt

version = "0.01"

# サポートする画像拡張子リスト
img_ext_list = ['.bmp', '.png', 'jpg']

# 画像領域のサイズ
image_area_width = 800
image_area_height = 600

ims = im.ImageSelector()
log = logger.Logger(os.getcwd(), "dledit.log")
global_optiton = opt.Option()

def main():
    global root
    gui.start()


if __name__ == '__main__':
    global root
    main()