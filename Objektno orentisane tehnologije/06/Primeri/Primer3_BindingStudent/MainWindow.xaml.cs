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

namespace Wpf_BindingStudent
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private ObservableCollection<Student> studenti = 
            new ObservableCollection<Student>();

        public MainWindow()
        {
            InitializeComponent();

            studenti.Add(new Student("PR 12/2010"));
            studenti.Add(new Student("PR 20/2010"));
            studenti.Add(new Student("PR 14/2010"));

            lbStudenti.ItemsSource = studenti;

        }

        private void btnDodaj_Click(object sender, RoutedEventArgs e)
        {
            if (txtStudenti.Text != "")
            {
                studenti.Add(new Student(txtStudenti.Text.Trim()));
                txtStudenti.Text = "";
            }

        }

        private void btnIzmeni_Click(object sender, RoutedEventArgs e)
        {
            if (lbStudenti.SelectedItem != null && txtStudenti.Text != "")
            {
               (lbStudenti.SelectedItem as Student).BrojIndeksa = txtStudenti.Text.Trim();
                txtStudenti.Text = "";
            }
               
        }

        private void btnObrisi_Click(object sender, RoutedEventArgs e)
        {
            if (lbStudenti.SelectedItem != null)
            {
                studenti.Remove(lbStudenti.SelectedItem as Student);
                txtStudenti.Text = "";
            }
        }

        private void lbStudenti_MouseDoubleClick(object sender, MouseButtonEventArgs e)
        {
            txtStudenti.Text = (lbStudenti.SelectedItem as Student).BrojIndeksa;
        }
    }
}
