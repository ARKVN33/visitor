using System;
using System.Collections.Generic;
using System.Linq;
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
    /// Interaction logic for WinDoctor.xaml
    /// </summary>
    public partial class WinDoctor
    {
        private List<spSelectViewDoctor_Result> _doctorData;
        private List<spSelectViewDoctor_Result> _doctorSearchData;
        private List<tblCounty> _countiyData;
        private List<tblSpecialty> _specialtyData;
        private string _specialtyText;

        private bool _add = true;
        public int Counter;

        public WinDoctor()
        {
            InitializeComponent();
            _doctorData = new List<spSelectViewDoctor_Result>();
            _doctorSearchData = new List<spSelectViewDoctor_Result>();
            _countiyData = new List<tblCounty>();
            _specialtyData = new List<tblSpecialty>();
            _specialtyText = string.Empty;
        }

        #region Event

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                _doctorData = await DDoctor.GetViewData();
                _specialtyData = await DDoctor.GetSpecialty();
                
                CboProvince.ItemsSource = await DDoctor.GetProvince();
                _countiyData = await DDoctor.GetCounty();

            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                Close();
                return;
            }
            _doctorSearchData = _doctorData;
            if (string.IsNullOrEmpty(TxtSearch.Text.Trim()) || _add)
            {
                DgdDoctor.ItemsSource = _doctorSearchData;
                CboSpecialty.ItemsSource = _specialtyData;
                TxtSearch.Text = string.Empty;
                CboSpecialty.Text = string.Empty;
            }
            else
            {
                TxtSearch_TextChanged(null, null);
            }
            CboSpecialty.ItemsSource = _specialtyData;
            DgdDoctor.ItemsSource = _doctorSearchData;

            BtnNew_Click(null, null);
        }

        private async void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckEmpty()) return;

            #region AddDoctor

            try
            {
                var addDoctor = new DDoctor
                {
                    DSpecialtyId = ((tblSpecialty) CboSpecialty.SelectedItem)?.Id ?? 0,
                    DCountyId = (short?)(CboCounty.SelectedIndex == -1 ? 0 : ((tblCounty)CboCounty.SelectedItem).Id),
                    DDoctorId = TxtDocterId.Text,
                    DDoctorName = TxtFirstName.Text,
                    DDoctorFamily = TxtLastName.Text,
                    DSex = CboGender.SelectedIndex == 0,
                    DAddress = TxtAddress.Text.Trim() == string.Empty ? null : TxtAddress.Text,
                    DPhoneNumber = TxtTell.Text.Trim() == string.Empty ? null : TxtTell.Text,
                    DMobileNumber = TxtMobile.Text.Trim() == string.Empty ? null : TxtMobile.Text,
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => addDoctor.Add());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ثبت اطلاعات پزشک\n" + exception.Message);
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ثبت گردید", "Correct.png");

            #endregion
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            TxtSearch.Focus();

            TxtDocterId.Text = string.Empty;
            TxtFirstName.Text = string.Empty;
            TxtLastName.Text = string.Empty;
            CboGender.SelectedIndex = 0;
            TxtTell.Text = string.Empty;
            TxtMobile.Text = string.Empty;
            TxtAddress.Text = string.Empty;
            CboSpecialty.SelectedIndex = 0;
            CboProvince.SelectedIndex = 0;
            CboCounty.SelectedIndex = 0;
            TxtDescription.Text = string.Empty;
            BtnAutoId_Click(null, null);
            BtnAdd.IsEnabled = true;
            DgdDoctor.SelectedIndex = -1;
            Counter = 1;
            _add = true;
            Counter = 1;
        }

        private async void BtnAutoId_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                TxtDocterId.Text = await DDoctor.GetDoctorId();
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
            }
        }

        private async void TxtSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            var search = TxtSearch.Text;
            _doctorSearchData = _doctorData;
            _doctorSearchData =
                await Task.Run(() => _doctorSearchData.FindAll(
                    t =>
                        !string.IsNullOrEmpty(t.Doctor_Id) && t.Doctor_Id.Contains(search) ||
                        !string.IsNullOrEmpty(t.Name) && t.Name.Contains(search) ||
                        !string.IsNullOrEmpty(t.Family) && t.Family.Contains(search) ||
                        !string.IsNullOrEmpty(t.SpecialtyName) && t.SpecialtyName.Contains(search) ||
                        !string.IsNullOrEmpty(t.CountyName) && t.CountyName.Contains(search) ||
                        !string.IsNullOrEmpty(t.ProvinceName) && t.ProvinceName.Contains(search) ||
                        !string.IsNullOrEmpty(t.MobileNumber) && t.MobileNumber.Contains(search) ||
                        !string.IsNullOrEmpty(t.PhoneNumber) && t.PhoneNumber.Contains(search) ||
                        !string.IsNullOrEmpty(t.Address) && t.Address.Contains(search)));

            DgdDoctor.ItemsSource = _doctorSearchData;
        }

        private void DgdDoctor_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DgdDoctor.SelectedIndex == -1) return;

            BtnAdd.IsEnabled = false;
            var selectItem = _doctorData[DgdDoctor.SelectedIndex];
            TxtDocterId.Text = selectItem.Doctor_Id;
            TxtFirstName.Text = selectItem.Name;
            TxtLastName.Text = selectItem.Family;
            CboGender.SelectedIndex = selectItem.Sex == true ? 0 : 1;
            CboSpecialty.SelectedValue = selectItem.Specialty_Id;
            CboProvince.SelectedValue = selectItem.Province_Id;
            CboCounty.SelectedValue = selectItem.County_Id;
            TxtTell.Text = selectItem.PhoneNumber;
            TxtMobile.Text = selectItem.MobileNumber;
            TxtAddress.Text = selectItem.Address;

            TxtDescription.Text = selectItem.Description;
        }

        private async void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectEdit() || !CheckEmpty()) return;
            var selectItem = _doctorSearchData[DgdDoctor.SelectedIndex];
            try
            {
                var editDoctor = new DDoctor
                {
                    DId = selectItem.Id,
                    DSpecialtyId = ((tblSpecialty)CboSpecialty.SelectedItem).Id,
                    DCountyId = (short?) (CboCounty.SelectedIndex == -1 ? 0 : ((tblCounty)CboCounty.SelectedItem).Id),
                    DDoctorId = TxtDocterId.Text,
                    DDoctorName = TxtFirstName.Text,
                    DDoctorFamily = TxtLastName.Text,
                    DSex = CboGender.SelectedIndex == 0,
                    DAddress = TxtAddress.Text.Trim() == string.Empty ? null : TxtAddress.Text,
                    DPhoneNumber = TxtTell.Text.Trim() == string.Empty ? null : TxtTell.Text,
                    DMobileNumber = TxtMobile.Text.Trim() == string.Empty ? null : TxtMobile.Text,
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => editDoctor.Edit());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ویرایش اطلاعات پزشک\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ویرایش گردید", "Correct.png");
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectDelete()) return;
            var selectItem = _doctorSearchData[DgdDoctor.SelectedIndex];
            Utility.MyMessageBox("هشدار", "آیا از حذف اطمینان دارید؟ ", "Warning.png", false);
            if (!Utility.YesNo) return;
            try
            {
                var deleteDoctor = new DDoctor
                {
                    DId = selectItem.Id
                };
                await Task.Run(() => deleteDoctor.Delete());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در حذف اطلاعات\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت حذف گردید", "Correct.png");
        }

        private void CboProvince_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CboCounty.ItemsSource = _countiyData.Where(t =>
                CboProvince.SelectedItem != null && CboProvince != null && t.Province_Id == ((tblProvince) CboProvince.SelectedItem).Id);
        }

        private void CboSpecialty_TextInput(object sender, TextCompositionEventArgs e)
        {
            _specialtyText += e.Text;
            CboSpecialty.IsDropDownOpen = true;
            CboSpecialty.ItemsSource =
                _specialtyData.FindAll(t => !string.IsNullOrEmpty(t.Name) && t.Name.Contains(_specialtyText));

        }

        private void CboSpecialty_PreviewKeyUp(object sender, KeyEventArgs e)
         {
            if (e.Key != Key.Back && e.Key != Key.Delete) return;
            CboSpecialty.IsDropDownOpen = true;
             _specialtyText = CboSpecialty.Text;
            CboSpecialty.ItemsSource = !string.IsNullOrEmpty(CboSpecialty.Text)
                ? _specialtyData.FindAll(t =>
                    !string.IsNullOrEmpty(t.Name) && t.Name.Contains(CboSpecialty.Text))
                : _specialtyData;
        }

        private void CboSpecialty_Pasting(object sender, DataObjectPastingEventArgs e)
        {

            CboSpecialty.IsDropDownOpen = true;
            _specialtyText = CboSpecialty.Text;
            CboSpecialty.ItemsSource =
                _specialtyData.FindAll(t => !string.IsNullOrEmpty(t.Name) && t.Name.Contains(CboSpecialty.Text));
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
            if (DgdDoctor.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای حذف انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckSelectEdit()
        {
            if (DgdDoctor.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای ویرایش انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckEmpty()
        {
            if (TxtDocterId.Text.Trim() == string.Empty)
            {
                Utility.Message("خطا", "لطفا کد پزشک را وارد کنید یا اجازه دهید بصورت خودکار تولید شود", "Stop.png");
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

        private async void BtnAddSpecialty_Click(object sender, RoutedEventArgs e)
        {
            var winSpecialty = new WinSpecialty();
            winSpecialty.ShowDialog();
            try
            {
                _specialtyData = await DSpecialty.GetData();
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                Close();
            }
            CboSpecialty.ItemsSource = _specialtyData;
        }
    }
}
