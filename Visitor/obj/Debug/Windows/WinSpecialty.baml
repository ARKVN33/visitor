   M S B A M L   `   `   `  ����B  >Visitor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null1clr-namespace:Visitor.WindowsVisitor.Windows  5   	   "    Visitor.Windows.WinSpecialty   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   /localclr-namespace:Visitor.Windows     5   	   -   5        $	��406��5   	   $	��540��6     � WindowStartupLocation$  CenterScreen=�6"    � WindowStyle$
 None=�6G   $��20(�6Z    � 
ResizeMode$ NoResize=�6h   $��	B Nazanin)�6~    � Triggers 5
      :� 5   
    :� RoutedEvent$ Window.Loaded��6   .[�5      �� .��5      �� .��5      W�  �� TargetProperty$ Opacity�6&    W� From$ 0X�6J   	 W� To$ 1X�6S    g� Duration$ 0:0:2D�6Z   	 g� FillBehavior$	 HoldEnd=�6k   5      5      5      .��5      � $��RightToLeft=�6   ���	#FFEEEEF2.+�5   
   �� -   5        ���	#FF192D6E$��0��5   '   ���	#FFEEEEF2$��30��6a   $	��Top=�6m   �� 5   
   -   5        
 ��Name$
 LblTitle��5      $$��ثبت اطلاعات تخصص��6"   $��22(�6=   $
��Bold"�6K   $��0q�6]   $	��Top=�6h      LabelStyle1#���   6�   $��30��6�   $��Center=�6�   �� 5   
   -   5         ��Name$ BtnClose��5      $��×��6#   $��35��6/   $��30��6:   $��22(�6F   $��Arial)�6T   $
��Left=�6u   $	��Top=�6�     ButtonStyle2#���  6�   �� 5   
   -   5        $ BtnMinimize��5      $��-��6&   $��35,0,0,0q�62   $��35��6D   $��30��6O   $��27(�6[   $��Arial)�6i   $
��Left=�6�   $	��Top=�6�     ButtonStyle3#���  6�   �� 5   
   ���	#FF192D6E$��2q�6)   $��10,35,10,10q�6=    �� CornerRadius$ 10��6R   �� 5   
   ���	#FF192D6E$��2q�6)   $��	20,45,0,0q�6=   $ 10��6P   $��50��6b   $	��Top=�6n   $
��Left=�6�   $	��500��6�   �� 5   
   -   5         ��Name$ TxtName��5      $��30��6#   $��
115,55,0,0q�6/    �� TextWrapping$
 Wrap=�6C   $	��Top=�6X     TextBoxStyle1#���  6p   $��2��6�    �� 	MaxLength$ 50��6�   $
��Left=�6�   $	��395��6�   &   System.Windows.Controls.DataGrid  5   
   -   5          Name$ DgdData��5      $��
20,100,0,0q�6$     DataGridStyle1#���  68   ���	#FF192D6E$��2q�6�      AreRowDetailsFrozen .    
IsReadOnly .    GridLinesVisibility$ 
Horizontal=�6�      HorizontalGridLinesBrush �	#FF192D6E   AlternatingRowBackground �	#FFF1F4F7 �� AlternationCount$ 2��6;     SelectionMode$ Single=�6P     AutoGenerateColumns .  -  'System.Windows.Input.KeyboardNavigation   TabNavigation$
 Once=�6�     CanUserSortColumns .  $	��216��6�  $	��Top=�6  $
��Left=�6  $	��500��64  ��6a   Z�    Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ نام تخصص��6%      Width5  /System.Windows.Controls.DataGridLengthConverter$	 450 67   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6C   �� *Name+5"      �� 5#   
   -   5        $
 LblPersonnelSearch��5#      $��جست و جو:��6,   $
��Left=�6@   $��
19,321,0,0q�6[   $��30��6o   $	��Top=�6{   #���   6�   �� 5$   
   -	   5        $ 	TxtSearch��5$      $
��Left=�6%   $��30��6@   $��108,321,0,0q�6L   $
 Wrap=�6a   $	��Top=�6v   $	��412��6�   #���  6�   $��0��6�   $	 200��6�   6�   �� 5%   
   $��نام تخصص:��6   $
��Left=�6$   $��	30,55,0,0q�6?   $	��Top=�6R   $��30��6j   #���   6v   �� 5&   
   -
   5        $ BtnAdd��5&      $��ثبت��6!   $��
22,356,0,0q�6/     ButtonStyle1#���  6C   $
��Left=�6   $	��120��6�    �� 	IsDefault . $��12��6�   $��30��6�   $	��Top=�6�   �� 5'   
   -   5        $ BtnNew��5'      $��جدید��6!   $��397,356,23,0q�60   #���  6F   $��15��6�   $��30��6�   $	��Top=�6�   �� 5(   
   -   5        $ BtnEdit��5(      $��ویرایش��6"   $��147,356,0,0q�63   #���  6H   $
��Left=�6�   $	��120��6�   $��13��6�   $��30��6�   $	��Top=�6�   �� 5)   
   -   5        $ 	BtnDelete��5)      $��حذف��6$   $��272,356,0,0q�62   #���  6G   $��30��6�   $	��Top=�6�   $
��Left=�6�   $	��120��6�   $��14��6�   5+      5,      