.PHONY: all data clean

all: report.pdf  eda-output.txt regression.RData

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Advertising.csv > data/Advertising.csv

report.pdf: report/report.Rmd data/regression.RData images/scatter-tv-sales.png
	pandoc report/report.Rmd -s -o report/report.pdf

eda-output.txt: code/eda-script.R data/Advertising.csv
	Rscript code/eda-script.R
	mv eda-output.txt data
	rm Rplots.pdf
	
regression.RData: code/regression-script.R data/Advertising.csv
	Rscript code/regression-script.R
	rm Rplots.pdf

clean:
	rm -f report/report.Rmd
	rm -f report/report.pdf