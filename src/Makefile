RM = rm -rfv
TEX = pdflatex

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

ifndef LINKEDIN
  LINKEDIN = in\/linkedin
endif

ifndef FULL_LINKEDIN
  LINKEDIN = https:\/\/linkedin.com\/in\/linkedin
endif

ifndef GITHUB
  GITHUB = github.com\/username
endif

ifndef FULL_GITHUB
  FULL_GITHUB = https:\/\/github.com\/username
endif

$(PDF) : temp.tex
	@echo "Compiling the source"
	$(TEX) $(TFLAGS) temp.tex

temp.tex :
	sed -e 's/<E-Mail>/$(EMAIL)/g'\
		-e 's/<Mobile Phone Number>/$(PHON)/g'\
		-e 's/<Address>/$(ADDR)/g'\
		-e 's/<Image>/$(IMAGE)/g'\
		-e 's/<LinkedIn>/$(LINKEDIN)/g'\
		-e 's/<GitHub>/$(GITHUB)/g'\
		-e 's/<FullGitHub>/$(FULL_GITHUB)/g'\
		-e 's/<FullLinkedIn>/$(FULL_LINKEDIN)/g'\
		-e 's/<Birthday>/$(BDAY)/g' $(SRC) > temp.tex

.PHONY: clean

clean :
	$(RM) $(PDF) temp.tex cv.log cv.aux
