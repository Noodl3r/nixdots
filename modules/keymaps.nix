[
  {
    key = "<leader>w";
    mode = "n";
    silent = true;
    action = ":w<CR>";
  }

  {
    key = "<leader>q";
    mode = "n";
    silent = true;
    action = ":q<CR>";
  }

  {
    key = "<leader><Tab>";
    mode = "n";
    silent = true;
    action = ":Oil<CR>";
  }

  {
    key = "<leader>y";
    mode = "v";
    silent = false;
    action = "\"+y";
  }

  {
    key = "<leader>Y";
    mode = "v";
    silent = false;
    action = "\"+Y";
  }

  {
    key = "J";
    mode = "n";
    silent = true;
    action = "mzJ`z";
  }

  {
    key = "<Up>";
    mode = "i";
    silent = true;
    action = "<C-o>gk";
  }

  {
    key = "<Down>";
    mode = "i";
    silent = true;
    action = "<C-o>gj";
  }

  {
    key = "<leader>s";
    mode = "n";
    silent = true;
    action = ":%s/\\<<C-r><C-w>\\>//g<Left><Left>";
  }

  {
    key = "<C-l>";
    mode = "i";
    silent = true;
    action = "<c-g>u<Esc>[s1z=']a<c-g>u";
  }

  {
    key = "n";
    mode = "n";
    silent = true;
    action = "nzz";
  }

  {
    key = "N";
    mode = "n";
    silent = true;
    action = "Nzz";
  }

  {
    key = "<C-d>";
    mode = "n";
    silent = true;
    action = "<C-d>zz";
  }

  {
    key = "<C-u>";
    mode = "n";
    silent = true;
    action = "<C-u>zz";
  }

  {
    key = "<Esc>";
    mode = "n";
    silent = true;
    action = ":noh<CR>";
  }
]
