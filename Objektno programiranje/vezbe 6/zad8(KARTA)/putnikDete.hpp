#ifndef PUTNIKDETE_HPP_INCLUDED
#define PUTNIKDETE_HPP_INCLUDED

#include "putnik.hpp"

class PutnikDete : public Putnik {
protected:
    DinString mbRoditelja;

public:
    PutnikDete() : Putnik(), mbRoditelja("") {}
    PutnikDete(int bk, VrstaKarte vk, const DinString& ds1, const DinString& ds2, const DinString& ds3) : Putnik(bk,vk,ds1,ds2), mbRoditelja(ds3) {}
    PutnikDete(const Putnik& p, const DinString& ds) : Putnik(p), mbRoditelja(ds) {}

    DinString toString() const{
        DinString ret = "Dete: ";
        ret = ret + Putnik::toString();
        ret = ret + "Maticni broj roditelja: ";
        ret = ret + mbRoditelja;
        return ret;
    }

};

#endif // PUTNIKDETE_HPP_INCLUDED
