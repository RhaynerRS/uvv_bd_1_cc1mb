-- 01
<<<<<<< HEAD
SELECT nome_departamento AS departamento, CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS media_salarial
=======
SELECT nome_departamento AS Departamento, CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM funcionarios f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento
GROUP BY nome_departamento;

-- 02
SELECT CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'm' THEN 'Masculino'
WHEN sexo = 'F' THEN 'Feminino' WHEN sexo = 'f' THEN 'Feminino' END AS Sexo,
<<<<<<< HEAD
CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS media_salarial FROM funcionarios GROUP BY Sexo;

-- 03
--floor é uma expressão que arredonda pra baixo o resultado de algo
SELECT nome_departamento AS departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, 
data_nascimento AS Data_de_nascimento, 
FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS salario 
=======
CONCAT('R$ ', CAST(AVG(salario) AS DECIMAL(10,2))) AS Média_salarial FROM funcionarios GROUP BY Sexo;

-- 03
--floor é uma expressão que arredonda pra baixo o resultado de algo
SELECT nome_departamento AS Departamento, CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, 
data_nascimento AS Data_de_nascimento, 
FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário 
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM funcionarios f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento
ORDER BY nome_departamento;

-- 04
<<<<<<< HEAD
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS salario, CONCAT('R$ ', CAST((salario*1.2) AS DECIMAL(10,2))) AS Novo_salario FROM funcionarios f
WHERE salario < '35000'
UNION
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS salario, CONCAT('R$ ', CAST((salario*1.15) AS DECIMAL(10,2))) AS Novo_salario FROM funcionarios f
=======
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário, CONCAT('R$ ', CAST((salario*1.2) AS DECIMAL(10,2))) AS Novo_salário FROM funcionarios f
WHERE salario < '35000'
UNION
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, FLOOR(DATEDIFF(CURDATE(), data_nascimento)/365.25) AS Idade, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário, CONCAT('R$ ', CAST((salario*1.15) AS DECIMAL(10,2))) AS Novo_salário FROM funcionarios f
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
WHERE salario >= '35000';

-- 05
-- foi utilizado um select dentro de outro select para conseguir utilizar a tabela funcionarios novamente com outro "alias"
<<<<<<< HEAD
SELECT nome_departamento AS departamento, g.primeiro_nome AS Gerente, f.primeiro_nome AS Funcionário, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS salario
FROM departamento d INNER JOIN funcionarios f, 
(SELECT primeiro_nome, cpf FROM funcionarios f INNER JOIN departamento d WHERE f.cpf = d.cpf_gerente) AS g
WHERE g.cpf = d.cpf_gerente AND d.numero_departamento = f.numero_departamento
ORDER BY d.nome_departamento ASC, f.salario DESC;

-- 06
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, d.nome_departamento AS departamento,
dp.nome_dependente AS Dependente, FLOOR(DATEDIFF(CURDATE(), dp.data_nascimento)/365.25) AS idade_dependente,
CASE WHEN dp.sexo = 'M' THEN 'Masculino' WHEN dp.sexo = 'm' THEN 'Masculino'
WHEN dp.sexo = 'F' THEN 'Feminino' WHEN dp.sexo = 'f' THEN 'Feminino' END AS Sexo_dependente
FROM funcionarios f 
INNER JOIN departamento d ON f.numero_departamento = d.numero_departamento
INNER JOIN dependente dp ON dp.cpf_funcionario = f.cpf;

-- 07
SELECT DISTINCT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, d.nome_departamento AS departamento,
CONCAT('R$ ', CAST((f.salario) AS DECIMAL(10,2))) AS salario FROM funcionarios f
INNER JOIN departamento d
INNER JOIN dependente dp
WHERE d.numero_departamento = f.numero_departamento AND
f.cpf NOT IN (SELECT dp.cpf_funcionario FROM dependente dp);

-- 08
SELECT d.nome_departamento AS departamento, p.nome_projeto AS projeto,
CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, t.horas AS Horas
=======
SELECT nome_departamento AS Departamento, g.primeiro_nome AS Gerente, f.primeiro_nome AS Funcionário, 
CONCAT('R$ ', CAST((salario) AS DECIMAL(10,2))) AS Salário
FROM departamento d INNER JOIN funcionarios f, 
(SELECT primeiro_nome, cpf FROM funcionarios f INNER JOIN departamento d WHERE f.cpf = d.cpf_gerente) AS g
WHERE d.numero_departamento = f.numero_departamento AND g.cpf = d.cpf_gerente
ORDER BY d.nome_departamento ASC, f.salario DESC;

-- 06
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, dto.nome_departamento AS Departamento,
dpd.nome_dependente AS Dependente, FLOOR(DATEDIFF(CURDATE(), dpd.data_nascimento)/365.25) AS Idade_dependente,
CASE WHEN dpd.sexo = 'M' THEN 'Masculino' WHEN dpd.sexo = 'm' THEN 'Masculino'
WHEN dpd.sexo = 'F' THEN 'Feminino' WHEN dpd.sexo = 'f' THEN 'Feminino' END AS Sexo_dependente
FROM funcionarios f 
INNER JOIN departamento dto ON f.numero_departamento = dto.numero_departamento
INNER JOIN dependente dpd ON dpd.cpf_funcionario = f.cpf;

