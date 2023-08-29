SHELL=/bin/bash
ifndef PREFIX
	PREFIX = /usr/share/backgrounds
endif

all: build

build:
	bash create-xml.sh

install:
	@echo "Installing Pardus Background Images"
	mkdir -p $(DESTDIR)$(PREFIX)
	mkdir -p $(DESTDIR)/usr/share/gnome-background-properties
	for file in images/* ; do \
	    install $$file $(DESTDIR)$(PREFIX) ;\
	done
	install pardus-wallpaper-23-0.xml $(DESTDIR)/usr/share/gnome-background-properties/

clean:
	rm -f pardus-wallpaper-23-0.xml

uninstall:
	@echo "Removing Pardus Background Images"
	for file in images/* ; do \
	    rm -f $(DESTDIR)$(PREFIX)/$$file ;\
	done
	rm -f $(DESTDIR)/usr/share/gnome-background-properties/pardus-wallpaper-23-0.xml

.PHONY: install uninstall
