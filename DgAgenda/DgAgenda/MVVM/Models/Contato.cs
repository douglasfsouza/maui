using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;

namespace DgAgenda.MVVM.Models
{
    [Table("Contatos")]
    public class Contato
    {        
        [PrimaryKey, AutoIncrement]
        public int Id { get; set; }
        [MaxLength(100), NotNull]        
        public string Nome { get; set; }
        [MaxLength(200), NotNull]
        public string Email { get; set; }

    }
}
