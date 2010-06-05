
NAME = flyspray
VERSION = 0.9.9.6

all:

fetch:
	@if [ ! -d distfiles ];then \
		mkdir distfiles; \
		wget http://flyspray.org/$(NAME)-$(VERSION).zip; \
		cd distfiles; unzip -q ../$(NAME)-$(VERSION).zip; \
		cd ..; \
		rm $(NAME)-$(VERSION).zip; \
		fi

dist: fetch
	cp -r distfiles xoops-mod-$(NAME)-$(VERSION); \
		cp -r addons/* xoops-mod-$(NAME)-$(VERSION); \
		cd xoops-mod-$(NAME)-$(VERSION); \
		for i in ../patches/*;do \
		patch -p1  < $$i; \
		done
