{ config, inputs, pkgs, ... }:

{
  home.file.".local/share/applications/org.octave.Octave.desktop".text = ''
[Desktop Entry]
Name=GNU Octave
Comment=Interactive programming environment for numerical computations
Comment[ca]=Entorn de programació interactiva per a càlculs numèrics
Comment[de]=Interaktive Programmierumgebung für numerische Berechnungen
Comment[es]=Entorno de programación interactiva para cálculos numéricos
Comment[fr]=Environnement de programmation interactif pour le calcul numérique
Comment[hu]=Interaktív programozási környezet számszerű számításokhoz
Comment[it]=Ambiente di programmazione interattivo per il calcolo numerico
Comment[ja]=数値計算のための対話的なプログラミング環境
Comment[nl]=Interactieve programmeeromgeving voor numerieke berekeningen
Comment[pt]=Ambiente de programação interativo para computação numérica
Comment[zh]=数值计算交互式编程环境
TryExec=env XCURSOR_SIZE=24 ${pkgs.octaveFull}/bin/octave
Exec=env XCURSOR_SIZE=24 ${pkgs.octaveFull}/bin/octave --gui %f
Icon=octave
Terminal=false
Type=Application
Categories=Education;Science;Math;
StartupNotify=false
StartupWMClass=GNU Octave
MimeType=text/x-octave;text/x-matlab;
Keywords=science;math;matrix;numerical computation;plotting;
'';
}
