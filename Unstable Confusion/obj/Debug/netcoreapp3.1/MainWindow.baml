   M S B A M L   `   `   `  ????M  IUnstable Confusion, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null7 clr-namespace:Unstable_ConfusionUnstable_Confusion  5   	   #    Unstable_Confusion.MainWindow   5   	   W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   U QWpfAnimatedGif, Version=2.0.0.0, Culture=neutral, PublicKeyToken=9e7cd3b544a090dc,gif"http://wpfanimatedgif.codeplex.com  5   	   ,local clr-namespace:Unstable_Confusion  5   	     ? Title$  Unstable Confusion??5	   	   $	??556??6$   $	??474??61    ? 
ResizeMode$ NoResize=?6=    ? Icon$ 	/icon.png??6S   .??5
      ? .+?5   
   ?? $??Enter text2image prompt:??6   $
??Left=?63   $??	10,10,0,0q?6N   $	??Top=?6a   ?? 5   
   -   5         ??Name$ 	txtPrompt??5      $??Center=?6%   $??0,36,0,0q?6B    ?? TextWrapping$
 Wrap=?6T   $	??Top=?6h   $	??423??6?   ?? 5   
   -   5         ??Name$ bnStart??5      $??Start??6"   $??Center=?62   $??0,74,0,0q?6O   $	??Top=?6a   $	??423??6y   6?   ?? 5   
   -   5         ??Name$ 	imgResult??5      $
??Left=?6#   $	??329??6>   $??
57,123,0,0q?6K   $	??Top=?6_   $	??342??6w   ?? 5   
   -   5        $ bnSave??5      $
??Save??6!   $??Center=?60   $??33??6M   $??	0,466,0,0q?6Y   $	??Top=?6l   $	??422??6?   ${?False??6?   ?? 5   
   -   5        $
 wait??5   b   "  WpfAnimatedGif.ImageBehavior   AnimatedSource$  loading-loading-symbol.gif??6   $y?Hidden=?6N   $
??Left=?6p   $	??100??6?   $??179,213,0,0q?6?   $	??Top=?6?   $	??100??6?   ?? 5   
   -   5        $ bnStop??5      ${?False??6!   $
??Stop??63   $??Center=?6B   $??0,99,0,0q?6_   $	??Top=?6q   $	??423??6?   6?   5      5      