local M = {}

M.defaults = {
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
  on_colors = function(_, _) end,
  on_highlights = function(_, _) end,
}

M.options = vim.deepcopy(M.defaults)

function M.setup(opts)
  M.options = vim.tbl_deep_extend("force", vim.deepcopy(M.defaults), opts or {})
end

return M
