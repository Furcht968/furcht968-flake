{ config, pkgs, lib, ... }: 

let tex = (pkgs.texliveBasic.withPackages (
  ps: with ps; [
    lualatex-math amsmath dvisvgm xkeyval
    babel-english cbfonts-fd cm-super count1to ctex doublestroke
    everysel fontspec frcursive fundus-calligra gnu-freefont jknapltx latex-bin
    mathastext microtype multitoc physics preview prelim2e ragged2e relsize rsfs
    setspace standalone tipa wasy wasysym xcolor
    braket cancel
    unicode-math mathtools luatexja haranoaji newcomputermodern
    #(setq org-latex-compiler "lualatex")
    #(setq org-preview-latex-default-process 'dvisvgm)
  ]
  ));
in
{
  home.packages = with pkgs; [
    tex
  ];
}
