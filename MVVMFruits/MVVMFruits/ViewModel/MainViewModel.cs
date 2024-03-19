
using CommunityToolkit.Mvvm.ComponentModel;
using CommunityToolkit.Mvvm.Input;
using System.Collections.ObjectModel;
using System.ComponentModel;


namespace MVVMFruits.ViewModel
{
    public partial class MainViewModel  : ObservableObject
    {
        IConnectivity connectivity;
        public MainViewModel(IConnectivity connectivity)
        {
            Items = new ObservableCollection<string>();
            this.connectivity = connectivity;
        }
        [ObservableProperty]
        ObservableCollection<string> items;

        [ObservableProperty]
        string text;

        [ICommand]
        async Task Add()
        {
            if (string.IsNullOrWhiteSpace(Text))
                return;

            if (connectivity.NetworkAccess != NetworkAccess.Internet)
            {
                await Shell.Current.DisplayAlert("oh oh","Internet access failed!!", "ok");
                return;
            }

            items.Add(Text);
            Text = string.Empty;
        }

        [ICommand]
        void Delete(string s)
        {
            if (string.IsNullOrEmpty(s)) return;
            if (items.Contains(s))
            {
                items.Remove(s);
            }            
        }

        [ICommand]
        async Task Tap(string s)
        {
            await Shell.Current.GoToAsync($"{nameof(DetailPage)}?Text={s}");
        }
        
    }
}
