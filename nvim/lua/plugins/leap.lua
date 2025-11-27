return {
  "ggandor/leap.nvim",
  config = function()
    local leap = require('leap')
    leap.opts.smart_case = true
  end,
}
