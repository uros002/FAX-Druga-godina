#ifndef LABEL_HPP_INCLUDED
#define LABEL_HPP_INCLUDED

#include"component.hpp"

class Label : public Component {
protected:
    DinString text;
    static DinString typeName;

public:
    Label(double x = 0, double y = 0,const DinString &t = "") : text(t){
        this -> X = x;
        this -> Y = y;
    }

    DinString getTypeName() const{
        return typeName;
    }

    void printComponent() {
        cout << "----------------------------" << endl;
        cout << getTypeName() << endl;
        Component::printComponent();
        cout << "Text: " << text << endl;
        cout << "----------------------------" << endl;
    }

    DinString getText() const{
        return text;
    }

    void setText(DinString& t){
        this -> text = t;
    }

};


#endif // LABEL_HPP_INCLUDED
