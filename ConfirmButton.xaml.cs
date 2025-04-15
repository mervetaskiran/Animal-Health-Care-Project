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

namespace AnimalHealthCareDBMS.View.UserControls
{
    /// <summary>
    /// ConfirmButton.xaml etkileşim mantığı
    /// </summary>
    public partial class ConfirmButton : UserControl
    {
        private string buttonText;

        public string ButtonText
        {
            get { return buttonText; }
            set 
            { 
                buttonText = value;
                confirmButton.Content = buttonText;
            }
        }

        public ConfirmButton()
        {
            InitializeComponent();
        }

        // Define the Click event
        public static readonly RoutedEvent ClickEvent = EventManager.RegisterRoutedEvent(
            "Click", RoutingStrategy.Bubble, typeof(RoutedEventHandler), typeof(ConfirmButton));

        // CLR wrapper for the Click event
        public event RoutedEventHandler Click
        {
            add { AddHandler(ClickEvent, value); }
            remove { RemoveHandler(ClickEvent, value); }
        }

        private void ConfirmButton_Click(object sender, RoutedEventArgs e)
        {
            // Raise the Click event
            RoutedEventArgs newEventArgs = new RoutedEventArgs(ClickEvent);
            RaiseEvent(newEventArgs);
        }

    }
}
