   M S B A M L   `   `   `  ����  Visitor    Visitor.CustomControl1   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      -   5          >�Name$  UserControl��5      $��20(�5   7   $��	B Nazanin)�6E   ���	#FF212125$��0q�6s    � 	Resources 5         OnMouseEnter1 �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value8  2System.Windows.Media.Animation.EasingColorKeyFrame �� KeyTime �� Value  OnMouseLeave1  OnMouseLeftButtonDown1  OnMouseLeftButtonUp1��%d  &	        &	 )    &	 �    &	 �    �� 5	   
   .��5
      U� $ (UIElement.Opacity)�6,   $ UserControl��6\   .\�5        $ 0��6'   $ 1Q�63   5      �� 5      $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF2F2F37��62   5      5      �� 5   
   .��5      �� $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF212125��62   5      5      �� 5   
   .��5      �� $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF4B4B4B��62   5      5      �� 5   
   .��5      �� $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF2F2F37��62   5      5      5        � Triggers 5!      :� 5"   
   	 :� RoutedEvent$	 UIElement.MouseEnter��6   .[�5#      �� #��[  6   5$      :� 5%   
   $	 UIElement.MouseLeave��6   .[�5&      �� -   5        
 ��Name$"
 OnMouseLeave1BeginStoryboard��5&      #��[ 6D   5'      :� 5(   
   $#	 UIElement.MouseLeftButtonDown��6   .[�5)      �� -   5        $+
 %OnMouseLeftButtonDown1BeginStoryboard��5)      #��[ 6M   5*      :� 5+   
   $!	 UIElement.MouseLeftButtonUp��6   .[�5,      �� -   5        $)
 #OnMouseLeftButtonUp1BeginStoryboard��5,      #��[ 6K   5-      .��5/      �  � RowDefinitions 50   
   �� 51      �� 52      $
��Auto �6   .+�54   
   �� -   5         ��Name$ 
ImgSetting��54      $��106,10,107,10q�6$   �� 55   
   -   5         ��Name$ 
LblSetting��55       $��0��6   $�� ��64   $��10q�6?     LabelStyle1#���  6K   ���	#FFDADADA$��1��6�   $��Center=�6�   57      58      