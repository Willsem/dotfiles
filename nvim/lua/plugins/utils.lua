return {
    {
        'mrjones2014/smart-splits.nvim',
    },

    {
        'kevinhwang91/nvim-hlslens',
        opts = {},
    },

    {
        'petertriho/nvim-scrollbar',
        -- v2 moves to main on 2026-11-16.
        branch = 'refactor/v2',
        opts = {
            exclude = {
                buftypes = {
                    'terminal',
                    'dashboard',
                },
                filetypes = {
                    'blink-cmp-menu',
                    'dropbar_menu',
                    'dropbar_menu_fzf',
                    'DressingInput',
                    'cmp_docs',
                    'cmp_menu',
                    'noice',
                    'prompt',
                    'TelescopePrompt',
                    'neo-tree',
                },
            },
            providers = {
                cursor = false,
                diagnostic = true,
                gitsigns = true,
                search = true,
                ale = false,
                marks = false,
            },
        },
    },

    {
        'rest-nvim/rest.nvim',
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            opts = function(_, opts)
                opts.ensure_installed = opts.ensure_installed or {}
                table.insert(opts.ensure_installed, 'http')
            end,
        },

        config = function(_, _)
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'json',
                callback = function(ev)
                    vim.bo[ev.buf].formatprg = 'jq'
                end,
            })

            vim.g.rest_nvim = {
                clients = {
                    curl = {
                        opts = {
                            certificates = {
                                ['https://prod.k.avito.ru/'] = {
                                    set_certificate_crt = '/Users/aostepanov/.avito/certs/personal.crt',
                                    set_certificate_key = '/Users/aostepanov/.avito/certs/personal.key',
                                },
                            },
                        },
                    },
                },
            }
        end,
    },
}
