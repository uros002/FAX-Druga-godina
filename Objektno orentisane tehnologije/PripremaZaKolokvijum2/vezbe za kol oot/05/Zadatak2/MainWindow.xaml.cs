using System;
using System.Windows;
using System.Windows.Controls;


namespace Zadatak2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private int counter;
        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            this.counter = 0;
        }
       

        private void Izgenerisi_Click(object sender, RoutedEventArgs e)
        {
            if (this.Ime.Text == "" && this.Prezime.Text == "")
                MessageBox.Show("Unesite vrednosti za ime i prezime");
            else
            {
                Random rand = new Random();
                this.KorisnickoIme.Text = this.Ime.Text + this.Prezime.Text + rand.Next();
            }

        }

        private void Osvezi_Click(object sender, RoutedEventArgs e)
        {
            this.KorisnickoIme.Text = this.Ime.Text = this.Prezime.Text = "";
        }

        private void Sacuvaj_Click(object sender, RoutedEventArgs e)
        {
            if (this.Ime.Text == "" && this.Prezime.Text == "")
                MessageBox.Show("Unesite vrednosti za ime i prezime"); 
            else
                this.Sacuvano.Text = this.KorisnickoIme.Text;
        }

        private void Sacuvano_TextChanged(object sender, TextChangedEventArgs e)
        {
            this.counter++;
            this.Broj.Text = this.counter.ToString();

        }
    }
}
