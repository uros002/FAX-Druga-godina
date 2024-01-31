#ifndef AUTOMOBIL_HPP_INCLUDED
#define AUTOMOBIL_HPP_INCLUDED

#include "menjac.hpp"
#include "skoljka.hpp"

#define MAX_BRZINA 6

enum Stanje{UGASEN,UPALJEN,POKVAREN};

class Automobil {

private:
    Menjac m;
    Skoljka s;
    Stanje stanje;
    int trenutnaBrzina;

public:

    Automobil() : m(), s(){
        stanje = UGASEN;
        trenutnaBrzina = 0;
    }

    Automobil(TipMenjaca tm, int br, BojaSkoljke bs) : m(tm,br), s(bs){}

    Automobil(const Automobil &a) : m(a.m), s(a.s){}

    bool setBrzina(int b){
        return m.setBrzina(b);
    }

    int getBrzina() const{
        return m.getBrzina();
    }

    void setBoja(BojaSkoljke bs){
        s.setBoja(bs);
    }

    BojaSkoljke getBojaSkoljke() const{
        return s.getBoja();
    }

    void setTipMenjaca(TipMenjaca tm){
        m.setTip(tm);
    }

    TipMenjaca getTipMenjaca() const{
        return m.getTip();
    }

    bool upali(){
        if(stanje == UGASEN) {
            stanje = UPALJEN;
            return true;
        }
        return false;
    }

    bool ugasi(){
        if(stanje == UPALJEN){
            stanje = UGASEN;
            trenutnaBrzina = 0;
            return true;
        }
        return false;
    }

    bool pokvari(){
        if(stanje == UGASEN || stanje == UPALJEN){
            stanje = POKVAREN;
            trenutnaBrzina = 0;
            return true;
        }
        return false;
    }

    bool popravi(){
        if(stanje == POKVAREN){
            stanje = UGASEN;
            return true;
        }
        return false;
    }

    bool povecajBrzinu(){
        if(stanje == UPALJEN && trenutnaBrzina < MAX_BRZINA){
            trenutnaBrzina = trenutnaBrzina + 1;
            return true;
        }
        return false;
    }

    bool smanjiBrzinu(){
        if(stanje == UPALJEN && trenutnaBrzina > 0){
            trenutnaBrzina = trenutnaBrzina - 1;
            return true;
        }
        return false;
    }

    friend void ispisiAutomobil(const Automobil &);
};


#endif // AUTOMOBIL_HPP_INCLUDED
