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