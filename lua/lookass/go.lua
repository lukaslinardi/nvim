-- loading module to provide config for a server following steps from guide here
-- https://github.com/neovim/nvim-lspconfig/blob/ede4114e1fd41acb121c70a27e1b026ac68c42d6/doc/lspconfig.txt#L326
local configs = require 'lspconfig.configs'

-- copy paste from 
-- https://github.com/neovim/nvim-lspconfig/blob/ede4114e1fd41acb121c70a27e1b026ac68c42d6/lua/lspconfig/server_configurations/gopls.lua
local util = require 'lspconfig.util'
local async = require 'lspconfig.async'
-- -> the following line fixes it - mod_cache initially set to value that you've got from `go env GOMODCACHE` command
local mod_cache = '/home/lukas/go/pkg/mod'

-- setting the config for gopls, the contents below is also copy-paste from
-- https://github.com/neovim/nvim-lspconfig/blob/ede4114e1fd41acb121c70a27e1b026ac68c42d6/lua/lspconfig/server_configurations/gopls.lua
configs.gopls = {
    default_config = {
      cmd = { 'gopls' },
      filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
      root_dir = function(fname)
        -- see: https://github.com/neovim/nvim-lspconfig/issues/804
        if not mod_cache then
          local result = async.run_command 'go env GOMODCACHE'
          if result and result[1] then
            mod_cache = vim.trim(result[1])
          end
        end
        if fname:sub(1, #mod_cache) == mod_cache then
          local clients = vim.lsp.get_active_clients { name = 'gopls' }
          if #clients > 0 then
            return clients[#clients].config.root_dir
          end
        end
        return util.root_pattern 'go.work'(fname) or util.root_pattern('go.mod', '.git')(fname)
      end,
      single_file_support = true,
    },
    docs = {
      description = [[
  https://github.com/golang/tools/tree/master/gopls
  
  Google's lsp server for golang.
  ]],
      default_config = {
        root_dir = [[root_pattern("go.work", "go.mod", ".git")]],
      },
    },
  }
