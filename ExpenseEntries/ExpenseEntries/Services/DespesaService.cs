using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ExpenseEntries.MVVM.Models;
using SQLite;

namespace ExpenseEntries.Services
{
    public class DespesaService : IDespesaService
    {
        SQLiteAsyncConnection _connection;
        public async Task InitializeAsync()
        {
            await SetupDB();
        }
        public async Task<int> AddDespesa(Despesa despesa)
        {
            despesa.Tipo = despesa.TipoDescricao?.ToLower() == "debit" ? "d" : "c";
            if (!string.IsNullOrEmpty(despesa.VValor))
            {
                despesa.Valor = Convert.ToDouble(despesa.VValor);
                despesa.VValor = despesa.Valor.ToString("N2");
            }                
            despesa.Ano = despesa.Data.Year;
            return await _connection.InsertAsync(despesa);
        }

        public async Task<int> DeleteDespesa(Despesa despesa)
        {
            return await _connection.DeleteAsync(despesa);
        }

        public async Task<Despesa> GetDespesa(int id)
        {
            return await _connection.Table<Despesa>().FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<List<Despesa>> GetDespesas()
        {
            return await _connection.Table<Despesa>().ToListAsync();
        }      
        
        public async Task<List<Despesa>> GetDespesas(long year)
        {
            var result = await _connection.Table<Despesa>().Where(x => x.Ano == year).ToListAsync();
            return result;
        }

        public async Task<List<Despesa>> GetDespesas(long year, string month, DateTime date, string description, string type, double amount)
        {
            var result = new List<Despesa>();

            if (year != 0 && !string.IsNullOrEmpty(month) && date.Year >= 2000)
            {
                result = await _connection.Table<Despesa>().Where(x => x.Data == date).ToListAsync();
            }
            else if (year != 0 && !string.IsNullOrEmpty(month))
                result = await _connection.Table<Despesa>().Where(x => x.Ano == year && x.Mes == month).ToListAsync();
            else
            {
                if (year != 0)
                    result = await _connection.Table<Despesa>().Where(x => x.Ano == year).ToListAsync();
                else if (!string.IsNullOrEmpty(month))
                    result = await _connection.Table<Despesa>().Where(x => x.Mes == month).ToListAsync();
                else
                    result = await _connection.Table<Despesa>().ToListAsync();
            }

            if (!string.IsNullOrEmpty(description))
                result = result.Where(x => x.Descricao.ToLower().Contains(description.ToLower())).ToList();

            if (!string.IsNullOrEmpty(type))
                result = result.Where(x => x.TipoDescricao.ToLower().Contains(type.ToLower())).ToList();

            if (amount != 0)
                result = result.Where(x => x.Valor == amount).ToList();
            
            return result;
        }

        public async Task<int> UpdateDespesa(Despesa despesa)
        {
            despesa.Tipo = despesa.TipoDescricao?.ToLower() == "debit" ? "d" : "c";
            if (!string.IsNullOrEmpty(despesa.VValor))
            {
                despesa.Valor = Convert.ToDouble(despesa.VValor);
                despesa.VValor = despesa.Valor.ToString("N2");
            }
                
            despesa.Ano = despesa.Data.Year;
            return await _connection.UpdateAsync(despesa);
        }
        private async Task SetupDB()
        {
            if (_connection == null)
            {
                string dbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Despesas.db3");
                _connection = new SQLiteAsyncConnection(dbPath);
                await _connection.CreateTableAsync<Despesa>();                    
            }
        }
    }
}
