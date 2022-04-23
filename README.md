# Trabalho Design e Desenvolvimento de Banco de Dados 
## Aluno: Rhayner Rossmann de Souza

<p align="center"><img src="https://i.imgur.com/sKidXYDl.png"></p>

### Criar Banco de Dados:
  ```
    1- CREATE DATABASE uvv WITH OWNER = {seu usuario } TEMPLATE = template0 ENCODING = UTF8 LC_COLLATE = 'pt_BR.UTF-8' ALLOW_CONNECTIONS=true;
    2- CREATE SCHEME elmasri;
    3- SET SEARCH_PATH TO elmasri, "$user", public;
    4- ALTER USER {seu usuario } SET SEARCH_PATH TO elmasri, "$user", public;
  ```
