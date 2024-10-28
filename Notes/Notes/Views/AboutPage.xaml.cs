namespace Notes.Views;

public partial class AboutPage : ContentPage
{
	public AboutPage()
	{
		InitializeComponent();
	}

    private async void btnPrivacy_Clicked(object sender, EventArgs e)
    {
		string url = "";
		if (BindingContext is Models.About about)
		{
			url = about.PrivacyURL.ToString();
		}		
		
		await Launcher.Default.OpenAsync(url);
    }

  
}