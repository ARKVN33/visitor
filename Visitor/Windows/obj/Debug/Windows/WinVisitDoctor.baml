   M S B A M L   `   `   `  ����U  QPersianDateControls, Version=1.2.4495.22344, Culture=neutral, PublicKeyToken=nullbDclr-namespace:Arash.PersianDateControls;assembly=PersianDateControlsArash.PersianDateControls  5       Visitor$   Visitor.Windows.WinVisitDoctor   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   dpersianDateControlsDclr-namespace:Arash.PersianDateControls;assembly=PersianDateControls     5      -   5        $	��460��5   	   $	��700��6     � WindowStartupLocation$  CenterScreen=�6"    � WindowStyle$
 None=�6G   $��20(�6Z    � 
ResizeMode$ NoResize=�6h   $��	B Nazanin)�6~    � Triggers 5
      :� 5   
    :� RoutedEvent$ FrameworkElement.Loaded��6   .[�5      �� .��5      �� .��5      W�  �� TargetProperty$ Opacity�6&    W� From$ 0X�6J   	 W� To$ 1X�6S    g� Duration$ 0:0:2D�6Z   	 g� FillBehavior$	 HoldEnd=�6k   5      5      5      .��5      � $��RightToLeft=�6   ���	#FF1A1A1D.+�5   
   �� -   5        ���	#FF192D6E$��0��5   '   ���	#FF2D2D30$��30��6a   $	��Top=�6m   �� 5   
   -   5        
 ��Name$
 LblTitle��5      $/��)ثبت اطلاعات ویزیت پزشک��6"   $��22(�6C   $
��Bold"�6Q   $��0q�6c   $	��Top=�6n      LabelStyle1#���   6�   $��30��6�   $��Center=�6�   �� 5   
   -   5         ��Name$ BtnClose��5      $��×��6#   $��35��6/   $��30��6:   $��22(�6F   $��Arial)�6T   $
��Left=�6u   $	��Top=�6�     ButtonStyle2#���  6�   �� 5   
   -   5        $ BtnMinimize��5      $��-��6&   $��35,0,0,0q�62   $��35��6D   $��30��6O   $��27(�6[   $��Arial)�6i   $
��Left=�6�   $	��Top=�6�     ButtonStyle3#���  6�   �� 5   
   ���	#FF2D2D30$��2q�6)   $��10,35,10,10q�6=    �� CornerRadius$ 10��6R   �� 5   
   ���	#FF2D2D30$��2q�6)   $��	20,45,0,0q�6=   $ 10��6P   $��30��6b   $	��Top=�6n   $
��Left=�6�   $	��660��6�   �� 5   
   $��کد پزشک:��6   $
��Left=�6#   $��	20,45,0,0q�6>   $	��Top=�6Q   $��30��6i   #���   6u   
�������6�   �� 5   
   -   5        $
 LblDoctorId��5      $
��Left=�6%   $��	94,45,0,0q�6@   $	��Top=�6S   $��30��6k   #���   6w   
�������$	��110��6�   �� 5   
   $��نام:��6   $
��Left=�6   $��
204,45,0,0q�6:   $	��Top=�6N   $��30��6f   #���   6r   
�������6�   �� 5   
   -   5        $
 LblName��5      $
��Left=�6!   $��
233,45,0,0q�6<   $	��Top=�6P   $��30��6h   #���   6t   
�������$	��165��6�   �� 5   
   $��نام خانوادگی:��6   $
��Left=�6(   $��
398,45,0,0q�6C   $	��Top=�6W   $��30��6o   #���   6{   
�������6�   �� 5    
   -   5        $
 	LblFamily��5       $
��Left=�6#   $��
488,45,0,0q�6>   $	��Top=�6R   $��30��6j   #���   6v   
�������$	��192��6�   �� 5!   
   -	   5        $ BtnAdd��5!      $��ثبت��6!   $��102,411,0,0q�6/     ButtonStyle1#���  6D   $
��Left=�6�   $	��120��6�    �� 	IsDefault . $��12��6�   $��30��6�   $	��Top=�6�   
�������6�   �� 5"   
   -
   5        $ BtnNew��5"      $��جدید��6!   $��477,411,0,0q�60   #���  6E   $��15��6�   $��30��6�   $	��Top=�6�   
�������$
��Left=�6�   $	��120��6�   �� 5#   
   -   5        $ BtnEdit��5#      $��ویرایش��6"   $��227,411,0,0q�63   #���  6H   $
��Left=�6�   $	��120��6�   $��13��6�   $��30��6�   $	��Top=�6�   
�������6�   �� 5$   
   -   5        $ 	BtnDelete��5$      $��حذف��6$   $��352,411,0,0q�62   #���  6G   $��30��6�   $	��Top=�6�   $
��Left=�6�   $	��120��6�   $��14��6�   
�������6�   �� 5'   
   -   5        $
 LblDescription��5'      $	��Top=�6(   #���   6@   $��
34,115,0,0q�6f   $��30��6z   $
��Left=�6�   $��توضیحات:��6�   
�������6�   �� 5(   
   $��85��6   $	��Top=�6   #���   63   $��	20,80,0,0q�6Y   $��30��6l   $
��Left=�6x   $��تاریخ ویزیت:��6�   
�������6�   �� 5)   
   $	��Top=�6   #���   6(   $��
368,80,0,0q�6N   $��30��6b   $
��Left=�6n   $��ساعت ویزیت:��6�   
�������6�   �� 5*   
   -   5         ��Name$ TxtDescription��5*      $	��Top=�6*   $��8��6B    �� TextWrapping$
 Wrap=�6O     TextBoxStyle1#���  6c   $��110,115,0,0q�6�   $��70��6�   $
��Left=�6�   $	��570��6�   ���	#FFDDDDDD6�   �� 5+   
   -   5        $ TxtTime��5+      $	��Top=�6#   $��3��6;   $
 Wrap=�6H   #���  6\    �� 	MaxLength$ 15��6�   $��
465,80,0,0q�6�   $��30��6�   $��Center=�6�   ���	#FFDDDDDD$
��Left=�6�   $	��215��6	  1   +Arash.PersianDateControls.PersianDatePicker  5,   
   -   5          Name$ TxtDate��5,   0   $
��Left=�6A   $��
110,80,0,0q�6\   $	��Top=�6p   $��30��6�   $	��215��6�     PersianDatePickerStyle1#���  6�   $��2��6�   
���   �6.  &   System.Windows.Controls.DataGrid  5-   
   -   5          Name$ DgdVisitDoctor��5-      $��20,190,20,0q�6+     DataGridStyle1#���  6@   ���	#FF2D2D30$��2q�6�      AreRowDetailsFrozen .    
IsReadOnly .    GridLinesVisibility$ 
Horizontal=�6�      HorizontalGridLinesBrush �	#FF1F1F1F   AlternatingRowBackground �	#FF262626 �� AlternationCount$ 2��6C     SelectionMode$ Single=�6X     AutoGenerateColumns .  -  'System.Windows.Input.KeyboardNavigation   TabNavigation$
 Once=�6�     CanUserSortColumns .  $	��216��6�  $	��Top=�6�  ���	#FFDDDDDD   RowBackground �	#FF212121��6i   Z�  � 	Resources 5/      =  7System.Windows.Controls.Primitives.DataGridColumnHeader �� BasedOn  �� 
TargetType! �� Property" �� Value��%�   '        7 �� 50      8   "   6Q   .�51      �� ! � ��" �	#FF21212563   �� 52      ! � ��
" �����64   53      54      #   Columns# 55      0  *System.Windows.Controls.DataGridTextColumn  57      ,  &System.Windows.Controls.DataGridColumn$   Header$$ تاریخ ویزیت��6%   %   Width5  /System.Windows.Controls.DataGridLengthConverter$	% 130 6:   1  +System.Windows.Controls.DataGridBoundColumn&   Binding& 6F   �� *Date+  58      $$ ساعت ویزیت��6%   $	% 130 69   & 6E   �� *Time+  59      $$ توضیحات��6%   $	% 200 66   & 6B   �� *Description+5>      5A      5B      