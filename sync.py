#!/usr/bin/python
# -*- coding: utf-8 -*-

import os

from git import Repo

repo = Repo(os.getcwd())        # 生成Git Repo对象
assert not repo.bare
