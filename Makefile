all:
	make -s install

clean:
	rm -fr env

install:
	test -d env || pyvenv env
	if [ ! -d env/lib/python3*/site-packages/bs4 ]; then \
		. env/bin/activate && pip install -r requirements.txt; \
	fi
