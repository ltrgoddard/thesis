phd.pdf: head.markdown fron.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown bibl.markdown figs/man.png
	cat fron.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown bibl.markdown | \
	pandoc -S -t markdown | \
	sed -e 's/\xe2\x80\x98s/\xe2\x80\x99s/g' | \
	sed -e 's/ \xe2\x80\x99s/ \xe2\x80\x98s/g' | \
	sed -e 's/ \xe2\x80\x99/ \xe2\x80\x98/g' | \
	sed -e 's/ \xe2\x80\x981/ \xe2\x80\x991/g' | \
	sed -e 's/ \xe2\x80\x982/ \xe2\x80\x992/g' | \
	sed -e 's/ \xe2\x80\x983/ \xe2\x80\x993/g' | \
	sed -e 's/ \xe2\x80\x984/ \xe2\x80\x994/g' | \
	sed -e 's/ \xe2\x80\x985/ \xe2\x80\x995/g' | \
	sed -e 's/ \xe2\x80\x986/ \xe2\x80\x996/g' | \
	sed -e 's/ \xe2\x80\x987/ \xe2\x80\x997/g' | \
	sed -e 's/ \xe2\x80\x988/ \xe2\x80\x998/g' | \
	sed -e 's/ \xe2\x80\x989/ \xe2\x80\x999/g' | \
	sed -e 's/ \xe2\x80\x98nine/ \xe2\x80\x99nine/g' > \
	temp.markdown
	pandoc -s head.markdown temp.markdown -o phd.pdf --filter pandoc-fignos

figs/man.png:
	bash figs/man.sh data/prynne.txt

clean:
	rm temp.markdown
