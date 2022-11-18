{ config, inputs, pkgs, ...}:

{
  home.file.".local/share/applications/fcitx5-configtool.desktop".text = ''
[Desktop Entry]
Name[ca]=Configuració de fcitx 5
Name[da]=Fcitx 5-konfiguration
Name[de]=Fcitx 5 Konfiguration
Name[fr]=Configuration Fcitx 5
Name[ja]=Fcitx5 設定
Name[ko]=Fcitx 5 설정
Name[ru]=Конфигурация Fcitx 5
Name[zh_CN]=Fcitx 5 配置
Name[zh_TW]=Fcitx 5 設定
Name=Fcitx 5 Configuration
GenericName[da]=Konfiguration af inputmetode
GenericName[de]=Konfiguration Eingabemethode
GenericName[fr]=Configuration de la méthode d'entrée
GenericName[ja]=入力メソッドの設定
GenericName[ko]=입력기 구성
GenericName[ru]=Настройка метода ввода
GenericName[zh_CN]=输入法配置
GenericName[zh_TW]=輸入法設定
GenericName=Input Method Configuration
Comment[da]=Skift Fcitx 5-konfiguration
Comment[de]=Fcitx 5 Konfiguration ändern
Comment[fr]=Modifier la configuration de Fcitx 5
Comment[ja]=Fcitx5 設定を変更
Comment[ko]=Fcitx5 구성 변경
Comment[ru]=Изменить конфигурацию Fcitx 5
Comment[zh_CN]=修改 Fcitx 5 配置
Comment[zh_TW]=變更 Fcitx 5 設定
Comment=Change Fcitx 5 Configuration
Exec=env XCURSOR_SIZE=24 fcitx5-config-qt
Icon=fcitx
Type=Application
Categories=Settings;
X-KDE-StartupNotify=false
StartupNotify=false
X-AppStream-Ignore=true
NotShowIn=KDE
'';
}
