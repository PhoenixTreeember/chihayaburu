# -*- coding: utf-8 -*-

import os
import glob

dirs = ['test', 'train']
path = os.getcwd()

for dir in dirs:
    csv_name = dir+'.csv'
    fp = open(csv_name, 'w')
    print('open %s' % csv_name)

    flist = glob.glob(dir+'/*/*')
    for file in flist:
        words = file.split('/')
        label = words[-2]
        full_path = path + '/' + file
        fp.write('%s,%s\n' % (full_path, label))

    fp.close()

