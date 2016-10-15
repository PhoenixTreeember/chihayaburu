# -*- coding: utf-8 -*-

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
