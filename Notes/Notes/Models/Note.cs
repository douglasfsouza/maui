using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SimpleNotes.Models
{
    public class Note
    {
        public string Name { get; set; }
        public string ThreePoints { get; set; }
        public string NoteText { get; set; }
        public DateTime Date { get; set; }
        public string FileName { get; set; }
        
        public Note()
        {                      
        }
    }

}
