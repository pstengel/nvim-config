SHELL := /bin/bash

.PHONY: backup force-uninstall install uninstall update

CONFIG = $(addprefix $(HOME)/,.config/nvim .local/share/nvim)
LINKS = $(addprefix $(HOME)/,.config/nvim/init.vim .local/share/nvim/site/autoload)

backup:
	mkdir -p .backups
	-tar -zcf .backups/nvim-config-`date +%s`.tar.gz $(CONFIG)

force-uninstall: backup
	rm -vfR $(CONFIG)

install: $(LINKS)
	git submodule update --init
	nvim -u <(sed '/call plug#end()/q' init.vim) +PlugInstall +PlugClean! +qall

uninstall:
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done

update: install
	nvim +PlugUpdate +qall

$(HOME)/.config/nvim/init.vim: init.vim
	mkdir -p $(dir $@)
	ln -s $(abspath $<) $@

$(HOME)/.local/share/nvim/site/autoload: vim-plug
	mkdir -p $(dir $@)
	ln -s $(abspath $<) $@
