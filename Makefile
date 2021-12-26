
# \ tool
CURL = curl -L -o
PY   = $(shell which python3)
PIP  = $(shell which pip3)
PEP  = $(shell which autopep8)
PYT  = $(shell which pytest)
# / tool

# \ src
Y += gen.py model.ipynb
S += $(Y)
# / src

jupyter:
	LANG=C $@ notebook

install update:
	pip3 install --user -U `cat requirements.txt`


doc: doc/SmalltalkVMinPyPy.pdf

doc/SmalltalkVMinPyPy.pdf:
	$(CURL) $@ https://citeseerx.ist.psu.edu/viewdoc/download?doi=10.1.1.144.8184&rep=rep1&type=pdf

# \ merge
SHADOW ?= shadow
MERGE   = Makefile README.md .gitignore requirements.txt $(S)
MERGE  += .vscode bin doc lib src tmp

.PHONY: shadow
shadow:
	git push -v
	git checkout $@
	git pull -v

.PHONY: dev
dev:
	git push -v
	git checkout $@
	git pull -v
	git checkout $(SHADOW) -- $(MERGE)
# / merge
