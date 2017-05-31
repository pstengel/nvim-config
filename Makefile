SHELL := /bin/bash

.PHONY: backup force-uninstall install uninstall update

LINKS = $(addprefix $(HOME)/,.config/nvim .local/share/nvim)

backup:
	mkdir -p .backups
	-tar -zcf .backups/nvim-config-`date +%s`.tar.gz $(LINKS)

force-uninstall: backup
	rm -vfR $(LINKS)

install: $(LINKS)
	nvim -u <(sed '/call plug#end()/q' config/init.vim) +PlugInstall +qall

uninstall:
	-for i in $(LINKS); do test -L $$i && rm -vf $$i; done

update: install
	nvim +PlugUpdate +qall

$(LINKS):
	mkdir -p $(dir $@)
	ln -s $(abspath $(firstword $(subst /, ,$(@:$(HOME)/.%=%)))) $@
