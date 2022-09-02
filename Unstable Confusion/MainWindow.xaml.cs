using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.IO;
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

namespace Unstable_Confusion
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        static Process p;
        static bool canceled = false;
        public static String prompt;

        public MainWindow()
        {
            InitializeComponent();
           
        }

        public void getText()
        {
            prompt=txtPrompt.Text;
        }

        public static BitmapImage bmpImg=null;

        private void showResultImage()
        {
            imgResult.Visibility = Visibility.Visible;
        }

        private void cancelProcessing()
        {
            canceled = true;
            if (p != null && !p.HasExited)
                p.Kill(true);

        }

        private void enableControls()
        {
            wait.Visibility = Visibility.Hidden;
            bnStop.IsEnabled = false;
            bnSave.IsEnabled = true;
            bnStart.IsEnabled = true;
            txtPrompt.IsEnabled = true;
        }

        private void disableControls()
        {
            bnStop.IsEnabled = true;
            wait.Visibility = Visibility.Visible;
            imgResult.Visibility = Visibility.Hidden;
            bnSave.IsEnabled = false;
            bnStart.IsEnabled = false;
            txtPrompt.IsEnabled = false;
        }

        public void setBitmapImage()
        {
            try
            {
                var bitmapImage = new BitmapImage();
                bitmapImage.BeginInit();
                bitmapImage.StreamSource = new MemoryStream(File.ReadAllBytes(".\\squirrel-0.png"));
                bitmapImage.EndInit();
                imgResult.Source = bitmapImage;
            }
            catch (Exception ex) { }
            bnSave.IsEnabled = true;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {

            getText();
            System.Threading.Thread t = new System.Threading.Thread(() =>
              {
                  canceled = false;
                  bnStart.Dispatcher.Invoke(disableControls);
                  p = Process.Start(new ProcessStartInfo(".\\txt2img.exe", "\"" + MainWindow.prompt + "\"") { CreateNoWindow = true });
                  p.WaitForExit();
                  bnStart.Dispatcher.Invoke(enableControls);
                  if (p.ExitCode == 0)
                  {
                      bnStart.Dispatcher.Invoke(showResultImage);
                      imgResult.Dispatcher.Invoke(setBitmapImage);
                  }
                  else
                  {
                      if(!canceled)
                            MessageBox.Show("Error. plese check available VRAM- and harddisk space.");
                  }
              });
            t.Start();        
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            SaveFileDialog d = new SaveFileDialog();
            if(d.ShowDialog(this)==true)
            {
                try
                {
                    File.Copy("squirrel-0.png", d.FileName, true);
                }catch(Exception ex)
                {
                    MessageBox.Show(this, "Error saving image.");
                }
            }


        }

        private void ButtonStop_Click(object sender, RoutedEventArgs e)
        {
            cancelProcessing();
            bnStart.Dispatcher.Invoke(enableControls);
        }
    }
}
