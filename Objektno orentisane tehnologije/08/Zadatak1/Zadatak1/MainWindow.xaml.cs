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

namespace Zadatak1
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Point startPoint = new Point();

        public MainWindow()
        {
            InitializeComponent();
            this.DataContext = this;
            List<Student> l = new List<Student>();
            l.Add(new Student { Ime = "Petar", Prezime = "Petrovic", Indeks = "PR1\\2061", Email = "ppetrovic@gmail.com", Upisan = true });
            l.Add(new Student { Ime = "Marko", Prezime = "Markovic", Indeks = "PR2\\2061", Email = "mmarkovic@gmail.com", Upisan = false });
            l.Add(new Student { Ime = "Nikola", Prezime = "Nikolic", Indeks = "PR3\\2061", Email = "nnikolic@gmail.com", Upisan = true });
            l.Add(new Student { Ime = "Suzana", Prezime = "Suzanic", Indeks = "PR4\\2061", Email = "ssuzanic@gmail.com", Upisan = false });
            l.Add(new Student { Ime = "Vukasin", Prezime = "Vukasinovic", Indeks = "PR5\\2061", Email = "vule@gmail.com", Upisan = true });

            Studenti = new ObservableCollection<Student>(l);
            Studenti2 = new ObservableCollection<Student>();

        }

        public ObservableCollection<Student> Studenti
        {
            get;
            set;
        }

        public ObservableCollection<Student> Studenti2
        {
            get;
            set;
        }

        private void ListView_PreviewMouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            startPoint = e.GetPosition(null);
        }

        private void ListView_MouseMove(object sender, MouseEventArgs e)
        {
            Point mousePos = e.GetPosition(null);
            Vector diff = startPoint - mousePos;

            if (e.LeftButton == MouseButtonState.Pressed &&
                (Math.Abs(diff.X) > SystemParameters.MinimumHorizontalDragDistance ||
                Math.Abs(diff.Y) > SystemParameters.MinimumVerticalDragDistance))
            {
                // Get the dragged ListViewItem
                ListView listView = sender as ListView;
                ListViewItem listViewItem =
                    FindAncestor<ListViewItem>((DependencyObject)e.OriginalSource);

                // Find the data behind the ListViewItem
                Student student = (Student)listView.ItemContainerGenerator.
                    ItemFromContainer(listViewItem);

                // Initialize the drag & drop operation
                DataObject dragData = new DataObject("myFormat", student);
                DragDrop.DoDragDrop(listViewItem, dragData, DragDropEffects.Move);
            }
        }

        private static T FindAncestor<T>(DependencyObject current) where T : DependencyObject
        {
            do
            {
                if (current is T)
                {
                    return (T)current;
                }
                current = VisualTreeHelper.GetParent(current);
            }
            while (current != null);
            return null;
        }

        private void ListView_DragEnter(object sender, DragEventArgs e)
        {
            if (!e.Data.GetDataPresent("myFormat") || sender == e.Source)
            {
                e.Effects = DragDropEffects.None;
            }
        }

        private void ListView_Drop(object sender, DragEventArgs e)
        {
            if (e.Data.GetDataPresent("myFormat"))
            {
                Student student = e.Data.GetData("myFormat") as Student;
                Studenti.Remove(student);
                Studenti2.Add(student);
            }
        }


    }
}
