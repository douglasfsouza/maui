namespace Notes.Views;

public partial class AllNotesPage : ContentPage
{
    public AllNotesPage()
    {
        InitializeComponent();
        BindingContext = new Models.AllNotes();
    }

    protected override void OnAppearing()
    {
        ((Models.AllNotes)BindingContext).LoadNotes();
    }

    private async void notesCollection_SelectionChanged(object sender, SelectionChangedEventArgs e)
    {
        if (e.CurrentSelection.Count != 0)
        {
            var note = (Models.Note)e.CurrentSelection[0];
            await Shell.Current.GoToAsync($"//notes/notepage?{nameof(NotePage.ItemId)}={note.FileName}", true);
            notesCollection.SelectedItem = null;
        }

        
    }

    private async void itemAdd_Clicked(object sender, EventArgs e)
    {
        //await Shell.Current.GoToAsync(nameof(NotePage),true);
        await Shell.Current.GoToAsync("//notes/notepage", true);
    }
}