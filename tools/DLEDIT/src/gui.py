# -*- coding: utf-8 -*-
import os
import tkinter as tk
from tkinter import filedialog
import PIL.Image, PIL.ImageTk


import dledit
import image

root = tk.Tk()
root_mf = None


def start():
    global root, root_mf
    root.title("DLEDITOR")
    menu()
    root.option_add('*font', 'FixedSys 12')
    root_mf = MainFrame()
    root_mf.pack()

    root.bind('<KeyPress-s>', root_mf.output_frame.save_key)

    root.mainloop()


def about():
    about_win = tk.Toplevel()
    message = 'DLEDIT\nversiton:%s' % dledit.version
    tk.Message(about_win, text=message).pack()



def menu():
    """メニューの作成"""
    menubar = tk.Menu(root)
    root.configure(menu=menubar)
    menubar.add_command(label="Open", command=open)
    menubar.add_command(label="About", command=about)
    menubar.add_command(label="Quit", command=root.quit)


def open():
    cdir = os.getcwd()
    dirname = tk.filedialog.askopenfilename(initialdir=cdir, title=u'画像を一枚選択してください')
    image_dir = os.path.dirname(dirname)
    update_image_list(image_dir)


def update_image_list(image_dir):
    """画像リストの更新"""
    dledit.ims.update(image_dir)
    root_mf.image_frame.update_status()

class MainFrame(tk.Frame):
    """ Frame with three label """
    def __init__(self, master=root):
        tk.Frame.__init__(self, master)

        # First Label
        self.image_frame = ImageFrame(self)
        self.image_frame.grid(row=0,column=0)

        self.label_frame = LabelFrame(self)
        self.label_frame.grid(row=0,column=1)

        self.output_frame = OutputFrame(self)
        self.output_frame.grid(row=1,column=0)



