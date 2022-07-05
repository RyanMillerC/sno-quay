.PHONY: install uninstall

install:
	helm install \
            --create-namespace \
            --namespace quay-enterprise \
            quay-enterprise .

uninstall:
	helm uninstall \
             --namespace quay-enterprise\
             quay-enterprise
	oc delete project quay-enterprise
