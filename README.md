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
    bg_visual = "#2f4254",
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

`colors.bg_visual` drives visual selection and focused menu states.

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

## `neo-tree`

```lua
{
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree filesystem reveal left toggle<CR>", desc = "Explorer" },
    { "<leader>be", "<cmd>Neotree buffers reveal float toggle<CR>", desc = "Buffers" },
    { "<leader>ge", "<cmd>Neotree git_status left<CR>", desc = "Git Explorer" },
  },
  opts = {
    close_if_last_window = true,
    popup_border_style = "rounded",
    enable_git_status = true,
    enable_diagnostics = true,
    sort_case_insensitive = true,
    source_selector = {
      winbar = true,
      statusline = false,
      content_layout = "center",
      tabs_layout = "equal",
      show_scrolled_off_parent_node = true,
      sources = {
        { source = "filesystem", display_name = "Files" },
        { source = "buffers", display_name = "Buffers" },
        { source = "git_status", display_name = "Git" },
      },
    },
    default_component_configs = {
      container = {
        enable_character_fade = false,
      },
      indent = {
        with_markers = true,
        with_expanders = true,
        indent_size = 2,
        padding = 1,
      },
      modified = {
        symbol = "●",
      },
      name = {
        highlight_opened_files = "all",
        use_git_status_colors = true,
      },
      git_status = {
        symbols = {
          added = "+",
          modified = "~",
          deleted = "x",
          renamed = ">",
          untracked = "?",
          ignored = ".",
          unstaged = "!",
          staged = "+",
          conflict = "!",
        },
      },
    },
    filesystem = {
      bind_to_cwd = true,
      follow_current_file = { enabled = true },
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = false,
      },
      window = {
        mappings = {
          ["l"] = "open",
          ["h"] = "close_node",
          ["H"] = "toggle_hidden",
          ["/"] = "filter_as_you_type",
          ["Y"] = "copy_to_clipboard",
        },
      },
    },
    window = {
      position = "left",
      width = 34,
      mappings = {
        ["<space>"] = "none",
        ["q"] = "close_window",
      },
    },
  },
}
```

## Customize

If you want to change the theme itself, start here:

1. `lua/nordaurora/palette.lua`
2. `lua/nordaurora/highlights.lua`

## License

MIT. See [LICENSE](LICENSE).
