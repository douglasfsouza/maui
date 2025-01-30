

namespace SimpleNotes.Views;

public partial class AboutPage : ContentPage
{
	public AboutPage()
	{
		InitializeComponent();
	}

    private async void btnPrivacy_Clicked(object sender, EventArgs e)
    {
        await OpenPrivacy("privacy");
    }

    private async void btnTerms_Clicked(object sender, EventArgs e)
    {        
        await OpenPrivacy("terms");        
    }

    private async Task OpenPrivacy(string section)
    {
        string url = "";
        if (BindingContext is Models.About about)
        {
            url = about.TermsURL.ToString();
        }

        try
        {
            await Launcher.Default.OpenAsync($"{url}#{section}");
        }
        catch (Exception ex)
        {
            await DisplayAlert("Privacy", ex.Message, "Ok");
        }
    }


}