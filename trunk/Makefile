
NAME = flyspray
VERSION = 0.9.9.6

all:

fetch:
	if [ ! -d distfiles ];then \
		mkdir distfiles; \
		wget http://flyspray.org/$(NAME)-$(VERSION).zip; \
		cd distfiles; unzip ../$(NAME)-$(VERSION).zip; \
		cd ..; \
		rm $(NAME)-$(VERSION).zip; \
		fi
