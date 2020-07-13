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
using Stimulsoft.Report;
using Stimulsoft.Report.Dictionary;
using Visitor.Class;

namespace Visitor.Windows
{
    /// <summary>
    /// Interaction logic for WinReportVisitDoctor.xaml
    /// </summary>
    public partial class WinReportVisitDoctor
    {
        private List<spSelectViewDoctor_Result> _doctorData;
        private List<spSelectViewDoctor_Result> _doctorSearchData;
        private List<tblCounty> _countiyData;
        private List<tblSpecialty> _specialtyData;


        public WinReportVisitDoctor()
        {
            InitializeComponent();
            _doctorData = new List<spSelectViewDoctor_Result>();
            _doctorSearchData = new List<spSelectViewDoctor_Result>();
            _countiyData = new List<tblCounty>();
            _specialtyData = new List<tblSpecialty>();
        }


        private void CboProvince_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            CboCounty.ItemsSource = _countiyData.Where(t =>
                CboProvince.SelectedItem != null &&
                (CboProvince != null && t.Province_Id == ((tblProvince)CboProvince.SelectedItem).Id));
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
            CboSpecialty.ItemsSource = _specialtyData;
            DgdDoctor.ItemsSource = _doctorSearchData;
            BtnNew_Click(null,null);
        }

