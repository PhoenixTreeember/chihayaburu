# -*- coding: utf-8 -*-
import os
from PIL import Image, ImageDraw, ImageFont

# 出力ディレクトリ
output_dir = './output'
train_dir = "train"     # 学習データ用ディレクトリ
test_dir = "test"       # テスト用ディレクトリ

font_dir = "C:\\Windows\\Fonts\\"
ori_size = 40
ori_size_margin = 6 # 下が切れることがあるのでキャンバスにマージンを入れる。
output_size = 28 # for MNIST
font_list = ('ARIALUNI.TTF',
'batang.ttc',
'CRccgYuk.TTF',
'CRCCGYUK4.ttf',
'gulim.ttc',
'HGRGE.TTC',
'HGRGM.TTC',
'HGRGY.TTC',
'HGRKK.TTC',
'HGRMB.TTC',
'HGRME.TTC',
'HGRPP1.TTC',
'HGRPRE.TTC',
'HGRSGU.TTC',
'HGRSKP.TTF',
'HGRSMP.TTF',
'JCHW00U.TTC',
'JGTR00M.TTC',
'jgtr00m4.ttc',
'jlei00m.ttc',
'jlei00m4.ttc',
'JOVR00H.TTC',
'jpop04b.ttc',
'jpop04b4.ttc',
'JPOP05H.TTC',
'JSKA00H.TTC',
'jska00h4.ttc',
'kaiu.ttf',
'malgun.ttf',
'malgunbd.ttf',
'meiryo.ttc',
'meiryob.ttc',
'MSJH.TTC',
'msjh.ttf',
'MSJHBD.TTC',
'msjhbd.ttf',
'msmincho.ttc',
'MSYH.TTC',
'msyh.ttf',
'MSYHBD.TTC',
'msyhbd.ttf',
'PrimeSansFull.ttf',
'Ricty-Bold.ttf',
'Ricty-Regular.ttf',
'simfang.ttf',
'simhei.ttf',
'simkai.ttf',
'simsun.ttc',
'VL-Gothic-Regular.ttf',
'VL-PGothic-Regular.ttf',
'YUGOTHB.TTC',
'YUGOTHL.TTC',
'YUGOTHM.TTC',
'YUGOTHR.TTC',
'YUMIN.TTF',
'YUMINDB.TTF',
'YUMINL.TTF',
'msgothic.ttc')


# test用データ（フォント）の数
test_font_cnt = 0
test_font_num = 10


# 出力フォーマットを拡張子で指定。bmp, jpg, pngから選択
output_ext = 'png'

# 色の定義
white = (255, 255, 255)
black = (0, 0, 0)


kana_list = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'
#kana_list = ['あ', ]


def make_images(font, dir):
    """
    引数に指定されたフォントで「あ」から「ん」までの画像ファイルを作る。
    出力先は引数のdirディレクトリ。
    """
    global test_font_cnt
    print('making images %s' % font)
    for i in range(len(kana_list)):
        img = Image.new("RGBA", (ori_size + ori_size_margin, ori_size + ori_size_margin), white)
        draw = ImageDraw.Draw(img)

        try:
            draw.font = ImageFont.truetype(font_dir + font, ori_size)
        except OSError:
            print('passed')
            return

        draw.text((0, 0), kana_list[i], black)
        img.thumbnail((output_size, output_size))
        # 出力画像をゆがめたりする場合は、_00を01,02等に変更する。
        file_name = dir+'/'+str(i)+'/'+font+'_00.'+output_ext
        img.save(file_name)

    test_font_cnt += 1

def get_font_list():
    """osにインストールされているフォントファイルのリストを返す。"""
#    flist = os.listdir(font_dir)
    return font_list

def make_kana_dirs(dir):
    """ひらがな格納用ディレクトリの作成"""
    print("making dirs %s" % dir)
    for i in range(len(kana_list)):
        target_dir = dir + '/' + str(i)
        os.makedirs(target_dir,  exist_ok=True)


def make_directories():
    """出力ディレクトリの作成"""
    for d in (train_dir, test_dir):
        make_kana_dirs(output_dir+'/'+d)


def show_info():
    """情報の表示"""
    print('font directory:%s' % font_dir)
    print('output directory:%s' % output_dir)
    print('')


def main():
    """main関数"""
    show_info()
    make_directories()

    fonts = get_font_list()

    for font in fonts:
        if test_font_cnt < test_font_num:
            target_dir = output_dir+'/'+test_dir
        else:
            target_dir = output_dir+'/'+train_dir
        make_images(font, target_dir)


if __name__ == '__main__':
    main()