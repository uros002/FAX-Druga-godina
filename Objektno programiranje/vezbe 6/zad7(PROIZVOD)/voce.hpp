#ifndef VOCE_HPP_INCLUDED
#define VOCE_HPP_INCLUDED

#include "proizvod.hpp"

class Voce : public Proizvod {
protected:
    DinString zemljaPorekla;
    int rokTrajanja;
public:
    Voce(int c, const DinString &n,const DinString &zp, int rt) : Proizvod(c,n) ,zemljaPorekla(zp), rokTrajanja(rt) {}

    void izracunajPopust() {
        double popust = 0;
        if(rokTrajanja > 5){
            popust = 0.33;
        } else if(rokTrajanja >= 1 && rokTrajanja <= 5){
            popust = 0.66;
        }else if(rokTrajanja == 0) {
            popust = 1;
        }

        cena = cena - cena * popust;
    }

    void ispisi() const {
        Proizvod::ispisi();
        cout << "Zemlja porekla: " << zemljaPorekla << endl;
        cout << "Rok trajanja: " << rokTrajanja << endl;
    }

};

#endif // VOCE_HPP_INCLUDED
