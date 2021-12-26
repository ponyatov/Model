import os,sys

for d in ['.','bin','doc','lib','src','tmp','.vscode']:
    try: os.mkdir(d)
    except OSError: pass
    with open(f'{d}/.gitignore','w'): pass

for f in ['Makefile','README.md','requirements.txt']:
    with open(f,'w'): pass
