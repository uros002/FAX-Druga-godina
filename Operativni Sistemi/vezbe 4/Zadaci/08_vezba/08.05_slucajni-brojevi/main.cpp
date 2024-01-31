/**
 * Napisati C++ program koji cita podatke o uniformnim distribucijama iz ulazne datoteke i potom za
 * svaku distribuciju generise po 10 brojeva, racuna njihov prosek, i nalazi najmanji i najveci broj.
 *
 * U ulaznoj datoteci "distribucije.txt" se u svakom redu nalaze informacije o donjoj i gornjoj granici
 * intervala u kojem treba generisati brojeve. Informacije o gornjoj i donjoj granici su odvojene dvotackom.
 *  U pitanju su razlomljeni brojevi.
 *
 * U izlaznoj datoteci "brojevi.csv" treba da se nalaze u jednom redu odvojeni zarezom prvo 10
 * izgenerisanih brojeva a potom i prosek, najmanji element i najveci element.
 *
 * Treba napraviti jednu nit koja ce samo citati ulazne podatke, jednu nit koja ce samo pisati gotove
 * brojeve u datoteku i 6 niti radnika koji ce na osnovu podataka iz ulazne datoteke generisati sve
 * neophodno za ispis u izlaznu datoteku.
*/

#include <iostream>
#include <fstream>
#include <mutex>
#include <condition_variable>
#include <thread>
#include <random>
#include <queue>
#include <sstream>

#define BROJ_RADNIKA 6
#define BROJ_GENERISANIH_BROJEVA 10;
using namespace std;

/** Klasa koja modeluje "postansko sanduce" izmedju citaca i radnika.
*/
template<typename T>
class UlazniPodaci {
private:
    mutex podaci_mx;                       // propusnica za sinhronizaciju nad svim poljima klase
    // TODO dodati polja ako je potrebno
    queue<T> granice;
    condition_variable podaci_spremni;
    bool kraj;
public:
    UlazniPodaci(): kraj(false) {}  // na pocetku nije kraj i nema radnika

    void dodaj(T par_granica) {
        // TODO
        unique_lock<mutex> propusnica(podaci_mx);
        granice.push(par_granica);
        }
    }

    bool preuzmi(T &par_granica) {
        // TODO
        unique_lock<mutex> propusnica(podaci_mx);
        while(daLiCekamPodatke()){
            podaci_spremni.wait(propusnica);
        }
        if(jeLiKraj()){
            return false;
        }
        par_granica = granice.front();
        granice.pop();
        return true;

    }

    void objaviKraj(){
        unique_lock<mutex> propusnica(podaci_mx);
        kraj = true;
        podaci_spremni.notify_all();
    }

    // TODO dodati jos neku metodu ako je potrebno

private:
    /**
     * Provera da li treba da cekamo podatke. Vraca istinu samo onda kada u kolekciji
     * nema podataka ali istovremeno i nije objavljen kraj stvaranja podataka.
    */
    bool daLiCekamPodatke() {
        // TODO
        return granice.empty() && !kraj;
    }

    /**
     * Provera da li smo zavrsili sa citanjem podataka. Vraca istinu samo onda kada nema vise podataka
     * u kolekciji i sve niti stvaraoci podataka su se odjavili.
    */
    bool jeLiKraj() {
        // TODO
        return granice.empty() && kraj;
    }
};


/** Klasa koja modeluje "postansko sanduce" izmedju radnika i pisaca.
*/
template<typename T>
class IzlazniPodaci {
private:
    mutex podaci_mx;                       // propusnica za sinhronizaciju nad svim poljima klase
    // TODO dodati polja ako je potrebno
    int br_stvaralaca_podataka;
    queue<T> brojevi_za_ispis;
    condition_variable podaci_spremni;
    bool kraj;
public:
    IzlazniPodaci(): kraj(false), br_stvaralaca_podataka(0) {}  // na pocetku nije kraj i nema radnika

    void dodaj(T brojevi) {
        // TODO
        unique_lock<mutex> propusnica(podaci_mx);
        brojevi_za_ispis.push(brojevi);
    }

    bool preuzmi(T &brojevi) {
        // TODO
        unique_lock<mutex> propusnica(podaci_mx);
        while(daLiCekamPodatke()){
            podaci_spremni.wait(propusnica);
        }
        if(jeLiKraj()){
            return false;
        }
        brojevi = brojevi_za_ispis.front();
        brojevi_za_ispis.pop();
        return true;
    }

    void prijavaStvaraoca(){
        unique_lock<mutex> propusnica(podaci_mx);
        br_stvaralaca_podataka++;
    }

    void odjavaStvaraoca(){
        unique_lock<mutex> propusnica(podaci_mx);
        br_stvaralaca_podataka--;
        if(!br_stvaralaca_podataka){
            kraj = true;
            podaci_spremni.notify_one();
        }
    }

    // TODO dodati jos neku metodu ako je potrebno

private:
    /**
     * Provera da li treba da cekamo podatke. Vraca istinu samo onda kada u kolekciji
     * nema podataka ali istovremeno i nije objavljen kraj stvaranja podataka.
    */
    bool daLiCekamPodatke() {
        // TODO
        return brojevi_za_ispis.empty() && !kraj;
    }

    /**
     * Provera da li smo zavrsili sa citanjem podataka. Vraca istinu samo onda kada nema vise podataka
     * u kolekciji i sve niti stvaraoci podataka su se odjavili.
    */
    bool jeLiKraj() {
        // TODO
        return brojevi_za_ispis.empty() && kraj;
    }
};


/**
 * Logika radnika - niti koje vrse transformaciju ulaznih podataka u izlazne podatke spremne za ispis.
*/
void radnik(UlazniPodaci<pair<double, double>> &ulaz, IzlazniPodaci<vector<double>> &izlaz) {
    // TODO
}

/**
 * Logika citaca_iz_datoteke - nit koja radi citanje iz ulazne datoteke i salje u ulaznu kolekciju za radnike
*/
void citacf(string ime_ulazne_dat, UlazniPodaci<pair<double, double>> &ulaz) {
    // TODO
}

/**
 * Logika pisaca_u_datoteku - nit koja radi pisanje u izlaznu datoteku podataka dobijenih od radnika
*/
void pisacf(IzlazniPodaci<vector<double>> &izlaz, string ime_izlazne_dat) {
    // TODO
}

int main() {
    UlazniPodaci<pair<double, double>> ulazni_podaci;  // bafer podataka koje salje citac_iz_datoteke a obradjuju radnici
    IzlazniPodaci<vector<double>> izlazni_podaci;  // bafer podataka koje pripremaju radnici a ispisuju se u datoteku u pisacu_u_datoteku
    thread citac{citacf, "distribucije.txt", ref(ulazni_podaci)},  // stvaranje niti citaca_iz_datoteke
           pisac{pisacf, ref(izlazni_podaci), "brojevi.csv"},      // stvaranje niti pisaca_u_datoteku
           radnici[BROJ_RADNIKA];

    for (auto &nit: radnici)
        nit = thread(radnik, ref(ulazni_podaci), ref(izlazni_podaci));  // stvaranje niti radnika

    for (auto &nit: radnici)
        nit.join();
    citac.join();
    pisac.join();

    return 0;
}
