using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;

namespace Zadatak2
{
    enum Vrsta
    {
        HRANA, PICE, OSTALO
    }
    internal class Stavka : INotifyPropertyChanged
    {
        private int id;
        private string naziv;
        private double cena;
        private Vrsta vrsta;
        private string opis;

        public event PropertyChangedEventHandler PropertyChanged;

        public Stavka(int id, string naziv, double cena, Vrsta vrsta, string opis)
        {
            this.id = id;
            this.naziv = naziv;
            this.cena = cena;
            this.vrsta = vrsta;
            this.opis = opis;
        }

        public Stavka()
        {
        }

        public int Id
        {
            get { return this.id; }
            set
            {
                if (this.id != value)
                {
                    this.id = value;
                    this.NotifyPropertyChanged("Id");
                }
            }
        }

        public string Naziv
        {
            get { return this.naziv; }
            set
            {
                if (this.naziv != value)
                {
                    this.naziv = value;
                    this.NotifyPropertyChanged("Naziv");
                }
            }
        }

        public double Cena
        {
            get { return this.cena; }
            set
            {
                if (this.cena != value)
                {
                    this.cena = value;
                    this.NotifyPropertyChanged("Cena");
                }
            }
        }

        public Vrsta Vrsta
        {
            get { return this.vrsta; }
            set
            {
                if (this.vrsta!= value)
                {
                    this.vrsta = value;
                    this.NotifyPropertyChanged("Vrsta");
                }
            }
        }
        public string Opis
        {
            get { return this.opis; }
            set
            {
                if (this.opis != value)
                {
                    this.opis = value;
                    this.NotifyPropertyChanged("Opis");
                }
            }
        }

        private void NotifyPropertyChanged(string v)
        {
            throw new NotImplementedException();
        }
    }
}
