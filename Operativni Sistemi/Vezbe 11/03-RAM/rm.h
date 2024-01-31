#ifndef RADNA_MEMORIJA_H_INCLUDED
#define RADNA_MEMORIJA_H_INCLUDED

#include "tip_procesa.h"
#include "dijagnostika.h"

using namespace std;
using namespace chrono;

struct Zahtev{
    int broj_okvira;
    bool zavrsen;
    condition_variable cv;
    Tip_procesa::tip_procesa tip;
    int id_procesa;
    Zahtev(int br_ok,int id,Tip_procesa::tip_procesa t){
        broj_okvira = br_ok;
        id_procesa = id;
        tip = t;
        zavrsen = false;
    }
};


class Radna_memorija {
private:
    	Dijagnostika& dijagnostika;
    	mutex m;
    	condition_variable cv_opsluzilac;
    	condition_variable oslobodjena_memorija;
    	vector<int> okviri;
    	int slobodnih_okvira;
    	queue<shared_ptr<Zahtev>> sys_zahtevi;
    	vector<shared_ptr<Zahtev>> user_zahtevi;

public:
        // parametar ukupno_okvira - ukupan broj okvira u radnoj memoriji
        Radna_memorija(Dijagnostika& d, int ukupno_okvira) : dijagnostika(d) {
            // proširiti po potrebi
            okviri.resize(ukupno_okvira,-1);
            slobodnih_okvira = ukupno_okvira;

        }

        Dijagnostika& getDijagnostika() {
            return dijagnostika;
        }
        // parametar broj_okvira - koliko okvira treba procesu za izvršavanje
        // parametar id_procesa  - jedinstveni identifikator procesa
        // parametar tip_procesa - da li je proces USER ili SYSTEM
        // nakon što pošalje zahtev, proces mora da sačeka dok opslužilac ne zauzme zahtevani broj okvira
        // i tada je potrebno pozvati metodu proces_ceka
        void napravi_zahtev(int broj_okvira, int id_procesa, Tip_procesa::tip_procesa t) {
           // Implementirati
           unique_lock<mutex> l(m);
           shared_ptr<Zahtev> z = shared_ptr<Zahtev>(broj_okvira,id_procesa,t);
           if(t== Tip_procesa::SYSTEM)
            sys_zahtevi.push(z);
           else
            sys_zahtevi.push_back(z);

           while(!z->zavrsen){
            dijagnostika.proces_ceka(id_procesa,broj_okvira,t);
            z->cv.wait(l);
           }



        }

        // parametar id_procesa  - jedinstveni identifikator procesa

        void oslobodi(int id_procesa) {
            // Implementirati
            for(auto it=okviri.begin();it!=okviri.end();it++){
                if(*it == id_procesa){
                    *it = -1;
                    slobodnih_okvira++;
                }
            }
            oslobodjena_memorija.notify_one();

        }

        // potrebno pozvati metodu ispisi_okvire nakon što proces zauzme okvire
        // potrebno pozvati metodu proces_zauzeo proces zauzme okvire
        void opsluzi() {
            // Implementirati
            unique_lock<mutex> l(m);
            while(sys_zahtevi.empty() && user_zahtevi.empty()){
                cv_opsluzilac.wait(l);
            }

            shared_ptr<Zahtev> z;
            vector<shared_ptr<Zahtev>>::iterator najbolji = user_zahtevi.begin();

            if(!sys_zahtevi.empty()){
                z = sys_zahtevi.front();
                sys_zahtevi.pop();
            }else{
                for(auto it=user_zahtevi.begin();it!=user_zahtevi.end();it++){
                    if(*it)->broj_okvira < (*najbolji)->broj_okvira){
                        najbolji = it;
                        break;
                    }
                }

                z = *najbolji;
                user_zahtevi.erase(najbolji);
            }

            while(slobodnih_okvira<z->br_okvira){
                oslobodjena_memorija.wait(l);
            }

            int proces_zauzeto_okvira = 0;
            for(auto it = okviri.begin();it!=okviri.end();it++){
                if(*it == -1){
                    *it = id_procesa;
                    slobodnih_okvira--;
                    if(++proces_zauzeto_okvira == z->broj_okvira){
                        break;
                    }
                }
            }

            dijagnostika.proces_zauzeo(z->id_procesa,z->broj_okvira,z->tip);
            dijagnostika.ispisi_okvire(okviri.begin(),okviri.end());
            z->zavrsen = true;
            z->cv.notify_one();



        }


};



#endif // RADNA_MEMORIJA_H_INCLUDED
