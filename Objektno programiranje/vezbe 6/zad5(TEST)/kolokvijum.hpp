#ifndef KOLOKVIJUM_HPP_INCLUDED
#define KOLOKVIJUM_HPP_INCLUDED

#include <cstdlib>
#include "test.hpp"


class Kolokvijum : public Test {
public:
    Kolokvijum() : Test() {}
    Kolokvijum(const char* naz) : Test(naz, rand()%25 + 1){}

    int getPoeni() const{
        return osvojeniPoeni;
    }

    bool polozio()const{
        if(osvojeniPoeni > 12){
            return true;
        }else{
            return false;
        }
    }


};

#endif // KOLOKVIJUM_HPP_INCLUDED
