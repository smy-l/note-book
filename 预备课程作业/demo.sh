#!/bin/zsh
mkdir -p prepare/practice  #依次创建prepare/practice文件夹
cd prepare/practice/       
mkdir new
touch new/new.txt   #在new文件下创建new.txt
echo "welcome to banyuan" > new/new.txt  #将welcome to banyuan写入到new/new.txt文件中
mkdir -p newother/sub
cp new/new.txt newother/sub/  #将new.txt复制到newother/sub文件夹中
mv new/new.txt new/new1.txt  #重命名
mv newother/sub ./new2  #将sub文件夹移动到当前文件夹下，并重命名为new2
find . -maxdepth 1 -type d -name "new*" -exec rm -r {} \;  #将practice文件夹中以new开头的文件删除

