(when (>= emacs-major-version 24)
     (require 'package)
     (package-initialize)
     (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
		      ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

;; 注意 elpa.emacs-china.org 是 Emacs China 中文社区在国内搭建的一个 ELPA 镜像

 ;; cl - Common Lisp Extension
 (require 'cl)

 ;; Add Packages
 (defvar my/packages '(
		;; --- Auto-completion ---
		company
		;; --- Better Editor ---
		hungry-delete
		swiper
		counsel
		smartparens
		;; --- Major Mode ---
		js2-mode
		web-mode
		php-mode
		htmlize
		;; --- Minor Mode ---
		nodejs-repl
		exec-path-from-shell
		;; --- Themes ---
		monokai-theme
	       
		;; solarized-theme
		org-preview-html
		) "Default packages")

 (setq package-selected-packages my/packages)

 (defun my/packages-installed-p ()
     (loop for pkg in my/packages
	   when (not (package-installed-p pkg)) do (return nil)
	   finally (return t)))

 (unless (my/packages-installed-p)
     (message "%s" "Refreshing package database...")
     (package-refresh-contents)
     (dolist (pkg my/packages)
       (when (not (package-installed-p pkg))
	 (package-install pkg))))

 ;; Find Executable Path on OS X
 (when (memq window-system '(mac ns))
   (exec-path-from-shell-initialize))



;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)





;;关闭工具栏
(tool-bar-mode -1)

;;关闭文件滑动控件
(scroll-bar-mode -1)`

;;显示行号
(global-linum-mode 1)

;;更改光标的样式
(setq-default cursor-type 'bar)

;;关闭启动帮助画面
(setq inhibit-splash-screen 1)

;;关闭自动生成的备份
(setq make-backup-files nil)

;;最近编辑过的文件
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-item 10)

;;更改显示字体大小 16pt
(set-face-attribute 'default nil :height 160)

;;修改默认字体
(set-default-font "JetBrains Mono" 16)

;;配置删除模式
(delete-selection-mode 1)

;;快速打开配置文件
(defun open-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;将打开init.el的功能绑定到<f2>按键上
(global-set-key (kbd "<f2>") 'open-init-file)
;;绑定recentf快捷键
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;org-mode 代码高亮
(setq org-src-fontify-natively t)
;;org 模式美化
;; 打开 org-indent mode
(setq org-startup-indented t)

;; 设置 bullet list

;; 设置 todo keywords
(setq org-todo-keywords
      '((sequence "TODO" "HAND" "|" "DONE")))
;;todo keywords 增加背景色
(setf org-todo-keyword-faces
      '(("TODO" . (:foreground "white" :background "#95A5A6"   :weight bold))
        ("HAND" . (:foreground "white" :background "#2E8B57"  :weight bold))
        ("DONE" . (:foreground "white" :background "#3498DB" :weight bold))))


;;默认全屏
(setq initial-frame-alist (quote ((fullscreen .maximized))))
;;启动括号匹配
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)
;;高亮当前行
(global-hl-line-mode 1)

;;安装主题
(add-to-list 'my/packages 'monokai-theme)
;;加载主题
(load-theme (quote monokai) 1)



;;开启全局Company 补全
(global-company-mode 1)

;;启用js2-mode 替换js-mode
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (emmet-mode git-gutter monokai-pro-theme company))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
