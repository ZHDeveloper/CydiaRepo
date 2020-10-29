#!/bin/bash
# 自动脚本执行 把本文件直接拖到终端 按Enter一步到位

# 获取项目路劲
SCRIPTPATH="$( cd "$(dirname "$0")" ; pwd -P )"
cd $SCRIPTPATH

# 删除之前Packages和Packages.bz2
rm ./Packages
rm ./Packages.bz2

# 创建新的Packages
dpkg-scanpackages debs / > Packages

# 创建新的Packages.bz2
bzip2 -fks Packages

# git 提交操作
git add .
git commit -m "Update debs"
git push