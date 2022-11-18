{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/org.fcitx.fcitx5-qt5-gui-wrapper.desktop".text = ''
[Desktop Entry]
Name[fr]=Fcitx 5 Qt5 Gui Wrapper
Name[ja]=Fcitx 5 の Qt5 GUI ラッパー
Name[ko]=Fcitx 5 Qt5 Gui 래퍼
Name[ru]=Графическая оболочка Fcitx 5 Qt5
Name[zh_CN]=Fcitx 5 Qt5 图形界面封装器
Name=Fcitx 5 Qt5 Gui Wrapper
GenericName[fr]=Aide à la configuration de la méthode d'entrée
GenericName[ja]=入力メソッド設定ヘルパー
GenericName[ko]=입력기 구성 도우미
GenericName[ru]=Помощник по настройке метода ввода
GenericName[zh_CN]=输入法配置助手程序
GenericName=Input Method Configuration helper
Comment[fr]=Charger le plugin de configuration pour Fcitx Addon
Comment[ja]=Fcitx アドオンの設定プラグインをロードする
Comment[ko]=Fcitx 애드온용 구성 플러그인 불러오기
Comment[ru]=Плагин загрузки конфигурации для Fcitx Addon
Comment[zh_CN]=加载 Fcitx 附加组件的配置插件
Comment=Load configuration plugin for Fcitx Addon
Icon=fcitx
Exec= ${pkgs.libsForQt5.fcitx5-qt}/libexec/fcitx5-qt5-gui-wrapper
Type=Application
Categories=Settings;
NoDisplay=true
'';
}
