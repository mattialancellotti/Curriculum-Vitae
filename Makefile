RM = rm -rfv
TEX = pdflatex

VPATH = template:$(SRC)

# Output files in bin/
OUT = cv
PDF = cv.pdf
SRC = cv.tex

# Flags used by pdflatex
TFLAGS = -output-format pdf -no-shell-escape -output-directory ./ -jobname $(OUT)

# Personal infos in the tex file
ifndef EMAIL
  EMAIL = defaultmail@test.com
endif

ifndef PHON
  PHON = +00 000 000 0000
endif

ifndef ADDR
  ADDR = Some Address
endif

ifndef BDAY
  BDAY = Some Date
endif

ifndef IMAGE
  IMAGE = photo.jpg
endif

$(PDF) : temp.tex
	@echo "Compiling the source"
	$(TEX) $(TFLAGS) temp.tex

temp.tex :
	sed -e 's/<E-Mail>/$(EMAIL)/g'\
		-e's/<Mobile Phone Number>/$(PHON)/g'\
		-e 's/<Address>/$(ADDR)/g'\
		-e 's/<Image>/$(IMAGE)/g'\
		-e 's/<Birthday>/$(BDAY)/g' $(SRC) > temp.tex

.PHONY: clean

clean :
	$(RM) $(PDF) temp.tex cv.log cv.aux
