TMPDIR=.tmp

all: article

article: article.pdf

article.tmp: article.tex article-content.tex references.bib
	latexmk -pdf -interaction=nonstopmode -f $<

article.pdf: article.tmp
	cp $(TMPDIR)/$@ $@

check: article.tmp
	checkcites --backend biber $(TMPDIR)/article

clean:
	rm -rf $(TMPDIR)
	#latexmk -c

.PHONY: all check clean article
