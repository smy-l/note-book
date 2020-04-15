# 生成选择二叉树

```
#include <stdio.h>
#include <stdlib.h>
#include <time.h>


//制作选择二叉树

typedef struct treenode{
    int data;
    struct treenode *Left, *Right;
}BSTNode;

BSTNode* createBST(int elem){
    BSTNode* root = (BSTNode*)malloc(sizeof(BSTNode));
    root->data = elem;
    root->Left = root->Right = NULL;
    return root;
}



void search_elem(BSTNode* t, int elem){
    BSTNode* temp = t;
    if(temp->data == elem){
        printf("%d在该二叉树中\n",elem);
        return;
    }else if(temp->data > elem && temp->Right != NULL){
        temp = temp->Right;
        search_elem(temp, elem);
    }else if(temp->data < elem && temp->Left != NULL){
        temp = temp->Left;
        search_elem(temp, elem);
    }else{
        printf("%d不在该二叉树中\n",elem);
    }
}


void insert_BST(BSTNode *p, int elem){
    BSTNode *NewElem = (BSTNode*)malloc(sizeof(BSTNode));
    NewElem->data = elem;
    NewElem->Left = NULL;
    NewElem->Right = NULL;
    
    BSTNode* temp = p;
    
    if(temp->data >= elem) {
        while (temp->Right != NULL){
            temp = temp->Right;
        }
        temp->Right = NewElem;
    }
    
    if(temp->data < elem) {
        while (temp->Left != NULL){
            temp = temp->Left;
        }
        temp->Left = NewElem;
    }
}

void print_tree(BSTNode* tree){
    /*
    if(tree->Left){
        print_tree(tree->Left);
    }
    
    printf("%d ", tree->data);
    
    */
    if(tree->Right){
        print_tree(tree->Right);
    }
    
    printf("%d ", tree->data);
    
    if(tree->Left){
        print_tree(tree->Left);
    }
}



int main(){
    BSTNode* tree = createBST(10);
    insert_BST(tree, 1000);
    search_elem(tree, 10);
    search_elem(tree, 1000);
    insert_BST(tree, 5);
    insert_BST(tree, 200);
    
    
    print_tree(tree);
    
    
    /*
    int a[10];
    srand((int)time(NULL));
    for(int i = 0; i < 10; i++){
        a[i] = rand() % 100;
        printf("%4d",a[i]);
    }
    printf("\n");
     */
}


```