#ifndef SCREEN_HPP_INCLUDED
#define SCREEN_HPP_INCLUDED

#define BRIGHTNESS_MAX 20
#define BRIGHTNESS_MIN 0
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
        if(state == ssON && brightness < BRIGHTNESS_MAX){
            brightness = brightness + KORAK;
            return true;
        }
        return false;
    }

    bool decB(){
        if(state == ssON && brightness > BRIGHTNESS_MIN){
            brightness = brightness - KORAK;
            return true;
        }
        return false;
    }

    void setState(ScreenStates ss){
         state = ss;
    }
    ScreenStates getState() const{
        return state;
    }
    int getBrightness() const {
        return brightness;
    }

};


#endif // SCREEN_HPP_INCLUDED
