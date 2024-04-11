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
