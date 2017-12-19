CREATE_DATE = 2015-12-31
DATE_FORMAT = +%Y-%m-%d
# pygments, kate, monochrome, espresso, haddock, tango, zenburn
HTML_CODE_STYLE = zenburn
CREATED_STR = Oprettet:
LAST_UPDATED_STR = Sidst opdateret:
BOOK_FILENAME = docs/programmering_i_go

all: html pdf epub

html:
	cp inc/css/* docs/css/
	cp img/* docs/img/
	cp inc/.htaccess docs/
	cp inc/favicon.ico docs/
	pandoc -s --highlight-style $(HTML_CODE_STYLE) -w html5 --template inc/default.html5 --toc -c css/html.css -H inc/header.html -A inc/footer.html -o docs/index.html inc/html_logo_and_date.txt README.md `cat sections.txt`
	grep -rl "##DATEFIELD##" docs/index.html | xargs sed -i "s/##DATEFIELD##/<span style='font-size:small;'>$(CREATED_STR) $(CREATE_DATE). $(LAST_UPDATED_STR) `date '$(DATE_FORMAT)'`<\/span>/"
	grep -rl "img" docs/index.html | xargs sed -i 's#" />#">#'

