#ifndef RADNA_MEMORIJA_HPP_INCLUDED
#define RADNA_MEMORIJA_HPP_INCLUDED

#include "dijagnostika.hpp"

using namespace std;
using namespace chrono;

class Radna_memorija {
private:
    Dijagnostika& dijagnostika;
    mutex m;
    bool pocni_sazimanje;
    vector<int> lokacije;
    condition_variable cv_sazimanje,cv_slobodno;


    int pocetak_bloka(int br_lokacija_procesa){
        int broj_uzastopnih = 0;
        int i = 0;
        for(auto it_lok = lokacije.begin();it_lok!=lokacije.end();it_lok++,i++){
            if(*it_lok==-1){
                broj_uzastopnih++;
            }else{
                broj_uzastopnih=0;
            }

            if(broj_uzastopnih == br_lokacija_procesa){
                return i - broj_uzastopnih + 1;
            }
        }
        return -1;
    }

public:
    Radna_memorija(Dijagnostika& d, int ukupno_lokacija) : dijagnostika(d) {
        // Proširiti po potrebi ...
        lokacije.resize(ukupno_lokacija,-1);
        pocni_sazimanje=false;

    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje procesa kako bi proces zauzeo potrebnu memoriju i krenuo sa radom
    //
    // id_procesa          - identifikator procesa
    // br_lokacija_procesa - ukupan broj lokacija memorije koje su neophodne za izvršenje procesa
    // trajanje            - koliko dugo se proces izvršava (u sekundama)
    //
    // Ukoliko trenutno nema na raspolaganju dovoljno slobodne memorije (moraju se zauzeti uzastopni okviri u memoriji!), potrebno je pozvati metodu dijagnostika.proces_ceka a nakon toga proces treba da čeka dok se memorija ne oslobodi.
    // Kada proces uspe da dođe do potrebne radne memorije, treba da se pozove dijagnostika.proces_zauzeo_okvire.
    // Kada se proces završi, potrebno je pozvati metodu dijagnostika.proces_zavrsio.
    // Metodu dijagnostika.ispisi_memoriju potrebno je pozvati u sledećim momentima: nakon što proces zauzme memoriju i nakon što proces oslobodi memoriju.
    void koristi(int id_procesa, int br_lokacija_procesa, int trajanje) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        int pocetak;

        while(pocetal = pocetak_bloka(br_lokacija_procesa) == -1){
                dijagnostika.proces_ceka(id_procesa);
                cv_slobodno.wait(l);
        }

        for(int i = 0; i<br_lokacija_procesa;i++){
            lokacije[pocetak + i] = id_procesa;
        }

        l.unlock();
        this_thread::sleep_for(seconds(trajanje));
        l.lock();

        for(pocetak = 0; pocetak < lokacije.size();pocetak++){
            if(lokacije[pocetak] == id_procesa)
                break;
        }

        for(int i  = 0; i<br_lokacija_procesa;i++){
            lokacije[pocetak + i] = -1;
        }

        dijagnostika.proces_zavrsio(id_procesa);
        dijagnostika.ispisi_memoriju(lokacije.begin(),lokacije.end());

        pocni_sazimanje = true;
        cv_sazimanje.notify_one();
    }

    // Metoda koju poziva nit operativnog sistema koji se bavi sažimanjem memorije
    //
    // Nakon što je sažimanje obavljeno potrebno je pozvati metodu dijagnostika.sazimanje_obavljeno a nakon toga i metodu dijagnostika.ispisi_memoriju kako bi se prikazali efekti sažimanja memorije.
    void sazimanje() {
        // Implementirati ...
        unique_lock<mutex> l(m);
        while(!pocni_sazimanje){
            cv_sazimanje.wait(l);
        }

        pocni_sazimanje = false;

        vector<int> kopija;
        kopija.resize(lokacije.size(),-1);
        int a= 0;
        for(int i = 0; i< lokacije.size(); i++){
            if(lokacije[i] != -1){
                kopija[++a] = lokacije[i];
            }
        }

        lokacije = kopija;

        dijagnostika.sazimanje_obavljeno();
        dijagnostika.ispisi_memoriju(lokacije.begin(),lokacije.end());

        cv_slobodno.notify_all();



    }
};

#endif // RADNA_MEMORIJA_HPP_INCLUDED
