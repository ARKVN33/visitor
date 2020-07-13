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
    /// Interaction logic for WinSearchDoctorPatient.xaml
    /// </summary>
    public partial class WinSearchDoctorPatient
    {
        private List<spSelectViewDoctor_Result> _doctorData;
        private List<spSelectViewDoctor_Result> _doctorSearchData;
        private List<tblPatient> _patientData;
        private List<tblPatient> _patientSearchData;
        private List<spSelectViewDoctorPatient_Result> _doctorPatientData;
        private List<spSelectViewDoctorPatient_Result> _doctorPatientSearchData;

        public int DoctorId { get; set; }
        public int PatientId { get; set; }

        public WinSearchDoctorPatient()
        {
            InitializeComponent();

            _doctorData = new List<spSelectViewDoctor_Result>();
            _doctorSearchData = new List<spSelectViewDoctor_Result>();
            _patientData = new List<tblPatient>();
            _patientSearchData = new List<tblPatient>();
            _doctorPatientData = new List<spSelectViewDoctorPatient_Result>();
            _doctorPatientSearchData = new List<spSelectViewDoctorPatient_Result>();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                _doctorData = await DDoctor.GetViewData();
                _patientData = await DPatient.GetData();
                _doctorPatientData = await DDoctorPatient.GetViewData();
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                Close();
                return;
            }
            _doctorSearchData = _doctorData;
            _patientSearchData = _patientData;
            _doctorPatientSearchData = _doctorPatientData;
            DgdDoctor.ItemsSource = _doctorSearchData;
            DgdPatient.ItemsSource = _patientSearchData;
            DgdPatientVisit.ItemsSource = _doctorPatientSearchData;

            BtnNew_Click(null, null);
        }

        private async void TxtPatientSearch_TextChanged(object sender, TextChangedEventArgs e)
        {
            var search = TxtPatientSearch.Text;
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

            var selectItem = _doctorSearchData[DgdDoctor.SelectedIndex];
            DoctorId = selectItem.Id;
            LblName.Content = selectItem.Name;
            LblFamily.Content = selectItem.Family;
        }

        private void DgdPatient_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DgdPatient.SelectedIndex == -1) return;

            var selectItem = _patientSearchData[DgdPatient.SelectedIndex];
            PatientId = selectItem.Id;
            LblPatientName.Content = selectItem.Name;
            LblPatientFamily.Content = selectItem.Family;
        }
        private async void BtnAddDoctor_Click(object sender, RoutedEventArgs e)
        {
            var winDoctor = new WinDoctor();
            winDoctor.ShowDialog();
            try
            {
                _doctorData = await DDoctor.GetViewData();
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                Close();
                return;
            }
            _doctorSearchData = _doctorData;
            DgdDoctor.ItemsSource = _doctorSearchData;
        }

        private async void BtnAddPatient_Click(object sender, RoutedEventArgs e)
        {
            var winPatient = new WinPatient();
            winPatient.ShowDialog();

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
            DgdPatient.ItemsSource = _patientSearchData;

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
        #endregion

        private async void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckEmpty()) return;

            #region AddDoctor

            try
            {
                var addDoctorPatient = new DDoctorPatient
                {
                    DDoctorId = _doctorSearchData[DgdDoctor.SelectedIndex].Id,
                    DPatientId = _patientSearchData[DgdPatient.SelectedIndex].Id,
                    DMedicalRecord = TxtMedicalRecord.Text.Trim() == string.Empty ? null : TxtMedicalRecord.Text,
                    DDate = Utility.CurrectDate(TxtDate.Text),
                    DTime = Utility.CurrectTime(TxtTime.Text),
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => addDoctorPatient.Add());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ثبت اطلاعات پزشک\n" + exception.Message);
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ثبت گردید", "Correct.png");

            #endregion

        }

        private bool CheckSelectDelete()
        {
            if (DgdPatientVisit.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای حذف انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckSelectEdit()
        {
            if (DgdPatientVisit.SelectedIndex == -1)
            {
                Utility.Message("اخطار", "موردی را برای ویرایش انتخاب کنید", "Warning.png");
                return false;
            }
            return true;
        }

        private bool CheckEmpty()
        {
            if (DgdDoctor.SelectedIndex == -1 && DoctorId == 0)
            {
                Utility.Message("اخطار", "پزشکی را انتخاب کنید", "Warning.png");
                return false;
            }
            if (DgdPatient.SelectedIndex == -1 && PatientId == 0)
            {
                Utility.Message("اخطار", "بیماری را انتخاب کنید", "Warning.png");
                return false;
            }
            if (string.IsNullOrEmpty(TxtDate.Text))
            {
                Utility.Message("خطا", "لطفا تاریخ را وارد کنید", "Stop.png");
                return false;
            }

            if (!Utility.CheckDate(TxtDate.Text))
            {
                Utility.Message("خطا", "لطفا یک تاریخ صحیح انتخاب کنید", "Stop.png");
                return false;
            }

            if (string.IsNullOrEmpty(TxtTime.Text))
            {
                Utility.Message("خطا", "لطفا ساعت را وارد کنید", "Stop.png");
                return false;
            }

            if (!Utility.CheckTime(TxtTime.Text))
            {
                Utility.Message("خطا", "لطفا یک ساعت صحیح وارد کنید", "Stop.png");
                return false;
            }
            return true;
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            TxtSearch.Text = string.Empty;
            TxtPatientSearch.Text = string.Empty;
            TxtMedicalRecord.Text = string.Empty;
            TxtDate.Text = PersianDate.Today.ToString();
            TxtTime.Text = DateTime.Now.ToString("HH:mm:ss");
            TxtDescription.Text = string.Empty;

            DgdDoctor.SelectedIndex = -1;
            DgdPatient.SelectedIndex = -1;
            DgdPatientVisit.SelectedIndex = -1;

            LblName.Content = string.Empty;
            LblFamily.Content = string.Empty;
            LblPatientName.Content = string.Empty;
            LblPatientFamily.Content = string.Empty;

            BtnAdd.IsEnabled = true;
        }

        private async void BtnEdit_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectEdit() || !CheckEmpty()) return;
            var selectItem = _doctorPatientSearchData[DgdPatientVisit.SelectedIndex];
            try
            {
                var editDoctorPatient = new DDoctorPatient
                {
                    DId = selectItem.Id,
                    DDoctorId =
                        DgdDoctor.SelectedIndex == -1 ? DoctorId : _doctorSearchData[DgdDoctor.SelectedIndex].Id,
                    DPatientId = DgdPatient.SelectedIndex == -1
                        ? PatientId
                        : _patientSearchData[DgdPatient.SelectedIndex].Id,
                    DMedicalRecord = TxtMedicalRecord.Text.Trim() == string.Empty ? null : TxtMedicalRecord.Text,
                    DDate = Utility.CurrectDate(TxtDate.Text),
                    DTime = Utility.CurrectTime(TxtTime.Text),
                    DDescription = TxtDescription.Text.Trim() == string.Empty ? null : TxtDescription.Text
                };
                await Task.Run(() => editDoctorPatient.Edit());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در ویرایش اطلاعات پزشک\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت ویرایش گردید", "Correct.png");
        }

        private async void TxtSearchDP_TextChanged(object sender, TextChangedEventArgs e)
        {
            var search = TxtSearchDoctorPatient.Text;
            _doctorPatientSearchData = _doctorPatientData;
            _doctorPatientSearchData =
                await Task.Run(() => _doctorPatientSearchData.FindAll(
                    t =>
                        !string.IsNullOrEmpty(t.DoctorCode) && t.DoctorCode.Contains(search) ||
                        !string.IsNullOrEmpty(t.Name) && t.Name.Contains(search) ||
                        !string.IsNullOrEmpty(t.Family) && t.Family.Contains(search) ||
                        !string.IsNullOrEmpty(t.PatientCode) && t.PatientCode.Contains(search) ||
                        !string.IsNullOrEmpty(t.PatientName) && t.PatientName.Contains(search) ||
                        !string.IsNullOrEmpty(t.PatientFamily) && t.PatientFamily.Contains(search) ||
                        !string.IsNullOrEmpty(t.Date) && t.Date.Contains(search) ||
                        !string.IsNullOrEmpty(t.Time) && t.Time.Contains(search) ||
                        !string.IsNullOrEmpty(t.MedicalRecord) && t.MedicalRecord.Contains(search)));

            DgdPatientVisit.ItemsSource = _doctorPatientSearchData;
        }

        private void DgdDoctorPatient_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DgdPatientVisit.SelectedIndex == -1) return;
            BtnAdd.IsEnabled = false;

            var selectItem = _doctorPatientSearchData[DgdPatientVisit.SelectedIndex];

            if (selectItem.Doctor_Id != null) DoctorId = (int) selectItem.Doctor_Id;

            LblName.Content = selectItem.Name;
            LblFamily.Content = selectItem.Family;

            if (selectItem.Patient_Id != null) PatientId = (int) selectItem.Patient_Id;
            LblPatientName.Content = selectItem.PatientName;
            LblPatientFamily.Content = selectItem.PatientFamily;

            TxtMedicalRecord.Text = selectItem.MedicalRecord;
            TxtDate.Text = selectItem.Date;
            TxtTime.Text = selectItem.Time;
            TxtDescription.Text = selectItem.Description;
        }

        private async void BtnDelete_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelectDelete()) return;
            var selectItem = _doctorPatientSearchData[DgdPatientVisit.SelectedIndex];
            Utility.MyMessageBox("هشدار", "آیا از حذف اطمینان دارید؟ ", "Warning.png", false);
            if (!Utility.YesNo) return;
            try
            {
                var deleteDoctorPatient = new DDoctorPatient
                {
                    DId = selectItem.Id
                };
                await Task.Run(() => deleteDoctorPatient.Delete());
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در حذف اطلاعات\n" + exception.Message);
                return;
            }
            Window_Loaded(null, null);
            Utility.Message("پیام", "اطلاعات با موفقیت حذف گردید", "Correct.png");
        }
    }
}
