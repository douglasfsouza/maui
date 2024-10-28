namespace Notes
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            Routing.RegisterRoute("notes",typeof(AppShell));
            Routing.RegisterRoute("notepage", typeof(Views.NotePage));
        }
    }
}
