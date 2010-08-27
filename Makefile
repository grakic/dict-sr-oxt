dict: clean description.xml
	mkdir build
	cp hunspell-sr/sr.aff hunspell-sr/sr.dic hunspell-sr/sr-Latn.aff hunspell-sr/sr-Latn.dic build/
	cp hyphen-sr/hyph_sr.dic hyphen-sr/hyph_sr-Latn.dic build/
	cp -r description.xml dictionaries.xcu registration META-INF build/
	cd build; zip -r dict-sr .
	mv build/dict-sr.zip dict-sr.oxt

description.xml: description.xml.in VERSION
	sed -e 's/{VERSION}/`cat VERSION`/' < description.xml.in > description.xml

clean:
	rm -fr build
	rm -f description.xml

.PHONY: dict clean
