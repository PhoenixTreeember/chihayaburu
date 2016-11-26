import struct
import glob
import os
from PIL import Image

etl_dir = '/media/natu/data/data/sansou/ETL8G/'
# output_dir = '/media/natu/data/src/output'
output_dir = '/home/natu/data/src/output'

sz_record = 8199

hira_list = ['A', 'I', 'U', 'E', 'O', 'SA', 'SU','SHI','SE', 'SO',
             'KA', 'KI',  'KU',  'KE',  'KO', 'TA', 'CHI', 'TSU',  'TE', 'TO',
             'NA', 'NI', 'NU', 'NE', 'NO', 'HA',  'HI', 'FU', 'HE', 'HO',
             'MA', 'MI', 'MU', 'ME', 'MO', 'YA', 'YU', 'YO', 'RA', 'RI', 'RU', 'RE', 'RO', 'WA']

kana_list = 'あいうえおかきくけこさしすせそたちつてとなにぬねのはひふへほまみむめもやゆよらりるれろわをん'


def read_record_ETL8G(f):
  s = f.read(8199)
  r = struct.unpack('>2H8sI4B4H2B30x8128s11x', s)
  iF = Image.frombytes('F', (128, 127), r[14], 'bit', 4)
  iL = iF.convert('L')
  return r + (iL,)




def make_kana_dirs(dir):
  """ひらがな格納用ディレクトリの作成"""
  print("making dirs %s" % dir)
  for i in range(len(kana_list)):
    target_dir = dir + '/' + str(i)
    os.makedirs(target_dir, exist_ok=True)


make_kana_dirs(output_dir + '/' + "train")

for i in range(33):
  etl_name = "ETL8G_%02d" % (i + 1)
  etl_pass = etl_dir + etl_name
  print("open %s" % etl_pass)

  for id_record in range(950):
    with open(etl_pass, 'rb') as f:
      f.seek(id_record * sz_record)
      r = read_record_ETL8G(f)

    s = str(r[2])
    s1 = s[2:]
    yomi, type = s1.split('.')


    if type.find('HIRA') != -1:
      if yomi in hira_list:
#        print(yomi)
        iE = Image.eval(r[-1], lambda x: 255 - x * 16)

        index = hira_list.index(yomi)
        kana = kana_list[index]

        fn = output_dir + '/train/'+ str(index) +'/' + etl_name + '_00.png'
        print(fn)
        iE.save(fn, 'PNG')
