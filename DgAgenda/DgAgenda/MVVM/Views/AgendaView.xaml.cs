using DgAgenda.MVVM.ViewModels;
using DgAgenda.Services;

namespace DgAgenda.MVVM.Views;

public partial class AgendaView : ContentPage
{
	private readonly IAgendaService _service;
	public AgendaView(IAgendaService service)
	{
		InitializeComponent();
		_service = service;
		BindingContext = new AgendaViewModel(_service);
	}
}