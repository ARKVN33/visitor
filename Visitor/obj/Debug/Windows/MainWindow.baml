   M S B A M L   `   `   `  ����B  >Visitor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:VisitorVisitor  5   	        Visitor.Windows.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   )visitorclr-namespace:Visitor     5   	   -   5          � Title$  
MainWindow��5   	   $	��640��6   $
��1000��6)    � WindowStartupLocation$ CenterScreen=�66    � WindowStyle$
 None=�6\    � 
ResizeMode$ NoResize=�6o   $��20(�6�   $��	B Nazanin)�6�    � 	Resources 5	         OnMouseLeftButtonDown1 �� TargetProperty �� 
TargetName R� KeyTime  System.Windows.Visibility   Visible	 R� Value
   	Collapsed9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value<  6System.Windows.Media.Animation.EasingThicknessKeyFrame p� KeyTime p� Value  OnMouseLeftButtonDown2��%;  &	        &	 e    �� 5
   
   .��5      T� $ (UIElement.Visibility)�6,   $ BtnMenue��6_   ..�5      i� $ 0��6)   #	 Z 65   i� 5      $ 0:0:0.5��6)   #	 Z
 6;   5      T� 5      $ (UIElement.Visibility)�6,   $ BtnBack��6_   ..�5      i� $ 0��6)   #	 Z 65   i� 5      $ 0:0:0.5��6)   #	 Z 6;   5      U� 5      $ (UIElement.Opacity)�6,   $ BtnMenue��6\   .\�5        $ 0��6'   $ 1Q�63     5      $ 0:0:0.5��6'   $ 0Q�69   5      U� 5      $ (UIElement.Opacity)�6,   $ BtnBack��6\   .\�5        $ 0��6'   $ 0Q�63     5      $ 0:0:0.5��6'   $ 1Q�69   5      r� 5      $ (FrameworkElement.Margin)�6/   $ 
StackPanel��6e   .	�5        $ 0��6*   $ 1000,0,-300,0q�66     5      $ 0:0:0.5��6*   $ 	700,0,0,0q�6<   5      5      �� 5    
   .��5!      r� $ (FrameworkElement.Margin)�6/   $ 
StackPanel��6e   .	�5"        $ 0��6*   $ 	700,0,0,0q�66     5#      $ 0:0:0.5��6*   $ 1000,0,-300,0q�6<   5$      U� 5%      $ (UIElement.Opacity)�6,   $ BtnBack��6\   .\�5&        $ 0��6'   $ 1Q�63     5'      $ 0:0:0.5��6'   $ 0Q�69   5(      U� 5)      $ (UIElement.Opacity)�6,   $ BtnMenue��6\   .\�5*        $ 0��6'   $ 0Q�63     5+      $ 0:0:0.5��6'   $ 1Q�69   5,      T� 5-      $ (UIElement.Visibility)�6,   $ BtnMenue��6_   ..�5.      i� $ 0��6)   #	 Z
 65   i� 5/      $ 0:0:0.5��6)   #	 Z 6;   50      51      52       � Triggers 53      :� 54   
    :� RoutedEvent$# UIElement.MouseLeftButtonDown��6    :� 
SourceName$ BtnMenue��6C   .[�55      �� #��[  6   56      :� 57   
   $# UIElement.MouseLeftButtonDown��6   $ BtnBack��6C   .[�58      �� -   5         ��Name$+ %OnMouseLeftButtonDown2BeginStoryboard��58      #��[ 6M   59      .��5=      � ���	#FF1A1A1D.+�5>   
   �� -   5        ���	#FF192D6E$��0��5>   '   ���	#FF2D2D30$��40��6a   $	��Top=�6m   �� 5?   
   -   5         ��Name$ LblTitle��5?      $��ویزیتور��6"   $��22(�64   $
��Bold"�6B   $��0q�6T   $	��Top=�6_     LabelStyle1#���  6�   $��40��6�   $��Center=�6�   �� 5@   
   -   5         ��Name$ 
BtnUpClose��5@      $��×��6%   $��40��61   $��40��6<   $��22(�6H   $��Arial)�6V   $
��Left=�6w   $	��Top=�6�     ButtonStyle2#���  6�   �� 5A   
   -   5        $ BtnMinimize��5A      $��-��6&   $��40,0,0,0q�62   $��40��6D   $��40��6O   $��27(�6[   $��Arial)�6i   $
��Left=�6�   $	��Top=�6�     ButtonStyle3#���  6�   � 5B   
   $��0,40,0,0q�6   .+�5C         Visitor.CustomControl1  -   5          Name$ 	BtnDoctor��5C   %      Visitor.CustomControl1   MouseLeftButtonDown$# BtnDoctor_MouseLeftButtonDown��6�   $
��Left=�68   $��
667,10,0,0q�6S   $	��Top=�6g   $	��190��6   $	��323��6�      SettingText$3 -ثبت اطلاعات عمومی پزشکان��6�      SettingImageSource$ ../Icon/Doctor.png��6�   6�     5D      -   5        $ 
BtnPatient��5D   %   $$ BtnPatient_MouseLeftButtonDown��6�   $
��Left=�69   $��
339,10,0,0q�6T   $	��Top=�6h   $	��190��6�   $	��323��6�   $5 /ثبت اطلاعات عمومی بیماران��6�   $ ../Icon/Patient.png��6�   6�     5E      -	   5        $ BtnVisit��5E   %   $" BtnVisit_MouseLeftButtonDown��6�   $
��Left=�67   $��	11,10,0,0q�6R   $	��Top=�6e   $	��190��6}   $	��323��6�   $ ویزیت پزشکان��6�   $ ../Icon/VisitDoctor.png��6�   6�     5F      -
   5        $ BtnDoctorPatient��5F   %   $* $BtnDoctorPatient_MouseLeftButtonDown��6�   $
��Left=�6?   $��667,205,0,0q�6Z   $	��Top=�6o   $	��190��6�   $	��323��6�   $, &بیماران مراجعه کننده��6�   $ ../Icon/Therapy.png��6�   6�     5G      -   5        $ 	BtnReport��5G   %   $# BtnReport_MouseLeftButtonDown��6�   $
��Left=�68   $��339,205,0,0q�6S   $	��Top=�6h   $	��190��6�   $	��323��6�   $ گزارشات��6�   $ ../Icon/Report.png��6�   6�   5H      �� 5I   
   -   5         ��Name$ 
StackPanel��5I      $��1000,0,-300,0q�6)   ���	#FF101011$	��300��6W   .+�5K         Visitor.CustomControl     SettingText$! اطلاعات کاربری��6$      SettingImageSource$ ../Icon/UserInfo.png��6A   $��
10,40,10,5q�6k   $��50��6   $��0q�6�     5L      $ تنظیمات��6$   $ ../Icon/Setting.png��6:   $��	10,5,10,5q�6c   $��50��6v     5M      -   5          Name$ 	BtnBackUp��5M   $      Visitor.CustomControl   MouseLeftButtonDown$# BtnBackUp_MouseLeftButtonDown��6�   $1 +پشتیبان گیری از اطلاعات��67   $ ../Icon/Backup.png��6]   $��	10,5,10,5q�6�   $��50��6�   6�     5N      -   5        $ BtnAutoBackUp��5N   $   $' !BtnAutoBackUp_MouseLeftButtonDown��6�   $5 /مشاهده پشتیبان های خودکار��6;   $ ../Icon/RestoreAll.png��6c   $��	10,5,10,5q�6�   $��50��6�   6�     5O      -   5        $ 
BtnRestore��5O   $   $$ BtnRestore_MouseLeftButtonDown��6�   $. (بازنشانی فایل پشتیبان��68   $ ../Icon/Restore.png��6\   $��	10,5,10,5q�6�   $��50��6�   6�     5P      $* $بروزرسانی نرم افزار��6$   $ ../Icon/Update.png��6F   $��	10,5,10,5q�6n   $��50��6�     5Q      -   5        $ BtnChangePassword��5Q   $   $+ %BtnChangePassword_MouseLeftButtonDown��6�   $" تغییر کلمه عبور��6?   $  ../Icon/ChangePassword.png��6]   $��	10,5,10,5q�6�   $��50��6�   6�     5R      $ راهنما��6$   $ ../Icon/Help.png��69   $��	10,5,10,5q�6_   $��50��6r     5S      $ درباره ی ما��6$   $ ../Icon/AboutUs.png��6>   $��	10,5,10,5q�6g   $��50��6z     5T      -   5        $ BtnClose��5T   $   $" BtnClose_MouseLeftButtonDown��6�   $ خروج��66   $ ../Icon/Exit.png��6I   $��	10,5,10,5q�6o   $��50��6�   6�   5W      �� 5X   
   -   5         ��Name$ BtnBack��5X      $��../Icon/Back.png��6!   $��961,13,13,0q�6;    J� Opacity$ 0Q�6P   $��14��6\   $	��Top=�6h   �� 5Y   
   -   5        $ BtnMenue��5Y      $��../Icon/MenuIcon.png��6"   $��
958,5,10,0q�6@   $��30��6T   $	��Top=�6`   5\      5]      