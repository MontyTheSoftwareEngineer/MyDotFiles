return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "nvim-neotest/nvim-nio", -- required by dap-ui
    },
    config = function()
        local dap = require("dap")
        local dapui = require("dapui")

        -- ===== Keymaps (same as before) =====
        vim.keymap.set("n", "<F5>",  dap.continue,       { desc = "DAP Continue" })
        vim.keymap.set("n", "<F10>", dap.step_over,      { desc = "DAP Step Over" })
        vim.keymap.set("n", "<F11>", dap.step_into,      { desc = "DAP Step Into" })
        vim.keymap.set("n", "<F12>", dap.step_out,       { desc = "DAP Step Out" })
        vim.keymap.set("n", "<Leader>b",  dap.toggle_breakpoint, { desc = "DAP Toggle Breakpoint" })
        vim.keymap.set("n", "<Leader>B",  function()
            dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
        end, { desc = "DAP Conditional Breakpoint" })
        vim.keymap.set("n", "<Leader>lp", function()
            dap.set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
        end, { desc = "DAP Log Point" })
        vim.keymap.set("n", "<Leader>dr", dap.repl.open, { desc = "DAP Open REPL" })
        vim.keymap.set("n", "<Leader>dl", dap.run_last,  { desc = "DAP Run Last" })

        -- Handy eval/inspect under cursor
        vim.keymap.set({ "n", "v" }, "<Leader>de", function()
            require("dap.ui.widgets").hover()
        end, { desc = "DAP Eval (hover)" })

        -- ===== DAP-UI =====
        dapui.setup({
            -- sensible defaults; tweak if you want
            controls = { enabled = true },
            expand_lines = true,
        })
        -- Auto open/close UI
        dap.listeners.before.attach.dapui_config = function() dapui.open() end
        dap.listeners.before.launch.dapui_config = function() dapui.open() end
        dap.listeners.before.event_terminated.dapui_config = function() dapui.close() end
        dap.listeners.before.event_exited.dapui_config = function() dapui.close() end

        -- Toggle UI manually
        vim.keymap.set("n", "<Leader>du", dapui.toggle, { desc = "DAP UI Toggle" })

        -- ===== codelldb adapter (reuse your setup) =====
        dap.adapters.codelldb = {
            type = "server",
            port = "${port}",
            executable = { command = "codelldb", args = { "--port", "${port}" } },
        }

        dap.configurations.cpp = {
            {
                name = "Launch file",
                type = "codelldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
            },
        }
        dap.configurations.c    = dap.configurations.cpp
        dap.configurations.rust = dap.configurations.cpp
    end
}

