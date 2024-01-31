#include <iostream>
#include "predmet.hpp"
#include "student.hpp"
#include <ctime>


int main()
{
    srand(time(NULL));

    Kolokvijum k,k1("K1"),k2("K2"),k3("K3"),k4("K4");
    cout << "Testiranje klase Kolokvijum" << endl << endl;

    if(k1.polozio()){
        cout << "---------------------------------" << endl;
        cout << "Kolokvijum je polozen!" << endl;
        cout << "Broj osvojenih bodova je: " << k1.getPoeni() << endl;
        cout << "---------------------------------" << endl;
    }else {
        cout << "---------------------------------" << endl;
        cout << "Kolokvijum nije polozen!" << endl;
        cout << "Broj osvojenih bodova je: " << k1.getPoeni() << endl;
        cout << "---------------------------------" << endl;
    }

    cout << endl;

     if(k2.polozio()){
        cout << "---------------------------------" << endl;
        cout << "Kolokvijum je polozen!" << endl;
        cout << "Broj osvojenih bodova je: " << k2.getPoeni() << endl;
        cout << "---------------------------------" << endl;
    }else {
        cout << "---------------------------------" << endl;
        cout << "Kolokvijum nije polozen!" << endl;
        cout << "Broj osvojenih bodova je: " << k2.getPoeni() << endl;
        cout << "---------------------------------" << endl;
    }

    cout << endl << endl;
    cout << "Testiranje klase Predmet" << endl;

    Predmet p1,p2("OOP"),p3("Primenjeni Algoritmi");

    p1.ispis();
    p2.ispis();
    p3.ispis();

    p2.dodajTest(k1);
    p2.ispis();

    p2.dodajTest(k2);
    p2.dodajTest(k3);
    p2.dodajTest(k4);
    p2.ispis();

    cout << "Ukupno bodova osvojeno: " << p2.getUkupniPoeni() << endl;
    cout << (p2.polozio() ? "Polozio OOP" : "Nije polozio OOP") << endl;

    cout << endl << endl;

    Predmet p4(p3);
    p4.ispis();

    cout << endl << endl ;
    cout << "Testiranje klase Student" << endl;


    Student s(p2,p3);
    s.ispis();

    return 0;
}
