   M S B A M L   `   `   `  ����  Visitor'    !Visitor.Windows.WinForgetPassword   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   -   5        $	��580��5   	   $	��788��6     � WindowStartupLocation$  CenterScreen=�6"    � WindowStyle$
 None=�6G   $��20(�6Z    � 
ResizeMode$ NoResize=�6h   $��	B Nazanin)�6~   ���	#FF192D6E$��2q�6�    � Triggers 5	      :� 5
   
    :� RoutedEvent$ Window.Loaded��6   .[�5      �� .��5      �� .��5      W�  �� TargetProperty$ Opacity�6&    W� From$ 0X�6J   	 W� To$ 1X�6S    g� Duration$ 0:0:2D�6Z   	 g� FillBehavior$	 HoldEnd=�6k   5      5      5      .��5      � $��RightToLeft=�6   ���	#FFEEEEF2.+�5   
   �� -   5        ���	#FF192D6E$��0��5   '   ���	#FFEEEEF2$��30��6a   $	��Top=�6m   �� 5   
   -   5        
 ��Name$
 LblTitle��5      $$��بازیابی رمز عبور��6"   $��22(�6=   $
��Bold"�6K   $��0q�6]   $	��Top=�6h      LabelStyle1#���   6�   $��30��6�   $��Center=�6�   �� 5   
   -   5         ��Name$ BtnClose��5      $��×��6#   $��35��6/   $��30��6:   $��22(�6F   $��Arial)�6T   $
��Left=�6u   $	��Top=�6�     ButtonStyle2#���  6�   �� 5   
   -   5        $ BtnMinimize��5      $��-��6&   $��35,0,0,0q�62   $��35��6D   $��30��6O   $��27(�6[   $��Arial)�6i   $
��Left=�6�   $	��Top=�6�     ButtonStyle3#���  6�   �� 5   
   ���	#FF192D6E$��2q�6)   $��10,35,10,10q�6=    �� CornerRadius$ 10��6R   �� 5   
   -   5        $
 LblUserName��5      $#��نام کاربری جدید:��6%   $��	52,80,0,0q�6@   $	��Top=�6S   $��30��6k   $
��Left=�6w   #���   6�   $y�	Collapsed=�6�   �� 5   
   -   5        $
 LblUserNewPassword��5      $!��کلمه عبور جدید:��6,   $
��Left=�6F   $��
54,115,0,0q�6a   $	��Top=�6u   $��30��6�   #���   6�   $y�	Collapsed=�6�   �� 5   
   -   5         ��Name$ TxtUserName��5      $��30��6'   $��
172,80,0,0q�63    �� TextWrapping$
 Wrap=�6G   $	��Top=�6\     TextBoxStyle1#���  6t   $��1��6�    �� 	MaxLength$ 50��6�   $
��Left=�6�   $	��205��6�   $y�	Collapsed=�6�   G� 5   
   -	   5         G�Name$ TxtNewPassword��5      $
��Left=�6.   $��172,115,0,0q�6I   $	��Top=�6^   $	��205��6v   $��30��6�     PasswordBoxStyle1#���  6�   $��2��6�    G� 	MaxLength$ 50��6�   $y�	Collapsed=�6�   �� 5   
   -
   5        $ BtnSave��5      $��ثبت��6"   $��172,150,0,0q�60     ButtonStyle1#���  6E   $
��Left=�6l   $	��100��6�   $��3��6�    �� 	IsDefault . $��30��6�   $	��Top=�6�   $y�	Collapsed=�6�   �� 5   
   -   5        $ BtnExit��5      $��خروج��6"   $��277,150,0,0q�61   #���  6F   $
��Left=�6m   $	��100��6�   $��4��6�    �� IsCancel . $��30��6�   $	��Top=�6�   $y�	Collapsed=�6�   5!      5"      