-- 07
SELECT DISTINCT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, dto.nome_departamento AS Departamento,
CONCAT('R$ ', CAST((f.salario) AS DECIMAL(10,2))) AS Salário FROM funcionarios f
INNER JOIN departamento dto
INNER JOIN dependente dpd
WHERE dto.numero_departamento = f.numero_departamento AND
f.cpf NOT IN (SELECT dpd.cpf_funcionario FROM dependente dpd);

-- 08
SELECT d.nome_departamento AS Departamento, p.nome_projeto AS Projeto,
CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, t.horas AS Horas
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM funcionarios f INNER JOIN departamento d INNER JOIN projeto p INNER JOIN trabalha_em t
WHERE d.numero_departamento = f.numero_departamento AND
p.numero_projeto = t.numero_projeto AND
f.cpf = t.cpf_funcionario
ORDER BY p.numero_projeto;

-- 09
<<<<<<< HEAD
SELECT d.nome_departamento AS departamento, p.nome_projeto AS projeto, SUM(t.horas) AS Total_de_horas
=======
SELECT d.nome_departamento AS Departamento, p.nome_projeto AS Projeto, SUM(t.horas) AS Total_de_horas
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM departamento d INNER JOIN projeto p INNER JOIN trabalha_em t
WHERE d.numero_departamento = p.numero_departamento AND
p.numero_projeto = t.numero_projeto
GROUP BY p.nome_projeto;

-- 10
<<<<<<< HEAD
SELECT d.nome_departamento AS departamento, CONCAT('R$ ', CAST(AVG(f.salario) AS DECIMAL(10,2))) AS media_salarial
=======
SELECT d.nome_departamento AS Departamento, CONCAT('R$ ', CAST(AVG(f.salario) AS DECIMAL(10,2))) AS Média_salarial
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM departamento d INNER JOIN funcionarios f
WHERE d.numero_departamento = f.numero_departamento
GROUP BY d.nome_departamento;

-- 11
<<<<<<< HEAD
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, p.nome_projeto AS projeto,
=======
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, p.nome_projeto AS Projeto,
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
CONCAT('R$ ', CAST((t.horas*50) AS DECIMAL (10,2))) AS Recebimento
FROM funcionarios f INNER JOIN projeto p INNER JOIN trabalha_em t
WHERE f.cpf = t.cpf_funcionario AND p.numero_projeto = t.numero_projeto
GROUP BY f.primeiro_nome;

-- 12
<<<<<<< HEAD
SELECT d.nome_departamento AS departamento, p.nome_projeto AS projeto,
CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo, t.horas AS Horas
=======
SELECT d.nome_departamento AS Departamento, p.nome_projeto AS Projeto,
CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo, t.horas AS Horas
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM funcionarios f INNER JOIN departamento d INNER JOIN projeto p INNER JOIN trabalha_em t
WHERE f.cpf = t.cpf_funcionario AND p.numero_projeto = t.numero_projeto AND (t.horas = 0 OR t.horas = NULL)
GROUP BY f.primeiro_nome;

-- 13
SELECT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome,
CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'm' THEN 'Masculino'
WHEN sexo = 'F' THEN 'Feminino' WHEN sexo = 'f' THEN 'Feminino' END AS Sexo,
FLOOR(DATEDIFF(CURDATE(), f.data_nascimento)/365.25) AS Idade
FROM funcionarios f
UNION
SELECT d.nome_dependente AS Nome,
CASE WHEN sexo = 'M' THEN 'Masculino' WHEN sexo = 'm' THEN 'Masculino'
WHEN sexo = 'F' THEN 'Feminino' WHEN sexo = 'f' THEN 'Feminino' END AS Sexo,
FLOOR(DATEDIFF(CURDATE(), d.data_nascimento)/365.25) AS Idade
FROM dependente d
ORDER BY Idade;

-- 14
<<<<<<< HEAD
SELECT d.nome_departamento AS departamento, COUNT(f.numero_departamento) AS Número_funcionários
=======
SELECT d.nome_departamento AS Departamento, COUNT(f.numero_departamento) AS Número_funcionários
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM funcionarios f INNER JOIN departamento d
WHERE f.numero_departamento = d.numero_departamento
GROUP BY d.nome_departamento;

-- 15
<<<<<<< HEAD
SELECT DISTINCT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo,
d.nome_departamento AS departamento, 
p.nome_projeto AS projeto
=======
SELECT DISTINCT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo,
d.nome_departamento AS Departamento, 
p.nome_projeto AS Projeto
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM departamento d INNER JOIN projeto p INNER JOIN trabalha_em t INNER JOIN funcionarios f 
WHERE d.numero_departamento = f.numero_departamento AND p.numero_projeto = t.numero_projeto AND
t.cpf_funcionario = f.cpf
UNION
<<<<<<< HEAD
SELECT DISTINCT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS nome_completo,
d.nome_departamento AS departamento, 
'Sem projeto' AS projeto
=======
SELECT DISTINCT CONCAT(f.primeiro_nome, ' ', f.nome_meio, ' ', f.ultimo_nome) AS Nome_completo,
d.nome_departamento AS Departamento, 
'Sem projeto' AS Projeto
>>>>>>> 64858fa8e5cbd15143c50702b2901baa058c5524
FROM departamento d INNER JOIN projeto p INNER JOIN trabalha_em t INNER JOIN funcionarios f 
WHERE d.numero_departamento = f.numero_departamento AND p.numero_projeto = t.numero_projeto AND
(f.cpf NOT IN (SELECT t.cpf_funcionario FROM trabalha_em t));