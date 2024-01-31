/**
 * Napisati program koji 20 puta pokrece simulaciju 05_a_i_b_pre_c koja je radjena na terminu 4. vezbi.
 * 
 * Prvi korak je uraditi taj zadatak ako vec niste.
 * 
 * Ako jeste, izvrsnu datoteku programa kopirati pored izvrsne datoteke ovog programa. Uz oslonac na 
 * `fork`, `wait` i `execv` sistemske pozive, pokrenuti 20 puta zadatak 05_a_i_b_pre_c kao spoljasnji
 * program pritom svaki put sacekavsi da se pokrenuto izvrsenje zavrsi. 
 * 
 * NAPOMENA: program se navodi punom putanjom!
 * 
 * BONUS: pokrenuti ovaj program od 2 do 5 puta i videti da li se desava da nekada ispisi iz niti a i b
 * zamene mesta. Ako se desava da oni zamene mesta ali ne budu nikada pre ispisa iz niti c, zadatak 
 * 05_a_i_b_pre_c je odlicno resen. 
*/
#include <iostream>
#include <unistd.h>
#include <sys/wait.h>
#pragma GCC diagnostic ignored "-Wwrite-strings"

#define BR_POKRETANJA 20

using namespace std;

int main(){
        pid_t dete_pid;

        for(int i = 0; i<BR_POKRETANJA;i++){
                dete_pid = fork();
        }

        if(dete_pid < 0){
                cerr << "Proces se nije uspesno podvojio." << endl;
        }else if(dete_pid == 0){

                char *argumenti[] = {"C:\Users\User\OneDrive\Desktop\FAX 2GOD\Operativni Sistemi\vezbe 4\Zadaci\05_a_i_b_pre_c", NULL};

                if(excev(argumenti[0],argumenti) == -1){
                cerr << "Doslo je do greske prilikom pokretanja programa!" << endl;
                exit(1);
                }
        } else{
                wait(nullptr);
        }

        return 0;
}