#ifndef PROIZVOD_HPP_INCLUDED
#define PROIZVOD_HPP_INCLUDED

#include "dinstring.hpp"

class Proizvod {
protected:
    int cena;
    DinString naziv;
public:
    Proizvod(int c, const DinString &n) : cena(c), naziv(n) {}

    virtual void izracunajPopust() const = 0;

    virtual void ispisi() const {
        cout << "--------------------------------" << endl;
        cout << "Naziv: " << naziv << endl;
        cout << "Cena: " << cena << endl;
        cout << "--------------------------------" << endl;
    }

    DinString getNaziv() const {
        return naziv;
    }

    int getCena() const{
        return cena;
    }

};


#endif // PROIZVOD_HPP_INCLUDED
