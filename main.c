#include <stdio.h>
#include "nasm_module.h"

#define MAX_LEN 101 // 100 chars plus '\0'

int test(char* str);

int main(){
    char str[MAX_LEN];
    //char buf[MAX_LEN];
    //printf("Enter source text\n>: ");
    fgets(str,MAX_LEN, stdin);
    printf("Source text:\n%s\nEnd of source text\n");

    if(test(str)){
        printf("Rule 1\n");
        rule1(str);
    }else{
        printf("Rule 2\n");
        rule2(str);
    }

    printf("New text:\n%s\nEnd of new text\n");
    return 0;
}

int test(char* str){
    // test property 3
    int endl_pos=0; // end of line('\0') position
    while(endl_pos<MAX_LEN && str[endl_pos]!='\0')
        endl_pos++;

    return (
                ('a'<=str[0] && str[0]<='z')
                 ||
                ('A'<=str[0] && str[0]<='Z')
           )
            &&
           (
                ('a'<=str[endl_pos] && str[endl_pos]<='z')
                 ||
                ('A'<=str[endl_pos] && str[endl_pos]<='Z')
           );
}