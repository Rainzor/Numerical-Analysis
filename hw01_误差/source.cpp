#include<stdio.h>
#include<math.h>
#include<iostream>


#define SIZE 7
#define INTERATION 5000000  //5E6
double sum_sequence(double x, int iter){
    double sum = 0;
    int k,N;
    if (x == 0.0){
        for (k = iter / 5; k > 0; k--){ //倒序相加是为了考虑到double的舍入误差问题
            sum += 1 / ((double)(k)*k);
        }
    }else if (x == 0.5){// x is 0.5
        for (k = iter / 2; k > 0; k--)
        {
            sum += 1 / (double)k - 1 / (double)(k + x);
        }
        sum = sum / x;
    }else if (x >= 1 && x - (int)x == 0){ // x is an integer
        N = iter / (int)x + 1;
        for (k = x; k > 0; k--)
        {
            sum += 1 / (double)k - 1 / (double)(k + N * x);
        }
        sum = sum / x;
    }else{
        for (k = iter; k > 0; k--)
        {
            sum += 1 / (double)(k)-1 / (double)(k + x);
            sum = sum / x;
        }
    }
    return sum;
}

void get_answer_immed(){
    double X[SIZE] = {0.0, 0.5, 1.0, sqrt(2), 10.0, 100.0, 300.0};
    double x, sum;
    for (int i = 0; i < SIZE; i++){
        x = X[i];
        sum = sum_sequence(x, INTERATION);
        printf("input: x = %3.3f, output:sum = %.15f\n", x, sum);
    }
}

int main(){
    using namespace std;
    char c;
    double x, sum;
    cout<<"Do you want get some examples:(y/n)"<<endl;
    cin >> c;

    c = (char)tolower(c);

    if(c == 'y'){
        get_answer_immed();
    }else{
        cout<<"input:";
        while(cin >> x){
            sum = sum_sequence(x, INTERATION);
            printf("output : sum = % .15f\n\n",sum);
            cout << "input(or 'q' to quit) : ";
        }       
    }
}