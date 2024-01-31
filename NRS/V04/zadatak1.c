#include <stdio.h>
#include <stdlib.h>

#pragma pack(4)

typedef struct {
    char ime[12];       //2..13
    char prezime[12];   //14..25
    char pol;           //26 -> 27 je prazna
    short danR,mesecR,godinaR;  //28..30..32
    char JMBG[14];              //34..47
}Osoba;

void ispisiStariju(char *buffer){
    short N = *((short*)buffer);
    short pozicija = 0;

    short *danMin = &buffer[28];
    short *mesecMin = &buffer[30];
    short *godinaMin = &buffer[32];
    int velicina = sizeof(Osoba);

    for(int i = 1; i<N; i++){
        short *danTren = buffer[velicina * i + 28];
        short *mesecTren = buffer[velicina * i + 30];
        short *godinaTren = buffer[velicina * i + 32];

        if(*godinaTren < *godinaMin ||
           *godinaTren == *godinaMin && *mesecTren < *mesecMin ||
           *godinaTren == *godinaMin && *mesecTren == *mesecMin && *danTren < *danMin){

            godinaMin = godinaTren;
            mesecMin = mesecTren;
            danMin = danTren;
            pozicija = i;
           }
    }

    printf("Ime: %s\nPrezime: %s\nPol: %c\nJMBG: %s",
           &buffer[pozicija * velicina + 2], &buffer[pozicija * velicina + 14], buffer[pozicija * velicina + 26], &buffer[pozicija * velicina + 34]);

}

int main(){
    short N = 4;
    char buffer[2 + N * sizeof(Osoba)];
    *((short*)buffer) = N;
    Osoba *os = (Osoba*) &buffer[2];

    os[0] = (Osoba) {
        "Jugoslav", "Jugovic",
        'M',
        1,4,2001,
        "0104001800043"
    };

    os[1] = (Osoba){
        "Severina", "Severic",
        'Z',
        3,2,2002,
        "0302002805012"
    };

    os[2] = (Osoba){
        "Jug", "Bogdan",
        'M',
        31,6,2000,
        "3106000800043"
    }

    os[3] = (Osoba){
        "Severin", "Sever",
        'M',
        31,12,2005,
        "3112005805012"
    };

    ispisiStariju((char*)buffer);
    return 0;


}