#ifndef TEST_HPP_INCLUDED
#define TEST_HPP_INCLUDED

#include <iostream>
using namespace std;
#include "dinstring.hpp"

class Test{
protected:
    DinString naziv;
    int osvojeniPoeni;

public:
    Test() : naziv(""), osvojeniPoeni(0){}
    Test(const char* n,int op) : naziv(n), osvojeniPoeni(op){}

    virtual int getPoeni() const =0;
    virtual bool polozio() const =0;

    void ispis() const {
         cout << "Naziv: " << naziv << endl;
         cout << "Osvojeni poeni: " << osvojeniPoeni << endl;
    }

};


#endif // TEST_HPP_INCLUDED
