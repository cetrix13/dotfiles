"Disable print key for Macvim
if has("gui_macvim")
    macmenu &File.Print key = <nop>
    " Change color of numbers column
    hi LineNr guifg=#4B4E4F  
    hi LineNr guibg=bg
    set foldcolumn=2                    " fake custom left padding for each windo    
    hi foldcolumn guibg=bg
    hi vertsplit guifg=bg guibg=bg
endif
