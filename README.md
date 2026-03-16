# Nord Aurora 🌘

A Nordic Neovim colorscheme tuned for calm dark surfaces, soft contrast, and
Aurora accents that stay readable during long sessions.

## Special Thanks

- Inspired by [`nordic.nvim`](https://github.com/AlexvZyl/nordic.nvim) by AlexvZyl
- Built with appreciation for the original [Nord](https://www.nordtheme.com/)
  palette project

## Features

- Single colorscheme: `nordaurora`
- Transparent background and dim inactive window support
- Terminal colors included
- Matching `lualine` theme included
- Palette overrides with `colors` and `on_colors`
- Highlight overrides with `on_highlights`
- Plugin support for Telescope, blink.cmp, nvim-cmp, neo-tree, nvim-tree,
  which-key, Lazy, Mason, gitsigns, flash.nvim, and indent guides

## Install

### `lazy.nvim`

```lua
{
  "nhnvrr/nordaurora.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("nordaurora").setup(opts)
    vim.cmd.colorscheme("nordaurora")
  end,
}
```

### Local development

```lua
{
  dir = "/path/to/nordaurora.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    require("nordaurora").setup(opts)
    vim.cmd.colorscheme("nordaurora")
  end,
}
```

## Usage

### Minimal setup

```lua
require("nordaurora").setup()
vim.cmd.colorscheme("nordaurora")
```

### Default options

```lua
require("nordaurora").setup({
  transparent = false,
  terminal_colors = true,
  dim_inactive = false,
  colors = {},
  styles = {
    comments = { italic = true },
    keywords = {},
    functions = {},
    strings = {},
    types = {},
    variables = {},
  },
  on_colors = function(colors)
  end,
  on_highlights = function(highlights, colors)
  end,
})

vim.cmd.colorscheme("nordaurora")
```

### Transparent background

```lua
require("nordaurora").setup({
  transparent = true,
})

vim.cmd.colorscheme("nordaurora")
```

### Palette and highlight overrides

```lua
require("nordaurora").setup({
  colors = {
    bg = "#181a1f",
    yellow = "#e7c173",
  },
  on_colors = function(colors)
    colors.blue = "#8fbccf"
    colors.purple = "#c7a0dc"
  end,
  on_highlights = function(highlights, colors)
    highlights.CursorLineNr = { fg = colors.yellow, bold = true }
    highlights.Comment = { fg = "#6c7a92", italic = true }
    highlights.Visual = { bg = colors.selection }
  end,
})

vim.cmd.colorscheme("nordaurora")
```

### Styled syntax groups

```lua
require("nordaurora").setup({
  styles = {
    comments = { italic = true },
    keywords = { italic = true },
    functions = { bold = true },
    strings = {},
    types = { italic = true },
    variables = {},
  },
})

vim.cmd.colorscheme("nordaurora")
```

## `lualine`

```lua
require("lualine").setup({
  options = {
    theme = "nordaurora",
  },
})
```

## Customize

If you want to change the theme itself, start here:

1. `lua/nordaurora/palette.lua`
2. `lua/nordaurora/highlights.lua`

## License

MIT. See [LICENSE](LICENSE).
