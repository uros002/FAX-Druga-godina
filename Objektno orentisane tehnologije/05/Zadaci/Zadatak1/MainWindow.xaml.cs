using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Zadatak1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public enum BinarniOperator
    {
        Sabiranje,
        Oduzimanje,
        Mnozenje,
        Deljenje,
        Nista
    }
    public partial class MainWindow : Window
    {
        private BinarniOperator trenutniOperator;
        private double prviOperand;
        private double drugiOperand;
        public MainWindow()
        {
            InitializeComponent();
        }
        private void Broj_Click(object sender, RoutedEventArgs e)
        {
            var brojBtn = sender as Button;
            if (Rezultat.Text != "0")
            {
                Rezultat.Text = Rezultat.Text + brojBtn.Content;    
            }
            else
            {
                Rezultat.Text = brojBtn.Content.ToString();
            }
        }
        private void Obrisi_Click(object sender, RoutedEventArgs e)
        {
            prviOperand = 0;
            drugiOperand = 0;
            trenutniOperator = 0;
            Rezultat.Text = "0";
        }
        private void Sabiranje_Click(object sender, RoutedEventArgs e)
        {
            trenutniOperator = BinarniOperator.Sabiranje;
            prviOperand = double.Parse(Rezultat.Text);
            Rezultat.Text = "0";
        }
        private void Izracunavanje_Click(object sender, RoutedEventArgs e)
        {
            drugiOperand = double.Parse(Rezultat.Text);
            Rezultat.Text = Racunanje(prviOperand, trenutniOperator, drugiOperand);
            prviOperand = double.Parse(Rezultat.Text);
            trenutniOperator = BinarniOperator.Nista;

        }
        private string Racunanje(double prviOperand, BinarniOperator trenutniOperator, double drugiOperand)
        {
            if (trenutniOperator == BinarniOperator.Sabiranje)
            {
                return Math.Round((prviOperand + drugiOperand), 4).ToString();
            }
            else if (trenutniOperator == BinarniOperator.Oduzimanje)
            {
                return Math.Round((prviOperand - drugiOperand), 4).ToString();
            }
            else if (trenutniOperator == BinarniOperator.Mnozenje)
            {
                return Math.Round((prviOperand * drugiOperand), 4).ToString();
            }
            else if (trenutniOperator == BinarniOperator.Deljenje)
            {
                return Math.Round((prviOperand / drugiOperand), 4).ToString();
            }
            else if (trenutniOperator == BinarniOperator.Nista)
            {
                return Math.Round((prviOperand), 4).ToString();
            }
            else
            {
                return "0";
            }
        }
        private void Oduzimanje_Click(object sender, RoutedEventArgs e)
        {
            trenutniOperator = BinarniOperator.Oduzimanje;
            prviOperand = double.Parse(Rezultat.Text);
            Rezultat.Text = "0";
        }
        private void Mnozenje_Click(object sender, RoutedEventArgs e)
        {
            trenutniOperator = BinarniOperator.Mnozenje;
            prviOperand = double.Parse(Rezultat.Text);
            Rezultat.Text = "0";
        }
        private void Deljenje_Click(object sender, RoutedEventArgs e)
        {
            trenutniOperator = BinarniOperator.Deljenje;
            prviOperand = double.Parse(Rezultat.Text);
            Rezultat.Text = "0";
        }
        private void Znak_Click(object sender, RoutedEventArgs e)
        {
            if (Rezultat.Text != "0")
                Rezultat.Text = (double.Parse(Rezultat.Text) * -1).ToString();
        }
        private void Procenat_Click(object sender, RoutedEventArgs e)
        {
            if (Rezultat.Text != "0")
                Rezultat.Text = (double.Parse(Rezultat.Text)/100).ToString();
        }
        private void Tacka_Click(object sender, RoutedEventArgs e)
        {
            if (Rezultat.Text.IndexOf('.') < 0)
            {
                Rezultat.Text += ".";
            }
        }
    }

}
