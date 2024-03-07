#!/bin/bash

# Set variables for Istio version and namespace
ISTIO_VERSION="1.16.2"
ISTIO_NAMESPACE="istio-system"

echo -e "ISTIO Installation to start for ${ISTIO_VERSION} version at ${ISTIO_NAMESPACE} namespace\n\n"
	
echo -e "Adding helm repo https://istio-release.storage.googleapis.com/charts:\n"
helm repo add istio https://istio-release.storage.googleapis.com/charts
echo -e "\n\n\n"


echo -e "Updating helm repo:\n"
helm repo update
echo -e "\n\n\n"

	
echo -e "Creating ${ISTIO_NAMESPACE} namespace:\n"
kubectl create namespace ${ISTIO_NAMESPACE}
echo -e "\n\n\n"

echo -e "Installing istio-base:\n"
helm install istio-base istio/base -n ${ISTIO_NAMESPACE} --set defaultRevision=${ISTIO_VERSION}
echo -e "\n\n\n"

echo -e "Validating the isto-base installation:\n"
helm ls -n istio-system
echo -e "\n\n\n"

echo -e "Install the Istio discovery chart which deploys the istiod service:\n"
helm install istiod istio/istiod -n istio-system --wait
echo -e "\n\n\n"


echo -e "Verify the Istio discovery chart installation:\n"
helm ls -n istio-system
echo -e "\n\n\n"


echo -e "Get the status of the installed helm chart to ensure it is deployed:\n"
helm status istiod -n istio-system
echo -e "\n\n\n"


echo -e "Check istiod service is successfully installed and its pods are running:\n"

kubectl get deployments -n ${ISTIO_NAMESPACE} --output wide
kubectl get svc -n ${ISTIO_NAMESPACE} --output wide
kubectl get pods -n ${ISTIO_NAMESPACE} --output wide
echo -e "\n\n\n"



echo -e "Install Istio gateway:\n"
#kubectl create namespace istio-ingress
#helm install istio-ingress istio/gateway -n istio-ingress --wait
echo -e "\n\n\n"


echo -e "Enable istio injection for ${BOOKAPP_NAMESPACE} namespace :\n"
kubectl label namespace ${BOOKAPP_NAMESPACE} istio-injection=enabled