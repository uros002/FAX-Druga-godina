using System;
using System.Collections.Generic;
using System.Windows;
using System.ComponentModel;
using System.Collections.ObjectModel;

namespace Wpf_BindingStudent
{
    internal class Student: INotifyPropertyChanged
    {
        private string brojIndeksa;

        public event PropertyChangedEventHandler PropertyChanged;

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

		public Student(string brojIndeksa)
        {

			this.brojIndeksa = brojIndeksa;
        }

        private void NotifyPropertyChanged(string v)
		{
			if (this.PropertyChanged != null)
				this.PropertyChanged(this, new PropertyChangedEventArgs(v));
		}
    }
}
