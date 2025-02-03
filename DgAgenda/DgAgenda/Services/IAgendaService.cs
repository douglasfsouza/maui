using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DgAgenda.MVVM.Models;

namespace DgAgenda.Services
{
    public interface IAgendaService
    {
        Task InitializeAsync();
        Task<List<Contato>> GetContatos();
        Task<Contato> GetContato(int id);
        Task<int> AddContato(Contato contato);
        Task<int> UpdateContato(Contato contato);
        Task<int> DeleteContato(Contato contato);
    }
}
