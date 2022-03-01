
#include <stdio.h>

extern void p1(void);
extern void p2(void);

int main(void)
{
    p1();
    p2();
    printf("hello makefile!\n");
    return 0;
}