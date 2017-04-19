SHELL := /bin/bash

.PHONY: clean download-fonts install update

FONT_PATH = $(HOME)/Library/Fonts
LINKS = $(addprefix $(HOME)/,.config/nvim .local/share/nvim)

all: install

clean:
	rm -f $(LINKS) $(FONT_PATH)/Inconsolata-Regular.ttf \
		$(FONT_PATH)/Inconsolata-Bold.ttf
	git clean -ffdx

download-fonts:
	mkdir -p $(FONT_PATH)
	wget -nv -O $(FONT_PATH)/Inconsolata-Regular.ttf \
		https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Regular.ttf
	wget -nv -O $(FONT_PATH)/Inconsolata-Bold.ttf \
		https://github.com/google/fonts/raw/master/ofl/inconsolata/Inconsolata-Bold.ttf

install: download-fonts $(LINKS)
	brew install neovim
	nvim -u <(sed '/call plug#end()/q' config/init.vim) +PlugInstall +qall

update: install
	brew upgrade neovim || true
	nvim +PlugUpdate +qall

$(LINKS):
	mkdir -p $(dir $@)
	ln -s $(abspath $(firstword $(subst /, ,$(@:$(HOME)/.%=%)))) $@
