#! /usr/bin/env python

from ctypes import *
import subprocess

try:
    # First we force caps lock to off (to make sure that we don't get locked in
    # a situation where CAPS LOCK IS ON AND WE CAN'T CHANGE IT). From
    # http://askubuntu.com/questions/80254/how-do-i-turn-off-caps-lock-the-lock-not-the-key-by-command-line/607915

    X11 = cdll.LoadLibrary("libX11.so.6")
    display = X11.XOpenDisplay(None)
    X11.XkbLockModifiers(display, c_uint(0x0100), c_uint(2), c_uint(0))
    X11.XCloseDisplay(display)

    # Once that's done we can change caps lock to escape
    subprocess.call(['setxkbmap', '-option', 'caps:escape'])
except:
    # Not on X?... better do nothing
    pass

