using System;
using System.Windows;
using System.Windows.Input;
using Facebook;
using System;
using System.Web;
using System.Collections.Specialized;
using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Navigation;
using Facebook;
using Microsoft.Web.WebView2.Wpf;

namespace AnimalHealthCareDBMS
{
    /// <summary>
    /// MainWindow.xaml etkileşim mantığı
    /// </summary>
    public partial class MainWindow : Window
    {
       

        public MainWindow()
        {
            InitializeComponent();
        }

        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void btnClose_Click(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void btnMinimize_Click(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void btnLogin_Click(object sender, RoutedEventArgs e)
        {
            View.MainWindow mainWindow = new View.MainWindow();
            mainWindow.Show();
            this.Hide();
        }

        private void btnLogin_Loaded(object sender, RoutedEventArgs e)
        {

        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            FacebookLogin();
        }
        private void FacebookLogin()
        {
            string appId = "553748207567975";
            string redirectUri = "https://www.facebook.com/connect/login_success.html";
            string oauthUrl = $"https://www.facebook.com/v10.0/dialog/oauth?client_id={appId}&redirect_uri={redirectUri}&response_type=token&scope=email";

            var webView = new WebView2();
            webView.NavigationCompleted += WebView_NavigationCompleted;
            webView.Source = new Uri(oauthUrl);

            var window = new Window
            {
                Title = "Facebook Giriş",
                Content = webView,
                Width = 600,
                Height = 800
            };

            window.ShowDialog();
        }

        private void WebView_NavigationCompleted(object sender, Microsoft.Web.WebView2.Core.CoreWebView2NavigationCompletedEventArgs e)
        {
            var webView = sender as WebView2;
            if (webView != null && webView.Source.Fragment.Contains("access_token"))
            {
                string accessToken = ExtractAccessToken(webView.Source.Fragment);
                if (!string.IsNullOrEmpty(accessToken))
                {
                    GetFacebookUserInfo(accessToken);
                    Window.GetWindow(webView)?.Close();
                }
            }
        }

        private string ExtractAccessToken(string fragment)
        {
            var parameters = fragment.TrimStart('#').Split('&');
            foreach (var param in parameters)
            {
                var keyValue = param.Split('=');
                if (keyValue[0] == "access_token")
                    return keyValue[1];
            }
            return null;
        }

        private void GetFacebookUserInfo(string accessToken)
        {
            var fb = new FacebookClient(accessToken);
            dynamic result = fb.Get("me", new { fields = "name,email" });
            string name = result.name;
            string email = result.email;

            MessageBox.Show($"Hoş geldiniz, {name}!\nEmail: {email}");

            // Ana pencereye yönlendirme
            View.MainWindow mainWindow = new View.MainWindow();
            mainWindow.Show();
            this.Hide();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            FacebookLogin();
        }
    }
}

