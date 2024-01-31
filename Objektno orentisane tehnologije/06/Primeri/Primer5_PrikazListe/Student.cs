using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Wpf_PrikazListi
{
    internal class Student 
    {
        private string brojIndeksa;


        public string BrojIndeksa
        {
            get { return this.brojIndeksa; }
            set
            {
                if (this.brojIndeksa != value)
                {
                    this.brojIndeksa = value;
                }
            }
        }

        public Student(string brojIndeksa)
        {

            this.brojIndeksa = brojIndeksa;
        }

    }
}
