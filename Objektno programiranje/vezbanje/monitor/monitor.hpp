#ifndef MONITOR_HPP_INCLUDED
#define MONITOR_HPP_INCLUDED

#include "screen.hpp"

enum MonitorStates{sON,sOFF,sOUT,sSTANDBY,sTEST};

class Monitor{

private:
    MonitorStates state;
    Screen screen;

public:

    Monitor(): screen(){
        state = sOFF;
    }

    bool turnOn(){
        if(state != sON && state != sOUT){
            state = sON;
            screen.setState(ssON);
            return true;
        }
        return false;
    }

    bool turnOff(){
        if(state != sOFF && state != sOUT){
            state = sOFF;
            screen.setState(ssOFF);
            return true;
        }
        return false;
    }


    bool turnOut(){
        if(state != sOUT){
            state = sOUT;
            screen.setState(ssOFF);
            return true;
        }
        return false;
    }


    bool turnTest(){
        if(state == sON){
            state = sTEST;
            return true;
        }
        return false;
    }


    bool turnStandBy(){
        if(state == sON){
            state = sSTANDBY;
            return true;
        }
        return false;
    }


    bool repair(){
        if(state == sOUT){
            state = sOFF;
            return true;
        }
        return false;
    }

    bool incB(){
        if(state != sOUT && state != sOFF){
            return screen.incB();
        }
        return false;
    }

    bool decB(){
        if(state != sOUT && state != sOFF){
            return screen.decB();
        }
        return false;
    }

    MonitorStates getMonitorState()const{
        return state;
    }

    ScreenStates getScreenState() const{
        return screen.getState();
    }

    int getBrightness() const{
        return screen.getBrightness();
    }

    friend void printInfo(const Monitor&);
};


#endif // MONITOR_HPP_INCLUDED
