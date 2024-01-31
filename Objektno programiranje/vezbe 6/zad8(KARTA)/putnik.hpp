#ifndef PUTNIK_HPP_INCLUDED
#define PUTNIK_HPP_INCLUDED

#include "dinstring.hpp"
#include "karta.hpp"

class Putnik {
protected:
    Karta karta;
    DinString mb;
    DinString ime;
public:
    Putnik(): karta(), mb(0), ime(""){}
    Putnik(int bk, VrstaKarte vk, const DinString& ds1, const DinString& ds2) : karta(bk,vk), mb(ds1), ime(ds2) {}

    DinString getMb() const{
        return mb;
    }

    VrstaKarte getVrstaKarte() const {
        return karta.getVrstaKarte();
    }

    virtual DinString toString() const{
        return mb + " " + ime;
    }

    friend ostream& operator<<(ostream& out, const Putnik &p){
        out << "-----PUTNIK-----" << endl;
        out << p.toString() << endl;
        out << p.karta << endl;

        return out;
    }
};

#endif // PUTNIK_HPP_INCLUDED
