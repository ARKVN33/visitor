   M S B A M L   `   `   `  ����B  >Visitor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Visitor.WindowsVisitor.Windows  5   	   U QPersianDateControls, Version=1.2.4495.22344, Culture=neutral, PublicKeyToken=nullbDclr-namespace:Arash.PersianDateControls;assembly=PersianDateControlsArash.PersianDateControls 5   	   *    $Visitor.Windows.WinReportVisitDoctor   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:Visitor.Windows     5   	   dpersianDateControlsDclr-namespace:Arash.PersianDateControls;assembly=PersianDateControls     5   	   -   5        $	��505��5	   	   $	��900��6     � WindowStartupLocation$  CenterScreen=�6"    � WindowStyle$
 None=�6G   $��20(�6Z    � 
ResizeMode$ NoResize=�6h   $��	B Nazanin)�6~    � Triggers 5      :� 5   
    :� RoutedEvent$ FrameworkElement.Loaded��6   .[�5      �� .��5      �� .��5      W�  �� TargetProperty$ Opacity�6&    W� From$ 0X�6J   	 W� To$ 1X�6S    g� Duration$ 0:0:2D�6Z   	 g� FillBehavior$	 HoldEnd=�6k   5      5      5      .��5      � $��RightToLeft=�6   ���	#FFEEEEF2.+�5   
   �� -   5        ���	#FF192D6E$��0��5   '   ���	#FFEEEEF2$��30��6a   $	��Top=�6m   �� 5   
   -   5        
 ��Name$
 LblTitle��5      $��گزارشات��6"   $��22(�64   $
��Bold"�6B   $��0q�6T   $	��Top=�6_      LabelStyle1#���   6�   $��30��6�   $��Center=�6�   �� 5   
   -   5         ��Name$ BtnClose��5      $��×��6#   $��35��6/   $��30��6:   $��22(�6F   $��Arial)�6T   $
��Left=�6u   $	��Top=�6�     ButtonStyle2#���  6�   �� 5   
   -   5        $ BtnMinimize��5      $��-��6&   $��35,0,0,0q�62   $��35��6D   $��30��6O   $��27(�6[   $��Arial)�6i   $
��Left=�6�   $	��Top=�6�     ButtonStyle3#���  6�   �� 5   
   ���	#FF192D6E$��2q�6)   $��10,35,10,10q�6=    �� CornerRadius$ 10��6R   �� 5   
   -   5         ��Name$ GroupBox��5      $(��"انتخاب پزشک/پزشکان��6%   $
��Bold"�6A   $��
20,80,20,0q�6S   $��RightToLeft=�6g   ���	#FF192D6E$	��260��6�   $	��Top=�6�   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ 	DgdDoctor��5      $��30,115,30,0q�6&     DataGridStyle1#���  6;   ���	#FF192D6E$��2q�6�      AreRowDetailsFrozen .    
IsReadOnly .    GridLinesVisibility$ 
Horizontal=�6�      HorizontalGridLinesBrush �	#FF192D6E   AlternatingRowBackground �	#FFF1F4F7 �� AlternationCount$ 2��6>     SelectionMode$ Extended=�6S     AutoGenerateColumns .  -  'System.Windows.Input.KeyboardNavigation   TabNavigation$
 Once=�6�     CanUserSortColumns .  $	��215��6�  $	��Top=�6  ��6d   Z�    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5!      ,  &System.Windows.Controls.DataGridColumn   Header$ کد پزشک��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$ 90 66   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6A   �� *	Doctor_Id+  5"      $ نام��6%   $	 120 62    6>   �� *Name+  5#      $ نام خانوادگی��6%   $	 120 6;    6G   �� *Family+  5$      $ تخصص��6%   $	 140 63    6?   �� *SpecialtyName+  5%      $ تلفن همراه��6%   $	 110 69    6E   �� *MobileNumber+  5&      $ 
استان��6%   $	 100 64    6@   �� *ProvinceName+  5'      $ شهر��6%   $	 100 62    6>   �� *
CountyName+   RowHeaderTemplate 5+      �� 5,      .R�5-      � .+�5.      ��  d� 	IsChecked 6#   �� *
IsSelected+ �� Mode$ TwoWay=�  �� RelativeSource  �� *FindAncestor+! �� AncestorType)  #System.Windows.Controls.DataGridRow"!  5/      50      53      �� 56   
   $	��Top=�6   $��20,345,597,0q�6+   $	��105��6A   $��بازه زمانی��6N   $��RightToLeft=�6b   $
��Bold"�6~   ���	#FF192D6E6�   �� 57   
   $��58��6   $	��Top=�6   #���   63   $��
30,375,0,0q�6Y   $��30��6m   $
��Left=�6y   $��از تاریخ:��6�   1  +Arash.PersianDateControls.PersianDatePicker  58   
   -   5        "  Name$" TxtStartDate��58   0   $��
93,375,0,0q�6F   $	��Top=�6Z   $��30��6r   $	��200��6~     PersianDatePickerStyle1#���  6�   $��6��6�   $
��Left=�6  �� 59   
   $��58��6   $	��Top=�6   #���   63   $��
30,410,0,0q�6Y   $��30��6m   $
��Left=�6y   $��تا تاریخ:��6�     5:   
   -	   5        $" 
TxtEndDate��5:   0   $��
93,410,0,0q�6D   $	��Top=�6X   $��30��6p   $	��200��6|   #���  6�   $��7��6�   $
��Left=�6  �� 5;   
   $	��Top=�6   $��308,345,309,0q�6+   $	��105��6B   $$��انتخاب استان/شهر��6O   $��RightToLeft=�6i   $
��Bold"�6�   ���	#FF192D6E6�   �� 5<   
   $��استان:��6   $
��Left=�6!   $��317,375,0,0q�6<   $	��Top=�6Q   $��30��6i   #���   6u   �� 5=   
   $��شهر:��6   $
��Left=�6   $��326,410,0,0q�6:   $	��Top=�6O   $��30��6g   #���   6s   �� 5>   
   -
   5        # ��Name$# CboProvince��5>      $ �� DisplayMemberPath$
$ Name��6@   % �� SelectedValuePath$% Id��6Y   & �� 
IsEditable& . ' �� IsTextSearchEnabled' . $
��Left=�6�   $��370,375,0,0q�6�   $	��Top=�6�   $	��210��6�   $��30��6�   $��8��6�   ��6(   �� 6
  �� 5?   
   -   5        $# 	CboCounty��5?      $
$ Name��6>   $% Id��6W   & . ' . $
��Left=�6�   $��370,410,0,0q�6�   $	��Top=�6�   $	��210��6�   $��30��6�   $��9��6�   ��6&   �� 6�   �� 5@   
   $	��Top=�6   $��596,345,20,0q�6+   $	��105��6A   $&�� انتخاب تخصص/جنسیت��6N   $��RightToLeft=�6i   $
��Bold"�6�   ���	#FF192D6E6�   �� 5A   
   $��	تخصص:��6   $
��Left=�6    $��604,375,0,0q�6;   $	��Top=�6P   $��30��6h   #���   6t   �� 5B   
   $��جنسیت:��6   $
��Left=�6!   $��602,410,0,0q�6<   $	��Top=�6Q   $��30��6i   #���   6u   �� 5C   
   -   5        $# 	CboGender��5C      $
��Left=�6&   $��669,410,0,0q�6A   $	��Top=�6V   $	��201��6n   $��30��6z   $��5��6�   .@�5D      �� $�� ��6   ( �� 
IsSelected( . 6&   �� 5E      $��مذکر��6   �� 5F      $��مونث��6   5G      �� 5H   
   -   5        $ BtnShow��5H      $(��"گزارش ویزیت پزشکان��6"   $��220,455,530,0q�6?     ButtonStyle1#���  6V   $��30��6}   $	��Top=�6�   $��12��6�   ���	#FF192D6E) �� 	IsDefault) . 6�   �� 5I   
   -   5        $ BtnShowPatient��5I      $*��$گزارش ویزیت بیماران��6)   $��375,455,375,0q�6G   #���  6^   $��30��6�   $	��Top=�6�   $��12��6�   ���	#FF192D6E6�   �� 5J   
   -   5        $ BtnNew��5J      $��جدید��6!   $��530,455,220,0q�60   #���  6G   $��30��6n   $	��Top=�6z   $��13��6�   ���	#FF192D6E6�   �� 5K   
   -   5        $
 LblPersonnelSearch��5K      $��جست و جو:��6,   $
��Left=�6@   $��	20,45,0,0q�6[   $��30��6n   $	��Top=�6z   #���   6�   �� 5L   
   -   5        * ��Name$* 	TxtSearch��5L      $
��Left=�6%   $��30��6@   $��
109,45,0,0q�6L   + �� TextWrapping$
+ Wrap=�6`   $	��Top=�6u   $	��771��6�     TextBoxStyle1#���  6�   $��0��6�   , �� 	MaxLength$	, 200��6�   6�   �� 5M   
   -   5        $# CboSpecialty��5M      $
$ Name��6A   $% Id��6Z   & . ' .  $
��Left=�6�   $��669,375,0,0q�6�   $	��Top=�6�   $	��201��6�   $��30��6�   $��4��6�   ��6)   �� 6_  5P      5Q      