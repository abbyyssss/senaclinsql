/*mostrar bancos de dados*/
SHOW DATABASES
/*selecionar bancos de dados*/
USE test
/*mostrar tabelas*/
SHOW TABLES
/*criar banco de dados*/
CREATE DATABASE senabooks
/*apagar bancos de dados*/
DROP DATABASE test

/* Criação das tanelas do BD */
CREATE TABLE Medico (
idMedico INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeMedico VARCHAR(50) NOT NULL,
loginMedico VARCHAR (50) NOT NULL,
senha CHAR(8) NOT NULL,
crm CHAR(8) NOT NULL
);

senaclin /* MOSTRA AS TABELAS DO BANCO DE DADOS SELECIONADO */

CREATE TABLE Recepcionista(
idRecepcionista INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
nomeRecepcionista VARCHAR (50) NOT NULL,
loginRecepcionista VARCHAR (50) NOT NULL,
senha CHAR (8) NOT NULL,
celular CHAR (11) NOT NULL,
nomeLogradouro VARCHAR (50) NOT NULL,
numero VARCHAR (7) NOT NULL,
complemento VARCHAR (10) NULL,
cidade VARCHAR (30) NOT NULL,
cep CHAR (8) NOT NULL,
estado CHAR (2) NOT NULL
);

CREATE TABLE paciente (
idPaciente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) NOT NULL,
dataNascimento datetime NOT NULL,
cpf CHAR(11) NOT NULL unique,
email VARCHAR (50) NULL DEFAULT 'Não informado',
doencasPreexistentes VARCHAR (255) NULL,
tipoSanguineo VARCHAR (3) NOT NULL,
constraint chk_tipoSanguineo CHECK (tipoSanguineo='A+' OR tipoSanguineo='A-' OR tipoSanguineo='AB-' OR tipoSanguineo='AB+' OR tipoSanguineo='B+' OR tipoSanguineo='B-' OR tipoSanguineo='O-' OR tipoSanguineo='0+')
);

CREATE TABLE consulta(
idConsulta INT PRIMARY KEY AUTO_INCREMENT NOT null,
idPaciente INT NOT NULL,
idMedico INT NOT NULL,
idRecepcionista INT NOT NULL,
dataHoraConsulta DATETIME NOT NULL,
tipoConsulta SMALLINT DEFAULT 0,
/* 0- primeira vez, 1- se for retorno*/
observacoes VARCHAR (255),
valor DECIMAL (7,2),
CONSTRAINT fk_ConsultaPaciente FOREIGN KEY (idPaciente)
REFERENCES paciente(idPaciente),
CONSTRAINT fk_ConsultaMedico FOREIGN KEY (idMedico)
REFERENCES medico(idMedico),
CONSTRAINT fk_consultaRecepcionista FOREIGN KEY (idRecepcionista)
REFERENCES recepcionista(idRecepcionista)

);

/*inserindo massa de dados*/
INSERT INTO medico (nomeMedico ,loginMedico ,senha , crm)
VALUES ('Dr.Olavo','olavodoctor@gmail.com','12345678','222333SP');

/*inserindo dois ou mais registros*/

INSERT INTO medico (nomeMedico ,loginMedico ,senha , crm)
VALUES ('Dr.Rosana','Rosana@gmail.com','12345678','666333MG');
INSERT INTO medico (nomeMedico ,loginMedico ,senha , crm)
VALUES ('Dr.Heitor','Heitor@gmail.com','12345678','555333SP');

INSERT INTO medico (nomeMedico ,loginMedico ,senha , crm)
values
('Dr.Ricardo','Rosana@gmail.com','12345678','777222MG'),
('Dr.Graziella','Rosana@gmail.com','12345678','555111RJ');

/*trazendo todas as colunas*/
SELECT * FROM medico

/*escolhendo algumas colunas*/
SELECT nomeMedico,crm FROM medico


/*buscando dados*/
SELECT * FROM medico
SELECT nomeMedico, crm FROM medico 

