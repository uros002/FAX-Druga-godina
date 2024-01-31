#ifndef AMBULANTA_HPP_INCLUDED
#define AMBULANTA_HPP_INCLUDED

#include "student.hpp"
#include <mutex>
#include <condition_variable>


using namespace std;

class Studentska_ambulanta {
private:
    Student& student;
    mutex m;
    condition_variable uslovi[2];
    int broj_mesta[2];
public:
    Studentska_ambulanta(Student& st, int muskih, int zenskih) : student(st) {
        // Prosiriti po potrebi ...
        broj_mesta[0] = muskih;
        broj_mesta[1] = zenskih;
    }

    // Metoda koju poziva nit koja simulira studenta u ambulanti kada student pokusava da udje u nju.
    // Ukoliko je ambulanta zauzeta, izvrsenje ove metode ce cekati da se ona oslobodi.
    //
    // rbr - Redni broj studenta
    // p   - Pol studenta
    //
    // Potrebno je pozvati metodu student.ceka kada student ne moze da stupi u ambulantu.
    // Potrebno je pozvati metodu student.ulazi kada student udje u ambulantu.
    void udji(int rbr, Pol p) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        while(broj_mesta[p] == 0){
            student.ceka(rbr,p);
            uslovi[p].wait(l);
        }
        student.ulazi();
        broj_mesta[p]--;

    }

    // Metoda koju poziva nit koja simulira studenta u ambulanti nakon sto je student pregledan i izlazi iz nje.
    //
    // rbr - Redni broj studenta
    // p   - Pol studenta
    void izadji(int rbr, Pol p) {
        // Implementirati ...
        unique_lock<mutex> l(m);
        broj_mesta[p]++;
        uslovi[p].notify_one();
    }
};

#endif // AMBULANTA_HPP_INCLUDED
