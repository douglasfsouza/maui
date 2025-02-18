using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpenseEntries.MVVM.Models;

namespace ExpenseEntries.Services
{
    public interface IDespesaService
    {
        Task InitializeAsync();
        Task<List<Despesa>> GetDespesas();
        Task<List<Despesa>> GetDespesas(long year);
        Task<List<Despesa>> GetDespesas(long year, string month, DateTime date, string description, string type, double amount);
        Task<Despesa> GetDespesa(int id);        
        Task<int> AddDespesa(Despesa despesa);
        Task<int> UpdateDespesa(Despesa despesa);
        Task<int> DeleteDespesa(Despesa despesa);
    }
}
