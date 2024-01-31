using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
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

namespace Zadatak2
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private ObservableCollection<Stavka> jelovnik = new ObservableCollection<Stavka>();
        public MainWindow()
        {
            InitializeComponent();
            jelovnik.Add(new Stavka(1, "Giros", 360, Vrsta.HRANA, "Svinjski mali"));
            jelovnik.Add(new Stavka(2, "Burito", 460, Vrsta.HRANA, "Vege"));
            jelovnik.Add(new Stavka(3, "Coca Cola", 120, Vrsta.PICE, "Gazirano"));
            jelovnik.Add(new Stavka(4, "Sok od pomorandze", 300, Vrsta.PICE, "Cedjeni"));
            lbStavke.ItemsSource = ViewDataGrid.ItemsSource = lbStavkePrikaz.ItemsSource = jelovnik;
            cmbVrsta.ItemsSource = cmbVrstaIzmena.ItemsSource = new List<Vrsta>() { Vrsta.HRANA, Vrsta.PICE, Vrsta.OSTALO };
            

        }
        private Stavka validacija(string id, string naziv, string cena, string opis, ComboBox cmb)
        {

            if (id == "" || naziv == "" || cena == "")
                return null;

            if (!int.TryParse(id, out int idSt))
                return null;

            if (!double.TryParse(cena, out double cenaSt))
                return null;

            if (!Enum.TryParse(cmb.SelectedValue.ToString(), out Vrsta vrstaSt))
                return null;

            if (idSt <= 0 || cenaSt <= 0)
                return null;


            return new Stavka(idSt, naziv, cenaSt, vrstaSt, opis);
        }
        private void btnDodaj_Click(object sender, RoutedEventArgs e)
        {
            bool uspesno = true;
            
            if (cmbVrsta.SelectedItem != null)
            {
                Stavka s = validacija(txtId.Text, txtNaziv.Text, txtCena.Text, txtOpis.Text, cmbVrsta); 
                
                if (Dodaj(s))
                {
                    uspesno = true;
                }
                else
                {
                    uspesno = false;
                }

            }
            else
                uspesno = false;
        
            if (uspesno)
                MessageBox.Show("Uspešno dodavanje stavke!", "Uspešna operacija", MessageBoxButton.OK, MessageBoxImage.Information);

            else
                MessageBox.Show("Neuspešno dodavanje", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);

            txtId.Text = txtNaziv.Text = txtCena.Text = txtOpis.Text = "";
            cmbVrsta.SelectedItem = null;
        }

        private void btnIzmeni_Click(object sender, RoutedEventArgs e)
        {
            
            Enum.TryParse(cmbVrstaIzmena.SelectedValue.ToString(), out Vrsta vrsta);
            if ((lbStavke.SelectedItem as Stavka) != null)
            {
                Stavka novaStavka = validacija(txtIdIzmena.Text, txtNazivIzmena.Text, txtCenaIzmena.Text, txtOpisIzmena.Text, cmbVrstaIzmena);
                if (novaStavka == null)
                {
                    MessageBox.Show("Loša validacija!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
                }
                else
                {
                    int index = lbStavke.SelectedIndex;
                    jelovnik.RemoveAt(index);
                    jelovnik.Insert(index, novaStavka);
                    MessageBox.Show("Uspešno izmenjena stavka!", "Uspešna operacija", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            else
            {
                MessageBox.Show("Stavka nije selektovana!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }

        }

        private void btnObrisi_Click(object sender, RoutedEventArgs e)
        {
            if ((lbStavke.SelectedItem as Stavka) != null)
            {
                if (System.Windows.MessageBox.Show("Da li zaista želite da obrišete stavku?", "Potvdra o brisanju", MessageBoxButton.YesNo, MessageBoxImage.Question) == MessageBoxResult.Yes)
                {

                    jelovnik.RemoveAt(lbStavke.SelectedIndex);
                    MessageBox.Show("Uspešno brisanje!", "Uspešna operacija", MessageBoxButton.OK, MessageBoxImage.Information);
                }
            }
            else
            {
                MessageBox.Show("Stavka nije selektovana!", "Greška", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void lbStavke_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            this.DataContext = (lbStavke.SelectedItem as Stavka);
            btnIzmeni.IsEnabled = btnObrisi.IsEnabled = true;

        }

        private bool Dodaj(Stavka s)
        {

            if (s == null)
            {
                return false;
            }
            else
            {
                foreach (Stavka st in jelovnik)
                {
                    if (st.Id == s.Id || st.Naziv == s.Naziv)
                    {
                        return false;
                    }
                }
                jelovnik.Add(s);
                return true;
            }
        }

        private void searchBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            List<Stavka> pretrazenaLista = new List<Stavka>();

            if (searchBox.Text.Equals(""))
            {
                pretrazenaLista.AddRange(jelovnik);
            }
            else
            {
                foreach (Stavka st in jelovnik)
                {

                    if (st.Naziv.ToLower().StartsWith(searchBox.Text.ToLower()) || st.Opis.ToLower().StartsWith(searchBox.Text.ToLower()))
                    {
                        pretrazenaLista.Add(st);
                        
                    }
                }
            }

            ViewDataGrid.ItemsSource = pretrazenaLista.ToList();
        }


        private void search_Click(object sender, RoutedEventArgs e)
        {
            List<Stavka> pretrazenaLista = new List<Stavka>();

            if (searchBox.Text.Equals(""))
            {
                pretrazenaLista.AddRange(jelovnik);
            }
            else
            {
                foreach (Stavka st in jelovnik)
                {

                    if (st.Naziv.ToLower().Contains(searchBox.Text.ToLower()) || st.Opis.ToLower().Contains(searchBox.Text.ToLower()))
                    {
                        pretrazenaLista.Add(st);

                    }
                }
            }

            ViewDataGrid.ItemsSource = pretrazenaLista.ToList();
        }
    }
    }
