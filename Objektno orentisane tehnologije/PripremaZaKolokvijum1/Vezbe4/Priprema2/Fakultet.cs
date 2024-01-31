using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Priprema2
{
    class Fakultet
    {
        private List<Student> studenti;

        public Fakultet()
        {
            studenti = new List<Student>();
        }

        public void UpisiStudente(string txt)
        {
            string[] parts = txt.Split(';');
            for(int i = 0; i < parts.Length -1; i++)
            {
               // Console.WriteLine(parts[i]);
                string[] delovi = parts[i].Split(',');
                string ime = delovi[0];
                string prezime = delovi[1];

                string[] elementiIndeksa = delovi[2].Split('-');
                string smer = elementiIndeksa[0];

                string[] elementiDalje = elementiIndeksa[1].Split('/');
                int brojIndeksa = Int32.Parse(elementiDalje[0]);
                int godinaUpisa = Int32.Parse(elementiDalje[1]);

                Student s = new Student(ime, prezime, smer, brojIndeksa, godinaUpisa);
                studenti.Add(s);
            }
        }

        public void SortirajStudente()
        {
            for (int i = 0; i < studenti.Count - 1; i++)
            {
                for (int j = 1; j < studenti.Count; j++)
                {
                    Student prvi = studenti[i];
                    Student drugi = studenti[j];

                    if (prvi.GodUpisa > drugi.GodUpisa ||
                        prvi.GodUpisa == drugi.GodUpisa && prvi.BrInd > drugi.BrInd)
                    {

                        studenti.RemoveAt(i);
                        studenti.Insert(i, drugi);

                        studenti.RemoveAt(j);
                        studenti.Insert(j, prvi);
                    }
                }
            }
        }

        public void Add(Student s)
        {
            studenti.Add(s);
        }
        public override string ToString()
        {
            string str = "";
            foreach(Student s in studenti)
            {
                str += s.Ime + ", " + s.Prezime + ", " + s.Smer + " - " + s.BrInd + " / " + s.GodUpisa + ";\n";
            }
            return str;
        }
    }
}
