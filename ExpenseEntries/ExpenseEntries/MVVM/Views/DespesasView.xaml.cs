using ExpenseEntries.MVVM.ViewModels;
using ExpenseEntries.Services;

namespace ExpenseEntries.MVVM.Views;

public partial class DespesasView : ContentPage
{
	public DespesasView(IDespesaService service)
	{
		InitializeComponent();
		BindingContext = new DespesaViewModel(service);
	}

    private void ToolbarItem_Clicked(object sender, EventArgs e)
    {
        this.OpenPrivacy("privacy").Wait();
    }

    private void ToolbarItem_Clicked_1(object sender, EventArgs e)
    {
        this.OpenPrivacy("terms").Wait();        
    }

    private void tbExit_Clicked(object sender, EventArgs e)
    {
        App.Current.Quit();
    }

    private async Task OpenPrivacy(string section)
    {
        try
        {
            Uri uri = new Uri($"https://electrasystems.netlify.app/policy#{section}");
            await Browser.Default.OpenAsync(uri, BrowserLaunchMode.External);
        }
        catch (Exception ex)
        {
            await DisplayAlert("Privacy", ex.Message, "Ok");
            throw;
        }
    }

     
}