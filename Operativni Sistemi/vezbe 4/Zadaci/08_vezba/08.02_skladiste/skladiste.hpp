#ifndef SKLADISTE_HPP_INCLUDED
#define SKLADISTE_HPP_INCLUDED

#include "kamion.hpp"
#include <mutex>
#include <condition_variable>
#include <chrono>

using namespace std;
using namespace chrono;

class Skladiste {
private:
    Kamion& kamion;
    mutex m;
    bool rampa_slobodna[2];
    condition_variable zapaljivi,obicni;
    int zapaljivih_ceka;


public:
    Skladiste(Kamion& k) : kamion(k) {
        // Prosiriti po potrebi ...
        rampa_slobodna[0] = true;
        rampa_slobodna[1] = true;
        zapaljivih_ceka = 0;
    }

    // Metoda koju poziva nit koja simulira kretanje kamiona kada on pokusava da istovari robu.
    // Metoda je blokirajuca - ako su sve rampe za istovar zauzete, izvrsenje ce blokirati dok se neka ne oslobodi.
    //
    // rbr       - Redni broj kamiona
    // kolicina  - Kolicina robe koja se prevozi (u tonama)
    // zapaljivo - Ukazuje na to da li je roba koja se prevozi zapaljiva (takva roba ima prioritet pri istovaru!)
    //
    // Potrebno je pozvati metodu kamion.ceka kada su rampe zauzete i kamion mora da ceka.
    // Potrebno je pozvati metodu kamion.istovara kada zapocne istovar robe iz kamiona (primetiti da ta metoda zahteva da joj se prosledi indeks rampe na kojoj se obavlja istovar!)
    // Potrebno je pozvati metodu kamion.odlazi kada je kamion zavrsio istovar i odlazi.
    void istovari(int rbr, int kolicina, bool zapaljivo) {

        {
            unique_lock<mutex> l(m);
            while(rampa_slobodna[0] == false && rampa_slobodna[1]== false){

                if(zapaljivo){
                    zapaljivih_ceka++;
                    zapaljivi.wait();
                    kamion.ceka(rbr,kolicina,zapaljivo);
                    zapaljivih_ceka--;
                }else{
                    obicni.wait();
                    kamion.ceka(rbr,kolicina,zapaljivo);
                }
            }
        }

        int rampa = rampa_slobodna[0] ? 0:1
        rampa_slobodna[rampa] = false;
        kamion.istovara(rbr,kolicina,zapaljivo,rampa);
        l.unlock();
        this_thread::sleep_for(chrono::milliseconds(kolicina));
        l.lock();
        rampa_slobodna[rampa] = true;
        kamion.odlazi(rbr);

        if(zapaljivih_ceka){
            zapaljivi.notify_one();
        }else {
            obicni.notify_one();
        }

    }
};

#endif // SKLADISTE_HPP_INCLUDED
