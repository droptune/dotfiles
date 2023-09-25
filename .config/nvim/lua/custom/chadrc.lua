---@type ChadrcConfig 
 local M = {}
 M.ui = {
  theme = 'everforest',
  statusline = {
    separator_style = "block", --default/round/block/arrow
  },
}
 M.mappings = require "custom.mappings"
 M.plugins = "custom.plugins"
 return M
