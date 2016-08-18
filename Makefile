phd.pdf: ackn.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown bibl.markdown figs/man.png
	pandoc -s ackn.markdown intr.markdown chap1.markdown chap2.markdown chap3.markdown conc.markdown bibl.markdown -o phd.pdf --filter pandoc-fignos -V geometry:margin=1.25in

figs/man.png:
	bash figs/man.sh prynne.txt 
