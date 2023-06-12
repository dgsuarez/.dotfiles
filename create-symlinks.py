#! /usr/bin/env python3
# -*- coding: utf-8 -*-

from os import *
from os.path import *
from sys import exit

homedir = environ["HOME"]
dotfiles = join(homedir, ".dotfiles")

def symlinkfile(fname):
    source = relpath(dotfiles+"/"+fname, dirname(homedir+"/."+fname))
    target = homedir+"/."+fname
    if not islink(target):
        if exists(target):
            print("WARNING: %s exists" % target)
        else:
            print("creating symlink: %s\n\t→ %s" % (target, source))
            symlink(source, target)

def makelinks(path = "."):
    if path != ".":
        dirpath = normpath(join(homedir,'.'+path))
    else:
        dirpath = normpath(join(homedir,path))

    if not exists(dirpath):
        print("mkdir: %s" % dirpath)
        mkdir(dirpath)

    for fname in listdir(path):
        # skip this script and files starting with a dot
        if fname == normpath(__file__) or fname[0] == '.':
            print("skipping %s" % fname)
            continue

        filepath=normpath(join(path, fname))

        if isfile(filepath):
            symlinkfile(filepath)
        elif isdir(filepath):
            makelinks(filepath)
        else:
            print("neither file nor dir: %s" % filepath)

if abspath(".") != dotfiles:
    exit("ERROR: script must be run from ~/.dotfiles")

makelinks()
