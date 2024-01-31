#include<stdlib.h>
#include<stdio.h>
#include<ctype.h>

void copyLEToLE(int x, void *copy){
    for(int i = 0; i<sizeof(x);i++){
        *((char*)copy + i) = *((char*)&x + i);
    }
}

void copyLEToBE(int x, void *copy){
    for(int i = 0; i<sizeof(x); i++){
        *((char*)copy + i) = *((char*)&x + sizeof(x) - i - 1);
    }
}


int main(){

    char c;
    short n;
    printf("Unesite broj n: ");
    scanf("%hd",&n);

    char *buffer = (char*)malloc(sizeof(char) + 2*sizeof(short)+ 2*n*sizeof(short));

    int *niz1 = (int*)(buffer + sizeof(char) + 2*sizeof(short));
    int *niz2 = (int*)(buffer + sizeof(char) + 2*sizeof(short)+ n*sizeof(short));

    do{
        printf("Unesite L i B: ");
        scanf("%c",&c);
        fflush(stdin);
    }while(c!='L' && c!='B');

    if(c == 'L'){
        buffer[0] = 'L';
        buffer[1] = n;
        buffer[2] = n;

    }else if(c == 'B'){
        buffer[0] = 'B';
        buffer[1] = n;
        buffer[2] = n;
    }

    printf("Unesite prvi niz: ");
    for(int i = 0; i<n;i++){
        scanf("%d", &niz1[i]);
        fflush(stdin);
    }

    printf("Unesite drugi niz: ");
    for(int i = 0; i<n; i++){
        scanf("%d",&niz2[i]);
        fflush(stdin);
    }

    int rez = Count(buffer);
    printf("U prvom nizu imamo %d vecih elemenata na istom indeksu!", rez);
    free(buffer);
    return 0;

}

int Count(char* buffer){
    char c = buffer[0];
    short num = *((short *)(buffer + 1));
    int brojac = 0;
    int niz1[num];
    int niz2[num];


    if(c == 'L'){
        copyLEToLE(*((int*)(buffer + sizeof(char) + 2*sizeof(short))), &niz1);
        copyLEToLE(*((int*)(buffer + sizeof(char) + 2*sizeof(short)+ num*sizeof(short))), &niz2);
    } else if(c == 'B'){
        copyLEToBE(*((int*)(buffer + sizeof(char) + 2*sizeof(short))), &niz1);
        copyLEToBE(*((int*)(buffer + sizeof(char) + 2*sizeof(short) + num*sizeof(short))), &niz2);
    }

    for(int i = 0 ; i<num; i++){
        if(niz1[i] > niz2[i]){
            brojac++;
        }
    }

    return brojac;


}

