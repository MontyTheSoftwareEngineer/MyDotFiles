return {
  "sindrets/diffview.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("diffview").setup({
      diff_binaries = false,
      enhanced_diff_hl = true,
      git_cmd = { "git" },
      use_icons = true,
      show_help_hints = true,
      watch_index = true,
      icons = {
        folder_closed = "",
        folder_open = "",
      },
      signs = {
        fold_closed = "",
        fold_open = "",
        done = "✓",
      },
      view = {
        default = {
          layout = "diff2_horizontal",
          winbar_info = false,
          disable_diagnostics = true,
        },
        merge_tool = {
          layout = "diff3_horizontal",
          disable_diagnostics = true,
          winbar_info = true,
        },
        file_history = {
          layout = "diff2_horizontal",
          winbar_info = false,
          disable_diagnostics = true,
        },
      },
      file_panel = {
        listing_style = "tree",
        tree_options = {
          flatten_dirs = true,
          folder_statuses = "only_folded",
        },
        win_config = {
          position = "left",
          width = 35,
          win_opts = {}
        },
      },
      file_history_panel = {
        log_options = {
          git = {
            single_file = {
              diff_merges = "combined",
            },
            multi_file = {
              diff_merges = "first-parent",
            },
          },
        },
        win_config = {
          position = "bottom",
          height = 16,
          win_opts = {}
        },
      },
      commit_log_panel = {
        win_config = {
          win_opts = {},
        }
      },
      default_args = {
        DiffviewOpen = {},
        DiffviewFileHistory = {},
      },
      hooks = {},
      keymaps = {
        disable_defaults = false,
        view = {
          { "n", "<tab>",       "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "gf",          "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<leader>e",   "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<leader>co",  "<cmd>DiffviewConflictChooseOurs<cr>",   { desc = "Choose the OURS version of a conflict" } },
          { "n", "<leader>ct",  "<cmd>DiffviewConflictChooseTheirs<cr>", { desc = "Choose the THEIRS version of a conflict" } },
          { "n", "<leader>cb",  "<cmd>DiffviewConflictChooseBoth<cr>",   { desc = "Choose BOTH versions of a conflict" } },
          { "n", "<leader>cB",  "<cmd>DiffviewConflictChooseBase<cr>",   { desc = "Choose the BASE version of a conflict" } },
          { "n", "<leader>cn",  "<cmd>DiffviewConflictChooseNone<cr>",   { desc = "Delete the conflict region" } },
        },
        diff1 = {
          { "n", "g<C-x>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        },
        diff2 = {
          { "n", "g<C-x>", "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        },
        diff3 = {
          { "n", "g<C-x>",        "<cmd>DiffviewToggleFiles<cr>",           { desc = "Toggle file panel" } },
          { "n", "<leader>co",    "<cmd>DiffviewConflictChooseOurs<cr>",    { desc = "Choose the OURS version of a conflict" } },
          { "n", "<leader>ct",    "<cmd>DiffviewConflictChooseTheirs<cr>",  { desc = "Choose the THEIRS version of a conflict" } },
          { "n", "<leader>cb",    "<cmd>DiffviewConflictChooseBoth<cr>",    { desc = "Choose BOTH versions of a conflict" } },
          { "n", "<leader>cB",    "<cmd>DiffviewConflictChooseBase<cr>",    { desc = "Choose the BASE version of a conflict" } },
          { "n", "<leader>cn",    "<cmd>DiffviewConflictChooseNone<cr>",    { desc = "Delete the conflict region" } },
        },
        diff4 = {
          { "n", "g<C-x>",        "<cmd>DiffviewToggleFiles<cr>",           { desc = "Toggle file panel" } },
          { "n", "<leader>co",    "<cmd>DiffviewConflictChooseOurs<cr>",    { desc = "Choose the OURS version of a conflict" } },
          { "n", "<leader>ct",    "<cmd>DiffviewConflictChooseTheirs<cr>",  { desc = "Choose the THEIRS version of a conflict" } },
          { "n", "<leader>cb",    "<cmd>DiffviewConflictChooseBoth<cr>",    { desc = "Choose BOTH versions of a conflict" } },
          { "n", "<leader>cB",    "<cmd>DiffviewConflictChooseBase<cr>",    { desc = "Choose the BASE version of a conflict" } },
          { "n", "<leader>cn",    "<cmd>DiffviewConflictChooseNone<cr>",    { desc = "Delete the conflict region" } },
        },
        file_panel = {
          { "n", "j",              "j",                         { desc = "Next entry" } },
          { "n", "<down>",         "j",                         { desc = "Next entry" } },
          { "n", "k",              "k",                         { desc = "Previous entry" } },
          { "n", "<up>",           "k",                         { desc = "Previous entry" } },
          { "n", "<cr>",           "<cmd>DiffviewOpen<cr>",     { desc = "Open the diff for the selected entry" } },
          { "n", "o",              "<cmd>DiffviewOpen<cr>",     { desc = "Open the diff for the selected entry" } },
          { "n", "l",              "<cmd>DiffviewOpen<cr>",     { desc = "Open the diff for the selected entry" } },
          { "n", "<2-LeftMouse>",  "<cmd>DiffviewOpen<cr>",     { desc = "Open the diff for the selected entry" } },
          { "n", "-",              "<cmd>DiffviewToggleStage<cr>", { desc = "Stage / unstage the selected entry" } },
          { "n", "S",              "<cmd>DiffviewToggleStage<cr>", { desc = "Stage / unstage the selected entry" } },
          { "n", "U",              "<cmd>DiffviewRefresh<cr>",     { desc = "Update stats and entries in the file list" } },
          { "n", "h",              "<cmd>DiffviewClose<cr>",       { desc = "Close the diff view" } },
          { "n", "q",              "<cmd>DiffviewClose<cr>",       { desc = "Close the diff view" } },
          { "n", "<leader>e",      "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<leader>b",      "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "gf",             "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<C-w><C-f>",     "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<C-w>gf",        "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        },
        file_history_panel = {
          { "n", "g!",            "<cmd>DiffviewRefresh<cr>", { desc = "Update stats and entries in the file list" } },
          { "n", "<C-A-d>",       "<cmd>DiffviewOpen<cr>",    { desc = "Open the diff for the selected entry" } },
          { "n", "o",             "<cmd>DiffviewOpen<cr>",    { desc = "Open the diff for the selected entry" } },
          { "n", "<cr>",          "<cmd>DiffviewOpen<cr>",    { desc = "Open the diff for the selected entry" } },
          { "n", "<2-LeftMouse>", "<cmd>DiffviewOpen<cr>",    { desc = "Open the diff for the selected entry" } },
          { "n", "h",             "<cmd>DiffviewClose<cr>",   { desc = "Close the diff view" } },
          { "n", "q",             "<cmd>DiffviewClose<cr>",   { desc = "Close the diff view" } },
          { "n", "<leader>e",     "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<leader>b",     "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "gf",            "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<C-w><C-f>",    "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
          { "n", "<C-w>gf",       "<cmd>DiffviewToggleFiles<cr>", { desc = "Toggle file panel" } },
        },
        option_panel = {
          { "n", "<tab>", "<cmd>DiffviewToggleOption<cr>", { desc = "Toggle the current option" } },
          { "n", "q",     "<cmd>DiffviewClose<cr>",        { desc = "Close the diff view" } },
          { "n", "<esc>", "<cmd>DiffviewClose<cr>",        { desc = "Close the diff view" } },
        },
      },
    })
  end,
  keys = {
    { "<leader>dv", "<cmd>DiffviewOpen<cr>", desc = "Open Diffview" },
    { "<leader>dc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    { "<leader>dh", "<cmd>DiffviewFileHistory<cr>", desc = "File History" },
    { "<leader>df", "<cmd>DiffviewFileHistory %<cr>", desc = "Current File History" },
  },
}