phd.pdf: head.markdown fron.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown bibl.markdown figs.markdown figs/man.png
	cat fron.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown bibl.markdown figs.markdown | \
	pandoc -S -t markdown | \
	sed -e 's/\xe2\x80\x98s/\xe2\x80\x99s/g' \
	-e 's/\xe2\x80\x94\xe2\x80\x99s/\xe2\x80\x94\xe2\x80\x98s/g' \
	-e 's/\[\xe2\x80\x99/\[\xe2\x80\x98/g' \
	-e 's/(\xe2\x80\x99/(\xe2\x80\x98/g' \
	-e 's/ \xe2\x80\x99/ \xe2\x80\x98/g' \
	-e 's/\xe2\x80\x993-/\xe2\x80\x983-/g' \
	-e 's/\xe2\x80\x99N/\xe2\x80\x98N/g' | \
	perl -pne 's/\xe2\x80\x98(?=[0-9]{2}[s| ])/\xe2\x80\x99/g' | \
	perl -pne 's/\xe2\x80\x99s(?=[a-z])/\xe2\x80\x98s/g' > \
	temp.markdown
	pandoc -s head.markdown temp.markdown -o phd.pdf --filter pandoc-fignos

figs/man.png:
	Rscript figs/man.R

clean:
	rm temp.markdown
