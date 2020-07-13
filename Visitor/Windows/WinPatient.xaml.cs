using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;
using DAL;
using DAL.Class;
using Visitor.Class;

namespace Visitor.Windows
{
    /// <summary>
    /// Interaction logic for WinPatient.xaml
    /// </summary>
    public partial class WinPatient
    {
        private List<tblPatient> _patientData;
        private List<tblPatient> _patientSearchData;

        public WinPatient()
        {
            InitializeComponent();
            _patientData = new List<tblPatient>();
            _patientSearchData = new List<tblPatient>();
        }

        #region Event

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                _patientData = await DPatient.GetData();
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                Close();
                return;
            }
            _patientSearchData = _patientData;
            if (string.IsNullOrEmpty(TxtSearch.Text.Trim()))
            {
                DgdPatient.ItemsSource = _patientSearchData;
                TxtSearch.Text = string.Empty;
            }
            else
            {
                TxtSearch_TextChanged(null, null);
            }
            DgdPatient.ItemsSource = _patientSearchData;

            BtnNew_Click(null, null);
        }

        private async void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckEmpty()) return;

            #region AddPatient

            try
            {
                var addPatient = new DPatient
                {
                    DPatientId = TxtPatientId.Text,
                    DName = TxtFirstName.Text,
                    DFamily = TxtLastName.Text,
                    DSex = CboGender.SelectedIndex == 0,
                    DAddress = TxtAddress.Text.Trim() == string.Empty ? null : TxtAddress.Text,
                    DPhoneNumber = TxtTell.Text.Trim() == string.Empty ? null : TxtTell.Text,
                    DMobileNumber = TxtMobile.Text.Trim() == string.Empty ? null : TxtMobile.Text,
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => addPatient.Add());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ثبت اطلاعات بیمار\n" + exception.Message);
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ثبت گردید", "Correct.png");

            #endregion
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            TxtSearch.Focus();

            TxtSearch.Focus();
            TxtPatientId.Text = string.Empty;
            TxtFirstName.Text = string.Empty;
            TxtLastName.Text = string.Empty;
            CboGender.SelectedIndex = 0;
            TxtTell.Text = string.Empty;
            TxtMobile.Text = string.Empty;
            TxtAddress.Text = string.Empty;
            TxtDescription.Text = string.Empty;
            BtnAutoId_Click(null, null);
            BtnAdd.IsEnabled = true;
            DgdPatient.SelectedIndex = -1;


        }

        private async void BtnAutoId_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                TxtPatientId.Text = await DPatient.GetPatientId();
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
            }
        }

        private async void TxtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            var search = TxtSearch.Text;
            _patientSearchData = _patientData;
            _patientSearchData =
                await Task.Run(() => _patientSearchData.FindAll(
                    t =>
                        !string.IsNullOrEmpty(t.Patient_Id) && t.Patient_Id.Contains(search) ||
                        !string.IsNullOrEmpty(t.Name) && t.Name.Contains(search) ||
                        !string.IsNullOrEmpty(t.Family) && t.Family.Contains(search) ||
                        !string.IsNullOrEmpty(t.MobileNumber) && t.MobileNumber.Contains(search) ||
                        !string.IsNullOrEmpty(t.PhoneNumber) && t.PhoneNumber.Contains(search) ||
                        !string.IsNullOrEmpty(t.Address) && t.Address.Contains(search)));

            DgdPatient.ItemsSource = _patientSearchData;
        }

        private void DgdPatient_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DgdPatient.SelectedIndex == -1) return;

            BtnAdd.IsEnabled = false;

            var selectItem = _patientData[DgdPatient.SelectedIndex];
            TxtPatientId.Text = selectItem.Patient_Id;
            TxtFirstName.Text = selectItem.Name;
            TxtLastName.Text = selectItem.Family;
            CboGender.SelectedIndex = selectItem.Sex == true ? 0 : 1;
            TxtTell.Text = selectItem.PhoneNumber;
            TxtMobile.Text = selectItem.MobileNumber;
            TxtAddress.Text = selectItem.Address;
            TxtDescription.Text = selectItem.Description;
        }

        private async void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectEdit() || !CheckEmpty()) return;
            var selectItem = _patientSearchData[DgdPatient.SelectedIndex];
            try
            {
                var editPatient = new DPatient
                {
                    DId = selectItem.Id,
                    DPatientId = TxtPatientId.Text,
                    DName = TxtFirstName.Text,
                    DFamily = TxtLastName.Text,
                    DSex = CboGender.SelectedIndex == 0,
                    DAddress = TxtAddress.Text.Trim() == string.Empty ? null : TxtAddress.Text,
                    DPhoneNumber = TxtTell.Text.Trim() == string.Empty ? null : TxtTell.Text,
                    DMobileNumber = TxtMobile.Text.Trim() == string.Empty ? null : TxtMobile.Text,
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => editPatient.Edit());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ویرایش اطلاعات بیمار\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ویرایش گردید", "Correct.png");
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectDelete()) return;
            var selectItem = _patientSearchData[DgdPatient.SelectedIndex];
            Utility.MyMessageBox("هشدار", "آیا از حذف اطمینان دارید؟ ", "Warning.png", false);
            if (!Utility.YesNo) return;
            try
            {
                var deletePatient = new DPatient
                {
                    DId = selectItem.Id
                };
                await Task.Run(() => deletePatient.Delete());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در حذف اطلاعات\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت حذف گردید", "Correct.png");
        }

        #endregion

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

        private void NumberInput(object sender, TextCompositionEventArgs e)
        {
            var regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void DisablePaste(object sender, ExecutedRoutedEventArgs e)
        {
            var regex = new Regex("[^0-9]+");
            e.Handled = e.Command == ApplicationCommands.Paste && regex.IsMatch(Clipboard.GetText());
        }
        #endregion

        #region Method

        private bool CheckSelectDelete()
        {
            if (DgdPatient.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای حذف انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckSelectEdit()
        {
            if (DgdPatient.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای ویرایش انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckEmpty()
        {
            if (TxtPatientId.Text.Trim() == string.Empty)
            {
                Utility.Message("خطا", "لطفا کد بیمار را وارد کنید یا اجازه دهید بصورت خودکار تولید شود", "Stop.png");
                return false;
            }
            if (TxtFirstName.Text.Trim() == string.Empty)
            {
                Utility.Message("خطا", "لطفا نام را وارد کنید", "Stop.png");
                return false;
            }

            if (TxtLastName.Text.Trim() == string.Empty)
            {
                Utility.Message("خطا", "لطفا نام خانوادگی را وارد کنید", "Stop.png");
                return false;
            }
            return true;
        }
        #endregion


    }
}
