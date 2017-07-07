(load-library "url-handlers")

; Load a theme
(load-theme 'wombat)

; Unmap the right modifier key (alt)
(setq ns-right-alternate-modifier nil)

; Set the title of the window
(setq frame-title-format "emacs")

; remove menu and tool bars
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

; Show columns
(column-number-mode)
