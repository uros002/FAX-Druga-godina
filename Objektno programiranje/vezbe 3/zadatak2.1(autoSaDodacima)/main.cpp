#include <iostream>
#include "automobil.hpp"

#define KRAJ_PROGRAMA 8

using namespace std;

void ispisiMenjac(const Menjac &m){
    cout << "Menjac: " << endl;
    cout << "\tBrzina = " << m.brzina << endl;
    cout << "\tTip menjaca = " << (m.tip == AUTOMATIK ? "AUTOMATIK" : "MANUELNI") << endl;
}

void ispisiSkoljku(const Skoljka &s){
    cout << "Skoljka: " << endl;
    cout << "\tBoja = ";
    switch(s.boja){
    case PLAVA:
        cout << "Plava" << endl;
        break;
    case ZELENA:
        cout << "Zelena" << endl;
        break;
    case CRVENA:
        cout << "Crvena" << endl;
        break;
    }
}

void ispisiAutomobil(const Automobil &a){
    cout << "Automobil: " << endl;
    cout << "*********************" << endl;
    ispisiMenjac(a.m);
    ispisiSkoljku(a.s);
    cout << endl;
    cout << "Trenutno brzina je: " << a.trenutnaBrzina << endl;
    switch(a.stanje){
    case UPALJEN:
        cout << "Automobil je upaljen!" << endl;
        break;
    case UGASEN:
        cout << "Automobil je ugasen" << endl;
        break;
    case POKVAREN:
        cout << "Automobil je pokvaren!" << endl;
        break;
    }
}

int meni(){
    int i;

    cout << "Izaberite opciju"<<endl;
    cout << "1. Upali auto"<<endl;
    cout << "2. Ugasi auto"<<endl;
    cout << "3. Pokvari auto"<<endl;
    cout << "4. Popravi auto"<<endl;
    cout << "5. Povecaj brzinu"<<endl;
    cout << "6. Smanji brzinu"<<endl;
    cout << "7. Prikazi stanje"<<endl;
    cout << "8. Kraj rada programa"<<endl;
    cout << "Operacija --->"<<endl;

    cin >> i;
    return i;
}


int main()
{
    int i;

    Menjac m1,m2(MANUELNI,5),m3(m1);
    ispisiMenjac(m1);
    ispisiMenjac(m2);
    ispisiMenjac(m3);

    cout << endl;

    Skoljka s1,s2(CRVENA),s3(s2);
    ispisiSkoljku(s1);
    ispisiSkoljku(s2);
    ispisiSkoljku(s3);

    cout << endl;
    cout << endl;
    cout << endl;

    Automobil a1;
    //ispisiAutomobil(a1);
    //ispisiAutomobil(a2);
    //ispisiAutomobil(a3);

     do{

        i = meni();

        switch(i){
        case 1:
            if(a1.upali()){
                cout << "Operacija je izvrsena!" << endl;
            } else {
                cout << "Operacija nije izvrsena!" << endl;
            }
            break;
        case 2:
            if(a1.ugasi()){
                cout << "Operacija je izvrsena!" << endl;
            } else {
                cout << "Operacija nije izvrsena!" << endl;
            }
            break;
        case 3:
            if(a1.pokvari()){
                cout << "Operacija je izvrsena!" << endl;
            } else {
                cout << "Operacija nije izvrsena!" << endl;
            }
            break;
        case 4:
            if(a1.popravi()){
                cout << "Operacija je izvrsena!" << endl;
            } else {
                cout << "Operacija nije izvrsena!" << endl;
            }
            break;
        case 5:
            if(a1.povecajBrzinu()){
                cout << "Operacija je izvrsena!" << endl;
            } else {
                cout << "Operacija nije izvrsena!" << endl;
            }
            break;
        case 6:
            if(a1.smanjiBrzinu()){
                cout << "Operacija je izvrsena!" << endl;
            } else {
                cout << "Operacija nije izvrsena!" << endl;
            }
            break;
        case 7:
           ispisiAutomobil(a1);
            break;
        case 8:
                cout << "*******  KRAJ PROGRAMA!  *******" << endl;
            break;
        }

    }while( i != KRAJ_PROGRAMA);


    return 0;
}
