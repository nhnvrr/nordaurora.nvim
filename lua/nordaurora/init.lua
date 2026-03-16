local config = require("nordaurora.config")
local highlights = require("nordaurora.highlights")
local palette = require("nordaurora.palette")

local M = {}

local function apply_terminal_colors(colors)
  for index, color in ipairs(colors.terminal) do
    vim.g["terminal_color_" .. (index - 1)] = color
  end
end

local function apply_highlights(groups)
  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end
end

function M.setup(opts)
  config.setup(opts)
end

function M.colors()
  return palette.get(config.options)
end

function M.load()
  local colors = palette.get(config.options)
  local groups = highlights.get(colors, config.options)

  config.options.on_highlights(groups, colors)

  vim.o.termguicolors = true
  vim.cmd("highlight clear")

  if vim.fn.exists("syntax_on") == 1 then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "nordaurora"

  if config.options.terminal_colors then
    apply_terminal_colors(colors)
  end

  apply_highlights(groups)
end

return M
