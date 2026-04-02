local colors = require("nordaurora.palette").get({})

local function mode(fg)
  return {
    a = { bg = colors.panel, fg = fg, gui = "bold" },
    b = { bg = colors.panel_alt, fg = colors.fg },
    c = { bg = colors.statusline, fg = colors.comment },
  }
end

return {
  normal = mode(colors.blue),
  insert = mode(colors.green),
  command = mode(colors.purple),
  visual = mode(colors.orange),
  replace = mode(colors.red),
  terminal = mode(colors.cyan),
  inactive = {
    a = { bg = colors.statusline, fg = colors.comment },
    b = { bg = colors.statusline, fg = colors.comment },
    c = { bg = colors.statusline, fg = colors.comment },
  },
}
