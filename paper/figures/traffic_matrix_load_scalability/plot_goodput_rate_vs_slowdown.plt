###
###  Released under the MIT License (MIT) --- see ../LICENSE
###  Copyright (c) 2014 Ankit Singla, Sangeetha Abdu Jyothi, Chi-Yao Hong,
###  Lucian Popa, P. Brighten Godfrey, Alexandra Kolla, Simon Kassing
###

#####################################
### STYLING

# Terminal (gnuplot 4.4+); Swiss neutral Helvetica font
set terminal pdfcairo font "Helvetica, 24" linewidth 1.5 rounded dashed

# Line style for axes
set style line 80 lt rgb "#808080"

# Line style for grid
set style line 81 lt 0  # Dashed
set style line 81 lt rgb "#999999"  # Grey grid

# Grey grid and border
set grid back linestyle 81
set border 3 back linestyle 80
set xtics nomirror
set ytics nomirror

# Line styles
set style line 1 lt rgb "#2177b0" lw 2.4 pt 6 ps 1 dt 1
set style line 2 lt rgb "#fc7f2b" lw 2.4 pt 2 ps 1 dt 1
set style line 3 lt rgb "#2f9e37" lw 2.4 pt 3 ps 1 dt 1
set style line 4 lt rgb "#d42a2d" lw 2.4 pt 4 ps 1 dt 1
set style line 5 lt rgb "#80007F" lw 2.4 pt 5 ps 1 dt 1
set style line 6 lt rgb "#8a554c" lw 2.4 pt 8 ps 1 dt 1
set style line 7 lt rgb "#e079be" lw 2.4 pt 10 ps 1 dt 1
set style line 8 lt rgb "#7d7d7d" lw 2.4 pt 12 ps 1 dt 1

# Output
set output "pdf/plot_goodput_rate_vs_slowdown.pdf"

#####################################
### AXES AND KEY

# Title
# set title "Title"

# Axes labels
set xlabel "Traffic goodput rate (Gbit/s)" # Markup: e.g. 99^{th}, {/Symbol s}, {/Helvetica-Italic P}
set ylabel "Slowdown (real s / virtual s)" font ",22"

# Axes ranges
set xrange [0.01:]       # Explicitly set the x-range [lower:upper]
set yrange [1:]       # Explicitly set the y-range [lower:upper]
# set xtics (0, 100, 300, 500, 700, 900)
# set ytics <start>, <incr> {,<end>}
# set format x "%.0fK"  # Set the x-tic format, e.g. in this case it takes 2 sign. decimals: "24.13%""

# For logarithmic axes
set log x           # Set logarithmic x-axis
set log y           # Set logarithmic y-axis
# set mxtics 3        # Set number of intermediate tics on x-axis (for log plots)
# set mytics 3        # Set number of intermediate tics on y-axis (for log plots)

# Font of the key (a.k.a. legend)
set key font ",14"
set key reverse
set key top left Left
set key spacing 1.3

#####################################
### PLOTS
set datafile separator ","
plot    "../../ns3_experiments/traffic_matrix_load/data/traffic_goodput_rate_vs_slowdown.csv" using ($2 / 1e3):(stringcolumn(1) eq "tcp" ? $3 : 1/0) title "TCP workload" w points ls 1, \
        "../../ns3_experiments/traffic_matrix_load/data/traffic_goodput_rate_vs_slowdown.csv" using ($2 / 1e3):(stringcolumn(1) eq "udp" ? $3 : 1/0) title "UDP workload" w points ls 2, \

