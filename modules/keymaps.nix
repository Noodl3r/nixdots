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
    action = ":Oil";
  }

  {
    key = "<leader>y";
    mode = "v";
    silent = true;
    action = "\"+y";
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
]
