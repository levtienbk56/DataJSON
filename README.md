# PROBLEM
### create a webapp:
- login/logout function
- after login, the page has table which can view all account data (id, name, password) retrieve from Database
- insert/update/delete account
- search function, total record in Database ~100.000

---
# SETTING

## DATABASE

- jdbc:postgresql://localhost:5433/demojson

### create a login role:
- name: ntq
- pass: 1234
- can login

### create database "demojson"
- name: demojson

### create table  & data:
- run script in file data-DemoJSON.sql

## SOURCE CODE
### build file war on server
- https://www.dropbox.com/s/yrrp6c4jaydy4s7/DemoJSON.war?dl=0