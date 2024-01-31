/**
 * Napisati program koji na standardnom izlazu prikazuje predloge lozinki od 80
 * znakova koje sadrze u sebi string "caj".
 * 
 * Uz oslonac na `fork`, `wait` i `execv` sistemske pozive, pokrenuti program 
 * "/usr/bin/gpg" kao spoljasnji program sa parametrima {"--gen-random", 
 * "--armor", "1", "4000000"}. Spoljasnji program i roditelja povezati 
 * pajpovanjem tako da izlaz spoljasnjeg programa obradjuje roditeljski proces.
 * 
 * Spoljasnji program ce izgenerisati sekvencu od 4000000 nasumicnih znakova a
 * bez belih znakova
 * 
 * Obrada treba da se desava tako da roditelj uzima po 80 znakova i tretira ih
 * kao jednu lozinku. Potom ako u ucitanih 80 znakova pronadje string "caj", 
 * ispisuje lozinku na standardni izlaz.
 * 
 * NAPOMENA: moze se dosta jednostavno uraditi ako se odvoji bafer od 81-og 
 * znaka i na kraju postavi '\0' nakon ucitavanja 80 znakova
*/
#include <iostream>
#include <unistd.h>
#pragma GCC diagnostic ignored "-Wwrite-strings"


using namespace std;

int main(){

        pid_t dete_pid;
        int tok[2];
        int status;

        status = pipe(tok);
        
        if(status == -1){
                cerr << "Nisam uspeo da napravim tok za preusmeravanje ulaza/izlaza"<<endl;
                exit(1);
        }

        dete_pid = fork();

        if(dete_pid < 0){
                cerr << "Proces se nije uspesno podvojio" << endl;
                exit(2);
        }else if(dete_pid == 0){
                close(tok[0]);

                cout << "Pocinje preusmerenje standardnog izlaza na tok ka roditelju"<< endl;

                dup2(tok[1],1);

                cout << "Preusmerio sam tok izlaza novog procesa i pozivam novi program"<< endl;

                char *argumenti[] = {"/usr/bin/gpg", "--gen-random", "--armor", "1", "4000000", NULL};

                if(execv(argumenti[0],argumenti) == -1){
                        cerr << "Doslo do greske prilikom pokretanja programa!"<< endl;
                        exit(1);
                }
        } else {
                char bafer[81], br_znakova;
                bafer[80] = 0;
                close(tok[1]);

                dup2(tok[0],0);

                cout<<"Roditelj pocinje citanje sadrzaja koji salje spoljni program"<<endl;
                while(br_znakova = read(0,bafer,80) > 0){
                        string lozinka(bafer);
                        if(lozinka.find("caj" != string::npos)){
                                cout<<lozinka<<endl;
                        }
                }
        }

        return 0;
}