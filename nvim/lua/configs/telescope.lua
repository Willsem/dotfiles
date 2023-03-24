local actions = require("telescope.actions")

require("telescope").setup({
    defaults = {
        prompt_prefix = " ",
        selection_caret = "❯ ",
        mappings = {
            i = {
                ["<C-n>"] = actions.cycle_history_next,
                ["<C-p>"] = actions.cycle_history_prev,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous
            },
            n = {["q"] = actions.close}
        },
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.6,
                results_width = 0.8
            },
            vertical = {mirror = false},
            width = 0.85,
            height = 0.85,
            preview_cutoff = 120
        }
    }
})
