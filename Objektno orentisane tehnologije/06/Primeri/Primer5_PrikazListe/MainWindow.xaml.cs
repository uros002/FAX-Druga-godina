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

namespace Wpf_PrikazListi
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();

            List<Student> studenti = new List<Student>();
            studenti.Add(new Student("PR1/2020"));
            studenti.Add(new Student("PR2/2020"));
            studenti.Add(new Student("PR3/2020"));

            icList.ItemsSource = studenti;
        }
    }
}
