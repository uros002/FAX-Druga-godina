#ifndef MONITOR_HPP_INCLUDED
#define MONITOR_HPP_INCLUDED

#include "screen.hpp"

enum MonitorStates{sON,sOFF,sOUT,sTEST,sSTANDBY};



class Monitor{

private:
    MonitorStates state;
    Screen screen;

public:

    Monitor() : screen() {
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
        if(state != sOUT && state != sOFF){
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

    bool turnStandby(){
        if(state == sON){
            state = sSTANDBY;
            screen.setState(ssOFF);
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
        if(state == sON || state == sTEST){
            bool ss = screen.incB();
            return ss;
        }
    }

    bool decB(){
        if(state == sON || state == sTEST){
            bool ss = screen.decB();
            return ss;
        }
    }

    MonitorStates getMonitorState()const{
        return state;
    }

    ScreenStates getScreenState()const{
        return screen.getState();
    }

    int getBrightness()const{
        return screen.getBrightness();
    }


    friend void printInfo(const Monitor&);
};

#endif // MONITOR_HPP_INCLUDED
