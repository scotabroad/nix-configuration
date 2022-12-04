{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/org.fcitx.Fcitx5.desktop".text = ''
[Desktop Entry]
Name[ca]=Fcitx 5
Name[da]=Fcitx 5
Name[de]=Fcitx 5
Name[fr]=Fcitx 5
Name[ja]=Fcitx 5
Name[ko]=Fcitx 5
Name[ru]=Fcitx 5
Name[zh_CN]=Fcitx 5
Name[zh_TW]=Fcitx 5
Name=Fcitx 5
GenericName[ca]=Mètode d'entrada
GenericName[da]=Inputmetode
GenericName[de]=Eingabemethode
GenericName[fr]=Méthode de saisie
GenericName[ja]=入力メソッド
GenericName[ko]=입력기
GenericName[ru]=Метод ввода
GenericName[zh_CN]=输入法
GenericName[zh_TW]=輸入法
GenericName=Input Method
Comment[ca]=Mètode d'entrada estàndard
Comment[da]=Start inputmetode
Comment[de]=Eingabemethode starten
Comment[fr]=Démarrer la méthode de saisie
Comment[ja]=入力メソッドを開始
Comment[ko]=입력기 시작
Comment[ru]=Запустить метод ввода
Comment[zh_CN]=启动输入法
Comment[zh_TW]=啟動輸入法
Comment=Start Input Method
Exec=env XCURSOR_SIZE=24 fcitx5
Icon=fcitx
Terminal=false
Type=Application
Categories=System;Utility;
StartupNotify=false
X-GNOME-AutoRestart=false
X-GNOME-Autostart-Notify=false
X-KDE-autostart-after=panel
X-KDE-StartupNotify=false
X-KDE-Wayland-VirtualKeyboard=true
NoDisplay=true
'';
}