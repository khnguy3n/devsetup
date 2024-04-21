return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "mxsdev/nvim-dap-vscode-js",
    "jay-babu/mason-nvim-dap.nvim",
  },
  config = function()
    require("mason-nvim-dap").setup({
      automatic_installation = false,
      ensure_installed = { "js@v1.76.1",},
    })
    require('dap-vscode-js').setup({
      debugger_path = vim.fn.stdpath('data') .. '/mason/packages/js-debug-adapter',
      debugger_cmd = { 'js-debug-adapter' },
      adapters = { 'chrome', 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost', 'node', 'chrome' },
    })

    local dap, dapui = require("dap"), require("dapui")
    dapui.setup()

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    vim.keymap.set("n", "<Leader>db", ":DapToggleBreakpoint<CR>")
    vim.keymap.set("n", "<F5>", ":DapContinue<CR>")
    vim.keymap.set("n", "<F10>", ":DapStepOver<CR>")
    vim.keymap.set("n", "<F6>", ":DapStepInto<CR>")
    vim.keymap.set("n", "<F7>", ":DapStepOut<CR>")
    vim.keymap.set("n", "<Leader>dx", ":DapTerminate<CR>")

    local js_based_languages = { "typescript", "javascript", "typescriptreact" }
    for _, language in ipairs(js_based_languages) do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "launch",
          name = "Launch file",
          program = "${file}",
          cwd = "${workspaceFolder}",
        },
        {
          type = "pwa-node",
          request = "attach",
          name = "Attach",
          processId = require 'dap.utils'.pick_process,
          cwd = "${workspaceFolder}",
          sourceMaps = true,
          resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**"},
          skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
      }
    end
  end
}
