# -*- coding: utf-8 -*-
import glob
import os
import datetime
import locale
import PIL.Image, PIL.ImageTk
import dledit

class ImageSelector():
    def __init__(self):
        self.image_dir = ""
        self.index = ""
        self.image_list = []
        self.fp =None

    def update(self, dir):
        dledit.global_optiton.set('image_dir', dir)
        self.image_dir = dir
        self.log('ImageSelector update %s\n' % self.image_dir)
        files = os.listdir(self.image_dir)

        # 画像リストの更新
        self.image_list = []
        for f in files:
            for ext in dledit.img_ext_list:
                if f.endswith(ext):
                    self.image_list.append(f)
        self.index = 0
        self.log(self.image_list)

    def get_index(self):
        return self.index

    def get_image_num(self):
        return len(self.image_list)

    def get_image_name(self):
        return self.image_list[self.index]

    def next_image(self):
        if self.index + 1 < len(self.image_list):
            self.index += 1

    def prev_image(self):
        if self.index != 0:
            self.index -= 1

    def log(self,s):
        dledit.log.write(s)

    def save_image(self, pos):
        print("save_imege")
        print(pos)
        if self.fp == None:
            self.open_label_file()

        x1, y1, x2, y2 = pos
        ori_img_name = self.get_image_name()
        input_dir = dledit.global_optiton.get('image_dir')
        output_dir = dledit.global_optiton.get('output_dir')
        out_img_name = "%s_%s_%s_%s_%s.jpg" % (self.get_image_name(), x1, y1, x2, y2)
        out_full_path = output_dir + '/' + out_img_name

        ori_img = PIL.Image.open(input_dir+'/'+ori_img_name)
        out_img = ori_img.crop((x1,y1,x2,y2))
        out_img.save(out_full_path)

        self.log("save %s" % out_full_path)
        self.fp.write("%s\t%s\t%s\t%s\t%s\n" % (out_full_path, x1, y1, x2, y2))
        self.fp.flush()

    def open_label_file(self):
        output_dir = dledit.global_optiton.get('output_dir')
        date = datetime.datetime.today()
        fname = date.strftime("%Y%m%d_%H%M%S") + ".txt"
        full_path = output_dir+'/'+fname
        self.fp = open(full_path, "w")
        self.log("open labal file %s" % full_path)

def create_zoom_im(file, width, height):
    """
    fileで指定された画像を開き、width, heightに収まるように縮小する。
    縮小された画像(im)と拡大率をペアで返す。
    """
    img = PIL.Image.open(file)
    img_w, img_h = img.size
    rate_w = width / float(img_w)
    rate_h = height / float(img_h)
    rate = min((rate_w, rate_h))
    img.thumbnail((width, height))

    return PIL.ImageTk.PhotoImage(img), rate
