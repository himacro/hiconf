-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer_init.lua source <afile> | PackerSync
augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
	return
end

-- Install plugins
return packer.startup(function(use)
	-- Add you plugins here:
	use 'wbthomason/packer.nvim' -- packer can manage itself

	-- File explorer
	use 'kyazdani42/nvim-tree.lua'

	-- Indent line
	use 'lukas-reineke/indent-blankline.nvim'

	-- Autopair
	use {
		'windwp/nvim-autopairs',
		config = function()
			require('nvim-autopairs').setup{}
		end
	}

	-- Icons
	use 'kyazdani42/nvim-web-devicons'

	-- Tag viewer
	use 'preservim/tagbar'

--	-- Treesitter interface
--	use {
--		'nvim-treesitter/nvim-treesitter',
--		run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
--	}

	-- Color schemes
	use 'navarasu/onedark.nvim'
	use 'tanvirtin/monokai.nvim'
	use { 'rose-pine/neovim', as = 'rose-pine' }

  -- Autocomplete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-buffer',
			'saadparwaiz1/cmp_luasnip',
		},
    config = function()
      require('plugins-setup/nvim-cmp' )
    end
    }

	-- LSP
  use {
    'williamboman/nvim-lsp-installer',
    config = function()
      require('nvim-lsp-installer').setup{}
    end
  }

	use {
    'neovim/nvim-lspconfig',
		requires = {
      'williamboman/nvim-lsp-installer',
      'hrsh7th/nvim-cmp',
    },
    config = function()
      require('plugins-setup/nvim-lspconfig')
    end
  }

	-- Statusline
	use {
		'feline-nvim/feline.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
	}

--	-- git labels
--	use {
--		'lewis6991/gitsigns.nvim',
--		requires = { 'nvim-lua/plenary.nvim' },
--		config = function()
--			require('gitsigns').setup{}
--		end
--	}

	-- Dashboard (start screen)
	use {
		'goolord/alpha-nvim',
		requires = { 'kyazdani42/nvim-web-devicons' },
	}

  use {
    'tjdevries/nlua.nvim',
  }

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('plugins-setup/telescope')
    end
  }

  use {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    },
    config = function ()
      require('plugins-setup/neo-tree')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
      require('nvim-treesitter.install').update({ with_sync = true })
    end,
    config = function()
      require('plugins-setup/nvim-treesitter')
    end
  }

  use {
    'nanozuki/tabby.nvim',
    config = function()
      require('plugins-setup/tabby')
    end
  }

--  use {
--    "numToStr/FTerm.nvim",
--    config = function()
--      require('plugins-setup/FTerm')
--    end
--  }

  use {
    "akinsho/toggleterm.nvim", 
    tag = '*',
    config = function()
      require('plugins-setup/toggleterm')
    end
  }

  use {
    "LhKipp/nvim-nu",
    requires = {
      "nvim-treesitter/nvim-treesitter"
    },
    run = function()
      vim.cmd('TSInstall nu')
    end,
    config = function()
      require('nu').setup({
          complete_cmd_names = false, 
      })
    end
  }

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)



