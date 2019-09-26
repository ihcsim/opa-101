.PHONY: linkerd-%
linkerd-%:
	linkerd $*

opa:
	kubectl apply -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml

policy:
	kubectl apply -f mtls.yaml

clean:
	$(MAKE) linkerd-install | kubectl delete -f -
	kubectl delete -f https://raw.githubusercontent.com/open-policy-agent/gatekeeper/master/deploy/gatekeeper.yaml
