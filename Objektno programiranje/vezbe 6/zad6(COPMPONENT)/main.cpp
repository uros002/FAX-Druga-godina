
#include "CheckBox.hpp"
#include "label.hpp"
#include "panel.hpp"


DinString CheckBox::typeName = "CheckBox";
DinString Label::typeName = "Label";
DinString Panel::typeName = "Panel";


int main()
{
    CheckBox cb,cb1(3.2,4.0,true);
    cout << "Testiranje klase CheckBox: " << endl;

    cb.printComponent();
    cb1.printComponent();

    cb.setPressed(true);
    cb.printComponent();

    cout << endl << endl;

    Label l,l1(2.5,6.1,"DDD");
    DinString ds("AAA");
    cout << "Testiranje klase Label: " << endl;

    l.printComponent();
    l1.printComponent();

    l.setText(ds);
    l.printComponent();

    cout << endl << endl;

    Panel p,p1(p);
    cout << "Testiranje klase Panel: " << endl;

    p.printComponent();
    p1.printComponent();

    p.setCapacity(4);
    p.addComponent(cb);
    p.addComponent(cb1);
    p.addComponent(l);
    p.addComponent(l1);
    p.printComponent();

    if(!p.addComponent(l1)){
        cout << "Nije moguce vise ubacivati komponente, kapacitet je popunjen!  " << endl;
    }

    p.removeComponent(1);
    p.printComponent();

    Panel p2(p);
    p.printComponent();

    return 0;
}
