# Trabalho Design e Desenvolvimento de Banco de Dados 
<br />
## Aluno: Rhayner Rossmann de Souza
<br />
### Diagrama SQL Power Architect

<p align="center"><img src="https://i.imgur.com/sKidXYDl.png"></p>

### Comandos:
  <p>Criar banco de dados</p>
  ```
     CREATE DATABASE uvv WITH OWNER = {seu usuario } TEMPLATE = template0 ENCODING = UTF8 LC_COLLATE = 'pt_BR.UTF-8' ALLOW_CONNECTIONS=true;
  ```
  ```
    2- CREATE SCHEME elmasri;
    3- SET SEARCH_PATH TO elmasri, "$user", public;
    4- ALTER USER {seu usuario } SET SEARCH_PATH TO elmasri, "$user", public;
  ```
