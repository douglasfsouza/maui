using CommunityToolkit.Maui.Alerts;
using CommunityToolkit.Maui.Core;

namespace AsciiTable
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void btnConvertToAsc_Clicked(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtChar.Text.ToString().Trim()))
            {
                string letra = txtChar.Text;
                int a = (int)letra[0];
                txtAsc.Text = a.ToString();
            }
        }

        private void btnConvertToChar_Clicked(object sender, EventArgs e)
        {
            if (!String.IsNullOrEmpty(txtAsc.Text.ToString().Trim()))
            {
                int ascii = 0;
                ToastDuration duration = ToastDuration.Short;
                double fontSize = 14;
                var toast = Toast.Make("Invalid value!!", duration, fontSize);
                CancellationTokenSource cancellationTokenSource = new CancellationTokenSource();
                try
                {
                    ascii = Convert.ToInt32(txtAsc.Text.ToString().Trim());
                }
                catch (Exception)
                {
                    toast.Show(cancellationTokenSource.Token);
                }
                if (ascii != 0)
                {
                    if (ascii > 0 && ascii < 256)
                    {
                        txtChar.Text = Convert.ToString((char)ascii);
                    }
                    else
                    {
                        toast.Show(cancellationTokenSource.Token);
                    }
                }
            }
        }

        private void ToolbarItem_Clicked(object sender, EventArgs e)
        {
            this.OpenPrivacy().Wait();
        }

        private async Task OpenPrivacy()
        {
            try
            {
                Uri uri = new Uri("https://electrasystems.netlify.app/policy");
                await Browser.Default.OpenAsync(uri, BrowserLaunchMode.SystemPreferred);
            }
            catch (Exception ex)
            {
                await DisplayAlert("Privacy", ex.Message, "Ok");
            }
        }
    }

}
