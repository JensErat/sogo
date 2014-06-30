clean:
	rm -r *.html

html:
	textutil -convert html SOGo\ Installation\ Guide.odt
	basex cleanup.xq >SOGo-Installation-Guide.html

asciidoc:
	pandoc -o SOGo-Installation-Guide.asciidoc -t asciidoc SOGo-Installation-Guide.html

docbook:
	asciidoc -a docinfo2 -b docbook -d book -d book -o SOGo-Installation-Guide.docbook SOGo-Installation-Guide.asciidoc
	
pdf:
	fop -c fonts/fop-config.xml   -xsl docbook/xsl/packetfence-fo.xsl -xml SOGo-Installation-Guide.docbook  -pdf SOGo-Installation-Guide.pdf
	