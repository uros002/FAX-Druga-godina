#include "rerna.hpp"

Rerna::Rerna() {
    trenutnoStanje = ISKLJUCENA;
    temperatura = TEMPERATURA_MIN;
}

bool Rerna::ukljuci(){
    if(trenutnoStanje == ISKLJUCENA){
        trenutnoStanje = UKLJUCENA;
        temperatura += KORAK;
        return true;
    }
    return false;
}
bool Rerna::iskljuci(){
    if(trenutnoStanje == UKLJUCENA) {
        trenutnoStanje = ISKLJUCENA;
        temperatura = TEMPERATURA_MIN;
        return true;
    }
    return false;
}

bool Rerna::pokvari() {
    if( trenutnoStanje == ISKLJUCENA || trenutnoStanje == UKLJUCENA) {
        trenutnoStanje = POKVARENA;
        temperatura = TEMPERATURA_MIN;
        return true;
    }
    return false;
}

bool Rerna::popravi() {
    if(trenutnoStanje == POKVARENA) {
        trenutnoStanje = ISKLJUCENA;
        temperatura = TEMPERATURA_MIN;
        return true;
    }
    return false;
}

bool Rerna::pojacajTemperaturu() {
    if(trenutnoStanje == UKLJUCENA && temperatura+KORAK <= TEMPERATURA_MAX) {
        temperatura += KORAK;
        return true;
    }
    return false;
}
bool Rerna::smanjiTemperaturu() {
    if(trenutnoStanje == UKLJUCENA && temperatura-KORAK >= TEMPERATURA_MIN) {
        temperatura -= KORAK;
        return true;
    }
    return false;
}

StanjeRerne Rerna::getTrenutnoStanje() const {
    return trenutnoStanje;
}
int Rerna::getTemperatura() const{
    return temperatura;
}
