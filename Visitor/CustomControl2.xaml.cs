using System.Windows.Controls;
using System.Windows.Media;

namespace Visitor
{
    /// <summary>
    /// Interaction logic for CustomControl.xaml
    /// </summary>
    public partial class CustomControl2
    {
        public CustomControl2()
        {
            InitializeComponent();
        }

        public string SettingText
        {
            get { return LblSetting.Content.ToString(); }
            set { LblSetting.Content = value; }
        }
    }
}
