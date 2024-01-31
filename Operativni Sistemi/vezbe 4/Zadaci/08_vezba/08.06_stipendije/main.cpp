/**
 * Napisati C++ program koji cita podatke o studentima iz ulazne datoteke i potom
 * za svakog studenta racuna prosek
 *
 * U ulaznoj datoteci "studenti.csv" se u svakom redu nalaze informacije o studentu:
 *     Ime,Prezime,Broj indeksa,Ocene
 * Pritom su ocene odvojene medjusobno zarezima.
 *
 * Prilikom obrade podataka o studentima, mora se proveriti format indeksa da li je validan. Ako nije, zanemariti taj unos.
 * Format indeksa je:
 *     [[:alpha:]][[:alnum:]]{1,2}\s[[:digit:]]{1,3}\/[[:digit:]]{4}
 *
 * U tri izlazne datoteke rasporediti studente u zavisnosti od proseka.
 * Ukoliko je prosek > 9.00 potrebno je upisati studenta u datoteku "kandidati_stipendija.csv".
 * Ukoliko je prosek > 8.00 i prosek <= 9.00 potrebno je upisati studenta u datoteku "kandidati_kredit.csv".
 * U ostalim slucajevima upisati studenta u datoteku "ostali.csv".
 * Format u izlaznoj datoteci treba da odgovara sledecem: Ime,Prezime,Broj_indeksa,prosek
 *
 * Treba napraviti jednu nit koja ce samo citati redove ulazne podatke, jednu nit
 * koja ce samo pisati gotove podatke u izlazne datoteke i 10 niti radnika koji ce na osnovu redova
 * iz ulazne datoteke generisati sve neophodno za ispis u izlaznu datoteku.
*/

#include <iostream>
#include <fstream>
#include <regex>
#include <vector>
#include <mutex>
#include <condition_variable>
#include <thread>
#include <numeric>

using namespace std;

class Student {
private:
    string firstname;
    string lastname;
    string index;
    vector<int> grades;
    double avg_grade;

    void calculateAvgGrade(){
        avg_grade = accumulate(grades.begin(),grades.end(), 0.) / grades.size();
    }
public:
    Student();
    Student(string name,string surname, string idx){
        firstname = name;
        lastname = surname;
        index = idx;
    }

    void setGrades(vector<int> grds){
        grades = grds;
        calculateAvgGrade();
    }

    string getFirstname(){
        return firstname;
    }

    string getLastname(){
        return lastname;
    }

    string getIndex(){
        return index;
    }

    double getAvgGrade(){
        return avg_grade;
    }

    friend ostream& operator<<(ostream& os, Student& s) {
      os << s.firstname << " " << s.lastname << " " << s.index;
      os << " ocene: ";
      for(auto it = s.grades.begin(); it != s.grades.end(); it++) {
        os << *it << " ";
      }
      os  << "prosek: " << s.avg_grade << endl;
      return os;
   }

};

template<typename T>
class InputData {
private:
    mutex data_mtx;
    // TODO dodati polja po potrebi
    vector<T> data;
    bool end;
    int data_producers_num;
    condition_variable data_read;

public:
    InputData(): end(false) {
        // TODO
        data_producers_num = 0;
    }
    void add_data(T data_element) {
        // TODO
        unique_lock<mutex> l(data_mtx);
        data.push_back(data_element);
        data_read.notify_one();
    }
    bool remove_data(T &data_element) {
        // TODO
        unique_lock<mutex> l(data_mtx);
        data_read.wait(l,[this] {return !data.empty() || end; });

        if(the_end()){
            return false;
        }

        data_element = data.back();
        data.pop_back();

        return true;
    }

    bool the_end(){
        return data.empty() && end;
    }

    // TODO dodati metode po potrebi

};

template<typename T>
class OutputData {
private:
    mutex data_mtx;
    // TODO dodati polja po potrebi
    vector<T> data;
    bool end;
    int data_producers_num;
    condition_variable data_read;

public:
    OutputData(): end(false), data_producers_num(0) {}
    void add_data(T data_element) {

    }
    bool remove_data(T &data_element) {
        return false;
    }

    bool the_end() {
        return data.empty() && end;
    }

    // TODO dodati metode po potrebi

};

void reader(string input_file_name, InputData<string>& raw_data) {
    // TODO
}

void proccessing_data(InputData<string>& raw_data, OutputData<Student>& proccessed_data){
    // TODO
}

void writer(OutputData<Student>& proccessed_data) {
    // TODO
}


int main() {
    InputData<string> raw_data;
    OutputData<Student> proccessed_data;

    thread th_reader(reader, "studenti.csv", ref(raw_data));
    thread th_writer(writer, ref(proccessed_data));
    thread th_workers[10];

    for(auto &th: th_workers){
        th = thread(proccessing_data, ref(raw_data), ref(proccessed_data));
    }

    th_reader.join();
    for(auto &th: th_workers) {
        th.join();
    }
    th_writer.join();

    return 0;
}