{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/org.fcitx.fcitx5-migrator.desktop".text = ''
[Desktop Entry]
Name[de]=Fcitx 5 Migrationsassistent
Name[fr]=Assistant de migration Fcitx 5
Name[ja]=Fcitx 5 移行ウィザード
Name[ko]=Fcitx5 마이그레이션 마법사
Name[ru]=Мастер Перемещения Fcitx 5
Name[tr]=Fcitx 5 Göç Etme Sihirbazı
Name[zh_CN]=Fcitx 5 迁移向导
Name[zh_TW]=Fcitx 5 資料搬移精靈
Name=Fcitx 5 Migration Wizard
Comment[fr]=Importer des données à partir d'une autre méthode d'entrée telle que Fcitx 4
Comment[ja]=Fcitx 4 などの他の入力メソッドからデータをインポートする
Comment[ko]=Fcitx 4와 같은 다른 입력기에서 데이터 가져오기
Comment[ru]=Импорт данных из другого метода ввода, такого как Fcitx 4
Comment[zh_CN]=从其他输入法导入数据例如 Fcitx 4
Comment[zh_TW]=從其他輸入法（如 Fcitx 4）匯入資料
Comment=Import data from other input method such as Fcitx 4
Icon=fcitx
Exec=env XCURSOR_SIZE=24 fcitx5-migrator
Type=Application
Categories=Settings;
NoDisplay=true
'';
}
