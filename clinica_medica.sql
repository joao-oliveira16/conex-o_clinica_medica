CREATE DATABASE IF NOT EXISTS clinica_medica;
USE clinica_medica;

-- ========================================================
-- TABELA: tbl_paciente
-- ========================================================
CREATE TABLE tbl_paciente (
	numeroBeneficiario INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(200) NOT NULL,
	telefone VARCHAR(15) NOT NULL,
	doencasPrevias VARCHAR(100) NOT NULL,
	remedioDeUsoContinuo VARCHAR(100) NOT NULL,
	PRIMARY KEY(numeroBeneficiario)
) AUTO_INCREMENT = 92764;

INSERT INTO tbl_paciente (nome, endereco, telefone, doencasPrevias, remedioDeUsoContinuo)
VALUES
    ('Maria Silva', 'Avenida dos Bosques, 456', '(21) 98765-4321', 'Hipertensão', 'Losartana'),
    ('João Pereira', 'Rua das Palmeiras, 789', '(31) 5555-5555',  'Diabetes Tipo 2', 'Insulina'),
    ('Ana Souza', 'Rua das Montanhas, 101', '(41) 1234-5678',  'Artrite Reumatoide', 'Metotrexato'),
    ('Carlos Santos', 'Avenida do Sol, 567', '(51) 9876-5432',  'Enxaqueca', 'Sumatriptana'),
    ('Isabel Oliveira', 'Rua das Estrelas, 246', '(61) 3333-3333', 'Asma Crônica', 'Salbutamol');

SELECT * FROM tbl_paciente;

-- ========================================================
-- TABELA: tbl_especialidade
-- ========================================================
CREATE TABLE tbl_especialidade (
	numeroRegistro INT NOT NULL AUTO_INCREMENT,
	nome VARCHAR(100) NOT NULL,
	publicoAlvo VARCHAR(100) NOT NULL,
	PRIMARY KEY(numeroRegistro)
) AUTO_INCREMENT = 84;

INSERT INTO tbl_especialidade (nome, publicoAlvo)
VALUES
	('Dermatologista', 'Pessoas com problema de pele'),
	('Cardiologista', 'Pessoas com problemas cardíacos'),
    ('Oftalmologista', 'Pessoas com problemas de visão'),
    ('Ortopedista', 'Pessoas com problemas ortopédicos'),
    ('Ginecologista', 'Mulheres com saúde reprodutiva');

SELECT * FROM tbl_especialidade;

-- ========================================================
-- TABELA: tbl_agendamento
-- ========================================================
CREATE TABLE tbl_agendamento (
	numeroAgendamento INT NOT NULL AUTO_INCREMENT,
	data DATE NOT NULL,
	hora TIME NOT NULL,
	queixa VARCHAR(100) NOT NULL,
	gravidade INT NOT NULL,
	PRIMARY KEY(numeroAgendamento)
) AUTO_INCREMENT = 52456;

INSERT INTO tbl_agendamento (data, hora, queixa, gravidade)
VALUES
	('2008-02-24', '11:20:00', 'Dor de cabeça e vômito', 5),
	('2023-09-15', '14:30:00', 'Febre alta e dor no peito', 9),
    ('2023-09-16', '10:15:00', 'Tosse persistente e falta de ar', 7),
    ('2023-09-17', '16:45:00', 'Dor abdominal aguda', 8),
    ('2023-09-18', '09:00:00', 'Lesão no joelho após queda', 6);

SELECT * FROM tbl_agendamento;

-- ========================================================
-- TABELA: tbl_medico
-- ========================================================
CREATE TABLE tbl_medico (
	crm VARCHAR(13) NOT NULL,
	nome VARCHAR(100) NOT NULL,
	endereco VARCHAR(200) NOT NULL,
	telefone VARCHAR(18) NOT NULL,
	numeroRegistro INT NULL,
	PRIMARY KEY(crm),
	FOREIGN KEY(numeroRegistro) REFERENCES tbl_especialidade(numeroRegistro)
);

INSERT INTO tbl_medico (nome, endereco, telefone, crm, numeroRegistro)
VALUES
	('Roger Guedes','Rua das Flores, 123', '(12) 34567-8901', 'CRM/RJ 987654', 84),
	('Everson Silva', 'Avenida Central, 456', '(34) 56789-0123', 'CRM/MG 246813', 85),
	('Gabriel Gueto', 'Travessa dos Sonhos, 789', '(56) 78901-2345', 'CRM/BA 753951', 86),
	('Matheus Anjos', 'Praça da Liberdade, 1010', '(78) 90123-4567', 'CRM/RS 864209', 87),
	('Anderson Ortiz', 'Alameda dos Vales, 222', '(90) 12345-6789', 'CRM/PR 531486', 88);

SELECT * FROM tbl_medico;

-- ========================================================
-- TABELA: tbl_consulta
-- ========================================================
CREATE TABLE tbl_consulta (
	numeroConsulta INT NOT NULL AUTO_INCREMENT,
	data DATE NOT NULL,
	hora TIME NOT NULL, 
	numeroBeneficiario INT NOT NULL,
	crm VARCHAR(13) NOT NULL,
	numeroAgendamento INT NOT NULL,
	PRIMARY KEY(numeroConsulta),
	FOREIGN KEY(numeroBeneficiario) REFERENCES tbl_paciente(numeroBeneficiario),
	FOREIGN KEY(crm) REFERENCES tbl_medico(crm),
	FOREIGN KEY(numeroAgendamento) REFERENCES tbl_agendamento(numeroAgendamento)
) AUTO_INCREMENT = 2515;

INSERT INTO tbl_consulta (data, hora, numeroBeneficiario, crm, numeroAgendamento)
VALUES
    ('2008-02-24', '11:20:00', 92764, 'CRM/RJ 987654', 52456),
    ('2008-04-28', '11:30:00', 92765, 'CRM/MG 246813', 52457),
    ('2008-11-25', '10:20:00', 92766, 'CRM/BA 753951', 52458),
    ('2009-11-20', '10:30:00', 92767, 'CRM/RS 864209', 52459),
    ('2023-09-18', '09:00:00', 92768, 'CRM/PR 531486', 52460);

SELECT * FROM tbl_consulta;

-- ========================================================
-- STORED PROCEDURE: printarTabelas
-- ========================================================
DELIMITER //

CREATE PROCEDURE printarTabelas()
BEGIN
	SELECT * FROM tbl_agendamento;
	SELECT * FROM tbl_consulta;
	SELECT * FROM tbl_especialidade;
	SELECT * FROM tbl_medico;
	SELECT * FROM tbl_paciente;
END //

DELIMITER ;

-- Execução da Stored Procedure
CALL printarTabelas();