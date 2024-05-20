{pkgs, ...}: let
  aniseed = pkgs.vimUtils.buildVimPlugin {
    pname = "aniseed";
    version = "v3.32.0";
    src = pkgs.fetchFromGitHub {
      owner = "Olical";
      repo = "aniseed";
      rev = "v3.33.0";
      sha256 = "sha256-0000000000000000000000000000000000000000000=";
    };
    meta.homepage = "https://github.com/Olical/aniseed";
  };
in
  pkgs.stdenv.mkDerivation {
    name = "init.vim";
    phases = ["installPhase" "fixupPhase"];
    installPhase = ''
      mkdir $out
      cat << EOF > $out/init.vim
      set runtimepath+=${aniseed}
      let g:aniseed#env = v:true
      EOF
    '';
  }
