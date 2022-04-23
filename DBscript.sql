
CREATE TABLE funcionario (
                cpf CHAR(11) NOT NULL,
                primeiro_nome VARCHAR(15) NOT NULL,
                nome_meio CHAR(1),
                ultimo_meio VARCHAR(15) NOT NULL,
                data_nascimento DATE,
                endereco VARCHAR(70),
                sexo CHAR(1),
                salario DECIMAL(10,2),
                cpf_supervisor CHAR(11) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT cpf PRIMARY KEY (cpf)
);


CREATE TABLE departamento (
                numero_departamento INTEGER NOT NULL,
                nome_departamento VARCHAR(15) NOT NULL UNIQUE,
                data_inicio_gerente DATE,
                cpf_gerente CHAR(11) NOT NULL,
                CONSTRAINT numero_departamento PRIMARY KEY (numero_departamento)
);


CREATE TABLE projeto (
                numero_projeto INTEGER NOT NULL,
                numero_departamento INTEGER NOT NULL,
                nome_projeto VARCHAR(15) NOT NULL UNIQUE,
                local_projeto VARCHAR(45),
                CONSTRAINT numero_projeto PRIMARY KEY (numero_projeto)
);


CREATE TABLE trabalha_em (
                numero_projeto INTEGER NOT NULL,
                cpf_funcionario CHAR(11) NOT NULL,
                horas DECIMAL(3,1) NOT NULL,
                CONSTRAINT PFK PRIMARY KEY (numero_projeto, cpf_funcionario)
);


CREATE TABLE localizacoes_departamento (
                local VARCHAR(45) NOT NULL,
                numero_departamento INTEGER NOT NULL,
                CONSTRAINT local PRIMARY KEY (local, numero_departamento)
);


CREATE TABLE dependente (
                cpf_funcionario CHAR(11) NOT NULL,
                nome_dependente VARCHAR(15) NOT NULL,
                sexo CHAR(1),
                data_nascimento DATE,
                parentesco VARCHAR(15) NOT NULL,
                CONSTRAINT cpf_funcionario PRIMARY KEY (cpf_funcionario, nome_dependente)
);


ALTER TABLE funcionario ADD CONSTRAINT funcionario_funcionario_fk
FOREIGN KEY (cpf_supervisor)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE dependente ADD CONSTRAINT funcionario_dependente_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE departamento ADD CONSTRAINT funcionario_departamento_fk
FOREIGN KEY (cpf_gerente)
REFERENCES funcionario (cpf)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE trabalha_em ADD CONSTRAINT funcionario_trabalha_em_fk
FOREIGN KEY (cpf_funcionario)
REFERENCES funcionario (cpf)
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

INSERT INTO dependente (cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) VALUES
('12345678966', 'Alicia', 'F', '30-12-1988', 'Filha'),
('12345678966', 'Elizabeth', 'F', '05-05-1967', 'Esposa'),
('12345678966', 'Michael', 'M', '04-01-1988', 'Filho'),
('33344555587', 'Alicia', 'F', '05-04-1986', 'Filha'),
('33344555587', 'Janaina', 'F', '03-05-1958', 'Esposa'),
('33344555587', 'Tiago', 'M', '25-10-1983', 'Filho'),
('98765432168', 'Antonio', 'M', '28-02-1942', 'Marido');

INSERT INTO departamento (numero_departamento, nome_departamento, data_inicio_gerente, cpf_gerente) VALUES
(1, 'Matriz', '1981-06-19', '88866555576'),
(4, 'Administração', '1995-01-01', '98765432168'),
(5, 'Pesquisa', '1998-05-22', '33344555587');

INSERT INTO localizacoes_departamento (local, numero_departamento) VALUES
('Itu', 5),
('Mauá', 4),
('Santo André', 5),
('São Paulo', 1),
('São Paulo', 5);

INSERT INTO projeto (nome_projeto, numero_projeto, local_projeto, numero_departamento) VALUES
('ProdutoX', 1, 'Santo André', 5),
('ProdutoY', 2, 'Itu', 5),
('ProdutoZ', 3, 'São Paulo', 5),
('Informatização', 10, 'Mauá', 4),
('Reorganização', 20, 'São Paulo', 1),
('Novosbeneficios', 30, 'Mauá', 4);

INSERT INTO trabalha_em (numero_projeto, cpf_funcionario, horas) VALUES
(1, '12345678966', '32.5'),
(1, '45345345376', '20.0'),
(2, '12345678966', '7.5'),
(2, '33344555587', '10.0'),
(2, '45345345376', '20.0'),
(3, '33344555587', '10.0'),
(3, '66688444476', '40.0'),
(10, '33344555587', '10.0'),
(10, '98798798733', '35.0'),
(10, '99988777767', '10.0'),
(20, '33344555587', '10.0'),
(20, '88866555576', '0'),
(20, '98765432168', '15.0'),
(30, '98765432168', '20.0'),
(30, '98798798733', '5.0'),
(30, '99988777767', '30.0');