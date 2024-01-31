#ifndef RADNA_MEMORIJA_HPP_INCLUDED
#define RADNA_MEMORIJA_HPP_INCLUDED

#include "dijagnostika.hpp"

using namespace std;

class Radna_memorija {
private:
    Dijagnostika& dijagnostika;
    mutex m;
    vector<int> okviri;
    int slobodnih_okvira;
    condition_variable cv;

public:
    // dijagnostika  - referenca na instancu klase Dijagnostika
	// ukupno_okvira - ukupan broj okvira u memoriji
    Radna_memorija(Dijagnostika& d, int ukupno_okvira) : dijagnostika(d) {
        // Proširiti po potrebi ...
        okviri.resize(ukupno_okvira,-1);
        slobodnih_okvira = ukupno_okvira;

    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje procesa kako bi pokušala da učita proces u radnu memoriju
    //
    // broj_stranica - ukupan broj stranica koje proces sadrži
    // id_procesa    - identifikator procesa
    //
    // Ukoliko trenutno nema na raspolaganju dovoljno memorije (broj stranica u procesu je veći od broja raspoloživih okvira memorije), potrebno je pozvati metodu dijagnostika.proces_ceka a nakon toga proces treba da čeka dok se memorija ne oslobodi.
    // Kada proces uspe da dođe do potrebne radne memorije, treba da se pozove dijagnostika.proces_izvrsava. Nakon toga,
    // kada proces zauzme okvire radne memorije, potrebno je pozvati dijagnostika.ispisi_okvire kako bi se prikazalo trenutno zauzece svih okvira (podrazumeva se da zelimo da prikazemo sliku svih okvira, tako da ce se videti i okviri koje su zauzeli drugi procesi).
    void ucitaj(int broj_stranica, int id_procesa) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        while(slobodnih_okvira<broj_stranica){
            dijagnostika.proces_ceka(id_procesa);
            cv.wait(l);
        }

        dijagnostika.proces_se_izvrsava(id_procesa);
        int proces_zauzeto_okvira = 0;

        for(auto it=okviri.begin();it!=okviri.end();it++){
            if(*it == -1){
                *it = id_procesa;
                slobodnih_okvira--;
                if(++proces_zauzeto_okvira == broj_stranica){
                    break;
                }
            }
        }

        dijagnostika.ispisi_okvire(okviri.begin(),okviri.end());


    }

    // Metoda koju poziva nit koja simulira izvršenje procesa kako bi oslobodila radnu memoriju koju je koristila tokom izvršenja
    //
    // id_procesa - identifikator procesa koji oslobađa memoriju
    void oslobodi(int id_procesa) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        for(auto it=okviri.begin();it!=okviri.end();it++){
            if(*it == id_procesa){
                *it = -1;
                slobodnih_okvira++;
            }
        }
        cv.notify_all();
    }
};

#endif // RADNA_MEMORIJA_HPP_INCLUDED
