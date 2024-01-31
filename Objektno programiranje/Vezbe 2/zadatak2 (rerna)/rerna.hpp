#ifndef RERNA_HPP_INCLUDED
#define RERNA_HPP_INCLUDED

#define TEMPERATURA_MIN 0
#define TEMPERATURA_MAX 220
#define KORAK 20

enum StanjeRerne {UKLJUCENA, ISKLJUCENA, POKVARENA};

class Rerna{
private:
    StanjeRerne trenutnoStanje;
    int temperatura;

public:
    Rerna();

    bool ukljuci();
    bool iskljuci();
    bool pokvari();
    bool popravi();

    bool pojacajTemperaturu();
    bool smanjiTemperaturu();

    StanjeRerne getTrenutnoStanje() const;
    int getTemperatura() const;
};

#endif // RERNA_HPP_INCLUDED
