using DgAgenda.MVVM.Views;
using DgAgenda.Services;

namespace DgAgenda
{
    public partial class App : Application
    {
        public App(IAgendaService agendaService)
        {
            InitializeComponent();

            MainPage = new NavigationPage(new AgendaView(agendaService));
        }
    }
}
