#ifndef SCREEN_HPP_INCLUDED
#define SCREEN_HPP_INCLUDED

#define MIN_BRIGHTNESS 0
#define MAX_BRIGHTNESS 20
#define KORAK 2

enum ScreenStates{ssON,ssOFF};

class Screen{
private:
    ScreenStates state;
    int brightness;

public:
    Screen(){
        state = ssOFF;
        brightness = 0;
    }

    bool incB(){
        if(state == ssON && brightness < MAX_BRIGHTNESS){
            brightness = brightness + KORAK;
            return true;
        }
        return false;
    }

    bool decB(){
        if(state == ssON && brightness > MIN_BRIGHTNESS){
            brightness = brightness - KORAK;
            return true;
        }
        return false;
    }

    void setState(ScreenStates ss){
        state = ss;
    }

    ScreenStates getState()const{
        return state;
    }

    int getBrightness()const{
        return brightness;
    }



};

#endif // SCREEN_HPP_INCLUDED
