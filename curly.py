#!/usr/bin/env python

import sys

input = sys.stdin.read()
text = input.decode('utf-8')
text.replace(u'\u2018', u'\u2019')
print(text.encode('utf-8'))
