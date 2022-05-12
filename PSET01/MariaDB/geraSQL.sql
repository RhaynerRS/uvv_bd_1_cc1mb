/* INICIO CRIAÇÃO DAS TABELAS */
CREATE TABLE funcionarios (
                cpf CHAR(11) NOT NULL COMMENT 'cpf do funcionario',
                primeiro_nome VARCHAR(15) NOT NULL COMMENT 'primeiro nome do funcionario',
                nome_meio CHAR(1) COMMENT 'segundo nome do funcionario',
                ultimo_nome VARCHAR(15) NOT NULL COMMENT 'ultimo nome do funcionario',
                data_nascimento DATE COMMENT 'data de nascimento do funcionario', 
                endereco VARCHAR(70) COMMENT 'endereço do funcionario',
                sexo CHAR(1) COMMENT 'sexo do funcionario',
                salario DECIMAL(10,2) COMMENT 'salario do funcionario',
                cpf_supervisor CHAR(11) COMMENT  'cpf do supervisor do funcionario',
                numero_departamento INTEGER NOT NULL COMMENT 'numero de departamento do funcionario',
                CONSTRAINT cpf PRIMARY KEY (cpf)
) COMMENT = 'Tabela contendo os dados dos funcionarios da empresa';

CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL COMMENT 'numero do departamento',
                nome_departamento VARCHAR(15) NOT NULL COMMENT 'nome do departamento',
                data_inicio_gerente DATE COMMENT 'data em uqe o gerente iniciou no comando do departamento',
                cpf_gerente CHAR(11) NOT NULL COMMENT 'cpf do gerente do departamento',
                CONSTRAINT numero_departamento PRIMARY KEY (numero_departamento)
) COMMENT = 'Tabela contendo os dados dos departamentos da empresa';

CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL COMMENT 'numero do projeto',
                numero_departamento INTEGER NOT NULL COMMENT 'numero do departamento a qual o projeto pertence',
                nome_projeto VARCHAR(15) NOT NULL COMMENT 'nome do projeto',
                local_projeto VARCHAR(45) COMMENT 'local do projeto',
                CONSTRAINT numero_projeto PRIMARY KEY (numero_projeto)
) COMMENT = 'Tabela contendo os dados dos projetos da empresa';

CREATE UNIQUE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

CREATE TABLE trabalha_em (
                numero_projeto INTEGER NOT NULL COMMENT 'numero do projeto',
                cpf_funcionario CHAR(11) NOT NULL COMMENT 'cpf do funcionario',
                horas DECIMAL(3,1) NOT NULL COMMENT 'horas de trabalho de um funcionario no projeto',
                CONSTRAINT PFK PRIMARY KEY (numero_projeto, cpf_funcionario)
) COMMENT='Tabela de relacionamento entre funcionarios e projetos';

CREATE TABLE localizacoes_departamento (
                local VARCHAR(45) NOT NULL COMMENT 'local do projeto',
                numero_departamento INTEGER NOT NULL COMMENT  'numero do departamento responsavel pelo projeto',
                CONSTRAINT local PRIMARY KEY (local, numero_departamento)
) COMMENT='Tabela contendo os dados das localizaçoes dos projetos da empresa';

CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL COMMENT 'cpf do funcionarios que tem o dependente',
                nome_dependente VARCHAR(15) NOT NULL COMMENT 'nome do dependente do funcionario',
                sexo CHAR(1) COMMENT 'sexo do dependente',
                data_nascimento DATE COMMENT 'data do nascimento do dependente',
                parentesco VARCHAR(15) NOT NULL COMMENT 'parentesco entre dependente e funcionario',
                CONSTRAINT cpf_funcionario PRIMARY KEY (cpf_funcionario, nome_dependente)
)COMMENT = 'Tabela contendo os dados dos dependentes dos funcionarios';

/* FIM CRIAÇÃO DAS TABELAS */

/* INICIO DOS AlTER TABLES */
ALTER TABLE funcionarios ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION;
/* FIM DOS AlTER TABLES */