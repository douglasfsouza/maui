using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.ComponentModel;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace SimpleNotes.Models
{
    public class AllNotes : INotifyPropertyChanged
    {
        private string _searchText;
        public string SearchText
        {
            get => _searchText;
            set
            {
                if (_searchText != value)
                {
                    _searchText = value;
                    OnPropertyChanged();
                    FilterNotes();
                }
            }
        }
        public ObservableCollection<Note> Notes { get; set; } = new ObservableCollection<Note>();
        public ObservableCollection<Note> FilteredNotes { get; set; }
        public ICommand FilterCommand { get; set; }
        //public AllNotes() => LoadNotes();
        public AllNotes()
        {
            LoadNotes();
        }        

        private void FilterNotes()
        {
            if (string.IsNullOrWhiteSpace(SearchText))
            {
                FilteredNotes = new ObservableCollection<Note>(Notes);
            }
            else
            {
                FilteredNotes = new ObservableCollection<Note>(Notes.Where(
                    note => note.NoteText.Contains(SearchText,StringComparison.OrdinalIgnoreCase)));
            }
            OnPropertyChanged(nameof(FilteredNotes));

        }

        public event PropertyChangedEventHandler? PropertyChanged;
        protected void OnPropertyChanged([CallerMemberName] string propertyName = null) =>
            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

        public void LoadNotes()
        {            
            Notes.Clear();
            string appDataPath = FileSystem.AppDataDirectory;

            IEnumerable<Note> notes = Directory
                                        .EnumerateFiles(appDataPath, "*.dgsNotes.txt")
                                        .Select(fileName => new Note()
                                        {
                                            ThreePoints = File.ReadAllText(fileName).Length > 20 ? "..." : string.Empty,
                                            FileName = fileName,
                                            NoteText = File.ReadAllText(fileName),
                                            Date = File.GetCreationTime(fileName)
                                        })
                                        .OrderBy(x => x.Date);
            foreach (Note note in notes)
            {                
                string name = string.Empty;
                if (note.NoteText.Length > 20)
                {
                    name = note.NoteText.Substring(0,20) + "...";
                }
                else
                    name = note.NoteText;

                note.Name = name.Replace("\r"," ").Replace("\n"," ");
                
                Notes.Add(note);
            }

            FilteredNotes = new ObservableCollection<Note>(Notes);
            FilterCommand = new Command(FilterNotes);

            OnPropertyChanged();
            FilterNotes();

        }
    }
}
