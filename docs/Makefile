# Source: https://gist.github.com/hjst/4f2f2c2ca9bd550e50c7f06cb17775b2
PLANTUML_JAR_URL = https://sourceforge.net/projects/plantuml/files/plantuml.jar/download
PLANTUML_EXEC = ../bin/plantuml.jar
DIAGRAMS_SRC := $(wildcard diagrams/*.plantuml)
DIAGRAMS_PNG := $(addsuffix .png, $(basename $(DIAGRAMS_SRC)))
DIAGRAMS_SVG := $(addsuffix .svg, $(basename $(DIAGRAMS_SRC)))

# Default target first; build png and svg
all: png svg

# build PNGs, probably what we want most of the time
png: $(PLANTUML_EXEC) $(DIAGRAMS_PNG)

# SVG are nice-to-have but don't need to build by default
svg: $(PLANTUML_EXEC) $(DIAGRAMS_SVG)

# clean up compiled files
clean:
	rm -f $(DIAGRAMS_PNG) $(DIAGRAMS_SVG)

# If the JAR file isn't already present, download it
$(PLANTUML_EXEC):
	curl -sSfL $(PLANTUML_JAR_URL) -o $(PLANTUML_EXEC)

# Each PNG output depends on its corresponding .plantuml file
diagrams/%.png: diagrams/%.plantuml
	java -jar $(PLANTUML_EXEC) -tpng $^

# Each SVG output depends on its corresponding .plantuml file
diagrams/%.svg: diagrams/%.plantuml
	java -jar $(PLANTUML_EXEC) -tsvg $^

# Quirk of GNU Make: https://www.gnu.org/software/make/manual/html_node/Phony-Targets.html
.PHONY: all png svg clean