/*alterar ou atualizar dados*/
UPDATE medico
SET senha='87654321'
    loginMedico='olavodoctor@hotmail.com'
  WHERE idMedico=1  
    
    
 /*insert explicito*/
 INSERT INTO medico (crm, nomeMedico, senha, loginMedico)
 VALUES ('666111SP','Dra. Ana Maria de Novo','anamaria@gmail.com');
 
 /*insert implicito*/
 INSERT INTO medico 
 VALUES (11,'Dra. Ana Paula','anapaulaa@gmail.com','11223344','121111SP');
 
 /*excluir registros*/
 DELETE FROM medico 
 WHERE idMedico= 10
 
/*buscando com filtros*/
SELECT * FROM medico
WHERE idMedico = 8

SELECT idMedico, nomeMedico,crm FROM medico
WHERE idMedico BETWEEN 2 AND 5   /*tambem poderia ser where idMedico >=2 and idMedico <=5*/

/*between funciona apenas com datas e números, não com textos!*/


/*mudando o email e senha de certa entidade*/
UPDATE medico
SET senha= 1234567,
loginMedico='anamarianova@gmail.com'
WHERE idMedico=6

/*filtro com like*/
SELECT * FROM medico
WHERE crm LIKE '%RJ'

SELECT nomeMedico,crm, loginMedico FROM medico
WHERE nomeMedico LIKE 'Dra. An%'

/*ordenando resultados de uma consulta*/
SELECT * FROM medico
ORDER BY loginMedico ASC /*crescente*/

SELECT * FROM medico
ORDER BY loginMedico DESC /*decrescente*/


/*adicionando 3 pacientes*/
SELECT * FROM paciente

insert into paciente (nome,dataNascimento,cpf,email,doencasPreexistentes,tiposanguineo)
values ('Kauan','2007-02-24 00:00','11223344556','Kauan@gmail.com','nc','AB+')

insert into paciente (nome,dataNascimento,cpf,email,doencasPreexistentes,tiposanguineo)
VALUES ('Filipe','2000-01-30 00:00','22113344557','Filipe@gmail.com','HIV','B-')

insert into paciente (nome,dataNascimento,cpf,email,doencasPreexistentes,tiposanguineo)
VALUE ('Pedro','2007-02-05 01:00','99887766554','pedromoles@gmail.com','nc','A-')

/*adicionando 3 recepcionistas*/

SELECT * FROM recepcionista

insert into recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cidade,cep,estado)
values ('yasmim','yasmim123@gmail.com','batata','11345678910','parque ibirapuera','190','apto 14','São paulo','11020031','SP')

insert into recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cidade,cep,estado)
values ('maui','maui123@gmail.com','banana','09876543211','marapé','163','apto 13','santos','11070010','SP')

insert into recepcionista (nomeRecepcionista,loginRecepcionista,senha,celular,nomeLogradouro,numero,complemento,cidade,cep,estado)
values('linkDoZap','éolink@gmail.com','berserk','65748390112','marapé','999','apto 666','São Paulo','11020031','SP')	

/*criando a tabela consulta*/

SELECT * FROM consulta
INSERT INTO consulta(idMedico,idPaciente,idRecepcionista,dataHoraConsulta,TipoConsulta)
VALUES
(2,3,2,'2024-06-24 18:30',0)

INSERT INTO consulta(idMedico,idPaciente,idRecepcionista,dataHoraConsulta,TipoConsulta)
VALUES
(1,2,3,'2024-06-26 15:30',0)


CREATE TABLE paciente (
/*todos os demais campos e chaves*/
STATUS SMALLINT /*1*/ /*0*/  /*exclusão lógica*/
);

UPDATE paciente
SET STATUS = 0
WHERE idPaciente = ?

/*funções de agregação*/
/*conta as ocorrências*/
SELECT COUNT(idMedico) AS 'Quantidade de médicos'
FROM medico
WHERE crm LIKE '%SP'

/*pega o valor máximo/maior:data, hora, inteirom decimal*/
SELECT MAX(dataHoraConsulta) FROM consulta

/*pega o valor mínimo/maior:data, hora, inteirom decimal*/
SELECT min(dataHoraConsulta) FROM consulta

 /*Realiza a soma dos valores*/
 SELECT SUM(idRecepcionista) FROM recepcionista
 
/*realiza a média aritmédica simples de determinados valores*/
SELECT AVG(idPaciente) FROM paciente 


