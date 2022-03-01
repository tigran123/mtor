MOD = mtor
SHELL = /bin/bash
LATEX = xelatex -halt-on-error $(MOD) < /dev/null > /dev/null 2>&1

all::		$(MOD).pdf

.PHONY:		clean

clean::		
		@rm -f $(MOD)*.{toc,aux,bibtoc,fnchk,idx,ilg,ind,lof,log,out,pdf}

$(MOD).pdf:	mtor.sty mtor.tex
		$(LATEX)
ifndef DRAFT
		@if test -f $(MOD).idx; then makeindex -q $(MOD); fi
		$(LATEX)
		@if test -f $(MOD).idx; then makeindex -q $(MOD); fi
		$(LATEX)
		@if test -f $(MOD).idx; then makeindex -q $(MOD); fi
endif
