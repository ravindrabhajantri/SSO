#!/bin/bash


#https://istio.io/v1.16/docs/examples/bookinfo/

# Set the namespace and release name
BOOKAPP_NAMESPACE="book-app"
ISTIO_NAMESPACE="istio-system"

echo -e "Installing Book Info app at ${BOOKAPP_NAMESPACE} namespace\n\n"
kubectl create namespace ${BOOKAPP_NAMESPACE}
kubectl -n ${BOOKAPP_NAMESPACE} apply -f ${PWD}/configurations/bookinfo.yaml
echo -e "\n\n\n"

echo -e "Check if the book info is installed\n"
kubectl  -n ${BOOKAPP_NAMESPACE} get all
echo -e "\n\n\n"


echo -e "Check if the book info is working:\n"
kubectl exec "$(kubectl get pod -n ${BOOKAPP_NAMESPACE} -l app=ratings -o jsonpath='{.items[0].metadata.name}')" -c ratings -- curl -sS productpage:9080/productpage | grep -o "<title>.*</title>"
echo -e "\n\n\n"


echo -e "Enable istio injection for ${BOOKAPP_NAMESPACE} namespace :\n"
kubectl label namespace ${BOOKAPP_NAMESPACE} istio-injection=enabled