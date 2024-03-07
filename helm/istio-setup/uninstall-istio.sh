#!/bin/bash

# Set the namespace and release name
#https://istio.io/latest/docs/setup/install/helm/
ISTIO_NAMESPACE="istio-system"
RELEASE_NAME="1.16.2"
BOOKAPP_NAMESPACE="book-app"


echo -e "Uninstalling ISTIO ${ISTIO_VERSION} version at ${ISTIO_NAMESPACE} namespace\n\n"


echo -e "List of Istio charts installed in ${ISTIO_NAMESPACE} namespace:\n"
helm ls -n ${ISTIO_NAMESPACE}
echo -e "\n\n\n"

echo -e "Delete any Istio gateway chart installations:\n"
helm delete ${ISTIO_NAMESPACE} -n ${ISTIO_NAMESPACE}
echo -e "\n"
kubectl delete namespace ${ISTIO_NAMESPACE}
echo -e "\n\n\n"


echo -e "Delete Istio discovery chart:\n"
helm delete istiod -n ${ISTIO_NAMESPACE}
echo -e "\n\n\n"

echo -e "Delete Istio base chart:\n"
helm delete istio-base -n ${ISTIO_NAMESPACE}
echo -e "\n\n\n"


echo -e "Uninstalling ISTIO Addons at ${ISTIO_NAMESPACE} namespace\n\n"


echo -e "Uninstalling Kiali at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} delete -f ${PWD}/configurations/kiali.yaml
echo -e "\n\n\n"    


echo -e "Delete existing ClusterIP Kiali service and create a NodePort service \n"
#kubectl -n ${ISTIO_NAMESPACE} delete svc kiali
#kubectl -n ${ISTIO_NAMESPACE} delete -f ${PWD}/configurations/Kiali-NodeportService.yaml
echo -e "\n\n\n"



echo -e "Uninstalling Jaeger at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} delete -f ${PWD}/configurations/jaeger.yaml
echo -e "\n\n\n"  


echo -e "Uninstalling Grafana at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} delete -f ${PWD}/configurations/grafana.yaml
echo -e "\n\n\n"  


echo -e "Uninstalling Prometheus at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} delete -f ${PWD}/configurations/prometheus.yaml
echo -e "\n\n\n"  



echo -e "Uninstalling Book App at ${BOOKAPP_NAMESPACE} namespace\n\n"
kubectl -n ${BOOKAPP_NAMESPACE} delete -f ${PWD}/configurations/bookinfo.yaml




echo -e " Delete the ${ISTIO_NAMESPACE} namespace:\n"
kubectl delete namespace ${ISTIO_NAMESPACE}
echo -e "\n\n\n"

echo -e " Verify that the release has been uninstalled:\n"
kubectl get all -n ${ISTIO_NAMESPACE} | grep ${RELEASE_NAME}


echo -e " Delete the ${BOOKAPP_NAMESPACE} namespace:\n"
kubectl delete namespace ${BOOKAPP_NAMESPACE}
echo -e "\n\n\n"


