using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Collections.ObjectModel;

namespace Zadatak1
{
    internal class Student: INotifyPropertyChanged

    {
        private string ime;
        private string prezime;
        private string brojIndeksa;

        public event PropertyChangedEventHandler PropertyChanged;

        private void NotifyPropertyChanged(string v)
        {
            if (this.PropertyChanged != null)
                this.PropertyChanged(this, new PropertyChangedEventArgs(v));
        }

        public Student()
        {
            this.ime = "";
            this.prezime = "";
            this.brojIndeksa = "";
        }
        public Student(string ime, string prezime, string brojIndeksa)
        {
            this.ime = ime;
            this.prezime = prezime;
            this.brojIndeksa = brojIndeksa;
        }

        public string BrojIndeksa
        {
            get { return this.brojIndeksa; }
            set
            {
                if (this.brojIndeksa != value)
                {
                    this.brojIndeksa = value;
                    this.NotifyPropertyChanged("BrojIndeksa");
                }
            }
        }

        public string Ime
        {
            get { return this.ime; }
            set
            {
                if (this.ime != value)
                {
                    this.ime = value;
                    this.NotifyPropertyChanged("Ime");
                }
            }
        }

        public string Prezime
        {
            get { return this.prezime; }
            set
            {
                if (this.prezime != value)
                {
                    this.prezime = value;
                    this.NotifyPropertyChanged("Prezime");
                }
            }
        }

    }
}
