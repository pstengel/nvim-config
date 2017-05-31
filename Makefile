SHELL := /bin/bash

.PHONY: clean install update

LINKS = $(addprefix $(HOME)/,.config/nvim .local/share/nvim)

all: install

clean:
	git clean -ffdx

install: $(LINKS)
	brew install neovim
	nvim -u <(sed '/call plug#end()/q' config/init.vim) +PlugInstall +qall

update: install
	brew upgrade neovim || true
	nvim +PlugUpdate +qall

$(LINKS):
	mkdir -p $(dir $@)
	ln -s $(abspath $(firstword $(subst /, ,$(@:$(HOME)/.%=%)))) $@
