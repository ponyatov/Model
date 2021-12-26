
CURL = curl -L -o
PY   = $(shell which python3)
PIP  = $(shell which pip3)
PEP  = $(shell which autopep8)
PYT  = $(shell which pytest)

jupyter:
	LANG=C $@ notebook

install update:
	pip3 install --user -U `cat requirements.txt`


doc: doc/SmalltalkVMinPyPy.pdf

doc/SmalltalkVMinPyPy.pdf:
	$(CURL) $@ https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.144.8184&rep=rep1&type=pdf
