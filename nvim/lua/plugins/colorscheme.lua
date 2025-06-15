return {
  -- add ayu colorscheme
  { "Shatur/neovim-ayu", main = "ayu", opts = { mirage = true } },

  -- Configure LazyVim to load ayu
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "ayu",
    },
  },
}
