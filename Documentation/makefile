# requires tcllib (mac only?), basex, pandoc

clean:
	rm -r *.html

html:
	textutil -convert html SOGo\ Installation\ Guide.odt
	
clean-html:
	basex cleanup.xq >SOGo-Installation-Guide.html

asciidoc:
	pandoc -o SOGo-Installation-Guide.asciidoc -t asciidoc SOGo-Installation-Guide.html
	sed -i "s/\`/+/g" SOGo-Installation-Guide.asciidoc
	sed -i '/^\[width=.*\]$$/d' SOGo-Installation-Guide.asciidoc
	sed -i -r 's/^(\* )?❏/* /' SOGo-Installation-Guide.asciidoc
	sed -i -r 's/^\+❏/* +/' SOGo-Installation-Guide.asciidoc
	sed -i -r 's/\+-/+ -/' SOGo-Installation-Guide.asciidoc
	sed -i 's/http:\/\/127\.0\.0\.1:20000/http:\/\/127.0.0.1:20000 /' SOGo-Installation-Guide.asciidoc
	sed -i "1i Installation and Configuration Guide\n====================================" SOGo-Installation-Guide.asciidoc

docbk:
	asciidoc -a docinfo2 -b docbook -d book -d book -o SOGo-Installation-Guide.docbook SOGo-Installation-Guide.asciidoc
	
pdf:
	fop -c fonts/fop-config.xml   -xsl docbook/xsl/packetfence-fo.xsl -xml SOGo-Installation-Guide.docbook  -pdf SOGo-Installation-Guide.pdf
	
