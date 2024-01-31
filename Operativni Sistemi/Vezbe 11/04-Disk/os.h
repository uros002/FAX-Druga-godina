#ifndef OS_H_INCLUDED
#define OS_H_INCLUDED

#include "dijagnostika.h"

using namespace std;
using namespace chrono;

struct Zahtev{
    int broj_staze;
    bool zavrsen;
    condition_variable cv;

    Zahtev(int b) {

        broj_staze = b;
        zavrsen = false;
    }
};

class OS {
private:
    Dijagnostika& dijagnostika;
    mutex m;
    condition_variable ui;
    int trenutna_pozicija;
    vector<shared_ptr<Zahtev>> zahtevi;
    bool smer_obrade;
    bool kraj;

    vector<shared_ptr<Zahtev>>::iterator nadji_sledeci(){
        auto najblizi = zahtevi.end();
        int razlika_najblize_poz, razlika_trenutne_poz;
        for(auto it = zahtevi.begin();it!=zahtevi.end();it++){
            if(smer_obrade){
                razlika_trenutne_poz = (*it)->broj_staze - trenutna_pozicija;
            }else{
                razlika_trenutne_poz = trenutna_pozicija - (*it)-<broj_staze;
            }

            if(razlika_trenutne_poz>=0){
                if(najblizi == zahtevi.end()){
                    najblizi = it;
                    razlika_najblize_poz = razlika_trenutne_poz;
                }else if(razlika_trenutne_poz < razlika_najblize_poz){
                    najblizi = it;
                    razlika_najblize_poz = razlika_trenutne_poz;
                }
            }

        }

        return najblizi;
    }


public:
    OS(Dijagnostika& d, int t, bool kvs) : dijagnostika(d) {
        // Prosiriti po potrebi...
        smer_obrade = kvs;
        trenutna_pozicija = t;
        kraj = false;
    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje procesa, kako bi se uputio zahtev ka U/I uređaju
    //
    // id_procesa - ID procesa koji upućuje zahtev
    // broj_staze - broj staze diska kojoj nit želi da pristupi
    //
    // Metoda treba da formira novi zahtev i uputi ga U/I uređaju na obradu. Proces će biti blokiran dok god se ovaj
    // zahtev ne izvrši. Pre nego što stupi u blokadu, potrebno je pozvati dijagnostika.proces_ceka.
    void uputi_UI_zahtev(int id_procesa, int broj_staze) {
        // Implementirati...
        unique_lock<mutex> l(m);
        shared_ptr<Zahtev> z = shared_ptr<Zahtev>(new Zahtev(broj_staze));
        zahtevi.push(z);
        ui.notify_one();

        while(!zahtevi->zavrsen){
            dijagnostika.proces_ceka(id_procesa,broj_staze);
            z->cv.wait(l);
        }

    }

    // Metoda koju poziva nit koja simulira deo operativnog sistema koji upravlja diskom, kako bi se obradio jedan pristigli zahtev
    //
    // Prema uslovima zadatka, metoda treba da obradi najblizi zahtev koji je u smeru kretanja glave
    //
    // Povratna vrednost metode treba da bude broj staze koji je obrađen.
    int obradi_zahtev() {
        // Implementirati...
        unique_lock<mutex> l(m);
        while(zahtevi.empty() && !kraj){
            ui.wait(l);
        }

        auto sledeci = nadji_sledeci();

        l.unlock();
        this_thread::sleep_for(milliseconds(300));
        l.lock();

        if(sledeci == zahtevi.end()){
            if(smer_obrade){
                if(trenutna_pozicija < 199){
                    trenutna_pozicija = 199;
                }else{
                    trenutna_pozicija = 0;
                }
            }else{
                if(trenutna_pozicija > 0){
                    trenutna_pozicija = 0;
                }else{
                    trenutna_pozicija = 199;
                }
            }
        }else{
            trenutna_pozicija = (*sledeci)->broj_staze;

            (*sledeci)->zavrsen = true;
            (*sledeci)->cv.notify_one();
            zahtevi.erase(sledeci);
        }

        return trenutna_pozicija;

    }

    void proglasi_kraj(){
        unique_lock<mutex> l(m);
        kraj = true;
        ui.notify_one();
    }
};

#endif // OS_H_INCLUDED


