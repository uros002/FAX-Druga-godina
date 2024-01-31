#ifndef COMPONENT_HPP_INCLUDED
#define COMPONENT_HPP_INCLUDED

#include "dinstring.hpp"

class Component {
protected:
    double X,Y;
public:
    Component() : X(0), Y(0) {}
    Component(double xx, double yy) : X(xx), Y(yy) {}


    double getX() const {
        return X;
    }
    double getY() const {
        return Y;
    }

    virtual void printComponent() const {
        cout << " KOORDINATE SU X = " << X << " , Y = " << Y << ". ( " << X << " , " << Y << " )" << endl;
    }

    virtual DinString getTypeName() const = 0;
};


#endif // COMPONENT_HPP_INCLUDED
