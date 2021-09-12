INPUT_FILES=$(wildcard notes/*/*.md notes/*/*/*.md)
OUTPUT_FILES=$(INPUT_FILES:.md=.html)

all: $(OUTPUT_FILES)

%.html: %.md template.html
	pandoc --toc "--output=$@" --from markdown --to html5 \
		--data-dir=. --template=template.html --katex \
		--variable=pagetitle:$(*F)\ \|\ Jasper\ Wang "$<"

clean:
	rm $(OUTPUT_FILES)
