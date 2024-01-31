#ifndef CHECKBOX_HPP_INCLUDED
#define CHECKBOX_HPP_INCLUDED

#include "component.hpp"

class CheckBox : public Component {
private:
    bool pressed;
    static DinString typeName;
public:
    /*
    CheckBox() {
        this -> X = 0;
        this -> Y = 0;
        this -> pressed = false;
    }
    */
    CheckBox() : Component() , pressed(false) {}

    /*
    CheckBox(double x, double y, bool p) {
        this -> X = x;
        this -> Y = y;
        this -> pressed = p;
    }
    */

    CheckBox(double xx, double yy, bool bp) : Component(xx,yy) , pressed(bp) {}

    DinString getTypeName() const{
        return typeName;
    }

    void printComponent(){
        cout << "----------------------------" << endl;
        cout << getTypeName() << endl;
        Component::printComponent();
        cout << "CheckBox pressed: " << pressed << endl;
        cout << "----------------------------" << endl;

    }

    bool getPressed() const {
        return pressed;
    }

    void setPressed(bool pr) {
        this -> pressed = pr;
    }
};


#endif // CHECKBOX_HPP_INCLUDED
