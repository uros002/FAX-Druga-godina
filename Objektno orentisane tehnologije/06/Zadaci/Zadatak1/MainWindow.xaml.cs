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
    public partial class MainWindow : Window
    {
        private ObservableCollection<Student> studenti = new ObservableCollection<Student>();

        public MainWindow()
        {
            InitializeComponent();
            btnIzmeni.IsEnabled = btnObrisi.IsEnabled = false;
            studenti.Add(new Student("Pera", "Peric", "PR1/2020"));
            studenti.Add(new Student("Mira", "Miric", "PR2/2020"));
            studenti.Add(new Student("Zika", "Zikic", "PR3/2020"));
            lbStudenti.ItemsSource = ViewDataGrid.ItemsSource = studenti;
        }

        private void btnDodaj_Click(object sender, RoutedEventArgs e)
        {
            if (Dodaj(new Student(txtIme.Text, txtPrezime.Text, txtBrojIndeksa.Text)))
            {
                MessageBox.Show("Uspesno dodavanje");

            }
            else
            {
                MessageBox.Show("Nespesno dodavanje");
            }
            txtIme.Text = txtPrezime.Text = txtBrojIndeksa.Text = "";
        }

        private void btnIzmeni_Click(object sender, RoutedEventArgs e)
        {
            if ((lbStudenti.SelectedItem as Student) != null)
            {
                Student noviStudent = new Student(txtImeIzmena.Text, txtPrezimeIzmena.Text, txtBrojIndeksaIzmena.Text);
                int index = lbStudenti.SelectedIndex;
		    this.DataContext = null;
                studenti.RemoveAt(index);
                studenti.Insert(index, noviStudent);
                MessageBox.Show("Uspesna izmena!");
            }
            else
            {
                MessageBox.Show("Student nije selektovan!");
            }

        }

        private void btnObrisi_Click(object sender, RoutedEventArgs e)
        {
            if ((lbStudenti.SelectedItem as Student) != null)
            {
                if (System.Windows.MessageBox.Show("Da li zaista zelite da obrisete studenta ?", "Potvdra o brisanju", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
                {
               
                    studenti.RemoveAt(lbStudenti.SelectedIndex);
                    MessageBox.Show("Uspesno brisanje!");
                }
            }
            else
            {
                MessageBox.Show("Student nije selektovan!");
            }
        }

        private void lbStudenti_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

            this.DataContext = (lbStudenti.SelectedItem as Student);
            btnIzmeni.IsEnabled = btnObrisi.IsEnabled = true;

        }

        private bool Dodaj(Student s)
        {
            if (s == null || s.Ime == "" || s.Prezime == "" || s.BrojIndeksa == "")
            {
                return false;
            }
            else
            {
                foreach (Student st in studenti)
                {
                    if (st.BrojIndeksa == s.BrojIndeksa)
                    {
                        return false;
                    }
                }
                studenti.Add(s);
                return true;
            }
        }


    }
}
