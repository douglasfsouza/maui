using ExpenseEntries.MVVM.Views;
using ExpenseEntries.Services;

namespace ExpenseEntries
{
    public partial class App : Application
    {
        public App(IDespesaService despesaService)
        {
            InitializeComponent();

            MainPage = new NavigationPage(new DespesasView(despesaService));

        }
    }
}
