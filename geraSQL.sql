/* INICIO CRIAÇÃO DAS TABELAS */
CREATE TABLE funcionarios (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_nome VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(70),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11),
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT cpf PRIMARY KEY (cpf)
);
COMMENT ON TABLE funcionarios IS 'Tabela contendo os dados dos funcionarios da empresa';
COMMENT ON COLUMN funcionarios.cpf IS 'cpf do funcionario';
COMMENT ON COLUMN funcionarios.primeiro_nome IS 'primeiro nome do funcionario';
COMMENT ON COLUMN funcionarios.nome_meio IS 'segundo nome do funcionario';
COMMENT ON COLUMN funcionarios.ultimo_nome IS 'ultimo nome do funcionario';
COMMENT ON COLUMN funcionarios.data_nascimento IS 'data de nascimento do funcionario';
COMMENT ON COLUMN funcionarios.endereco IS 'endereço do funcionario';
COMMENT ON COLUMN funcionarios.sexo IS 'sexo do funcionario';
COMMENT ON COLUMN funcionarios.salario IS 'salario do funcionario';
COMMENT ON COLUMN funcionarios.cpf_supervisor IS 'cpf do supervisor do funcionario';
COMMENT ON COLUMN funcionarios.numero_departamento IS 'numero de departamento do funcionario';

CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL,
                data_inicio_gerente DATE,
                cpf_gerente CHAR(11) NOT NULL,
                CONSTRAINT numero_departamento PRIMARY KEY (numero_departamento)
);
COMMENT ON TABLE departamento IS 'Tabela contendo os dados dos departamentos da empresa';
COMMENT ON COLUMN departamento.numero_departamento IS 'numero do departamento';
COMMENT ON COLUMN departamento.nome_departamento IS 'nome do departamento';
COMMENT ON COLUMN departamento.data_inicio_gerente IS 'data em uqe o gerente iniciou no comando do departamento';
COMMENT ON COLUMN departamento.cpf_gerente IS 'cpf do gerente do departamento';

CREATE UNIQUE INDEX departamento_idx
 ON departamento
 ( nome_departamento );

CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL,
                numero_departamento INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL,
                local_projeto VARCHAR(45),
                CONSTRAINT numero_projeto PRIMARY KEY (numero_projeto)
);
COMMENT ON TABLE projeto IS 'Tabela contendo os dados dos projetos da empresa';
COMMENT ON COLUMN projeto.numero_projeto IS 'numero do projeto';
COMMENT ON COLUMN projeto.numero_departamento IS 'numero do departamento a qual o projeto pertence';
COMMENT ON COLUMN projeto.nome_projeto IS 'nome do projeto';
COMMENT ON COLUMN projeto.local_projeto IS 'local do projeto';



CREATE UNIQUE INDEX projeto_idx
 ON projeto
 ( nome_projeto );

CREATE TABLE trabalha_em (
                numero_projeto INTEGER NOT NULL,
                cpf_funcionario CHAR(11) NOT NULL,
                horas DECIMAL(3,1) NOT NULL,
                CONSTRAINT PFK PRIMARY KEY (numero_projeto, cpf_funcionario)
);
COMMENT ON TABLE trabalha_em IS 'Tabela de relacionamento entre funcionarios e projetos';
COMMENT ON COLUMN trabalha_em.numero_projeto IS 'numero do projeto';
COMMENT ON COLUMN trabalha_em.cpf_funcionario IS 'cpf do funcionario';
COMMENT ON COLUMN trabalha_em.horas IS 'horas de trabalho de um funcionario no projeto';




CREATE TABLE localizacoes_departamento (
                local VARCHAR(45) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT local PRIMARY KEY (local, numero_departamento)
);
COMMENT ON TABLE localizacoes_departamento IS 'Tabela contendo os dados das localizaçoes dos projetos da empresa';
COMMENT ON COLUMN localizacoes_departamento.local IS 'local do projeto';
COMMENT ON COLUMN localizacoes_departamento.numero_departamento IS 'numero do departamento responsavel pelo projeto';


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15) NOT NULL,
                CONSTRAINT cpf_funcionario PRIMARY KEY (cpf_funcionario, nome_dependente)
);
COMMENT ON TABLE dependente IS 'Tabela contendo os dados dos dependentes dos funcionarios';
COMMENT ON COLUMN dependente.cpf_funcionario IS 'cpf do funcionarios que tem o dependente';
COMMENT ON COLUMN dependente.nome_dependente IS 'nome do dependente do funcionario';
COMMENT ON COLUMN dependente.sexo IS 'sexo do dependente';
COMMENT ON COLUMN dependente.data_nascimento IS 'data do nascimento do dependente';
COMMENT ON COLUMN dependente.parentesco IS 'parentesco entre dependente e funcionario';
/* FIM CRIAÇÃO DAS TABELAS */

/* INICIO DOS AlTER TABLES */
ALTER TABLE funcionarios ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionarios (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE localizacoes_departamento ADD CONSTRAINT departamento_localizacoes_departamento_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE projeto ADD CONSTRAINT departamento_projeto_fk
FOREIGN KEY (numero_departamento)
REFERENCES departamento (numero_departamento)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT projeto_trabalha_em_fk
FOREIGN KEY (numero_projeto)
REFERENCES projeto (numero_projeto)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
/* FIM DOS AlTER TABLES */