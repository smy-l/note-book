#include <stdio.h>
#include <stdlib.h>
#include <string.h>

double my_atof(char *nptr){
    double a = 0.0;
    double b = 10.0;

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
