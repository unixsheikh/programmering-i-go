CREATE_DATE = 2015-12-31
DATE_FORMAT = +%Y-%m-%d
# pygments, kate, monochrome, espresso, haddock, tango, zenburn
HTML_CODE_STYLE = zenburn
CREATED_STR = Oprettet:
LAST_UPDATED_STR = Sidst opdateret:
EPUB_TITLE_FILE = inc/epub_title.txt
BOOK_FILENAME = public_html/programmering_i_go

all: html pdf epub

html:
	cp inc/css/* public_html/css/
	cp img/* public_html/img/
	cp inc/.htaccess public_html/
	cp inc/favicon.ico public_html/
	pandoc -s --highlight-style $(HTML_CODE_STYLE) -w html5 --template inc/default.html5 --toc -c css/html.css -H inc/header.html -A inc/footer.html -o public_html/index.html inc/html_logo_and_date.txt README.md `cat sections.txt`
	grep -rl "##DATEFIELD##" public_html/index.html | xargs sed -i "s/##DATEFIELD##/<span style='font-size:small;'>$(CREATED_STR) $(CREATE_DATE). $(LAST_UPDATED_STR) `date '$(DATE_FORMAT)'`<\/span>/"
	grep -rl "img" public_html/index.html | xargs sed -i 's#" />#">#'

html-pdf:
	pandoc -s -w html5 --template inc/default_pdf.html5 --toc -c css/html_pdf.css -H inc/header.html -A inc/footer.html -o public_html/index_pdf.html inc/html_logo_and_date.txt README.md `cat sections.txt`
	grep -rl "##DATEFIELD##" public_html/index_pdf.html | xargs sed -i "s/##DATEFIELD##/<span style='font-size:small;'>$(CREATED_STR) $(CREATE_DATE). $(LAST_UPDATED_STR) `date '$(DATE_FORMAT)'`<\/span>/"
	grep -rl "img" public_html/index_pdf.html | xargs sed -i 's#" />#">#'

# Create the PDF file from HTML using Webkit.
# We need to remove the Github ribbon.
pdf: html-pdf
	cp public_html/index_pdf.html public_html/index_pdf.tmp.html
	sed -i '3d' public_html/index_pdf.tmp.html
	wkhtmltopdf --no-pdf-compression --footer-right "Side [page] af [toPage]" -s A4 public_html/index_pdf.tmp.html $(BOOK_FILENAME).pdf
	rm public_html/index_pdf.tmp.html
	rm public_html/index_pdf.html

# We need to remove the DATEFIELD from the title file as we don't want to see that in the EPUB.
epub:
	cp $(EPUB_TITLE_FILE) $(EPUB_TITLE_FILE).tmp
	sed -i '3d' $(EPUB_TITLE_FILE).tmp
	pandoc -s -w epub3 --self-contained $(TOC) $(EPUB_TITLE_FILE).tmp $(CHAPTERS) -o $(BOOK_FILENAME).epub
	rm -f $(EPUB_TITLE_FILE).tmp

