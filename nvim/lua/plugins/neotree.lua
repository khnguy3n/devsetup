return {
    "nvim-neo-tree/neo-tree.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "MunifTanjim/nui.nvim",
        "kyazdani42/nvim-web-devicons",
        "mrbjarksen/neo-tree-diagnostics.nvim",
    },
    keys = {
      { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree" },
    },
    config = function()
        require("neo-tree.sources.common.components").diagnostics = function(_config, node, state)
            local diag = state.diagnostics_lookup or {}
            local diag_state = diag[node:get_id()]
            if not diag_state then
                return {}
            end
            return {
                text = ({
                    Error = "⛔ ",
                    Warn = "⚠️  ",
                    Info = "ℹ️  ",
                    Hint = "💭 ",
                })[diag_state.severity_string],
                highlight = "Diagnostic" .. diag_state.severity_string,
            }
        end

        require("neo-tree").setup {
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
            sources = {
                "filesystem",
                "buffers",
                "git_status",
                "diagnostics",
            },
            window = {
                position = "right",
                mappings = {
                    ["o"] = "open",
                    ["m"] = "cut_to_clipboard",
                    ["p"] = "paste_from_clipboard",
                    ["q"] = "close_window",
                    ["<ESC>"] = "close_window",
                },
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true,
                },
                follow_current_file = {
                    enabled = true,
                },
                hijack_netrw_behavior = "open_current",
                use_libuv_file_watcher = true,
            },
            default_component_configs = {
              indent = {
                indent_marker = "│",
              },
              modified = {
                symbol = "[+]",
                highlight = "NeoTreeModified",
              },
              git_status = {
                symbols = {
                  added = "+",
                  modified = "",
                  deleted = "✖",
                  renamed = "🎭",
                  untracked = "",
                  ignored = "🚷",
                  unstaged = "",
                  staged = "",
                  conflict = "⚔️",
                },
              },
            },
        }
    end,
    event = "VeryLazy",
}