class ImageFrame(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        self.canvas_w = dledit.image_area_width
        self.canvas_h = dledit.image_area_height

        self.canvas = tk.Canvas(self, width = self.canvas_w, height = self.canvas_h)
        self.canvas.pack()

        im = PIL.Image.open('..\\img\\computer_jinkou_chinou.png')
        self.image1 = PIL.ImageTk.PhotoImage(im)
        self.canvas.create_image(0, 0, image = self.image1, anchor="nw")

        self.image_sel = ImageSelFrame(self)
        self.image_sel.pack(anchor='w')

        # 表示された画像の拡大率
        self.rate = 1.0
        self.sx = 0
        self.sy = 0
        self.ex = 0
        self.ey = 0
        self.mx = 0
        self.my = 0
        self.id = None

        self.ondrag = False
        self.mouse_status = ""

    def update_image(self):
        "画像更新時の処理"
        dir = dledit.global_optiton.get('image_dir')
        file = dledit.ims.get_image_name()
        file_path = "%s/%s" % (dir, file)
        im, rate = image.create_zoom_im(file_path, self.canvas_w,  self.canvas_h)
        self.image1 = im
        self.rate = rate
        self.canvas.create_image(0, 0, image=self.image1, anchor="nw")

        dledit.log.write("update_image self.id = %s" % str(self.id))
        if self.id != None:
            self.canvas.delete(self.id)
            self.id = self.canvas.create_rectangle(self.sx, self.sy, self.ex, self.ey, outline='red', width=1)
            self.update_selected_area_status()

    def mouse_status_update(self):
        x = int(self.mx / self.rate)
        y = int(self.my / self.rate)

        str = "%s (%d, %d)" % (self.mouse_status, x, y)
        self.image_sel.mouse_status.configure(text=str)

    def update_status(self):
        """画像表示関連の更新"""
        self.update_image()
        self.image_sel.update_status()

        self.canvas.bind("<Button-1>", self.click)
        self.canvas.bind("<B1-Motion>", self.motion)
        self.canvas.bind("<ButtonRelease-1>", self.release)
        self.canvas.bind("<Motion>", self.move)

#        if self.id != None:
#            self.canvas.delete(self.id)

        self.ondrag = False
        self.mouse_status = ""

    # マウスイベント
    def click(self, event):
        self.ondrag = True
        self.sx = event.x
        self.sy = event.y
        if self.id != None:
            self.canvas.delete(self.id)

    def move(self, event):
        self.mx = event.x
        self.my = event.y
        self.mouse_status_update()

    def motion(self, event):
        self.move(event)
        if self.ondrag:
            if self.id != None:
                self.canvas.delete(self.id)

            self.ex = event.x
            self.ey = event.y
            self.id = self.canvas.create_rectangle(self.sx, self.sy, self.ex, self.ey, outline='red', width=1 )

    def release(self, event):
        if self.ondrag:
            self.ex = event.x
            self.ey = event.y
            self.ondrag = False

            if self.id != None:
                self.canvas.delete(self.id)

            self.id = self.canvas.create_rectangle(self.sx, self.sy, self.ex, self.ey, outline='red', width=2 )
            self.update_selected_area_status()


    def update_selected_area_status(self):
        """選択範囲の表示更新"""
        x1 = int(min((self.sx, self.ex)) / self.rate)
        x2 = int(max((self.sx, self.ex)) / self.rate)
        y1 = int(min((self.sy, self.ey)) / self.rate)
        y2 = int(max((self.sy, self.ey)) / self.rate)

        str = u'選択範囲(%d, %d) -> (%d, %d) ' % (x1, y1, x2, y2)
        self.mouse_status = str
        self.mouse_status_update()


class ImageSelFrame(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        dir = os.getcwd()
        print(dir)
        iml = PIL.Image.open('..\\img\\mark_arrow_left.png')
        self.iml = PIL.ImageTk.PhotoImage(iml)
        self.left_b = tk.Button(self, image=self.iml, command=self.prev_image)
        self.left_b.pack(side='left')

        imr = PIL.Image.open('..\\img\\mark_arrow_right.png')
        self.imr = PIL.ImageTk.PhotoImage(imr)
        self.right_b = tk.Button(self, image=self.imr, command=self.next_image)
        self.right_b.pack( side='left')

        self.status = tk.Label(self, text='no directory selected')
        self.status.pack(side='left')

        self.mouse_status = tk.Label(self, width = 60)
        self.mouse_status.pack(side='left')

        self.master = master

    def update_status(self):
        dir = dledit.global_optiton.get('image_dir')
        file = dledit.ims.get_image_name()
        index = dledit.ims.get_index()
        num = dledit.ims.get_image_num()
        rate = self.master.rate
        str = "%s/%s %.2f%% [%d/%d]" % (dir, file, rate*100, index + 1, num)
        self.status.configure(text=str)

    def next_image(self):
        dledit.ims.next_image()
        self.master.update_status()

    def prev_image(self):
        dledit.ims.prev_image()
        self.master.update_status()


class OutputFrame(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        im = PIL.Image.open('..\\img\\computer_folder.png')
        self.master = master
        self.imb = PIL.ImageTk.PhotoImage(im)

#        self.lt = tk.Label(self, text = "output directory  ")
#        self.lt.pack(side='left')

        self.bt = tk.Button(self, image=self.imb, command=self.seldir)
        self.bt.pack(side='left')


        self.output_dir = "C:/ptech/DL/DLEDIT/output"
        self.entry = tk.Entry(self, width=60)
        self.entry.pack(side='left')
        dledit.global_optiton.set('output_dir', self.output_dir)

        self.bset = tk.Button(self, text='SET', command=self.setdir)
        self.bset.pack(side='left')
        self.bset.configure()

        self.bsave = tk.Button(self, text='SAVE', command=self.save)
        self.bsave.pack(side='right')
        self.bsave.configure(state='disabled')

        self.update_status()

    def seldir(self):
        cdir = os.getcwd()
        dirname = tk.filedialog.askdirectory(initialdir=self.output_dir, title=u'出力ディレクトリを選択して下さい')
        output_dir = os.path.dirname(dirname)
        self.output_dir = output_dir
        dledit.global_optiton.set('output_dir', self.output_dir)
        self.update_status()

    def update_status(self):
        output_dir = dledit.global_optiton.get('output_dir')
        self.output_dir = output_dir

        self.entry.delete(0, tk.END)
        self.entry.insert(0, output_dir)
        if self.output_dir == "":
            self.bsave.configure(state='disabled')
        else:
            self.bsave.configure(state='active')

    def setdir(self):
        self.output_dir = self.entry.get()
        dledit.global_optiton.set('output_dir', self.output_dir)
        self.update_status()

    def save(self):
        """画像を保存して、次の画像へ"""
        pos = self.get_selected_positon()
        if pos == (0,0,0,0):
            return
        dledit.ims.save_image(pos)
        self.master.image_frame.image_sel.next_image()
        print('save')

    def save_key(self,evnet):
        self.save()

    def get_selected_positon(self):
        """選択された範囲を元画像の座標のタプルで返す。"""
        sx = self.master.image_frame.sx
        sy = self.master.image_frame.sy
        ex = self.master.image_frame.ex
        ey = self.master.image_frame.ey
        rate = self.master.image_frame.rate
        x1 = int(min((sx, ex)) / rate)
        x2 = int(max((sx, ex)) / rate)
        y1 = int(min((sy, ey)) / rate)
        y2 = int(max((sy, ey)) / rate)
        return x1, y1, x2, y2

class LabelFrame(tk.Frame):
    def __init__(self, master):
        tk.Frame.__init__(self, master)
        self.t = tk.Label(self, text = "Label(未実装)", width = 30)
        self.t.pack()

