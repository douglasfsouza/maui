﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using DgAgenda.MVVM.Models;
using DgAgenda.Services;

namespace DgAgenda.MVVM.ViewModels
{
    public partial class AgendaViewModel : ObservableObject
    {
        [ObservableProperty]
        private List<Contato> _contatos;

        [ObservableProperty]
        private Contato _contatoAtual;

        public ICommand AddCommand { get; set; }
        public ICommand UpdateCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand DisplayCommand { get; set; }

        public AgendaViewModel(IAgendaService contatoRepository)
        {
            ContatoAtual = new Contato();
            AddCommand = new Command(async () =>
            {
                await contatoRepository.InitializeAsync();
                await contatoRepository.AddContato(ContatoAtual);
                await Refresh(contatoRepository);
            });

            UpdateCommand = new Command(async () =>
            {
                await contatoRepository.InitializeAsync();
                await contatoRepository.UpdateContato(ContatoAtual);
                await Refresh(contatoRepository);
            });

            DeleteCommand = new Command(async () =>
            {
                await contatoRepository.InitializeAsync();
                var resposta = await App.Current?.MainPage.DisplayAlert("Alerta", "Confirma exclusão ?", "Sim", "Não");
                if (resposta)
                {
                    await contatoRepository.DeleteContato(ContatoAtual);
                }
                
                await Refresh(contatoRepository);
            });

            DisplayCommand = new Command(async () =>
            {
                await contatoRepository.InitializeAsync();
                await Refresh(contatoRepository);
            });

        }
        private async Task Refresh(IAgendaService service)
        {
            Contatos = await service.GetContatos();            
        }
    }
}
