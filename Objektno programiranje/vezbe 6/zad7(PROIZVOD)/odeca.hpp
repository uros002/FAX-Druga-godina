#ifndef ODECA_HPP_INCLUDED
#define ODECA_HPP_INCLUDED

#include "proizvod.hpp"

enum SIZE{XS,S,M,L,XL};
enum TYPE{MAJICA,PANTALONE};

class Odeca : public Proizvod {
protected:
    SIZE velicina;
    TYPE tip;
    static int brojVelikeOdece;
public:
    Odeca(int c, const DinString &n,SIZE v, TYPE t): Proizvod(c,n), velicina(v), tip(t) {
        if(v == L || v == XL){
            brojVelikeOdece++;
        }
    }

    ~Odeca(){
        if(velicina == L || velicina== XL){
            brojVelikeOdece--;
        }
    }

    void izracunajPopust(){
        double popust = 0;
        if(tip == MAJICA){
            if(velicina == XL){
                popust = 0.6;
            }else {
                popust = 0.5;
            }
        }else if (tip == PANTALONE){
            popust = 0.33;
        }

        cena = cena - cena * popust;
    }

    /*
    void ispisi() {
        Proizvod::ispisi();
        cout << "Tip odece: " << tip << endl;
        cout << "Velicina: " << velicina << endl;
    }

    */

    void ispisi(){
        Proizvod::ispisi();
        cout << "Velicina: ";

        switch(velicina){
            case XS: cout << "XS" << endl; break;
            case S: cout << "S" << endl; break;
            case M: cout << "M" << endl; break;
            case L: cout << "L" << endl; break;
            case XL: cout << "XL" << endl; break;
        }

        cout << "Tip: ";
        switch (tip){
            case MAJICA: cout << "Majica" << endl; break;
            case PANTALONE: cout << "Pantalone" << endl; break;
        }
    }

    int getBrojVelikeOdece() const{
        return brojVelikeOdece;
    }

};


#endif // ODECA_HPP_INCLUDED
