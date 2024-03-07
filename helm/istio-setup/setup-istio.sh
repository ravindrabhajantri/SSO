#!/bin/bash

RED="\e[31m"
ENDCOLOR="\e[0m"

echo -e "${RED}Inalling Istio:\n${ENDCOLOR}"
sh ./install-scripts/install-istio.sh
echo -e "\n\n\n"


echo -e "${RED}Inalling Kiali:\n${ENDCOLOR}"
sh ./install-scripts/install-addons.sh
echo -e "\n\n\n"

echo -e "${RED}Inalling Book Application:\n${ENDCOLOR}"
sh ./install-scripts/install-bookapp.sh
echo -e "\n\n\n"


