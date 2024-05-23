#include <stdio.h>

int power2(exp);

int main(){
    int n,exp,resultado;
    scanf("%d",&n);
    scanf("%d",&exp);
    resultado = n*power2(exp);
    printf("%d",resultado);

}

power2(int exp){
    return 1 << exp;
}
