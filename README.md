# Trabalho Design e Desenvolvimento de Banco de Dados 
## Aluno: Rhayner Rossmann de Souza
### Diagrama SQL Power Architect

<p align="center"><img src="https://i.imgur.com/sKidXYDl.png"></p>

### Criar banco de dados:
    ```
        CREATE DATABASE uvv WITH OWNER = {seu usuario } TEMPLATE = template0 ENCODING = UTF8 LC_COLLATE = 'pt_BR.UTF-8' ALLOW_CONNECTIONS=true;
    ```
### Cria o schema do elmasri:
    ```
        CREATE SCHEME elmasri;
    ```
### Define o SEARCH_PATH para o schema do elmasri:
    ```
        SET SEARCH_PATH TO elmasri, "$user", public;
    ```
### Alter table:
    ```
        ALTER USER {seu usuario } SET SEARCH_PATH TO elmasri, "$user", public;
    ```
