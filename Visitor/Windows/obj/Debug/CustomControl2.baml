   M S B A M L   `   `   `  ����B  >Visitor, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null!clr-namespace:VisitorVisitor  5          Visitor.CustomControl2   5      W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5      R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      'localclr-namespace:Visitor     5      -   5          >�Name$  UserControl��5      $��20(�5      $��	B Nazanin)�6-   ���	#FF212125$��0q�6[   $��30��6o   $	��120��6{    � 	Resources 5         OnMouseEnter1 �� TargetProperty �� 
TargetName9  3System.Windows.Media.Animation.EasingDoubleKeyFrame O� KeyTime O� Value8  2System.Windows.Media.Animation.EasingColorKeyFrame �� KeyTime �� Value  OnMouseLeave1  OnMouseLeftButtonDown1  OnMouseLeftButtonUp1��%d  &	        &	 )    &	 �    &	 �    �� 5	   
   .��5
      U� $ (UIElement.Opacity)�6,   $ UserControl��6\   .\�5        $ 0��6'   $ 1Q�63   5      �� 5      $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF2F2F37��62   5      5      �� 5   
   .��5      �� $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF212125��62   5      5      �� 5   
   .��5      �� $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF4B4B4B��62   5      5      �� 5   
   .��5      �� $0 *(Panel.Background).(SolidColorBrush.Color)�6+   $ UserControl��6r   .g�5        $ 0��6&   $ 	#FF2F2F37��62   5      5      5        � Triggers 5!      :� 5"   
   	 :� RoutedEvent$	 UIElement.MouseEnter��6   .[�5#      �� #��[  6   5$      :� 5%   
   $	 UIElement.MouseLeave��6   .[�5&      �� -   5        
 ��Name$#
 OnMouseLeave1_BeginStoryboard��5&      #��[ 6E   5'      :� 5(   
   $#	 UIElement.MouseLeftButtonDown��6   .[�5)      �� -   5        $,
 &OnMouseLeftButtonDown1_BeginStoryboard��5)      #��[ 6N   5*      :� 5+   
   $!	 UIElement.MouseLeftButtonUp��6   .[�5,      �� -   5        $*
 $OnMouseLeftButtonUp1_BeginStoryboard��5,      #��[ 6L   5-      .��5/      � .+�50   
   �� -   5         ��Name$ 
LblSetting��50       $��0��6   $�� ��64   $��0q�6?     LabelStyle1#���  6J   ���	#FFDADADA$��Center=�6�   ���	#FF2D2D30$��1q�6�   53      54      