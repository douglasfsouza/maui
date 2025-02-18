using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using SQLite;
using TableAttribute = SQLite.TableAttribute;

namespace ExpenseEntries.MVVM.Models
{
    [Table("Despesas")]
    public class Despesa
    {
        [PrimaryKey,  AutoIncrement]
        public int Id { get; set; }
        [NotNull]
        public DateTime Data { get; set; }
        [MaxLength(50), NotNull]        
        
        public string Descricao { get; set; }
        [MaxLength(1)]
        public string Tipo { get; set; }        
        public double Valor { get; set; }

        public string VData
        {
            get
            {
                return Data.ToString("yyyy-MM-dd");
            }
            set { }            
        }

        public string VValor { get; set; }
        /*public string VValor
        {
            get
            {
                return Valor.ToString("N2");
            }
            set { }
        }*/

        public string TipoDescricao { get; set; }

        /*public string TipoDescricao
        {
            get
            {
                return Tipo?.ToLower() == "d" ? "Debit" : "Credit";
            }
            set { }
        }   */

        public string Mes { get; set; }

        /*public string Mes
        {
            get
            {
                long m = Convert.ToInt64(Data.ToString("MM"));
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
            set { }
        }*/

        public long Ano { get; set; }

        //public string Ano
        //{
        //    get
        //    {
        //        return Data.ToString("yyyy");
        //    }
        //    set { }
        //}
        //
        
        
    }
}
