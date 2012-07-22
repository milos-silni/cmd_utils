from Tkinter import *

class App:

    def __init__(self, master):

        frame = Frame(master)
        frame.pack()

        self.button = Button(frame, text="Stop", command=frame.quit)
        self.button.pack(side=LEFT)

        self.button1 = Button(frame, text="Start mts net", command=self.start_mts)
        self.button1.pack(side=LEFT)

    def start_mts(self):
        import os
        if self.button1["text"] == "Start mts net" :
	  os.system("kdesudo 'wvdial mts'")
	  self.button1["text"] = "Stop"
	else :
	  os.system("kdesudo 'killall -v pppd'")
	  self.button1["text"] = "Start mts net"
	
	

root = Tk()

app = App(root)

root.mainloop() 
