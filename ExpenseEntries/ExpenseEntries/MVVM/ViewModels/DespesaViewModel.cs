using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;
using CommunityToolkit.Mvvm.ComponentModel;
using ExpenseEntries.MVVM.Models;
using ExpenseEntries.Services;

namespace ExpenseEntries.MVVM.ViewModels
{
    public partial class DespesaViewModel : ObservableObject
    {
        [ObservableProperty]
        private List<Despesa> _despesas;

        [ObservableProperty]
        private Despesa _despesaAtual;

        [ObservableProperty]
        private List<String> _meses;

        [ObservableProperty]
        private List<long> _anos;


        [ObservableProperty]
        private List<String> _tipos;

        [ObservableProperty]
        private long _qtde;

        [ObservableProperty]
        private string _total;

        public ICommand AddCommand { get; set; }
        public ICommand UpdateCommand { get; set; }
        public ICommand DeleteCommand { get; set; }
        public ICommand DisplayCommand { get; set; }
        public ICommand FilterMonthCommand { get; set; }
        public ICommand CleanFilterCommand { get; set; }

        public DespesaViewModel(IDespesaService despesaRepository)
        {
            DespesaAtual = new Despesa();
            AddCommand = new Command(async () =>
            {
                await despesaRepository.InitializeAsync();
                await despesaRepository.AddDespesa(DespesaAtual);
                await Refresh(despesaRepository);
            });

            UpdateCommand = new Command(async () =>
            {
                await despesaRepository.InitializeAsync();
                await despesaRepository.UpdateDespesa(DespesaAtual);
                await Refresh(despesaRepository);
            });

            DeleteCommand = new Command(async () =>
            {
                await despesaRepository.InitializeAsync();
                var resposta = await App.Current?.MainPage.DisplayAlert("Alert", "Confirm delete?", "yes", "no");
                if (resposta)
                {
                    await despesaRepository.DeleteDespesa(DespesaAtual);
                }
                await Refresh(despesaRepository);
            });

            DisplayCommand = new Command(async () =>
            {
                await despesaRepository.InitializeAsync();
                await Refresh(despesaRepository);
            });

            FilterMonthCommand = new Command(async () =>
            {
                await despesaRepository.InitializeAsync();
                DespesaAtual = new Despesa();
                string mes = getMonth(Convert.ToInt64(DateTime.Today.ToString("MM")));

                DespesaAtual.Ano = DateTime.Now.Year;
                DespesaAtual.Mes = mes;
                
                await Refresh(despesaRepository);
                DespesaAtual.Ano = DateTime.Now.Year;
                DespesaAtual.Mes = mes;
            });

            CleanFilterCommand = new Command(() =>
            {
                DespesaAtual = new Despesa();
                DespesaAtual.Ano = 0;
                DespesaAtual.Mes = string.Empty;
            });

            Meses = new List<String>()
                {
                    "January",
                    "February",
                    "March",
                    "April",
                    "May",
                    "June",
                    "July",
                    "August",
                    "September",
                    "October",
                    "November",
                    "December"
                };

            Tipos = new List<String>()
            {
                "Debit",
                "Credit"
            };

            Qtde = 0;
            Total = "";

            long ano = DateTime.Now.Year - 5;
            Anos = new List<long>();
            for (int i = 0; i < 10; i++)
            {
                Anos.Add(ano);
                ano++;
            }

            string mes = getMonth(Convert.ToInt64(DateTime.Today.ToString("MM")));

            DespesaAtual.Ano = DateTime.Now.Year;

            DespesaAtual.Mes = mes;

            DespesaAtual.Data = DateTime.Today;
        }
        private async Task Refresh(IDespesaService service)
        {
            if (DespesaAtual.Ano == 0 && string.IsNullOrEmpty(DespesaAtual.Mes) && DespesaAtual.Data.Year < 2000 && string.IsNullOrEmpty(DespesaAtual.Descricao) && string.IsNullOrEmpty(DespesaAtual.TipoDescricao) && string.IsNullOrEmpty(DespesaAtual.VValor))
            {
                Despesas = await service.GetDespesas();
            }
            else
            {
                long ano = DespesaAtual.Ano;
                string mes = DespesaAtual.Mes;
                if (DespesaAtual.Data.Year >= 2000)
                {
                    ano = DespesaAtual.Data.Year;
                    mes = getMonth(Convert.ToInt64(DespesaAtual.Data.ToString("MM")));
                }

                Despesas = await service.GetDespesas(ano, mes, DespesaAtual.Data, DespesaAtual.Descricao ?? string.Empty, DespesaAtual.TipoDescricao ?? string.Empty, string.IsNullOrEmpty(DespesaAtual.VValor) ? 0 : Convert.ToDouble(DespesaAtual.VValor));


                //if (ano != 0 && !string.IsNullOrEmpty(mes) && dia > 0)
                //    Despesas = await service.GetDespesas(ano, mes, DespesaAtual.Data, DespesaAtual.Descricao.ToLower(), DespesaAtual.Tipo.ToLower(), Convert.ToDouble(DespesaAtual.VValor));
                //else if (ano != 0 && !string.IsNullOrEmpty(mes))
                //    Despesas = await service.GetDespesas(ano, mes, null, DespesaAtual.Descricao.ToLower(), DespesaAtual.Tipo.ToLower(), Convert.ToDouble(DespesaAtual.VValor));




                //if (ano != 0 && !string.IsNullOrEmpty(mes) && dia > 0)
                //{
                //    Despesas = await service.GetDespesas(ano, mes, DespesaAtual.Data, DespesaAtual.Descricao);
                //}
                //else if (ano != 0 && !string.IsNullOrEmpty(mes))
                //{
                //    Despesas = await service.GetDespesas(Convert.ToInt64(DespesaAtual.Ano), DespesaAtual.Mes, DespesaAtual.Data,DespesaAtual.Descricao);
                //}
                //else if (DespesaAtual.Ano != 0)
                //    Despesas = await service.GetDespesas(Convert.ToInt64(DespesaAtual.Ano));
                //else
                //    Despesas = await service.GetDespesas(0, DespesaAtual.Mes, DespesaAtual.Data, DespesaAtual.Descricao);
            }
            //DespesaAtual.Ano = DateTime.Now.Year;

            Qtde = Despesas.Count();
            double tot = Despesas.Sum(x => x.Valor);
            Total = tot.ToString("N2");

        }
        private string getMonth(long m)
        {
            switch (m)
            {
                case 1:
                    return "January";
                case 2:
                    return "February";
                case 3:
                    return "March";
                case 4:
                    return "April";
                case 5:
                    return "May";
                case 6:
                    return "June";
                case 7:
                    return "July";
                case 8:
                    return "August";
                case 9:
                    return "September";
                case 10:
                    return "October";
                case 11:
                    return "November";
                case 12:
                    return "December";
                default:
                    return string.Empty;
            }
        }
    }
}
