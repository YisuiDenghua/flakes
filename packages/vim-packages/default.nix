{ vimUtils, fetchFromGitHub, python3, update-nix-fetchgit }:
let
  inherit (vimUtils) buildVimPluginFrom2Nix;

  coc-source = fetchFromGitHub {
    owner = "neoclide";
    repo = "coc-sources";
    rev = "70564820ac1718b7f85f6cd9e67269500bd41211";
    sha256 = "1l7lhys5vmb0ixnxrhis10yh68icq4a13qmpx0yy14kal9aiqg20";
  };

in {
  updateAction = "${update-nix-fetchgit}/bin/update-nix-fetchgit *";

  mundo = buildVimPluginFrom2Nix {
    name = "vim-mundo";
    src = fetchFromGitHub {
      owner = "simnalamburt";
      repo = "vim-mundo";
      rev = "4cc954f5cad7ebf6c20b652c6cd6966940752b5b";
      sha256 = "0k5f7kcvh3rb8d16lcp5q3hl4bx3s09rw5dni8h6i1mw15cbyyi1";
    };
  };

  ncm2-yoink = buildVimPluginFrom2Nix {
    name = "ncm2-yoink";
    src = fetchFromGitHub {
      owner = "svermeulen";
      repo = "ncm2-yoink";
      rev = "802070a996527c4ee227287fc2cdf1f5a8f5d4f2";
      sha256 = "10lzw3xmxcjk9iwii0xbik8y4cmd0bl3r7kc3xcdvs4mzqpnbypa";
    };
  };

  ncm2-syntax = buildVimPluginFrom2Nix {
    name = "ncm2-yoink";
    src = fetchFromGitHub {
      owner = "ncm2";
      repo = "ncm2-syntax";
      rev = "d41d60b22175822c14f497378a05398e3eca2517";
      sha256 = "065sflxr6sp491ifvcf7bzvpn5c47qc0mr091v2p2k73lp9jx2s2";
    };
  };

  neovim-gdb = buildVimPluginFrom2Nix {
    name = "neovim-gdb";
    src = fetchFromGitHub {
      owner = "sakhnik";
      repo = "nvim-gdb";
      rev = "c617a18561f710c22f521f7efd05c1374a1b8073";
      sha256 = "1rk2z7ibrsh9gqrxisf13ybx846rxhlrx6s3piabhhr5x7m3h79n";
    };
    buildInputs = [ python3 ];
    postUnpack = ''
      patchShebangs .
    '';
  };

  vim-smoothie = buildVimPluginFrom2Nix {
    name = "vim-smoothie";
    src = fetchFromGitHub {
      owner = "psliwka";
      repo = "vim-smoothie";
      rev = "df1e324e9f3395c630c1c523d0555a01d2eb1b7e";
      sha256 = "1c87zc954wk76h9klxyygv19jp729fms2f5m18gwzskars3px076";
    };
  };

  vim-vala = buildVimPluginFrom2Nix {
    name = "vim-vala";
    src = fetchFromGitHub {
      owner = "arrufat";
      repo = "vala.vim";
      rev = "ce569e187bf8f9b506692ef08c10b584595f8e2d";
      sha256 = "143aq0vxa465jrwajs9psk920bm6spn9ga24f5qdai926hhp2gyl";
    };
  };

  vim-ingo-library = buildVimPluginFrom2Nix {
    name = "vim-ingo-library";
    src = fetchFromGitHub {
      owner = "inkarkat";
      repo = "vim-ingo-library";
      rev = "439c576a229769615fa1060cb8d14686c54a22c1";
      sha256 = "18dj7lbifvahlw7rg31n7xhqrw9vd7wvdzjyavjndb05wni69x77";
    };
  };

  context = buildVimPluginFrom2Nix {
    name = "vim-context";
    src = fetchFromGitHub {
      owner = "wellle";
      repo = "context.vim";
      rev = "c06541451aa94957c1c07a9f8a7130ad97d83a65";
      sha256 = "1n9623cp8ljyrwnq0i4zqfaxp1fwsl5l3shg87ksn1xvj14fw66c";
    };
  };

  gina = buildVimPluginFrom2Nix {
    name = "gina.vim";
    src = fetchFromGitHub {
      owner = "lambdalisue";
      repo = "gina.vim";
      rev = "ff6c2ddeca98f886b57fb42283c12e167d6ab575";
      sha256 = "09jlnpix2dy6kggiz96mrm5l1f9x1gl5afpdmfrxgkighn2rwpzq";
    };
  };

  codi = buildVimPluginFrom2Nix {
    name = "codi.vim";
    src = fetchFromGitHub {
      owner = "metakirby5";
      repo = "codi.vim";
      rev = "c120785c950f9991d32d3d4d2f3696fa8a8b5582";
      sha256 = "0fq01fh717fkq1qlr4ykn7b97l8775c8ja6q3gqs368nf6l94a4i";
    };
  };

  coc-dictionary = buildVimPluginFrom2Nix {
    name = "coc-dictionary";
    src = coc-source;
    preInstall = ''
      cd packages/dictionary
    '';
  };

  coc-word = buildVimPluginFrom2Nix {
    name = "coc-word";
    src = coc-source;
    preInstall = ''
      cd packages/word
    '';
  };

  coc-syntax = buildVimPluginFrom2Nix {
    name = "coc-syntax";
    src = coc-source;
    preInstall = ''
      cd packages/syntax
    '';
  };

  nerdtree-syntax-highlight = buildVimPluginFrom2Nix {
    name = "vim-nerdtree-syntax-highlight";
    src = fetchFromGitHub {
      owner = "tiagofumo";
      repo = "vim-nerdtree-syntax-highlight";
      rev = "5178ee4d7f4e7761187df30bb709f703d91df18a";
      sha256 = "0i690a9sd3a9193mdm150q5yx43mihpzkm0k5glllsmnwpngrq1a";
    };
  };

  nvim-lsp = buildVimPluginFrom2Nix {
    name = "nvim-lsp";
    src = fetchFromGitHub {
      owner = "neovim";
      repo = "nvim-lsp";
      rev = "10c39343660594278599694e98290fb5e629c239";
      sha256 = "0qy9pv4bkpa1r1v0r3ljwf8ydwm8rkvamdycv31457s2ygm7zgi5";
    };
  };

  keysound = buildVimPluginFrom2Nix {
    name = "vim-keysound";
    src = fetchFromGitHub {
      owner = "skywind3000";
      repo = "vim-keysound";
      rev = "88a60a3c3537b6342ec221415e2348ae03f8b71d";
      sha256 = "0yjyji5vrha7i15yvs7qf9dmyrilaqkypcmf1a3vhvpcidmb1ha0";
    };
  };

  vidir = buildVimPluginFrom2Nix {
    name = "vidir";
    src = fetchFromGitHub {
      owner = "aca";
      repo = "vidir.nvim";
      rev = "0ebc07147c4a6d2cd143b8c8bf193d4c6a6d248e";
      sha256 = "1wbib0vcr5qaj6dbsk8gd2ak3ams5af5dhsdac6m7q45wf842p6z";
    };
  };

  vibusen = buildVimPluginFrom2Nix {
    name = "vibusen.vim";
    src = fetchFromGitHub {
      owner = "lsrdg";
      repo = "vibusen.vim";
      rev = "9d944ea023253d35351e672eb2742ddcf1445355";
      sha256 = "1n2s8b7kya8dnn1d5b0dc8yadl92iwf58s7sb5950b6yyi3i3q7f";
    };
  };

  soong = buildVimPluginFrom2Nix {
    name = "soong.vim";
    src = fetchFromGitHub {
      owner = "cherrry";
      repo = "soong.vim";
      rev = "58f8a2b2e066f76f932b9683883689797b0d7274";
      sha256 = "1mllzgp66ds79anpz1k6gz4dkp2hjhn79iwi8chsap1hrpjc4yp1";
    };
  };
}
