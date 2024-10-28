using Microsoft.Maui.Storage;
using Notes.Models;

namespace Notes.Views;

[QueryProperty(nameof(ItemId), nameof(ItemId))]


public partial class NotePage : ContentPage
{
    public string _itemId { get; set; }
    public string ItemId
    {
        //get
        //{
        //    return _itemId;
        //}
        set
        {
            _itemId = value;
            Load(value);
        }
        
        
    }

    Note note = new Note();
    public NotePage()
    {
		InitializeComponent();
        if (_itemId != null)
        {
            note.FileName = _itemId;
        }
        else
        {
            string randomFileName = Path.GetRandomFileName();
            note.FileName = Path.Combine(FileSystem.AppDataDirectory, $"{randomFileName}.dgsNotes.txt");
        }

        this.Load(note.FileName);        
    }

    private async void btnSave_Clicked(object sender, EventArgs e)
    {
        if (_itemId != null)
        {
            note.FileName = _itemId;
        }
        if (BindingContext is Note)
        {
            //DisplayAlert("Note","Confirm saving?","Yes","No");
            File.WriteAllText(note.FileName, edtNotes.Text);
        }
        
        await Shell.Current.GoToAsync("..");
        edtNotes.Text = string.Empty;
    }

    private async void btnDelete_Clicked(object sender, EventArgs e)
    {
        //DisplayAlert("Note", "Confirm deleting?", "Yes", "No");
        if (_itemId != null)
        {
            note.FileName = _itemId;
        }

        if (BindingContext is Note)
        {
            if (File.Exists(note.FileName))
            {
                File.Delete(note.FileName);
            }
        }
        await Shell.Current.GoToAsync("..");
        edtNotes.Text = string.Empty;
    }

    public void Load(string fileName)
    {
        if (File.Exists(fileName))
        {
            note.NoteText = File.ReadAllText(fileName);
            note.Date = File.GetCreationTime(fileName);
            edtNotes.Text = note.NoteText;           
        }

        BindingContext = note;
        _itemId = fileName;
    }
}