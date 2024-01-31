#ifndef BROD_HPP_INCLUDED
#define BROD_HPP_INCLUDED

#define GORIVO_MAX 15
#define GORIVO_MIN 0
#define KORAK 2
#define KORAK_BRZINA 1

#include "motor.h"

enum StanjeBroda{USIDREN,PLOVI,POKVAREN};


class Brod{

private:
    StanjeBroda stanje;
    Motor motor;
    int predjenoKilometara;
    int kolicinaGoriva;

public:
    Brod() : motor() {
        stanje = USIDREN;
        predjenoKilometara = 0;
        kolicinaGoriva = 0;
    }

    bool pokvari(){
        if(stanje != POKVAREN){
            stanje = POKVAREN;
            kolicinaGoriva = 0;
            return true;
        }
        return false;
    }

    bool popravi(){
        if(stanje == POKVAREN){
            stanje = USIDREN;
            return true;
        }
        return false;
    }

    bool pokreni(){
        if(stanje == USIDREN){
            stanje = PLOVI;
            return true;
        }
        return false;
    }

    bool zaustavi(){
        if(stanje == PLOVI){
            stanje = USIDREN;
            return true;
        }
        return false;
    }

    bool sipajGorivo(){
        if(stanje == USIDREN && kolicinaGoriva < GORIVO_MAX){
            kolicinaGoriva = kolicinaGoriva + KORAK;
            if(kolicinaGoriva > GORIVO_MAX){
                kolicinaGoriva = GORIVO_MAX;
                return true;
            }
            return true;
        }
        return false;
    }

    bool povecajBrzinu(){
        if(stanje == PLOVI && motor.getBrzina() < BRZINA_MAX){
            int brzina = motor.getBrzina();
            brzina = brzina + KORAK_BRZINA;
            motor.setBrzina(brzina);
            return true;
        }
        return false;
    }

    bool smanjiBrzinu(){
        if(stanje == PLOVI && motor.getBrzina() > BRZINA_MIN){
            int brzina = motor.getBrzina();
            brzina = brzina - KORAK_BRZINA;
            motor.setBrzina(brzina);
            return true;
        }
        return false;
    }

    bool putuj(){
        if(stanje == PLOVI && kolicinaGoriva < GORIVO_MIN){
            kolicinaGoriva = kolicinaGoriva - 1;
            predjenoKilometara = 5 * motor.getBrzina();
            return true;
        }
        return false;
    }

    StanjeBroda getStanje()const{
        return stanje;
    }

    Motor getMotor()const{
        return motor;
    }

    int getPredjenoKm()const{
        return predjenoKilometara;
    }

    int getKolicinaG()const{
        return kolicinaGoriva;
    }


    void ispisiBrod(const Brod&);

};


#endif // BROD_HPP_INCLUDED
