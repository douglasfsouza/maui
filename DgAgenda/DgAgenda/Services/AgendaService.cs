using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DgAgenda.MVVM.Models;
using SQLite;

namespace DgAgenda.Services
{
    public class AgendaService : IAgendaService
    {
        SQLiteAsyncConnection _dbConnection;
        public async Task InitializeAsync()
        {
            await SetupDB();
        }
        public async Task<int> AddContato(Contato contato)
        {
            return await _dbConnection.InsertAsync(contato);
        }

        public async Task<int> DeleteContato(Contato contato)
        {
            return await _dbConnection.DeleteAsync(contato);
        }

        public async Task<Contato> GetContato(int id)
        {
            return await _dbConnection.Table<Contato>().FirstOrDefaultAsync(x => x.Id == id);
        }

        public async Task<List<Contato>> GetContatos()
        {
            return await _dbConnection.Table<Contato>().ToListAsync();
        }       

        public async Task<int> UpdateContato(Contato contato)
        {
            return await _dbConnection.UpdateAsync(contato);
        }
        private async Task SetupDB()
        {
            if (_dbConnection == null)
            {
                string dbPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.LocalApplicationData), "Agenda.db3");
                _dbConnection = new SQLiteAsyncConnection(dbPath);
                await _dbConnection.CreateTableAsync<Contato>();
            }

        }
    }
}
