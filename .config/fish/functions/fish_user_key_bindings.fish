function fish_user_key_bindings --description 'vi-like key bindings for fish (with custom modifications)'
    fish_vi_key_bindings

    bind --mode insert --sets-mode default jk repaint
end
