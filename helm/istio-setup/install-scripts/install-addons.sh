#!/bin/bash

#https://github.com/istio/istio/blob/release-1.16/samples/addons/kiali.yaml
ISTIO_NAMESPACE="istio-system"


echo -e "Installing Kiali at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} apply -f ${PWD}/configurations/kiali.yaml
echo -e "\n\n\n"    

echo -e "Rolling out the Kiali for the ${ISTIO_NAMESPACE} namespace\n"
kubectl rollout status deployment/kiali -n ${ISTIO_NAMESPACE}
echo -e "\n\n\n"


echo -e "Delete existing ClusterIP Kiali service and create a NodePort service \n"
kubectl -n ${ISTIO_NAMESPACE} delete svc kiali
kubectl -n ${ISTIO_NAMESPACE} apply -f ${PWD}/configurations/Kiali-NodeportService.yaml
echo -e "\n\n\n"



echo -e "Installing Jaeger at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} apply -f ${PWD}/configurations/jaeger.yaml
echo -e "\n\n\n"  


echo -e "Installing Grafana at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} apply -f ${PWD}/configurations/grafana.yaml
echo -e "\n\n\n"  


echo -e "Installing Prometheus at ${ISTIO_NAMESPACE} namespace\n\n"
kubectl -n ${ISTIO_NAMESPACE} apply -f ${PWD}/configurations/prometheus.yaml
echo -e "\n\n\n"  