{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/org.fcitx.fcitx5-config-qt.desktop".text = ''
[Desktop Entry]
Name[de]=Fcitx 5 Konfiguration
Name[fr]=Configuration Fcitx 5
Name[ja]=Fcitx 5 の設定
Name[ko]=Fcitx5 구성
Name[ru]=Конфигурация Fcitx 5
Name[tr]=Fcitx 5 Yapılandırması
Name[zh_CN]=Fcitx 5 配置
Name[zh_TW]=Fcitx 5 設定
Name=Fcitx 5 Configuration
GenericName[fr]=Configuration de la méthode d'entrée
GenericName[ja]=入力メソッドの設定
GenericName[ko]=입력기 구성
GenericName[ru]=Настройка метода ввода
GenericName[tr]=Girdi Yöntemi Yapılandırması
GenericName[zh_CN]=输入法配置
GenericName[zh_TW]=輸入法設定
GenericName=Input Method Configuration
Comment[fr]=Modifier la configuration de Fcitx 5
Comment[ja]=Fcitx 5 の設定を変更
Comment[ko]=Fcitx5 구성 변경
Comment[ru]=Изменить конфигурацию Fcitx 5
Comment[tr]=Fcitx 5 Yapılandırmasını Değiştirin
Comment[zh_CN]=修改 Fcitx 5 配置
Comment[zh_TW]=變更 Fcitx 5 設定
Comment=Change Fcitx 5 Configuration
Icon=fcitx
Exec=env XCUSROR_SIZE=24 fcitx5-config-qt
Type=Application
Categories=Settings;
NoDisplay=true
'';
}
