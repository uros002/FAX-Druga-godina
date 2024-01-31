#ifndef KRUG_H_INCLUDED
#define KRUG_H_INCLUDED

#include <cmath>

class Krug {

private:
    double r;

public:
    Krug(double rr = 1){
        r = rr;
    }

    double getR() const{
        return r;
    }

    double getO() const{
        return 2 * r * M_PI;
    }

    double getP() const{
        return r * r * M_PI;
    }
};

#endif // KRUG_H_INCLUDED
