# org-screenshot-grim

Take screenshots in Org-mode using grim and slurp for Wayland compositors.

## Requirements

- Emacs 24.3+
- Org-mode 9.0+
- `grim` - Screenshot utility for Wayland
- `slurp` - Region selector for Wayland

## Installation

### With Doom Emacs

Add to your `~/.config/doom/packages.el`:
```elisp
(package! org-screenshot-grim
  :recipe (:host github :repo "alvarmaciel/org-screenshot-grim"))
```

Run:
```bash
doom sync
```

Add to your `~/.config/doom/config.el`:
```elisp
(use-package! org-screenshot-grim
  :after org
  :config
  (map! :after org
        :map org-mode-map
        "C-c s c" #'org-screenshot-grim))
```

### Manual Installation

Clone the repository and add to your load path:
```elisp
(add-to-list 'load-path "/path/to/org-screenshot-grim")
(require 'org-screenshot-grim)
(define-key org-mode-map (kbd "C-c s c") 'org-screenshot-grim)
```

## Usage

- `C-c s c` - Take screenshot and insert link at point (saves to `./images/`)
- `C-u C-c s c` - Prompt for directory before taking screenshot

The screenshot will be automatically linked in your org file and displayed inline if `org-inline-images` is enabled.

## License

GPL-3.0
