TEX = pdflatex
DIR = bin/

# Output files in bin/
OUT = Curriculum_Vitae
SRC := $(wildcard src/*.tex)

# Flags used by pdflatex
TFLAGS = -output-format pdf -output-directory $(DIR) -jobname $(OUT)

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

$(OUT) : $(DIR)
	@echo "Adding personal infos"
	sed -i 's/<E-Mail>/$(EMAIL)/g' $(firstword $(SRC))
	sed -i 's/<Mobile Phone Number>/$(PHON)/g' $(firstword $(SRC))
	sed -i 's/<Address>/$(ADDR)/g' $(firstword $(SRC))
	sed -i 's/<Birthday>/$(BDAY)/g' $(firstword $(SRC))
	@echo "Compiling the source"
	$(TEX) $(TFLAGS) $(SRC)

$(DIR) :
	@echo "Creating binary directory"
	mkdir $(DIR)
