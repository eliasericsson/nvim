function ColorMyPencils(color)
    -- color = color or "catppuccin"
    -- color = color or "tokyonight"
    color = color or "gruvbox"
    vim.cmd.colorscheme(color)
end

ColorMyPencils()
