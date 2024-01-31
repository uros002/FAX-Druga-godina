#ifndef AUTOMOBIL_HPP_INCLUDED
#define AUTOMOBIL_HPP_INCLUDED

#include "menjac.hpp"
#include "skoljka.hpp"

class Automobil{

private:
    Menjac m;
    Skoljka s;

public:
    Automobil() : m(), s() {}

    Automobil(TipMenjaca tm, int br, BojaSkoljke bs) : m(tm,br), s(bs) {}

    Automobil(const Automobil &a): m(a.m), s(a.s) {}

    bool setBrzina(int br){
        return m.setBrzina(br);
    }

    void setBoja(BojaSkoljke bs){
        s.setBoja(bs);
    }

    void setTipMenjaca(TipMenjaca tm){
        m.setTip(tm);
    }

    int getBrzina() const{
        return m.getBrzina();
    }

    TipMenjaca getTipMenjaca() const{
        return m.getTip();
    }

    BojaSkoljke getBojaSkoljke() const{
        return s.getBoja();
    }

    friend void ispisiAutomobil(const Automobil &);

};

#endif // AUTOMOBIL_HPP_INCLUDED