        private void BtnShow_Click(object sender, RoutedEventArgs e)
        {
            var query = string.Empty;
            var doctorQuery = string.Empty;
            var startDate = string.Empty;
            var endDate = string.Empty;
            var province = string.Empty;
            var county = string.Empty;
            var specialty = string.Empty;
            var sex = string.Empty;

            if (DgdDoctor.SelectedIndex != -1)
            {
                query = "WHERE";
                doctorQuery = " viewDoctor.Id IN (";

                var doctor = new List<spSelectViewDoctor_Result>();
                var items = DgdDoctor.SelectedItems;
                foreach (var item in items)
                {
                    doctor.Add(item as spSelectViewDoctor_Result);
                }
                var index = 0;
                foreach (var item in doctor)
                {
                    
                    if (doctor.Count - 1 == index)
                    {
                        doctorQuery += item.Id;
                    }
                    else
                    {
                        doctorQuery += " " + item.Id + ",";
                    }
                    index++;
                }
                doctorQuery += ")";
            }

            if (TxtStartDate.Text != string.Empty)
            {
                if (doctorQuery != string.Empty)
                {
                    startDate = " AND ";
                }
                query = "WHERE";
                startDate += " Date >= N'" + Utility.CurrectDate(TxtStartDate.Text) + "' ";
            }
            if (TxtEndDate.Text != string.Empty)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty)
                {
                    endDate = " AND ";
                }
                endDate += " Date <= N'" + Utility.CurrectDate(TxtEndDate.Text) + "' ";
            }

            if (CboProvince.SelectedIndex > 0)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty || TxtEndDate.Text != string.Empty)
                {
                    province = " AND ";
                }

                province += " Province_Id = " + ((tblProvince) CboProvince.SelectedItem).Id;

                if (CboCounty.SelectedIndex > 0)
                {
                    query = "WHERE";
                    if (CboProvince.SelectedIndex > 0)
                    {
                        county = " AND ";
                    }
                    county += " County_Id = " + ((tblCounty)CboCounty.SelectedItem).Id;
                }
            }

            if (CboSpecialty.SelectedIndex > 0)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty || TxtEndDate.Text != string.Empty || CboProvince.SelectedIndex > 0 || CboCounty.SelectedIndex > 0)
                {
                    specialty = " AND ";
                }
                specialty += " Specialty_Id = " + ((tblSpecialty)CboSpecialty.SelectedItem).Id;
            }

            if (CboGender.SelectedIndex > 0)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty || TxtEndDate.Text != string.Empty || CboProvince.SelectedIndex > 0 || CboCounty.SelectedIndex > 0 || CboSpecialty.SelectedIndex > 0)
                {
                    sex = " AND ";
                }
                if (CboGender.SelectedIndex != 0)
                {
                    sex += " Sex = " + (CboGender.SelectedIndex == 1 ? 1 : 0);
                }
            }

            query += doctorQuery + startDate + endDate + province + county + specialty + sex;

            var report = new StiReport();
            report.Load("Report//VisitDoctor.mrt");
            report.Dictionary.Variables.Add(new StiVariable("query", query));
            report.Show();
        }

        private void BtnNew_Click(object sender, RoutedEventArgs e)
        {
            DgdDoctor.SelectedIndex = -1;
            TxtStartDate.Text = string.Empty;
            TxtEndDate.Text = string.Empty;
            CboProvince.SelectedIndex = 0;
            CboProvince.IsEnabled = true;
            CboCounty.SelectedIndex = 0;
            CboCounty.IsEnabled = true;
            CboSpecialty.SelectedIndex = 0;
            CboSpecialty.IsEnabled = true;
            CboGender.SelectedIndex = 0;
            CboGender.IsEnabled = true;
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
            CboProvince.SelectedIndex = 0;
            CboProvince.IsEnabled = false;
            CboCounty.SelectedIndex = 0;
            CboCounty.IsEnabled = false;
            CboSpecialty.SelectedIndex = 0;
            CboSpecialty.IsEnabled = false;
            CboGender.SelectedIndex = 0;
            CboGender.IsEnabled = false;
        }

        private void CboSpecialty_TextInput(object sender, TextCompositionEventArgs e)
        {
            CboSpecialty.IsDropDownOpen = true;

            if (!string.IsNullOrEmpty(CboSpecialty.Text))
            {
                CboSpecialty.ItemsSource = _specialtyData.FindAll(t => !string.IsNullOrEmpty(t.Name) && t.Name.Contains(CboSpecialty.Text));
            }
            else if (!string.IsNullOrEmpty(e.Text))
            {
                CboSpecialty.ItemsSource = _specialtyData.FindAll(t => !string.IsNullOrEmpty(t.Name) && t.Name.Contains(e.Text));
            }
            else
            {
                CboSpecialty.ItemsSource = _specialtyData;
            }
        }

        private void CboSpecialty_PreviewKeyUp(object sender, KeyEventArgs e)
        {
            if (e.Key != Key.Back && e.Key != Key.Delete) return;
            CboSpecialty.IsDropDownOpen = true;

            CboSpecialty.ItemsSource = !string.IsNullOrEmpty(CboSpecialty.Text)
                ? _specialtyData.FindAll(t =>
                    !string.IsNullOrEmpty(t.Name) && t.Name.Contains(CboSpecialty.Text))
                : _specialtyData;
        }

        private void CboSpecialty_Pasting(object sender, DataObjectPastingEventArgs e)
        {

            CboSpecialty.IsDropDownOpen = true;

            var pastedText = (string)e.DataObject.GetData(typeof(string));

            CboSpecialty.ItemsSource = !string.IsNullOrEmpty(pastedText) ? _specialtyData.FindAll(t => !string.IsNullOrEmpty(t.Name) && t.Name.Contains(pastedText)) : _specialtyData;
        }

        private void BtnShowPatient_Click(object sender, RoutedEventArgs e)
        {
            var query = string.Empty;
            var doctorQuery = string.Empty;
            var startDate = string.Empty;
            var endDate = string.Empty;
            var province = string.Empty;
            var county = string.Empty;
            var specialty = string.Empty;
            var sex = string.Empty;

            if (DgdDoctor.SelectedIndex != -1)
            {
                query = "WHERE";
                doctorQuery = " viewDoctor.Id IN (";

                var doctor = new List<spSelectViewDoctor_Result>();
                var items = DgdDoctor.SelectedItems;
                foreach (var item in items)
                {
                    doctor.Add(item as spSelectViewDoctor_Result);
                }
                var index = 0;
                foreach (var item in doctor)
                {

                    if (doctor.Count - 1 == index)
                    {
                        doctorQuery += item.Id;
                    }
                    else
                    {
                        doctorQuery += " " + item.Id + ",";
                    }
                    index++;
                }
                doctorQuery += ")";
            }

            if (TxtStartDate.Text != string.Empty)
            {
                if (doctorQuery != string.Empty)
                {
                    startDate = " AND ";
                }
                query = "WHERE";
                startDate += " Date >= N'" + Utility.CurrectDate(TxtStartDate.Text) + "' ";
            }
            if (TxtEndDate.Text != string.Empty)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty)
                {
                    endDate = " AND ";
                }
                endDate += " Date <= N'" + Utility.CurrectDate(TxtEndDate.Text) + "' ";
            }

            if (CboProvince.SelectedIndex > 0)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty || TxtEndDate.Text != string.Empty)
                {
                    province = " AND ";
                }

                province += " Province_Id = " + ((tblProvince)CboProvince.SelectedItem).Id;

                if (CboCounty.SelectedIndex > 0)
                {
                    query = "WHERE";
                    if (CboProvince.SelectedIndex > 0)
                    {
                        county = " AND ";
                    }
                    county += " County_Id = " + ((tblCounty)CboCounty.SelectedItem).Id;
                }
            }

            if (CboSpecialty.SelectedIndex > 0)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty || TxtEndDate.Text != string.Empty || CboProvince.SelectedIndex > 0 || CboCounty.SelectedIndex > 0)
                {
                    specialty = " AND ";
                }
                specialty += " Specialty_Id = " + ((tblSpecialty)CboSpecialty.SelectedItem).Id;
            }

            if (CboGender.SelectedIndex > 0)
            {
                query = "WHERE";
                if (TxtStartDate.Text != string.Empty || TxtEndDate.Text != string.Empty || CboProvince.SelectedIndex > 0 || CboCounty.SelectedIndex > 0 || CboSpecialty.SelectedIndex > 0)
                {
                    sex = " AND ";
                }
                if (CboGender.SelectedIndex != 0)
                {
                    sex += " Sex = " + (CboGender.SelectedIndex == 1 ? 1 : 0);
                }
            }

            query += doctorQuery + startDate + endDate + province + county + specialty + sex;

            var report = new StiReport();
            report.Load("Report//VisitDoctorPatient.mrt");
            report.Dictionary.Variables.Add(new StiVariable("query", query));
            report.Show();
        }
    }
}
