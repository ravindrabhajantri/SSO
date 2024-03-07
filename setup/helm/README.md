run sso setup helm
run istio-setup script

kubectl -n book-app get all

node product page ip


run this
 for i in $(seq 1 100); do curl -s -o /dev/null "http://127.0.0.1:30315/productpage"; done

kubectl -n istio-sytem get all
note the nodeport port
http://localhost:30770/kiali    where 30770 is the node port 
now access kiali dashboard 




Links:
https://istio.io/latest/docs/setup/install/helm/ for installing istio using helm
https://istio.io/v1.16/docs/setup/getting-started/ for setup and mesh related links
https://istio.io/v1.16/docs/examples/bookinfo/   for book app related info
https://istio.io/latest/docs/tasks/security/authorization/authz-jwt/    for jwt related info
https://github.com/shehbaz-pathan/istio-keycloak for authorization policy related info
https://istio.io/latest/docs/tasks/observability/kiali/  visualizing through Kiali
 
 
 
 keycloak: cn=admin,dc=example,dc=org 
 ldap://openldap:1389
