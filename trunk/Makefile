NAME = flyspray
VERSION = 0.9.9.6
modver = `php -r 'error_reporting(0);include "addons/xoops_version.php";echo "$$modversion['version']";'`
distdir = xoops-mod-$(NAME)-$(modver)

fetch:
	@echo Downloading the $(NAME)-$(VERSION).zip ...; \
		if [ ! -d distfiles ];then \
		mkdir distfiles; \
		wget -q http://flyspray.org/$(NAME)-$(VERSION).zip; \
		cd distfiles; unzip -q ../$(NAME)-$(VERSION).zip; \
		cd ..; \
		rm $(NAME)-$(VERSION).zip; \
		fi

dist: fetch
	@echo Creating $(distdir).tar.gz ...; \
		if [ -d $(distdir) ]; \
		then rm -rf $(distdir); \
		fi; \
		cp -r distfiles $(distdir); \
		rm -rf $(distdir)/setup; \
		cp -r addons/* $(distdir); \
		cd $(distdir); \
		for i in ../patches/*;do \
		patch -s -p1  < $$i; \
		done; \
		cd ..; \
		tar -zcf $(distdir).tar.gz $(distdir); \
		rm -rf $(distdir); \
		echo $(distdir).tar.gz is ready.
release: dist
	googlecode_upload.py -s $(distdir).tar.gz -p flyspray-xoops -u yetist@gmail.com -l Featured,Type-Source,OpSys-Linux $(distdir).tar.gz

clean:
	@[ -d distfiles ] && rm -rf distfiles
	@[ -f $(distdir).tar.gz ] && rm -f $(distdir).tar.gz
