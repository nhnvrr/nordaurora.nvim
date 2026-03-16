# nordaurora

A single Nordic Neovim theme tuned to resemble `nordic.nvim`: calm dark
surfaces, soft contrast, and warm Aurora accents for long coding sessions.

## Special Thanks

- Inspired by [`nordic.nvim`](https://github.com/AlexvZyl/nordic.nvim) by AlexvZyl.
- Built with appreciation for the original [Nord](https://www.nordtheme.com/) color palette project.

## Features

- Single colorscheme: `nordaurora`
- Palette overrides through `colors`
- Highlight overrides through `on_highlights`
- Transparent background and dim inactive window options
- Terminal colors and a matching lualine theme included
- Common plugin support for Telescope, blink.cmp, nvim-cmp, neo-tree,
  nvim-tree, which-key, Lazy, Mason, gitsigns, flash.nvim, and indent guides

## Install

With `lazy.nvim` during local development:

```lua
{
  dir = "/path/to/nordaurora",
  lazy = false,
  priority = 1000,
  opts = {
    transparent = false,
    dim_inactive = false,
    colors = {
      blue = "#81A1C1",
      bg = "#242933",
    },
    on_highlights = function(hl, c)
      hl.CursorLineNr = { fg = c.yellow, bold = true }
      hl.Comment = { fg = "#6c7a92", italic = true }
    end,
  },
  config = function(_, opts)
    require("nordaurora").setup(opts)
    vim.cmd.colorscheme("nordaurora")
  end,
}
```

If you rename the project folder later, update `dir` to match.

## Usage

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
    colors.blue = "#89b8d6"
  end,
  on_highlights = function(highlights, colors)
    highlights.Visual = { bg = colors.selection }
  end,
})

vim.cmd.colorscheme("nordaurora")
```

## Customize

The main files to edit are:

1. `lua/nordaurora/palette.lua`
2. `lua/nordaurora/highlights.lua`

## lualine

```lua
require("lualine").setup({
  options = {
    theme = "nordaurora",
  },
})
```

## License

MIT. See [LICENSE](LICENSE).
