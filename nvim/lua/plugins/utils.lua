return {
    {
        'mrjones2014/smart-splits.nvim',
    },

    {
        'kevinhwang91/nvim-hlslens',
        opts = {},
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
