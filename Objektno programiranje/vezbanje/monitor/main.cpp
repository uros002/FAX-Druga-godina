#include <iostream>

#include "monitor.hpp"

#define KRAJ_PROGRAMA 10

using namespace std;

int meni(){
    int i;

    cout << "*********  MENI  *********" << endl;
    cout << "\t1. Upali Monitor!" << endl;
    cout << "\t2. Ugasi Monitor!" << endl;
    cout << "\t3. Pokvari Monitor!" << endl;
    cout << "\t4. Popravi Monitor!" << endl;
    cout << "\t5. Prebaci Monitor u STANDBY!" << endl;
    cout << "\t6. Prebaci Monitor u TEST!" << endl;
    cout << "\t7. Pojacaj osvetljenost!" << endl;
    cout << "\t8. Smanji osvetljenost!" << endl;
    cout << "\t9. Trenutno stanje!" << endl;
    cout << "\t10. Kraj programa!" << endl;

    cout << endl;

    cin >> i;

    cout << endl << endl;

    return i;
}

void printInfo(Monitor &m){

    cout << "*********  MONITOR *********" << endl;
    cout << "\tStanje monitora: ";

    switch(m.getMonitorState()){
    case sON:
        cout << "ON" << endl;
        break;
    case sOFF:
        cout << "OFF" << endl;
        break;
    case sOUT:
        cout << "OUT" << endl;
        break;
    case sSTANDBY:
        cout << "STANDBY" << endl;
        break;
    case sTEST:
        cout << "TEST" << endl;
        break;
    }

    cout << "\tStanje monitora: " << (m.getScreenState() == ssOFF ? "OFF" : "ON") << endl;
    cout << "\tOsvetljenost ekrana: " << m.getBrightness() << endl;
    cout << endl;
}

int main()
{
    Monitor m;
    int i;

    do{
        i = meni();

        switch(i){
        case 1: m.turnOn();break;
        case 2: m.turnOff();break;
        case 3: m.turnOut();break;
        case 4: m.repair();break;
        case 5: m.turnStandBy();break;
        case 6: m.turnTest();break;
        case 7: m.incB();break;
        case 8: m.decB();break;
        case 9: printInfo(m);break;
        case 10: cout << "Kraj!" << endl;break;
        default: cout << "Pogresan unos!" << endl;
        }
    }while(i != KRAJ_PROGRAMA);

    return 0;
}
