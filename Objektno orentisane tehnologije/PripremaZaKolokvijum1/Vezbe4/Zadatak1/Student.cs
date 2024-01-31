namespace Zadatak1
{
    public class Student : Osoba
    {
        private string smer;
        private int brIndeksa;
        private int godinaUpisa;

        #region Konstruktori

        public Student() : base("Uros","Grahovac")
        {
            this.smer = "PSI";
            this.brIndeksa = 100;
            this.godinaUpisa = 2021;
        }

        public Student(string ime, string prezime, string smer, int brIndeksa, int godinaUpisa) : base(ime,prezime)
        {
            this.smer = smer;
            this.brIndeksa = brIndeksa;
            this.godinaUpisa = godinaUpisa;
        }

        #endregion

        #region props

        public string Smer {
            get { return smer; }
            set { smer = value; }
        }

        public int BrIndeksa
        {
            get { return brIndeksa; }
            set { brIndeksa = value; }
        }

        public int GodinaUpisa
        {
            get { return godinaUpisa; }
            set { godinaUpisa = value; }
        }
        #endregion

        public override bool Equals(object obj)
        {
            if(obj == null)
            {
                return false;
            }

            Student s = (Student)obj;

            if(s.Smer.Equals(smer) && s.BrIndeksa.Equals(brIndeksa) && s.GodinaUpisa.Equals(godinaUpisa))
            {
                return base.Equals(obj);
            }
            return false;
        }

        public override string ToString()
        {
            return Ime + " " + Prezime + " " + Smer +  "  " + BrIndeksa + "  " + GodinaUpisa + "\n" ;
        }
    }
}
