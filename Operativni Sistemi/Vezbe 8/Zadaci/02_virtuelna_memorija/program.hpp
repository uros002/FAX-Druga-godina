#ifndef PROGRAM_HPP_INCLUDED
#define PROGRAM_HPP_INCLUDED

#include "dijagnostika.hpp"
#include "naredba.hpp"
#include "povratna_vrednost.hpp"

using namespace std;
using namespace chrono;

struct Zahtev{
public:
    int zauzmi;
    condition_variable cv;

    Zahtev(int zauzmi_memoriju){
        zauzmi = zauzmi_memoriju;
    }

    void cekaj(unique_lock<mutex> &l){
        while(zauzmi){
            cv.wait(l);
        }
    }

    void obradjen(){
        zauzmi = 0;
        cv.notify_one();
    }

};



class Program {
private:
    Dijagnostika& dijagnostika;
    mutex m;
    condition_variable virtuelna;
    int slobodno_ram;
    int zauzeto_virtuelna;
    queue<shared_ptr<Zahtev>> zahtevi;

    void izvrsi_malloc(int kolicina_memorije){
        unique_lock<mutex> l(m);
        if(slobodno_ram < kolicina_memorije){
            virtuelna.notify_one();

            shared_ptr<Zahtev> z = make_shared<Zahtev>(kolicina_memorije);
            zahtevi.push(z);
            z->cekaj(l);
        }else{
            slobodno_ram-=kolicina_memorije;
        }
        this_thread::sleep_for(seconds(1));
    }

public:
    Program(Dijagnostika& d, int kapacitet) : dijagnostika(d) {
        // Proširiti po potrebi ...
        slobodno_ram = kapacitet;
        zauzeto_virtuelna = 0;
    }

    Dijagnostika& getDijagnostika() {
        return dijagnostika;
    }

    // Metoda koju poziva nit koja simulira izvršenje programa, kako bi zauzela potrebnu memoriju
    //
    // naredba - naredba koja se izvršava (naredba kojom se zauzima memorija)
    // Vraća instancu klase Povratna_vrednost koja sadrži opis zauzeća memorije NAKON izvršenja naredbe.
    Povratna_vrednost izvrsi_naredbu(Naredba naredba) {
        // Implementirati ...
        if(naredba.tip == "repeat"){
            for(int i = 0; i<naredba.ponavljanja;i++){
                izvrsi_malloc(naredba.kolicina_memorije);
            }
        }else{
            izvrsi_malloc(naredba.kolicina_memorije);
        }
        return {slobodno_ram,zauzeto_virtuelna};


    }

    // Metoda koju poziva nit koja simulira deo operativnog sistema koji se bavi zauzimanjem virtuelne memorije kako bi se zauzela određena količina VM
    // Potrebnu količinu VM (kao i bilo koju drugu neophodnu informaciju) preneti u nekom izabranom polju klase.
    int zauzmi_virtuelnu_memoriju() {
        // Implementirati ...
        unique_lock<mutex> l(m);

        while(zahtevi.empty()){
            virtuelna.wait(l);
        }
        this_thread::sleep_for(seconds(1));

        shared_ptr<Zahtev>z = zahtevi.front();
        zauzeto_virtuelna += z->zauzmi;
        z->obradjen();
        zahtevi.pop();

        return zauzeto_virtuelna;

    }
};

#endif // PROGRAM_HPP_INCLUDED
