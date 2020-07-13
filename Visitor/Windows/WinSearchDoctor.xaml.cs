using System;
using System.Collections.Generic;
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
    /// Interaction logic for WinSearchDoctor.xaml
    /// </summary>
    public partial class WinSearchDoctor
    {
        private List<spSelectViewDoctor_Result> _doctorData;
        private List<spSelectViewDoctor_Result> _doctorSearchData;
        private List<tblVisitDoctor> _visitDoctor;

        public WinSearchDoctor()
        {
            InitializeComponent();
            _doctorData = new List<spSelectViewDoctor_Result>();
            _doctorSearchData = new List<spSelectViewDoctor_Result>();
            _visitDoctor = new List<tblVisitDoctor>();
        }

        private async void Window_Loaded(object sender, RoutedEventArgs e)
        {
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

        private async void DgdDoctor_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (DgdDoctor.SelectedIndex == -1) return;
            var selectItem = _doctorSearchData[DgdDoctor.SelectedIndex];
            LblDoctorId.Content = selectItem.Doctor_Id;
            LblName.Content = selectItem.Name;
            LblFamily.Content = selectItem.Family;
            LblSpecialty.Content = selectItem.SpecialtyName;

            try
            {
                _visitDoctor = await DVisitDoctor.GetVisitDoctorData(selectItem.Id);
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در دریافت اطلاعات\n" + exception.Message);
                return;
            }
            DgdVisitDoctor.ItemsSource = _visitDoctor;
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

        #endregion

        private  void BtnAdd_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckSelect()) return;

            var selectItem = _doctorSearchData[DgdDoctor.SelectedIndex];

            var winVisitDoctor = new WinVisitDoctor
            {
                LblDoctorId = {Content = LblDoctorId.Content},
                LblName = {Content = LblName.Content},
                LblFamily = {Content = LblFamily.Content},
                DoctorId = selectItem.Id
            };
            winVisitDoctor.ShowDialog();
        }

        private bool CheckSelect()
        {
            if (DgdDoctor.SelectedIndex == -1 || LblDoctorId.Content == null)
            {
                Utility.Message("خطا", "پزشکی را انتخاب کنید", "Stop.png");
                return false;
            }

            return true;
        }
    }
}
