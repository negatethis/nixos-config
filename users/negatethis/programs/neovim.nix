{ pkgs, ...}:

{
  programs.neovim = {
    enable = true;
    
    defaultEditor = true;

    withNodeJs = true;
    withPython3 = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;   
 
    coc = {
      enable = true;
      settings = {
        languageserver = {
          nix = {
            command = "nil";
      	    filetypes = [ "nix" ];
      	    rootPatterns = [ "flake.nix" ];
      	  };
      	};
      };
    };

    plugins = with pkgs.vimPlugins; [
       nvim-treesitter
    ];

    extraPackages = with pkgs; [
      nil
    ];

    extraConfig = ''
      syntax enable
      filetype plugin indent on

      set tabstop=8
      set softtabstop=0
      set expandtab
      set shiftwidth=4
      set smarttab

      set linebreak
      set mouse=

      set nu

      " coc.nvim settings
      inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
      inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"
      inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"
    '';
  };
}
