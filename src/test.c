#include <stdio.h>

typedef struct n {
    int value;
    struct n *left, *right;
} node_t;


//A revoir avec return


int count_left( node_t* n, int sum){
    if(n->left != NULL){
        count_left(n->left, sum + n->value);
    }
    if(n->right != NULL){
        count_right(n->right, sum + n->value);
    }
    return sum;
}

int count_right(node_t* n, int sum){
    if(n->right != NULL){
        sum = sum + n->value;
        count_right(n->right, sum + n->value);
    }
    if(n->left != NULL){
        sum = sum + n->value;
        count_left(n->left, sum + n->value);
    }
    return sum;
}

int sum_tree ( node_t* n){
    int sum = 0;
    sum += n->value;

    sum += count_left(n, sum);
    sum += count_right(n, sum);
    printf("sum : %d\n", sum);
    return sum;
}

 

int main () {
    node_t nodes[7];
    for ( int i=0; i<7; i++ )
    {
        nodes[i].value = i;
        nodes[i].left = nodes[i].right = NULL;
    }
    nodes[0].left  = &nodes[1];
    nodes[0].right = &nodes[2];
    nodes[1].left  = &nodes[3];
    nodes[1].right = &nodes[4];
    nodes[2].left  = &nodes[5];
    nodes[2].right = &nodes[6];

    int sum = sum_tree ( &nodes[0]);
    printf ( "%d\n", sum );


}