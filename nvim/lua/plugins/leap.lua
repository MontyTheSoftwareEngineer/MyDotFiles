return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require('leap')
    leap.add_default_mappings()
    leap.opts.smart_case = true
  end,
}
