{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/qt5ct.desktop".text = ''
[Desktop Entry]
X-Desktop-File-Install-Version=0.11
Name=Qt5 Settings

Comment=Qt5 Configuration Tool

Comment[ar]= أداة اعداد Qt5
Name[ar]=إعدادات Qt5 

Comment[bg]=Инструмент за настройка на Qt5
Name[bg]=Настройки на Qt5

Comment[ca]=Eina de configuració de Qt5
Name[ca]=Configuració de Qt5

Comment[cs]=Nástroj na nastavení Qt5
Name[cs]=Nastavení Qt5

Comment[da]=Qt5-konfigurationsværktøj
Name[da]=Qt5-indstillinger

Comment[de]=Qt5-Konfigurationswerkzeug
Name[de]=Qt5-Einstellungen

Comment[el]=Εργαλείο διαμόρφωσης της Qt5
Name[el]=Ρυθμίσεις Qt5

Comment[es]=Herramienta de configuración de QT5
Name[es]=Ajustes QT5

Comment[es_ES]=Herramienta de configuración de QT5
Name[es_ES]=Ajustes QT5

Comment[fr]=Un outil de configuration de Qt5
Name[fr]=Paramètres de Qt5

Comment[he]=כלי תצורה Qt5
Name[he]=הגדרות Qt5

Comment[ru]=Программа для настройки Qt5
Name[ru]=Настройки Qt5

Comment[it_IT]=Strumento di configurazione Qt5
Name[it_IT]=Impostazioni Qt5

Comment[ja]=Qt5 設定ツール
Name[ja]=Qt5 の設定

Comment[nl_NL]=Qt5-instellingen
Name[nl_NL]=Qt5-instellingen

Comment[pl]=Narzędzie konfiguracji Qt5
Name[pl]=Ustawienia Qt5

Comment[sk]=Qt5 konfiguračný nástroj
Name[sk]=Qt5 nastavenia

Comment[sr]=Qt5 конфигурациони алат
Name[sr]=Qt5 поставке

Comment[tr]=Qt5 Yapılandırma Aracı
Name[tr]=Qt5 Ayarları

Comment[zh_CN]=Qt5 配置工具
Name[zh_CN]=Qt5 设置

Comment[zh_TW]=Qt5 設定工具
Name[zh_TW]=Qt5 設定


Exec=env XCURSOR_SIZE=24 qt5ct
Icon=preferences-desktop-theme
Terminal=false
Type=Application
Categories=Settings;DesktopSettings;Qt;
'';
}