SELECT * FROM paciente

INSERT INTO paciente (nome,cpf, dataNascimento, tipoSanguineo)
VALUES
('Magali','55566677788','2001-07-07 06:55:00','0+'),
('Mônica','99966677788','2002-10-02 13:22:00','0+'),
('Cascão','55566611188','2000-07-07 11:21:00','B-'),
('Penadinho','99966677799','2002-10-02 13:44:00','O-');

SELECT tipoSanguineo AS 'Tipos sanguineos' ,
          count(idPaciente) AS 'Total paciente'
FROM paciente
GROUP BY tipoSanguineo

SELECT tipoSanguineo AS 'Tipos sanguíneos',
       COUNT(idPaciente) AS 'Total de pacientes'
FROM paciente
GROUP BY tipoSanguineo
ORDER BY COUNT(idPaciente) DESC

/* where < algumacondicao */

SELECT tipoSanguineo AS 'Tipos sanguíneos',
       COUNT(idPaciente) AS 'Total de pacientes'
FROM paciente
WHERE idPaciente >= 2
GROUP BY tipoSanguineo
HAVING COUNT(idPaciente) >= 2
ORDER BY COUNT(idPaciente);


/***** join *****/
/* Traga o nome do médico e a data da consulta marcada para ele
levando em conta todos os médicos que possuem consultas */

SELECT nomeMedico, crm, dataHoraConsulta FROM
medico
INNER JOIN consulta
ON medico.idMedico = consulta.idMedico

SELECT nomeMEdico, crm, dataHoraConsulta FROM
medico
left JOIN consulta
ON medico.idMedico = consulta.idMedico

SELECT * FROM consulta;
SELECT * FROM medico;

/*criar uma querry que traga o nome do recepcionista, o celular dele, e a data de consulta que ele marcou*/

SELECT nomeRecepcionista,celular,dataHoraConsulta FROM recepcionista
INNER JOIN consulta
ON recepcionista.idRecepcionista=consulta.idRecepcionista

/*criar uma query que traga o nome do paciente, seu documento, o nome do médico, o crm, a data da consulta e o recepcionista que a marcou*/
SELECT 
    paciente.nome AS Nome_Paciente,
    paciente.cpf AS Documento_Paciente,
    medico.nomeMedico AS Nome_Médico,
    medico.crm AS CRM_Médico,
    consulta.dataHoraConsulta AS Data_Consulta,
    recepcionista.nomeRecepcionista AS Nome_Recepcionista
FROM 
    consulta
INNER JOIN 
    paciente ON consulta.idPaciente = paciente.idPaciente
INNER JOIN 
    medico ON consulta.idMedico = medico.idMedico
INNER JOIN 
    recepcionista ON consulta.idRecepcionista = recepcionista.idRecepcionista;

/*C - Criar uma query que traga quantas consultas existem 
na clínica */
 SELECT COUNT(*) AS Quantidade_de_Consultas
FROM consulta;

/*D - Criar uma query que traga o nome do paciente, o email,
o tipo sanguineo e a data de suas consultas
mas somente dos pacientes que possuem email*/
 SELECT 
    paciente.nome AS Nome_Paciente,
    paciente.email AS Email_Paciente,
    paciente.tipoSanguineo AS Tipo_Sanguineo,
    consulta.dataHoraConsulta AS Data_Consulta
FROM 
    paciente
INNER JOIN 
    consulta ON paciente.idPaciente = consulta.idPaciente
WHERE 
    paciente.email IS NOT NULL AND paciente.email <> ''
ORDER BY 
    paciente.nome, consulta.dataHoraConsulta;

/*E - Criar uma query que traga o nome de TODOS OS paciente, 
o nome do médico, a data da consulta
independente de os pacientes possuírem consultas */

SELECT 
    paciente.nome AS Nome_Paciente,
    medico.nomeMedico AS Nome_Médico,
    consulta.dataHoraConsulta AS Data_Consulta
FROM 
    paciente
LEFT JOIN 
    consulta ON paciente.idPaciente = consulta.idPaciente
LEFT JOIN 
    medico ON consulta.idMedico = medico.idMedico
ORDER BY 
    paciente.nome, consulta.dataHoraConsulta;
