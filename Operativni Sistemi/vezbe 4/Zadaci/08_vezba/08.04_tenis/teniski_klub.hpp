#ifndef TENISKI_KLUB_HPP_INCLUDED
#define TENISKI_KLUB_HPP_INCLUDED

#include "podaci.hpp"
#include "mec.hpp"

#include <mutex>
#include <condition_variable>
#include<chrono>

#define MAX_TERENA 30

using namespace std;
using namespace chrono;

class Teniski_klub {                             //Klasa deljenog resursa. Pravi se maksimalno 30 terena, ali ce u realnosti biti samo 3 terena.
private:
    Mec& mec;
    mutex m;
    condition_variable uslovi[MAX_TERENA];
    bool zauzeto[MAX_TERENA];

public:
    Teniski_klub(Mec& m, int ukupno_terena) : mec(m) {
        // Prosiriti po potrebi ...
            for(int i = 0; i<MAX_TERENA; i++){
                zauzeto[i] = false;
            }
        }
    }

    // Metoda koju poziva nit koja simulira mec kako bi izvrsila teniski mec.
    // Metoda je blokirajuca - ako je zeljeni teren zauzet, izvrsenje ce blokirati dok se on ne oslobodi.
    //
    // broj_meca - Redni broj meca
    // na_terenu - Indeks terena na kojem mec treba da se odigra
    //
    // Potrebno je pozvati metodu mec.ceka kada je izabrani teren zauzet i mec mora da ceka.
    // Potrebno je pozvati metodu mec.pocinje kada se isprazni izabrani teren i mec moze da pocne.
    // Potrebno je pozvati metodu mec.zavrsen kada se mec zavrsi i mogu se proslediti izmereni vremenski intervali.
    void odigraj_mec(int broj_meca, int na_terenu) {
        // Implementirati ...
        Podaci p;
        {
            p.dosao() = system_clock::now();
            unique_lock<mutex> l(m);
            while(zauzeto[na_terenu]){
                mec.ceka(broj_meca,na_terenu);
                uslovi[na_terenu].wait(l);
            }
            p.pocetak = system_clock::now();
            zauzeto[na_terenu] = true;
            mec.pocinje(broj_meca,na_terenu);
        }
        this_thread::sleep_for(seconds((rand %5)+1));
        p.trajanje = system_clock::now() - p.pocetak();
        mec.zavrsen(broj_meca,na_terenu);

        unique_lock<mutex> l(m);
        zauzeto[na_terenu] = false;
        uslovi[na_terenu].notify_one();

    }
};

#endif // TENISKI_KLUB_HPP_INCLUDED
