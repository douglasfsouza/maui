using MVVMFruits.ViewModel;

namespace MVVMFruits;

public partial class DetailPage : ContentPage
{
	public DetailPage(DetailViewModel vm)
	{
		InitializeComponent();
		BindingContext = vm;
	}
     
}