using System;
using System.Windows;
using System.Windows.Input;
using DAL.Class;
using Visitor.Class;

namespace Visitor.Windows
{
    /// <summary>
    /// Interaction logic for WinForgetPassword.xaml
    /// </summary>
    public partial class WinForgetPassword
    {
        public WinForgetPassword()
        {
            InitializeComponent();
        }

        #region Event

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            TxtUserName.Focus();
        }

        private void BtnSave_Click(object sender, RoutedEventArgs e)
        {
            if (!CheckEmpty()) return;
            try
            {
                var user = new DUser
                {
                    DUserName = TxtUserName.Text,
                    DPassword = TxtNewPassword.Password
                };
                user.ChangePassword();


                Utility.Message("پیام", "رمز عبور با موفقیت تغییر یافت", "Correct.png");
            }
            catch (Exception exception)
            {
                Utility.MyMessageBox("خطا در بانک اطلاعاتی", "خطا در تغییر رمز عبور\n" + exception.Message);
            }

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

        #endregion

        #region Method

        private bool CheckEmpty()
        {
            if (TxtUserName.Text.Trim() == string.Empty)
            {
                Utility.Message("خطا", "لطفا نام کاربری را وارد کنید", "Stop.png");
                return false;
            }
            return true;
        }

        #endregion
    }
}