#set terminal svg size 600,400 dynamic enhanced fname 'arial'  fsize 10 mousing name "histograms_2" butt dashlength 1.0 
#set output 'histograms.2.svg'

set terminal postscript eps enhanced color font 'Helvetica,10' size 6,4
set output 'bitmanip.eps'

set bmargin 7

set boxwidth 0.9 absolute
set style fill   solid 1.00 border -1
set key inside right top vertical Right noreverse noenhanced autotitle nobox
set style histogram clustered gap 1 title textcolor lt -1
set datafile missing '-'
set style data histograms
set xtics border in scale 0,0 nomirror rotate by -25
set xtics font ", 18"
set xtics offset -6
set xtics  norangelimit
set xtics   ()
#set title "CPU Performance Comparison" 
set ylabel "Speedup" font ", 30"
set yrange [ 0.00000 : 5. ] noreverse nowriteback

plot 'bitmanip.csv' using 2:xtic(1) ti col, '' u 3 ti col, '' u 4 ti col, '' u 5 ti col, '' u 6 ti col
