# 作业

1. 理解DLL双向链表的增删操作<br>
    增加
    1. 插入在head：<br>
        首先新建一个newNode，其next指向head；<br>
        接着head的指prev指向newNode；<br>
        head设置为newNode。<br>
    1. 插入在tail：<br>
        首先新建一个结点，原最后结点next指向newNode；<br>
        接着newNodeprev指向原最后结点;<br>
        tail设置为newNode。<br>
    1. 插入在中间：<br>
        首先找到要插入结点的位置；<br>
        新建一个结点其next指针指向当前结点；<br>
        当前结点prev指向newNode；<br>
        前一个结点next指向newNode；<br>
        newNode的prev指向前一个结点。<br>

    删除
    1. 删除head：<br>
        新建一个临时变量temp = head；
        将head下一个结点设置为head；
        删除temp(释放内存)。
    1. 删除tail；<br>
        新建一个临时变量temp = tail；
        令tail为原tail的前一个结点；
        然后使其next指针指向NULL；
        删除temp。
    1. 删除中间结点；<br>
        找到要删除的结点；
        令前一个结点next指向其next；
        其下一个结点prev指向前一个结点；
        删除当前结点。

2. 理解约瑟夫环使用循环链表来解决的思路
```
10人，数到4
    0 1 2   4 5 6 7 8 9   out3   1
    0 1 2   4 5 6   8 9   out7   2
    0   2   4 5 6   8 9   out1   3
    0   2   4 5     8 9   out6   4
    0       4 5     8 9   out2   5
    0       4 5     8     out9   6
    0       4 5           out8   7
```
参考别人代码，大致思路为每当删除一个结点将其前一个结点next指针指向删除结点next，删除该结点


```
#include<stdio.h>
#include<stdlib.h>
typedef struct node {
	unsigned int number;    // 存放编号
	struct node * next;
}* pt,node;

		/*  循环链表创建 */
void creat (pt * head, int numb)   // head为 node **型，值传递
{								   // numb 为数量
	pt current, prev;
	* head = (pt) malloc (sizeof(node));
	prev = * head;
	for(int i = 1; numb--; i++)    // 创建numb个节点
	{
		current = (pt) malloc (sizeof(node));
		current->number = i;       // 按顺序编号
		prev->next = current;
		prev = current ;
	}
	current->next = (*head)->next;  //尾节点指回头结点
}

/* 解决约瑟夫问题 */
int yue(int m,int n)              // m为总人数，n为报数的次数
{
	pt head, current, prev; 
	creat(&head,m);               // 创建循环链表，m个节点
	current = head->next;
	for (int i = 1; i < m; i++)   // 循环 m - 1次， 剩下最后一个人
	{
		for (int j = 0; j < n - 1; j++)   // current指到报道n的人
		{
			current = current->next;
		}
		/* 删除当前编号  */
		prev = current->next;             
		current->number = current->next->number;
		current->next = current->next->next;
		free(prev);
	}
	return current->number;        // 返回最后一个人的编号
}


//测试
int main ()
{
	int m, n;
	while(scanf("%d %d", &m, &n) != EOF)
	{
		printf("最后一个出局的人为%d号\n", yue(m, n%m));
	}
 } 
void creat (pt * c, int a)
{
	pt current, prev;
	* c = (pt) malloc (sizeof(node));
	prev = * c;
	for(int i = 1; a--; i++)
	{
		current = (pt) malloc (sizeof(node));
		current->number = i;
		prev->next = current;
		prev = current ;
	}
	current->next = (*c)->next;
}

int yue(int m,int n)
{
	pt head, current, prev; 
	creat(&head,m);
	current = head->next;
	for (int i = 1; i < m; i++)
	{
		for (int j = 0; j < n - 1; j++)
		{
			current = current->next;
		}
		prev = current->next;
		current->number = current->next->number;
		current->next = current->next->next;
		free(prev);
	}
	return current->number;
}

```

3. (附加题，非强制）搜索并理解约瑟夫问题使用数组来解决的思路


4. 使用栈的数据结构实现后缀表达式的计算(未完成)

```
#include <stdlib.h>
#include <stdio.h>
#include <string.h>

typedef struct stack{
    int top;
    int size;
    int* data;
} Stack;

// 初始化一个最多可以存放size个整数的栈
Stack* initStack(int size) {
    Stack* pStack = malloc(sizeof(Stack));
    pStack->data = malloc(sizeof(int) * size);
    pStack->top = 0; // top代表下一个入栈的位置，所以top-1才表示当前的栈顶
    pStack->size = size;
    return pStack;
}

// 当这个栈满的时候应该返回0，表示push失败
int push(int elem, Stack* ps) {
    if (ps->top == ps->size) {
        // 当size为5的时候，top从0到4是有效的，所以top为5的时候是无效的
        printf("栈满了，不能push\n");
        return 0;
    }
    
    ps->data[ps->top] = elem;
    ps->top++;
    return 1;
}

// pop需要返回成功还是失败，又需要返回一个数值
int pop(Stack* ps, int* result) {
    if (ps->top == 0) {
        // 空栈
        printf("空栈，不能pop\n");
        return 0;
    }
    /*
     *result = ps->data[ps->top-1];
     ps->top--;
     */
    *result = ps->data[--(ps->top)];
    return 1;
}

int peek(Stack* ps, int * result) {
    if (ps->top == 0) {
        // 空栈
        printf("空栈，不能peek\n");
        return 0;
    }
    
    *result = ps->data[ps->top-1];
    return 1;
}


int rpn(char * a){
    int result = 0;
    int len = 0;
    len = (int)strlen(a);
    int temp;
            
    for (int i = 0; i < len; i++) {
        temp = a[i];
        if((temp == '+' || temp == '-' || temp == '*' || temp == '/')){
            switch(temp){
                case '+':
                    result = a[i-1] + a[i-2];
                    break;
                case '-':
                    result = a[i-1] - a[i-2];
                    break;
                case '*':
                    result = a[i-1] * a[i-2];
                    break;
                case '/':
                    result = a[i-1] / a[i-2];
                    break;
                    
            }
            //把元素往前移动
            a[i-2] = result;
            for(int j = i; j < len; j++){
                //5 1 2 + 4 * + 3
                a[j - 1] = a[j + 1];
            }
            len = len - 2;//数组长度减2
        }
    }
    return result;
}


int main(void) {
    char a[] = "5 1 2 + 4 * + 3 -";
    /*
     5 (1 + 2) 4 * + 3 -
     5 (3 * 4) + 3 -
     (5 + 12) 3 -
     17 3 -
     14
     */
    
    int result = 0;
    result = rpn(a);
    printf("%d\n",result);
    return 0;
}

```





