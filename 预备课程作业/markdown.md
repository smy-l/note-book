# 一级标题
## 二级标题

*斜体文字*<br>
**加粗文字**<br>
***粗斜体***<br>
~~删除线文字~~<br>
```单行代码引用```<br>
上标：H^2^O
下标：n~2~

## 换行
这里是第一行<br>这里是第二行

## 有序列表
1. 衣服
1. 裤子
1. 鞋子

## 无序列表
- 衣服
- 裤子
- 鞋子

## 多层级列表
- 衣服
    - 大衣
        - 加厚
        - 加绒
    - 衬衣
- 裤子
    - 牛仔裤
    - 西裤
- 鞋子


## 表格
姓名（左对齐）| 职业（居中）| 年龄（右对齐）
:-| :-: | -: 
张三 | 屠夫 | 28
李四 | 马夫 | 28
王二 | 车夫 | 28

注: 使用" : "使表格选择对齐方式



编写一个shell脚本文件demo.sh，位于 ~/prepare/practice 文件夹下 执行这个文件，将产生以下效果

1. 在practice文件夹下文件文件夹new，在new文件夹下，新建new.txt 文件
1. new.txt中增加文本，welcome to banyuan
1. 在practice 文件夹下新建 newother文件夹，下面再建立一个sub文件夹，将new.txt 复制到sub文件夹下
1. 将new文件夹下new.txt 重新命名为 new1.txt
1. 将sub文件夹整个移动到 practice 文件夹下，命名为new2
1. 将practice下的new开头的文件夹都删除掉


## demo.sh 脚本文件
```
#!/bin/bash
mkdir -p prepare/practice  
cd prepare/practice/       
mkdir new
touch new/new.txt   
echo "welcome to banyuan" > new/new.txt  
mkdir -p newother/sub
cp new/new.txt newother/sub/  
mv new/new.txt new/new1.txt  
mv newother/sub ./new2  
find . -maxdepth 1 -type d -name "new*" -exec rm -r {} \;  
```














