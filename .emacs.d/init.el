; (add-to-list 'load-path "~/.emacs.d")
  (load-file "c:/Users/ngarg/AppData/Roaming/.emacs.d/init-common.el")
  (add-hook 'emacs-startup-hook (lambda () 
 				(find-file "d:/hotkey/contacts/tasks/todo.txt")))

