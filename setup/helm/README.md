<h1>ISTO Setup </h1>h1>
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
 
 
 <h1>Postgres</h1>
 How to check the postgres for keycloak tables

docker exec -it postgres bash

Connect: 
psql -h localhost -U keycloak
List of databases: 
\l
Connect to keycload DB
\c keycloak
Show tables
\dt

<h1>Keycloak</h1>
Connection URL	ldap://openldap:389
bind dn         cn=admin,dc=hdfcbank,dc=com 
Users DN	    dc=hdfcbank,dc=com


<h1>phpldapadmin</h1>
Access from web  http://localhost:8080/
login dn   cn=admin,dc=hdfcbank,dc=com
password   adminpassword
