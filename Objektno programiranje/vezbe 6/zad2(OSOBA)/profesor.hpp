#ifndef PROFESOR_HPP_INCLUDED
#define PROFESOR_HPP_INCLUDED

#include "osoba.hpp"

class Profesor : public Osoba{
protected:
    DinString predmet;

public:
    Profesor() {}
    Profesor(const DinString &i, const DinString &p, const DinString &predmet) : Osoba(i,p), predmet(predmet){}
    Profesor(const Profesor &p) : Osoba((Osoba)p), predmet(p.predmet){}

    virtual void predstaviSe()const {
        cout << "Osoba: ";
        if(ime =="" && prezime=="")
            cout << "x" << endl;
        else
            cout<< "Zovem se: " << ime << " " << prezime << " i predajem na predmetu " << predmet << "." << endl;
    }

};


#endif // PROFESOR_HPP_INCLUDED
