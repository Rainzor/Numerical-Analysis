#include <stdio.h>
#include <math.h>
typedef unsigned char *byte_pointer;

void show_bytes(byte_pointer start, int len)
{
    int i;
    for (i = 0; i < len; i++)
    {
        printf(" %.2x", start[i]);
    }
    printf("\n");
}

void show_int(int x)
{
    show_bytes((byte_pointer)&x, sizeof(int));
}

void show_float(float x)
{
    show_bytes((byte_pointer)&x, sizeof(float));
}

void show_pointer(void *x)
{
    show_bytes((byte_pointer)&x, sizeof(void *));
}

int main(void)
{
    printf("the size of short int is: %d bytes\n", sizeof(short int));
    printf("the size of int is: %d bytes\n", sizeof(int));
    printf("the size of float is: %d bytes\n", sizeof(float));
    printf("the size of double is: %d bytes\n", sizeof(double));

    short int x = 12345;
    short int mx = -x;
    printf("The real number of 12345 and -12345 in computer as short int:\n");
    show_bytes((byte_pointer)&x, sizeof(short int));
    show_bytes((byte_pointer)&mx, sizeof(short int));

    float f = 0.375;
    float mf = -f;
    printf("The real number of 0.375 and -0.375 in computer as float:\n");
    show_bytes((byte_pointer)&f, sizeof(float));
    show_bytes((byte_pointer)&mf, sizeof(float));

    double d = 0.2;
    printf("The real number of 0.375 and -0.375 in computer as double:\n");
    show_bytes((byte_pointer)&d, sizeof(double));

    float s =(float)sqrt(2);
    printf("sqrt of 2 is :%.30f as float format",s);

}
