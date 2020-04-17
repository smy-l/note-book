1. bit运算
    1. 将1000转化为2进制数
    1. 除32，将其向右移动5位
    1. 判断能否整除，能整除，返回输出值，否则，输出值+1

1. 使用直线划分空间 
    L(n) = n*(n+1)/2+1; 

    ```
    
    #include <stdio.h>

    int calc_spaces(int n){
        int L = 1;
        /*
        n  0   1   2   3   4   5
        L  1   2   4   7   11  16
        */
        L = n * (n + 1) / 2 + 1;
        return L;
    }

    int main(){
        int n; //线的数量
        int L = 1; //空间数
    
        printf("Please input n\n");
        scanf("%d",&n);
    
        L = calc_spaces(n);
    
        printf("%d条直线最多能划分%d个空间\n",n,L);
    
        return 0;
    }

    ```

1. 打印三角形
    ```
    #include <stdio.h>
    #include <stdlib.h>
    
    void draw(unsigned int n);  //n > 0

    void draw(unsigned int n){
        int a[n][n];
        for(int i = 0; i < n; i++){
            a[i][0] = i + 1;
            a[i][i] = i + 1;
        }
        for(int i = 2; i < n; i++){
            for (int j = 1; j < i; j++) {
                a[i][j] = a[i-1][j-1] + a[i-1][j];
            }
        }
    
        for (int i = 0; i < n; i++) {
            for(int j = n; j >i ; j--){
                printf("  ");
            }
        
            for(int j = 0; j <= i; j++){
                printf("%4d",a[i][j]);
            }
            printf("\n");
        }
        printf("\n");
    }

    int main(){
        unsigned int n;
        printf("Please input n(n>0)\n");
        scanf("%d",&n);
    
        draw(n);
    
        return 0;
    }
    ```

1. 实现atof函数

    ```
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>

    double my_atof(char *nptr){
        double a = 0.0;
        double b = 10.0;

        while(*nptr == ' '){
            nptr++;
        }

        while(*nptr >= '0' && *nptr <='9' && *nptr !='.')//计算小数点前整数部分
        {
            a = a * 10.0 + *nptr - '0';//*nptr - '0'是将字符转换为整形数字
            nptr++;
        }
    
        if(*nptr == '.')//小数点
            nptr++;
    
        while(*nptr >= '0' && *nptr <= '9')//计算小数部分
        {
            a = a + (*nptr - '0')/b;
            b *= 10.0;
            nptr++;
        }
    
        printf("%lf\n",a);
        return a;
    }

    int main(){
        char a[10];
        printf("Please input nums:\n");
        scanf("%s",a);
    
        my_atof(a);
    
        return 0;
    }
    ```

1. 使用栈的数据功能实现队列

    1. 创建两个新的栈，栈1作为入栈，栈2作为出栈
    1. 插入元素的时候，将元素插入到栈1
    1. 取出元素的时候，将栈1中的元素在压入到栈2中
    1. 利用栈2将其取出


