local M = {}

local inspect = require('messages.utils').inspect
local settings = require('messages.config').settings

M.open_float = function(text)
  local lines = vim.split(text, '\n')
  local winnr = settings.prepare_buffer(settings.buffer_opts())
  vim.api.nvim_buf_set_lines(vim.fn.bufnr(), 0, -1, true, lines)
  return winnr
end

M.capture_thing = function(...)
  M.open_float(inspect(...))
end

M.capture_cmd = function(cmd)
  local output = vim.api.nvim_exec(cmd, true)
  M.open_float(output)
end

return M