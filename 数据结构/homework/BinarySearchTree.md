# 生成选择二叉树

```
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define SIZE 10
//制作选择二叉树

typedef struct node{
    int data;
    struct node *Left, *Right;
}TreeNode;

TreeNode* create(void);
TreeNode* search(TreeNode* root, int target);
TreeNode* insert(TreeNode* root, int data);
void print(TreeNode* root);


TreeNode* create(void){
    return NULL;
}


TreeNode* search(TreeNode* root, int target){
    if(root == NULL){
        return NULL;
    }
    
    if(root->data == target){
        return root;
    }
    
    if(root->data < target){
        return search(root->Right, target);
    }else{
        return search(root->Left, target);
    }
}


TreeNode* insert(TreeNode* root, int data){
    TreeNode* new_node = (TreeNode*)malloc(sizeof(TreeNode));
    new_node->Left = NULL;
    new_node->Right = NULL;
    new_node->data = data;
    
    if(root == NULL){
        return new_node;
    }
    
    if(data >= root->data){
        root->Right = insert(root->Right, data);
    }else{
        root->Left = insert(root->Left, data);
    }
    
    return root;
}

void print(TreeNode* root){
    if(root == NULL){
        return;
    }
    print(root->Left);
    printf("%4d",root->data);
    print(root->Right);
}

int main(){
    TreeNode* pt = create();

    srand((int)time(NULL));
    for (int i = 0; i < SIZE; i++) {
        pt = insert(pt, rand() % 100);
        
    }
    
    print(pt);
    printf("\n");
    
    return 0;
}


```