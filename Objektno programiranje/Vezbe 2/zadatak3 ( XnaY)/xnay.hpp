#ifndef XNAY_HPP_INCLUDED
#define XNAY_HPP_INCLUDED

#include <iostream>
#include <cmath>



class XnaY {
private:
    int x,y;

public:
    //konstruktor bez parametara
    XnaY(){
        x = 1;
        y = 1;
    }

    //konstruktor sa parametrima
    XnaY(int a,int b){
         x = a;
         y = b;
    }

    //konstruktor kopije
    XnaY(const XnaY &pera){
        x = pera.x;
        y = pera.y;
    }

    void setX(int a){
        x = a;
    }
    void setY(int b){
        y = b;
    }
    void setX_Y(int mika,int zika){
        x = mika;
        y = zika;
    }

    int getX() const {return x;}
    int getY() const {return y;}
    double getXnaY() const {return pow(x,y);}
};

#endif // XNAY_HPP_INCLUDED
