RM = rm -rfv
TEX = pdflatex
BIN = bin
SRC = src

VPATH = template:$(SRC)

# Output files in bin/
OUT = cv
PDF = cv.pdf

# Flags used by pdflatex
TFLAGS = -output-format pdf -output-directory $(BIN) -jobname $(OUT)

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

$(PDF) : dirs cv.tex
	@echo "Compiling the source"
	$(TEX) $(TFLAGS) $(SRC)/cv.tex

cv.tex : cv-template.tex
	sed -e 's/<E-Mail>/$(EMAIL)/g'\
		-e's/<Mobile Phone Number>/$(PHON)/g'\
		-e 's/<Address>/$(ADDR)/g'\
		-e 's/<Birthday>/$(BDAY)/g' $< > $(SRC)/$@

dirs :
	@echo "Creating the necessary folders"
	mkdir -p $(BIN) $(SRC)

.PHONY: clean cleanall

clean :
	$(RM) $(BIN)

cleanall :
	$(RM) $(BIN) $(SRC)
