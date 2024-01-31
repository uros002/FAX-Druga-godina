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
        public MainWindow()
        {
            InitializeComponent();
        }

        private void btnPrethodni_Click(object sender, RoutedEventArgs e)
        {
            int newIndex = tabC.SelectedIndex - 1;
            if (newIndex < 0)
                newIndex = tabC.Items.Count - 1;
            tabC.SelectedIndex = newIndex;
        }

        private void btnSledeci_Click(object sender, RoutedEventArgs e)
        {
            int newIndex = tabC.SelectedIndex + 1;
            if (newIndex >= tabC.Items.Count)
                newIndex = 0;
            tabC.SelectedIndex = newIndex;

        }
    }
}
