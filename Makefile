SYMFONY_VERSION=6.3.*

help:
	@echo "Feral Docker Kit"
	@echo
	@echo "The Makefile provides tasks on Linux/Mac computers."
	@echo
	@echo "Targets"
	@echo
	@echo "	help:		Show this help page. Default."
	@echo "	install:	Install the Feral system with Symfony '${SYMFONY_VERSION}'"
	@echo
	@echo
	@echo

install-symfony:
	composer create-project symfony/skeleton:"${SYMFONY_VERSION}" ./temp
	mv -f ./temp/* ./ 2>/dev/null
	rm -Rf ./temp

install-sleep:
	@echo
	@echo
	@echo "Sleeping for 20 seconds for the filesystem to catch up."
	@echo "While you wait, some fun facts"
	@echo "- Did you know it only takes 2 weeks for a .NET developer to become feral? Well, that's what we think at least."
	@echo "- Did you know our documentation can be found at https://www.feralccf.com/ ?"
	@echo
	@echo
	sleep 20

install-feral:
	mkdir -p src/Process/NodeCode var/processes
	curl https://www.feralccf.com/files/feral_inline.yaml > config/packages/feral_inline.yaml
	composer require -W feral/inline

install: install-symfony install-sleep install-feral

remove:
	rm -Rf bin
	rm -Rf composer
	rm -Rf config
	rm -Rf temp
	rm -Rf public
	rm -Rf src
	rm -Rf temp
	rm -Rf var
	rm -Rf vendor
	rm -Rf composer.*
	rm -Rf symfony.*
	rm .env


.DEFAULT: help
.PHONY: help install version build rebuild server start stop clean term sniff test docs
