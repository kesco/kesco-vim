#!/usr/bin/python
# -*- coding: utf-8 -*-

import os
from datetime import datetime
import shutil
from os.path import expanduser

from git import Repo

repo = Repo(os.getcwd())        # 生成Git Repo对象

vimrc_path = expanduser('~/.vimrc')
shutil.copyfile(vimrc_path, u'vimrc')

index = repo.index
index.add([u'vimrc', u'sync.py'])
index.commit(str(datetime.now()))

origin = repo.remotes.origin    # 获取远程Origin分支对象
origin.push()                   # Push commit
