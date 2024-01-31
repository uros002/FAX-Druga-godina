using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.IO;

namespace Zadatak1
{
    public class Fakultet
    {
        private List<Student> studenti;

        public Fakultet()
        {
            studenti = new List<Student>(); 
        }

        public void UpisiStudente(string txt)
        {
            String[] lines = txt.Split(';'); 
            for(int i = 0; i< lines.Length - 1; i++)
            {
                Console.WriteLine(lines[i]);
                String[] parts = lines[i].Split(',');
                String ime = parts[0];
                String prezime = parts[1];

                String[] deloviIndeksa = parts[2].Split('-');
                String smer = deloviIndeksa[0];

                String[] elementi = deloviIndeksa[1].Split('/');

                int brojIndeksa = Int32.Parse(elementi[0]);
                int godinaUpisa = Int32.Parse(elementi[1]);

                Student s = new Student(ime, prezime, smer, brojIndeksa, godinaUpisa);
                studenti.Add(s);
            }       
        }
   
/*
        public void UpisiStudente(String txt)
        {
            String[] lines = txt.Split(';');
            for (int i = 0; i < lines.Length - 1; i++)
            {
                Console.WriteLine(lines[i]);
                String[] parts = lines[i].Split(',');
                String ime = parts[0];
                String prezime = parts[1];
                String indeks = parts[2];

                String[] deloviIndeksa = indeks.Split('-');
                String smer = deloviIndeksa[0];

                String[] elementi = deloviIndeksa[1].Split('/');

                int broj = Int32.Parse(elementi[0]);
                int godina = Int32.Parse(elementi[1]);

                Student s = new Student(ime, prezime, smer, broj, godina);
                studenti.Add(s);
            }

        }
        */

        public void SortirajStudente()
        {
            for(int i = 0;i < studenti.Count -1; i++)
            {
                for(int j = 1; j < studenti.Count; j++)
                {
                    Student prvi = studenti[i];
                    Student drugi = studenti[j];

                    if(prvi.GodinaUpisa > drugi.GodinaUpisa || prvi.GodinaUpisa == drugi.GodinaUpisa && prvi.BrIndeksa > drugi.BrIndeksa)
                    {
                        studenti.RemoveAt(i);
                        studenti.Insert(i, drugi);

                        studenti.RemoveAt(j);
                        studenti.Insert(j, prvi);
                    }
                }
            }
        }

        public override string ToString()
        {
            string retVal = "";
            foreach (Student s in studenti)
            {
                retVal += s;
            }

            return retVal;
        }
    }
}
