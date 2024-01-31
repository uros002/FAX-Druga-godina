#ifndef PANEL_HPP_INCLUDED
#define PANEL_HPP_INCLUDED

#include "component.hpp"
#include "list.hpp"

class Panel : public Component {
protected:
    static DinString typeName;
    int capacity;
    List<Component*> components;

public:
    Panel(){
        X = 0;
        Y = 0;
        capacity = 10;
    }

    Panel(const Panel &p){
        X = p.X;
        Y = p.Y;
        capacity = p.capacity;
    }

    DinString getTypeName() const{
        return typeName;
    }

    void printComponent(){
        cout << "----------------------------" << endl;
        cout << getTypeName() << endl;
        Component::printComponent();
        cout << "Capacity: " << capacity << endl;
        if(components.size() == 0){
            cout << "Nema komponenti!" << endl;
        } else {
            cout << "Komponente na panelu: " << endl;
            Component *c;
            for(int i = 1; i <= components.size();i++){
                components.read(i,c);
                c -> printComponent();
            }
        }
        cout << "----------------------------" << endl;
    }

    int getCapacity() const{
        return capacity;
    }

    void setCapacity(int c) {
        capacity = c;
    }

    bool addComponent(Component &c) {
        if(components.size() == capacity){
            return false;
        }

        return components.add(components.size() + 1, &c);
    }

    bool removeComponent(int n){
        return components.remove(n);
    }

};


#endif // PANEL_HPP_INCLUDED
