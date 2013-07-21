.PHONY: all test try-luajit try-lua

all: dist

dist:
	./util/mirror-tarballs

deb: dist
	./util/make-deb

test: all
	prove -r t

try-luajit: all
	cd ngx_openresty-`./util/ver` && ./configure --with-luajit

try-lua: all
	cd ngx_openresty-`./util/ver` && ./configure && $(MAKE)

