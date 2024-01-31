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
    queue<shared_ptr<UI_zahtev>> zahtevi;
    condition_variable ui;
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
        zahtevi.push(z);
        ui.notify_one();

        while(!z->obradjen){
            dijagnostika.proces_ceka(id_procesa,broj_staze);
            z->cv.wait(l);
        }
    }

    // Metoda koju poziva nit koja simulira deo operativnog sistema koji upravlja diskom, kako bi se obradio jedan pristigli zahtev
    //
    // Prema uslovima zadatka, metoda treba da obradi zahtev koji je najranije pristigao.
    //
    // Na kraju simulacije, treba ispisati na standardni izlaz ukupno utroseno vreme u ms.
    //
    // Povratna vrednost metode treba da bude broj staze koji je obrađen.
    int obradi_zahtev() {
        // Implementirati ...
        unique_lock<mutex> l(m);
        while(zahtevi.empty() && !kraj){
            ui.wait(l);
        }

        if(kraj) return -1;

        shared_ptr<UI_zahtev> z = zahtevi.front();
        zahtevi.pop();

        milliseconds trajanje_obrade(abs(trenutna_poz - z->broj_staze)*10);

        l.unlock();
        this_thread::sleep_for(trajanje_obrade);
        l.lock();

        trenutna_poz = z->broj_staze;
        ukupno_trajanje += trajanje_obrade;

        z->obradjen = true;
        z->cv.notify_one();
        return z->broj_staze;
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
