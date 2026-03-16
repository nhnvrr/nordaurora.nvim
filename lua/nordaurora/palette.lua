local color = require("nordaurora.color")

local M = {}

local palette = {
  bg = "#1A1B19",
  bg_alt = "#232522",
  bg_float = "#1D1F1C",
  bg_status = "#1D1F1C",
  bg_visual = "#2B2E2A",
  fg = "#C0C8D8",
  fg_dark = "#BBC3D4",
  fg_gutter = "#60728A",
  comment = "#60728A",
  border = "#3B4252",
  blue = "#81A1C1",
  cyan = "#88C0D0",
  green = "#A3BE8C",
  orange = "#D08770",
  pink = "#B48EAD",
  purple = "#B48EAD",
  red = "#BF616A",
  teal = "#8FBCBB",
  yellow = "#EBCB8B",
}

local function build_semantics(colors)
  colors.none = "NONE"
  colors.cursor = colors.fg
  colors.cursorline = color.blend(colors.fg, colors.bg, 0.04)
  colors.panel = color.blend(colors.bg_alt, colors.bg, 0.9)
  colors.panel_alt = color.blend(colors.bg_float, colors.bg, 0.82)
  colors.statusline = color.blend(colors.bg_status, colors.bg, 0.9)
  colors.selection = color.blend(colors.blue, colors.bg, 0.18)
  colors.selection_soft = color.blend(colors.purple, colors.bg, 0.12)
  colors.search = color.blend(colors.yellow, colors.bg, 0.2)
  colors.search_current = color.blend(colors.orange, colors.bg, 0.24)
  colors.match = color.blend(colors.cyan, colors.bg, 0.18)
  colors.border_focus = color.blend(colors.blue, colors.border, 0.35)

  colors.git = {
    add = colors.green,
    change = colors.yellow,
    delete = colors.red,
  }

  colors.git_bg = {
    add = color.blend(colors.green, colors.bg, 0.12),
    change = color.blend(colors.yellow, colors.bg, 0.12),
    delete = color.blend(colors.red, colors.bg, 0.12),
  }

  colors.diag = {
    error = colors.red,
    warn = colors.yellow,
    info = colors.blue,
    hint = colors.cyan,
    ok = colors.green,
  }

  colors.diag_bg = {
    error = color.blend(colors.red, colors.bg, 0.14),
    warn = color.blend(colors.yellow, colors.bg, 0.14),
    info = color.blend(colors.blue, colors.bg, 0.14),
    hint = color.blend(colors.cyan, colors.bg, 0.14),
    ok = color.blend(colors.green, colors.bg, 0.14),
  }

  colors.terminal = {
    colors.bg_alt,
    colors.red,
    colors.green,
    colors.yellow,
    colors.blue,
    colors.purple,
    colors.cyan,
    colors.fg_dark,
    colors.fg_gutter,
    colors.red,
    colors.green,
    colors.yellow,
    colors.blue,
    colors.purple,
    colors.cyan,
    colors.fg,
  }

  return colors
end

function M.get(opts)
  local colors = vim.deepcopy(palette)

  if opts and opts.colors then
    colors = vim.tbl_deep_extend("force", colors, opts.colors)
  end

  build_semantics(colors)

  if opts and opts.on_colors then
    opts.on_colors(colors)
  end

  return build_semantics(colors)
end

return M
