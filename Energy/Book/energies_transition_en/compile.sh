#!/bin/bash

pdflatex main.tex 
biber main
pdflatex main.tex 
pdflatex main.tex 
makeindex main.nlo -s nomencl.ist -o main.nls
makeglossaries main
pdflatex main.tex
