#!/bin/python

import os
from PIL import Image


PATH = '/home/rednik/Pictures/Wallpapers/'

i = 0
for pic in os.listdir(PATH):
    fullpath = PATH + pic 
    
    img = Image.open(fullpath)
    width, height = img.size

    filename = f"wallpaper-{width}x{height}-{i}.{pic.split('.')[-1]}"
    
    os.system(f"mv {fullpath} {PATH+filename}")
    
    i += 1
