# 作业


1. 
```
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

int duplicate(char *s, int n){
    for(int i= 0; i < n; i++){
        if(s[i] == s[n]){
            return 1;
        }
    }
    return 0;
}

int find_max_substring(char * s){
    //从s[0]字符往下寻找子串长度
    int i;
    //长度为1时，无法比较
    int len = (int)strlen(s);
    if(len == 1)
    return 1;
    for(i = 0; i < strlen(s); i++){
        //如果重复，终止，需返回i值
        if(duplicate(s, i)){
            break;
        }
    }
    return i;
}

int lengthOfLongestSubstring(char * s){
    //目的：找到最长的无重复子串
    //从s0开始比较
    //找出和s0不一样字符
    //返回其长度
    //和已有长度比较
    //返回max
    
    int max = 0;
    int count;//记录每一次寻找子串长度
    for(int i = 0; i < strlen(s); i++){
        count = find_max_substring(s + i);//每次是从第i个元素开始往下寻找
        if(count > max){
            max = count;
        }
    }
    return max;
    
    
}



int main(){
    
    char s[] = "qwweeaew";
    int max = lengthOfLongestSubstring(s);
    printf("max is %d\n", max);
    return 0;
    
    
    
}


```


2. 
```
#include <stdio.h>
#include <time.h>
#include <stdlib.h>
#include <string.h>

int singleNumber(int* nums, int numsSize){
    //找出只出现一次的数字
    //从nums[0]开始对比
    int count[numsSize];
    //使count中每个数字为0；
    for (int i = 0; i < numsSize; i++) {
        count[i]  = 0;
    }
    for (int i = 0; i < numsSize; i++) {
        int key = 0;
        if(count[i] == 1){
            continue;
        }
        for (int j = i+1; j < numsSize; j++) {
            if(nums[i] == nums[j]){
                //？？？
                //需要设置其他变量
                count[i] = count[j] = 1;//决定遇到nums[j]的时候是否运行
                key = 1;//决定是否继续执行（只有一个字符不重复）
                break;
            }
        }
        if(!key){//等价于if(key != 1)
            return nums[i];
        }
    }return -1;
}


int main(void){
    int a[] = {1,2,3,2,1};
    printf("%d\n",singleNumber(a, sizeof(a)/sizeof(int)));
}

```






