;;; org-screenshot-grim.el --- Take screenshots in org-mode using grim (Wayland) -*- lexical-binding: t; -*-
;;
;; Copyright (C) 2025 Alvar Maciel
;;
;; Author: Alvar Maciel <alvarmaciel@gmail.com>
;; Maintainer: Alvar Maciel <alvarmaciel@gmail.com>
;; Created: November 04, 2025
;; Modified: November 04, 2025
;; Version: 0.0.1
;; Package-Requires: ((emacs "24.3") (org "9.0"))
;; Keywords: convenience, org, screenshot, wayland
;; URL:  https://github.com/alvar/org-screenshot-grim
;; Homepage: https://github.com/alvar/org-screenshot-grim

;; This file is not part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;; This package provides org-mode screenshot functionality for Wayland
;; compositors using grim and slurp.

;;; Code:

(require 'org)

(defun org-screenshot-grim (arg)
  "Take screenshot using grim+slurp and insert link in org.
With prefix ARG, prompt for directory. Default: ./images/"
  (interactive "P")
  (let* ((default-dir "./images/")
         (img-dir (if arg
                      (read-directory-name "Screenshot directory: " default-dir)
                    default-dir))
         (filename (format "screenshot-%s.png" 
                          (format-time-string "%Y%m%d-%H%M%S")))
         (filepath (expand-file-name filename img-dir)))
    (unless (file-exists-p img-dir)
      (make-directory img-dir t))
    (shell-command (format "grim -g \"$(slurp)\" %s" filepath))
    (insert (format "[[file:%s]]" filepath))
    (org-display-inline-images)))

(provide 'org-screenshot-grim)
;;; org-screenshot-grim.el ends here
