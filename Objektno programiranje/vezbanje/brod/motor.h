#ifndef MOTOR_H_INCLUDED
#define MOTOR_H_INCLUDED

#define BRZINA_MAX 5
#define BRZINA_MIN 0
#define KORAK_BRZINA 1

class Motor{
private:
    int brzina;

public:

    Motor(){
        brzina = 0;
    }

    void setBrzina(int br){
        brzina = br;
    }

    int getBrzina()const{
        return brzina;
    }

    friend void ispisiMotor(const Motor &m);

};

#endif // MOTOR_H_INCLUDED
