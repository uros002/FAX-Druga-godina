#ifndef PREDMET_HPP_INCLUDED
#define PREDMET_HPP_INCLUDED

#include "list.hpp"
#include "kolokvijum.hpp"

class Predmet{
private:
    DinString naziv;
    List<Test*> testovi;

public:
    Predmet() : naziv(""){}
    Predmet(const char* n) : naziv(n){}
    Predmet(const Predmet &p) : naziv(p.naziv){}

    void dodajTest(Test &t){
        testovi.add(testovi.size() + 1, &t);
    }

    DinString getNaziv() const{
        return naziv;
    }

    int getUkupniPoeni() const {
        Test *t;
        int poeni = 0;
        for(int i = 1; i <= testovi.size(); i++){
            testovi.read(i,t);
            poeni += t -> getPoeni();
        }
        return poeni;
    }

    bool polozio() const{
        Test *t;
        for(int i = 1; i <= testovi.size(); i++){
            testovi.read(i,t);
            if(!(t -> polozio()))
                return false;
        }

        if(getUkupniPoeni() > 55){
            return true;
        }else{
            return false;
        }
    }

    void ispis() const{
        cout << "---------------------------------" << endl;
        cout << "Naziv predmeta: " << naziv << endl;
        if(testovi.size() == 0 ){
            cout << "Nema testova!" << endl;
        }else {
            Test *t;
            cout << "Informacije o Testovima: " << endl;
            for(int i;i <= testovi.size();i++){
                testovi.read(i,t);
                t -> ispis();
            }
        }
        cout << "---------------------------------" << endl;
    }



};


#endif // PREDMET_HPP_INCLUDED
