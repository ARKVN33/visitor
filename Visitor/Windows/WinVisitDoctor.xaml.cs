using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using Arash;
using DAL;
using DAL.Class;
using Visitor.Class;

namespace Visitor.Windows
{
    /// <summary>
    /// Interaction logic for WinVisitDoctor.xaml
    /// </summary>
    public partial class WinVisitDoctor
    {
        private List<tblVisitDoctor> _visitDoctorData;

        public int DoctorId { get; set; }

        public WinVisitDoctor()
        {
            InitializeComponent();
            _visitDoctorData = new List<tblVisitDoctor>();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                _visitDoctorData = await DVisitDoctor.GetVisitDoctorData(DoctorId);
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                Close();
                return;
            }
            DgdVisitDoctor.ItemsSource = _visitDoctorData;

            BtnNew_Click(null, null);
        }

        private async void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckEmpty()) return;

            #region AddDoctor

            try
            {
                var addVisitDoctor = new DVisitDoctor()
                {
                    DDoctorId = DoctorId,
                    DDate = Utility.CurrectDate(TxtDate.Text),
                    DTime = Utility.CurrectTime(TxtTime.Text),
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => addVisitDoctor.Add());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ثبت اطلاعات\n" + exception.Message);
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ثبت گردید", "Correct.png");

            #endregion
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            TxtDate.Text = PersianDate.Today.ToString();
            TxtTime.Text = DateTime.Now.ToString("HH:mm:ss");
            TxtDescription.Text = string.Empty;
            BtnAdd.IsEnabled = true;
            DgdVisitDoctor.SelectedIndex = -1;

        }

        private void DgdVisitDoctor_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DgdVisitDoctor.SelectedIndex == -1) return;

            BtnAdd.IsEnabled = false;

            var selectItem = _visitDoctorData[DgdVisitDoctor.SelectedIndex];
            TxtDate.Text = selectItem.Date;
            TxtTime.Text = selectItem.Time;
            TxtDescription.Text = selectItem.Description;
        }

        private async void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectEdit() || !CheckEmpty()) return;
            var selectItem = _visitDoctorData[DgdVisitDoctor.SelectedIndex];
            try
            {
                var editVisitDoctor = new DVisitDoctor
                {
                    DId = selectItem.Id,
                    DDoctorId = DoctorId,
                    DDate = Utility.CurrectDate(TxtDate.Text),
                    DTime = Utility.CurrectTime(TxtTime.Text),
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => editVisitDoctor.Edit());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ویرایش اطلاعات\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ویرایش گردید", "Correct.png");
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectDelete()) return;
            var selectItem = _visitDoctorData[DgdVisitDoctor.SelectedIndex];
            Utility.MyMessageBox("هشدار", "آیا از حذف اطمینان دارید؟ ", "Warning.png", false);
            if (!Utility.YesNo) return;
            try
            {
                var deleteVisitDoctor = new DVisitDoctor
                {
                    DId = selectItem.Id
                };
                await Task.Run(() => deleteVisitDoctor.Delete());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در حذف اطلاعات\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت حذف گردید", "Correct.png");
        }

        #region FixedEvent

        private void DragMove(object sender, MouseButtonEventArgs e)
        {
            DragMove();
        }

        private void Close(object sender, RoutedEventArgs e)
        {
            Close();
        }

        private void Minimize(object sender, RoutedEventArgs e)
        {
            WindowState = WindowState.Minimized;
        }

        private void DateInput(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex(@"[^0-9^\/]");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void DisablePasteDate(object sender, ExecutedRoutedEventArgs e)
        {
            var regex = new Regex(@"[^0-9^\/]+");
            e.Handled = e.Command == ApplicationCommands.Paste && regex.IsMatch(Clipboard.GetText());
        }

        //baraye shomare gozari datagrid

        #endregion

        #region Method

        private bool CheckSelectDelete()
        {
            if (DgdVisitDoctor.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای حذف انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckSelectEdit()
        {
            if (DgdVisitDoctor.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای ویرایش انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckEmpty()
        {
            if (string.IsNullOrEmpty(TxtDate.Text))
            {
                Utility.Message("خطا", "لطفا تاریخ وارد کنید", "Stop.png");
                return false;
            }

            if (!Utility.CheckDate(TxtDate.Text))
            {
                Utility.Message("خطا", "لطفا یک تاریخ صحیح انتخاب کنید", "Stop.png");
                return false;
            }

            if (string.IsNullOrEmpty(TxtTime.Text))
            {
                Utility.Message("خطا", "لطفا ساعت وارد کنید", "Stop.png");
                return false;
            }

            if (!Utility.CheckTime(TxtTime.Text))
            {
                Utility.Message("خطا", "لطفا یک ساعت صحیح وارد کنید", "Stop.png");
                return false;
            }
            return true;
        }

        #endregion
    }
}
