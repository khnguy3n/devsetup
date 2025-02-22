return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"theHamsta/nvim-dap-virtual-text",
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			{
				"LiadOz/nvim-dap-repl-highlights",
				config = true,
				dependencies = { "mfussenegger/nvim-dap", "nvim-treesitter/nvim-treesitter" },
				build = function()
					if not require("nvim-treesitter.parsers").has_parser("dap_repl") then
						vim.cmd(":TSInstall dap_repl")
					end
				end,
			},
		},
		keys = {
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "DAP Continue",
			},
			{
				"<F6>",
				function()
					require("dap").step_into()
				end,
				desc = "DAP Step Into",
			},
			{
				"<F7>",
				function()
					require("dap").step_over()
				end,
				desc = "DAP Step Over",
			},
			{
				"<F8>",
				function()
					require("dap").step_out()
				end,
				desc = "DAP Step Out",
			},
			{
				"<leader>b",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
			{
				"<leader>B",
				function()
					require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
				end,
				desc = "Set Conditional Breakpoint",
			},
			{
				"<leader>lp",
				function()
					require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
				end,
				desc = "Set Log Point",
			},
			{
				"<leader>dr",
				function()
					require("dap").repl.open()
				end,
				desc = "Open DAP REPL",
			},
		},
		config = function()
			local dap = require("dap")
			local dapui = require("dapui")
			local dap_vt = require("nvim-dap-virtual-text")
			local dap_utils = require("dap.utils")

			-- Setup Virtual Text and UI
			dap_vt.setup({
				enabled = true,
				show_stop_reason = true,
				virt_text_pos = "eol",
			})

			dapui.setup({
				icons = { expanded = "▾", collapsed = "▸" },
				layouts = {
					{
						elements = { { id = "scopes", size = 0.25 }, "breakpoints", "watches" },
						size = 40,
						position = "left",
					},
					{ elements = { "repl", "console" }, size = 0.25, position = "bottom" },
				},
				floating = { border = "rounded", mappings = { close = { "q", "<Esc>" } } },
			})

			dap.set_log_level("TRACE")

			-- Auto open/close UI on debug events
			dap.listeners.before.attach["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.launch["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			-- Define signs
			vim.fn.sign_define("DapBreakpoint", { text = "🔵" })
			vim.fn.sign_define("DapBreakpointRejected", { text = "🔴" })
			vim.fn.sign_define("DapConditionalBreakpoint", { text = "🟡" })
			vim.fn.sign_define("DapStopped", { text = "🟢" })

			-- Adapter definitions
			dap.adapters["pwa-node"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			dap.adapters["pwa-chrome"] = {
				type = "server",
				host = "localhost",
				port = "${port}",
				executable = {
					command = "node",
					args = {
						vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js",
						"${port}",
					},
				},
			}

			-- Configurations for supported filetypes
			local exts = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue", "svelte" }
			for _, ext in ipairs(exts) do
				dap.configurations[ext] = {
					-- Example: Launch Chrome for client-side debugging
					{
						type = "pwa-chrome",
						request = "launch",
						name = 'Launch Chrome with "localhost"',
						url = function()
							return vim.fn.input("Enter URL: ", "http://localhost:3000")
						end,
						webRoot = "${workspaceFolder}",
						protocol = "inspector",
						sourceMaps = true,
						userDataDir = false,
						skipFiles = { "<node_internals>/**", "node_modules/**", "${workspaceFolder}/node_modules/**" },
						resolveSourceMapLocations = {
							"${webRoot}/*",
							"${webRoot}/apps/**/**",
							"${workspaceFolder}/apps/**/**",
							"${webRoot}/packages/**/**",
							"${workspaceFolder}/packages/**/**",
							"${workspaceFolder}/*",
							"!**/node_modules/**",
						},
					},
					-- Example: Launch current file with Node (pwa-node)
					{
						type = "pwa-node",
						request = "launch",
						name = "Launch Current File (pwa-node)",
						program = "${file}",
						cwd = "${workspaceFolder}",
						sourceMaps = true,
						protocol = "inspector",
						runtimeExecutable = "node",
						skipFiles = { "<node_internals>/**", "node_modules/**" },
						resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
					},
				}
			end
		end,
	},
}
