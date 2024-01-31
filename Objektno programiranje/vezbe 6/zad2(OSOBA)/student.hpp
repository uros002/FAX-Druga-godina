#ifndef STUDENT_HPP_INCLUDED
#define STUDENT_HPP_INCLUDED

#include "osoba.hpp"

class Student : public Osoba{
protected:
    int brojIndeksa;

public:
    Student() : Osoba(), brojIndeksa(0){}
    Student(const DinString &i, const DinString &p, int bri) : Osoba(i,p), brojIndeksa(bri){}
    Student(const Student &s) : Osoba((Osoba)s), brojIndeksa(s.brojIndeksa){}

    virtual void predstaviSe()const {
        cout << "Osoba: ";
        if(ime =="" && prezime=="")
            cout << "x" << endl;
        else
            cout<< "Zovem se: " << ime << " " << prezime << " a broj indeksa je " << brojIndeksa << "." << endl;
    }
};

#endif // STUDENT_HPP_INCLUDED
