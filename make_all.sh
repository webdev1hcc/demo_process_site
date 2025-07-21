#!/bin/bash

asciidoctor -r ./prism-syntax-highlighter.rb -a toc=right -a linkcss -a source-highlighter=prism modules/module1/prebuilt/*.adoc
asciidoctor -r ./prism-syntax-highlighter.rb -a toc=right -a linkcss -a source-highlighter=prism modules/module2/prebuilt/*.adoc

cp modules/module1/prebuilt/*.html modules/module1/examples/
cp modules/module2/prebuilt/*.html modules/module2/examples/

npx antora --log-level=debug antora-playbook.yml --stacktrace
