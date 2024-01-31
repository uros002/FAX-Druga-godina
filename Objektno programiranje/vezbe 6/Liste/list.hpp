#ifndef LIST_HPP_INCLUDED
#define LIST_HPP_INCLUDED

#include <stdlib.h>
#include <iostream>

using namespace std;

template <class T>
class List{
private:
    struct listEl{
        T content;
        struct listEl *next;
    };
    listEl *head;
    listEl *tail;
    int noEl;

public:

    List(){
        head = tail = NULL;
        noEl = 0;
    }

    List(const List<T>&);

    virtual ~List();

    List<T>& operator=(const List<T>&);

    int size() const{ return noEl;}
    bool empty() const {return head == NULL ? 1 : 0;}

    bool add(int, const T&);
    bool remove(int);
    bool read(int, T&) const;
    void clear();

};

template <class T>
ostream& operator<<(ostream& out, const List<T>& rl){
    out << endl;
    out<<"-------------" << endl;
    for(int i = 1; i <= rl.size(); i++){
        if(i != 1) out << ", ";
        T res;
        rl.read(i,res);
        out << res;
    }
    out << endl << "-------------" << endl;
    return out;
}

template <class T>
List<T>::List(const List<T>& rl){       ///konstruktor kopije
    head = NULL;
    tail = NULL;
    noEl = 0;

    for(int i = 1; i < rl.noEl; i++){
        T res;
        if(rl.read(i,res))
            add(i,res);
    }
}

template <class T>
List<T>& List<T>::operator=(const List<T>& rl){
    if(this != &rl){
        clear();
        head = NULL;
        tail = NULL;
        noEl = 0;

        for(int i = 1; i <- rl.noEl; i++){
            T res;
            if(rl.read(i,res))
                add(i,res)
        }
    }
    return *this;
}

template <class T>
List<T>::List(){
    while(!empty())
        remove(1);
}



#endif // LIST_HPP_INCLUDED
