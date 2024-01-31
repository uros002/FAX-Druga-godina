#ifndef NITI_H
#define NITI_H

#include <thread>

using namespace std;

double izracunaj(list<string> kupljeno, map<string, double> cenovnik)
{
    double ukupna_cena;
    thread t(obracunajUkupno, kupljeno, cenovnik, ref(ukupna_cena));
    t.join();
    return ukupna_cena;
}

#endif // NITI_H
