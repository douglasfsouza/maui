﻿using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Notes.Models
{
    public class AllNotes
    {
        public ObservableCollection<Note> Notes { get; set; } = new ObservableCollection<Note>();
        public AllNotes() => LoadNotes();

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

        }
    }
}