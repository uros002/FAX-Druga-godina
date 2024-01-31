#include <iostream>

#include "monitor.hpp"
#include "screen.hpp"

#define KRAJ_PROGRAMA 10

using namespace std;

void printInfo(Monitor &m){
    cout << "*********  MONITOR  *********" << endl;
    cout << "\tScreen state:   " << (m.getScreenState() == ssOFF ? "OFF" : "ON") << endl;
    cout << "\tBrightness:     " << m.getBrightness() << endl;

    switch(m.getMonitorState()){
    case sON:
        cout << "\tMonitor state:  ON" << endl;
        break;
    case sOFF:
        cout << "\tMonitor state:  OFF" << endl;
        break;
    case sOUT:
        cout << "\tMonitor state:  OUT" << endl;
        break;
    case sSTANDBY:
        cout << "\tMonitor state:  STANDBY" << endl;
        break;
    case sTEST:
        cout << "\tMonitor state:  TEST" << endl;
        break;

    }
}

int meni(){
    int i;

    cout << "1. Upali monitor!" << endl;
    cout << "2. Ugasi monitor!" << endl;
    cout << "3. Pokvari monitor!" << endl;
    cout << "4. Popravi monitor!" << endl;
    cout << "5. Prebaci monitor u STANDBY!" << endl;
    cout << "6. Prebaci monitor u TEST!" << endl;
    cout << "7. Pojacaj brightness!" << endl;
    cout << "8. Smanji brightness!" << endl;
    cout << "9. Stampaj izvestaj!" << endl;
    cout << "10. Kraj programa!" << endl;
    cout << endl;

    cin >> i;
    return i;

    cout << endl;
}


int main()
{
    Monitor m;
    Screen s;

    int i;

    do{
        i = meni();

        switch(i){
        case 1:
            if(m.turnOn()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 2:
            if(m.turnOff()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 3:
            if(m.turnOut()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 4:
            if(m.repair()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 5:
            if(m.turnStandby()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 6:
            if(m.turnTest()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 7:
            if(m.incB()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 8:
            if(m.decB()){
                cout<< "Program je uspesno izvrsen!" << endl << endl;
            } else {
                cout << "Program nije izvrsen!" << endl << endl;
            }
            break;
        case 9:
            printInfo(m);
            break;
        case 10:
                cout<< "KRAJ PROGRAMA!" << endl << endl;
            break;
        default:
            cout<< "Nepostojeca operacija!" << endl;
        }

    }while(i != KRAJ_PROGRAMA);


    return 0;
}
