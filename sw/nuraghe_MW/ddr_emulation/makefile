ddr_for_sim:
	cd  ../convoluzioni_SW/ &&  \
	gcc -o  convoluzione convoluzione.c  && ./convoluzione  &&  \
	cd ../ddr_emulation && \
	python post_training.py  settings.txt
