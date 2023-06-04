local colorscheme = "system76"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
end

function ColorMyPencils()
  -- vim.g.material_style = 'palenight' -- used with tokyo-night
	-- vim.cmd('colorscheme material')
	vim.cmd('colorscheme ' .. colorscheme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

end

ColorMyPencils()
