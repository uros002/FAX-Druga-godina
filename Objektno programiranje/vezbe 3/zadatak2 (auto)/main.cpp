#include <iostream>
#include "automobil.hpp"

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
}


int main()
{
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

    Automobil a1,a2(AUTOMATIK,3,PLAVA),a3(a2);
    ispisiAutomobil(a1);
    ispisiAutomobil(a2);
    ispisiAutomobil(a3);


    return 0;
}
