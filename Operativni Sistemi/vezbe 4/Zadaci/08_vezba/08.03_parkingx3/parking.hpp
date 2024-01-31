#ifndef PARKING_HPP_INCLUDED
#define PARKING_HPP_INCLUDED

#include "automobil.hpp"

#include<mutex>
#include<condition_variable>

using namespace std;

class Parking {
    Automobil& automobil;
    mutex m;
    condition_variable uslov_ulaza[3];
    int aktivan_ulaz;
    bool zauzeto;
public:
    Parking(Automobil& a) : automobil(a){
        // Prosiriti po potrebi ...
        aktivan_ulaz = 0;
        zauzeto = false;
    }

    // Metoda koju poziva nit koja simulira kretanje automobila kada on pokusava da udje na parking.
    // Metoda je blokirajuca - ukoliko nema slobodnog mesta, izvrsenje je u blokadi dok se ono ne oslobodi.
    //
    // rbr  - Redni broj automobila
    // ulaz - Ulaz na koji automobil pokusava da udje
    //
    // Potrebno je pozvati metodu automobil.ceka kada automobil ne moze da pridje parkingu i mora da ceka.
    // Potrebno je pozvati metodu automobil.zauzima kada automobil zauzme parking mesto.
    void udji(int rbr, int ulaz) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        while(zauzeto == true || aktivan_ulaz!=ulaz){
            automobil.ceka(rbr,ulaz);
            uslov_ulaza[ulaz].wait(l);
        }
        automobil.zauzima(rbr);
        aktivan_ulaz = (aktivan_ulaz + 1)%3;
        zauzeto = true;


    }

    // Metoda koju poziva nit koja simulira kretanje automobila kada on napusta parking na koji je prethodno usao.
    //
    // rbr  - Redni broj automobila
    //
    // Potrebno je pozvati metodu automobil.napusta kada automobil napusti parking mesto.
    void izadji(int rbr) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        automobil.napusta(rbr);
        zauzeto = false;
        uslov_ulaza[aktivan_ulaz].notify_one();

    }
};

#endif // PARKING_HPP_INCLUDED
