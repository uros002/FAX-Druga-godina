#ifndef OS_HPP_INCLUDED
#define OS_HPP_INCLUDED

#include "dijagnostika.hpp"

using namespace std;
using namespace chrono;

struct UI_zahtev{
    condition_variable cv;
    int broj_staze;
    bool obradjen;

    UI_zahtev(int b) : broj_staze(b), obradjen(false){
    }
};

class OS {
private:
    Dijagnostika& dijagnostika;
    mutex m;
    condition_variable ui;
    queue<shared_ptr<UI_zahtev>> zahtevi;
    int trenutna_poz;
    bool kraj;
    milliseconds ukupno_trajanje;

public:
    OS(Dijagnostika& d, int t) : dijagnostika(d) {
        // Proširiti po potrebi ...
        trenutna_poz = t;
        kraj = false;
        ukupno_trajanje = 0;
    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje procesa, kako bi se uputio zahtev ka U/I uređaju
    //
    // id_procesa - ID procesa koji upućuje zahtev
    // broj_staze - broj staze diska kojoj nit želi da pristupi
    //
    // Metoda treba da formira novi zahtev i uputi ga U/I uređaju na obradu. Proces će biti blokiran dok god se ovaj zahtev ne izvrši. Pre nego što stupi u blokadu, potrebno je pozvati dijagnostika.proces_ceka.
    void uputi_UI_zahtev(int id_procesa, int broj_staze) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        shared_ptr<UI_zahtev> z = shared_ptr<UI_zahtev>(new UI_zahtev(broj_staze));
        zahtevi.push_back(z);
        ui.notify_one();

        while(!z->obradjen){
            dijagnostika.proces_ceka(id_procesa,broj_staze);
            z->cv.wait(l);
        }

    }

    // Metoda koju poziva nit koja simulira deo operativnog sistema koji upravlja diskom, kako bi se obradio jedan pristigli zahtev
    //
    // Prema uslovima zadatka, metoda treba da obradi zahtev kojim se pristupa onoj stazi koja je najbliža stazi na kojoj je trenutno glava diska
    //
    // Povratna vrednost metode treba da bude broj staze koji je obrađen.
    int obradi_zahtev() {
        // Implementirati ...
    }

    // Metoda koja vraca sumu svih vremena potrosenih za obradu zahteva
    int dobaviUkupnoTrajanje() {
        // Implementirati ...
        unique_lock<mutex> l(m);
        return ukupno_trajanje.count();
    }

    // Metoda koja postavlja signal za kraj izvršavanja i pokreće obrađivač iz čekanja kako bi program mogao da se završi
    void zavrsi() {
        // Implementirati ...
        unique_lock<mutex> l(m);
        kraj = true;
        ui.notify_one();
    }
};

#endif // OS_HPP_INCLUDED
