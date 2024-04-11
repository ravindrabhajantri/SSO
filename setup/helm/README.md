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
 <p>How to check the postgres for keycloak tables<br>
 docker exec -it postgres bash<br>
 Connect: <br>
 psql -h localhost -U keycloak<br>
 List of databases: <br>
 \l<br>
 Connect to keycload DB:<br>
 \c keycloak<br>
 Show tables:<br>
 \dt<br>
 </p> 

 
<h1>Keycloak</h1>
<p>Connection URL	ldap://openldap:3891<br>
bind dn         cn=admin,dc=hdfcbank,dc=com<br>
Users DN	    dc=hdfcbank,dc=com<br>
</p>

<h1>phpldapadmin</h1>
Access from web:  http://localhost:8080/<br>
login dn:   cn=admin,dc=hdfcbank,dc=com<br>
password:   adminpassword<br>
