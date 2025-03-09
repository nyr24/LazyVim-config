return {
  "rcarriga/nvim-dap-ui",
  event = "VeryLazy",
  dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
  config = function()
    local dap = require("dap")
    -- keymaps
    vim.keymap.set("n", "<leader>dr", dap.continue, { desc = "Run or continue debug" })
    vim.keymap.set("n", "<leader>dR", dap.run_to_cursor, { desc = "Run to cursor" })
    vim.keymap.set("n", "<leader>db", dap.toggle_breakpoint, { desc = "Add breakpoint" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>do", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<leader>dO", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<leader>dB", dap.step_back, { desc = "Step back" })
    vim.keymap.set("n", "<leader>dp", dap.pause, { desc = "Pause debug" })
    vim.keymap.set("n", "<leader>dt", dap.terminate, { desc = "Terminate debug" })

    local dapui = require("dapui")

    local dapui_config = {
        layouts = { {
            elements = { {
                id = "scopes",
                size = 0.45
            }, {
                id = "breakpoints",
                size = 0.15
            }, {
                id = "stacks",
                size = 0.15
            }, {
                id = "watches",
                size = 0.25
            } },
            position = "left",
            size = 50
        }, {
            elements = { {
                id = "repl",
                size = 0.5
            }, {
                id = "console",
                size = 0.5
            } },
            position = "bottom",
            size = 10
        } },
        mappings = {
            edit = "<C-e>",
            expand = { "<CR>", "<2-LeftMouse>" },
            open = "o",
            remove = "d",
            repl = "r",
            toggle = "t"
        }
    }

    dapui.setup(dapui_config)
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
  end,
}
