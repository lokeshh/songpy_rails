#!/usr/bin/env 

from google import search
from os import system
import sys

sys.argv.pop(0)
if sys.argv[0] == '-v':
	video = True
	sys.argv.pop(0)
else:
	video = False

song_name = ' '.join(sys.argv)
result = next(search(song_name + ' Youtube'))
if video:
	system('youtube-dl -s -g ' + result)
else:
	system('youtube-dl -f bestaudio -s -g ' + result)
