# -*- coding: utf-8 -*-
import dledit


class Option():
    def __init__(self):
        self.dic = {}

    def set(self, key, val):
        self.dic[key] = val
        self.log('opt update: "%s" %s\n' % (key, str(val)))

    def get(self, key):
        return self.dic[key]

    def log(self, s):
        dledit.log.write(s)


