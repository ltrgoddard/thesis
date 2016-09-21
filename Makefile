



phd.pdf: head.markdown fron.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown post.markdown bibl.markdown figs.markdown figs/man.png
	cat fron.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown post.markdown bibl.markdown figs.markdown | \
	pandoc -S -t markdown | \
	sed -e 's/\xe2\x80\x98s/\xe2\x80\x99s/g' \
	-e 's/\xe2\x80\x94\xe2\x80\x99s/\xe2\x80\x94\xe2\x80\x98s/g' \
	-e 's/\[\xe2\x80\x99/\[\xe2\x80\x98/g' \
	-e 's/(\xe2\x80\x99/(\xe2\x80\x98/g' \
	-e 's/ \xe2\x80\x99/ \xe2\x80\x98/g' \
	-e 's/ \xe2\x80\x982/ \xe2\x80\x992/g' \
	-e 's/ \xe2\x80\x983/ \xe2\x80\x993/g' \
	-e 's/ \xe2\x80\x984/ \xe2\x80\x994/g' \
	-e 's/ \xe2\x80\x985/ \xe2\x80\x995/g' \
	-e 's/\xe2\x80\x9860s/\xe2\x80\x9960s/g' \
	-e 's/ \xe2\x80\x987/ \xe2\x80\x997/g' \
	-e 's/ \xe2\x80\x988/ \xe2\x80\x998/g' \
	-e 's/ \xe2\x80\x989/ \xe2\x80\x999/g' \
	-e 's/\xe2\x80\x98mid/\xe2\x80\x99mid/g' \
	-e 's/\xe2\x80\x993-/\xe2\x80\x983-/g' \
	-e 's/\xe2\x80\x99N/\xe2\x80\x98N/g' | \
	perl -pne 's/\xe2\x80\x99s(?=[a-z])/\xe2\x80\x98s/g' > \
	temp.markdown
	pandoc -s -f markdown head.markdown temp.markdown -o phd.pdf --filter pandoc-fignos

figs/man.png:
	bash figs/man.sh data/prynne.txt

clean:
	rm temp.markdown
