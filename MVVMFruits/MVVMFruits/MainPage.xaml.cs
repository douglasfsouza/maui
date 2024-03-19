using MVVMFruits.ViewModel;

namespace MVVMFruits
{
    public partial class MainPage : ContentPage
    {
        public MainPage(MainViewModel vm)
        {
            InitializeComponent();
            BindingContext = vm;
        }

       
    }

}
