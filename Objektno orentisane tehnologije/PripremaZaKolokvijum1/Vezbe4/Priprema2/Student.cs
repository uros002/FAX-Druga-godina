using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Priprema2
{
    class Student : Osoba
    {
        private string smer;
        private int brIndeksa;
        private int godinaUpisa;

        public string Smer
        {
            get { return smer; }
            set { smer = value; }
        }

        public int BrInd
        {
            get { return brIndeksa; }
            set { brIndeksa = value; }
        }

        public int GodUpisa
        {
            get { return godinaUpisa; }
            set { godinaUpisa = value; }
        }

        public Student()
        {
            Ime = "Uros";
            Prezime = "Grahovac";
            Smer = "PR";
            BrInd = 100;
            GodUpisa = 2021;
        }

        public Student(string ime, string prezime, string smer, int brIndeksa, int godUpisa)
        {
            Ime = ime;
            Prezime = prezime;
            Smer = smer;
            BrInd = brIndeksa;
            GodUpisa = godUpisa;
        }

        public override bool Equals(object obj)
        {
            if(obj == null)
            {
                return false;
            }
            Student s = (Student)obj;

            if(s.Smer.Equals(smer) && s.BrInd.Equals(brIndeksa) && s.GodUpisa.Equals(godinaUpisa)) 
            {
                return base.Equals(obj);
            }
            return false;
        }

        public override string ToString()
        {
            return "Ime: " + Ime + " \nPrezime: " + Prezime + " \nSmer: " + Smer + "\n Broj indeksa: " + BrInd + "\nGodina upisa: " + GodUpisa + "\n";
        }
    }
}
