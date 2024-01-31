#include <iostream>
#include "brod.hpp"

using namespace std;

void ispisiMotor(const Motor &m){
    cout<<"--- Motor ---"<<endl;
    cout<<"Brzina: "<< m.getBrzina() <<endl<<endl;
}

void ispisiBrod(const Brod &b){
    cout<<"--- Brod ---"<<endl;
    cout<<"Stanje: ";
    switch (b.getStanje()){
    case USIDREN:
        cout<<"USIDREN"<<endl;
        break;
    case PLOVI:
        cout<<"PLOVI"<<endl;
        break;
    case POKVAREN:
        cout<<"POKVAREN"<<endl;
        break;

    }
    cout<<"Predjeno kilometara: "<<b.getPredjenoKm()<<endl;
    cout<<"Kolicina goriva: "<<b.getKolicinaG()<<endl;
    ispisiMotor(b.getMotor());
}



int main()
{
    Motor m1;
    m1.getBrzina();
    m1.setBrzina(5);
    ispisiMotor(m1);

    Brod b1;

    ispisiBrod(b1);
    b1.pokvari();
    ispisiBrod(b1);
    b1.popravi();
    ispisiBrod(b1);
    b1.pokreni();
    ispisiBrod(b1);
    b1.smanjiBrzinu();
    ispisiBrod(b1);
    cout<<b1.povecajBrzinu()<<endl;
    cout<<b1.povecajBrzinu()<<endl;
    cout<<b1.povecajBrzinu()<<endl;
    cout<<b1.povecajBrzinu()<<endl;
    cout<<b1.povecajBrzinu()<<endl;
    cout<<b1.povecajBrzinu()<<endl;
    ispisiBrod(b1);
    b1.zaustavi();
    for (int i=0; i<10; i++){
        b1.sipajGorivo();
    }
    ispisiBrod(b1);
    b1.pokreni();
    cout<<b1.povecajBrzinu()<<endl;
    cout<<b1.povecajBrzinu()<<endl;
    ispisiBrod(b1);
    b1.putuj();
    ispisiBrod(b1);


    return 0;
}
