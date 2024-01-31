#include <iostream>
#include "ucionica.hpp"
using namespace std;

int main()
{
    cout << "Testiranje klasa osoba" << endl;

    Osoba o;
    o.predstaviSe();

    Osoba o1("Petar", "Peric");
    o1.predstaviSe();

    Osoba o2(o);
    o2.predstaviSe();

    cout << endl;
    cout << "Testiranje klase student" << endl;

    Student s;
    s.predstaviSe();

    Student s1("Marko", "Markovic", 100);
    s1.predstaviSe();

    Student s2(s);
    s2.predstaviSe();

    cout << endl;
    cout << "Testiranje klase profesor" << endl;

    Profesor p;
    p.predstaviSe();

    Profesor p1("Milos", "Milosevic", "algebra");
    p1.predstaviSe();

    Profesor p2(p1);
    p2.predstaviSe();

    cout << endl;
    cout << "Testiranje klase ucionica" << endl;

    Ucionica u("FTN-u1",5);
    u.ispis();

    if(u.dodaj(p1)){
        cout << "Uspesno dodavanje!" << endl;
    }else {
        cout << "Neuspesno dodavanje!" << endl;
    }

    if(u.dodaj(p2)){
        cout << "Uspesno dodavanje!" << endl;
    }else {
        cout << "Neuspesno dodavanje!" << endl;
    }

    if(u.dodaj(s1)){
        cout << "Uspesno dodavanje!" << endl;
    }else {
        cout << "Neuspesno dodavanje!" << endl;
    }


    if(u.dodaj(s2)){
        cout << "Uspesno dodavanje!" << endl;
    }else {
        cout << "Neuspesno dodavanje!" << endl;
    }

    if(u.dodaj(p)){
        cout << "Uspesno dodavanje!" << endl;
    }else {
        cout << "Neuspesno dodavanje!" << endl;
    }

    if(u.dodaj(s)){
        cout << "Uspesno dodavanje!" << endl;
    }else {
        cout << "Neuspesno dodavanje!" << endl;
    }

    u.ispis();

    return 0;
}
