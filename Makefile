.PHONY: install uninstall

install:
	oc create -f ./manifests

uninstall:
	oc delete -f ./manifests
