CREATE DATABASE Manha_HealthClinic

USE Manha_HeathClinic;

CREATE TABLE Clinica
(
IdClinica INT PRIMARY KEY IDENTITY,
AbertoEm DATE NOT NULL,
FechaEm DATE NOT NULL,
NomeFantasia VARCHAR(75) NOT NULL,
CNPJ VARCHAR(20) NOT NULL UNIQUE,
RazaoSocial VARCHAR(100) NOT NULL,
)

CREATE TABLE Endereco
(
IdEndereco INT PRIMARY KEY IDENTITY,
IdClinica INT FOREIGN KEY REFERENCES Clinica(IdClinica) NOT NULL,
Endereco VARCHAR(100) NOT NULL,
)

CREATE TABLE Consulta
(
IdConsulta INT PRIMARY KEY IDENTITY,
IdFeedback INT FOREIGN KEY REFERENCES Feedback(IdFeedback),
IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente) NOT NULL,
IdMedico INT FOREIGN KEY REFERENCES Medico(IdMedico) NOT NULL,
IdEndereco INT FOREIGN KEY REFERENCES Endereco(IdEndereco) NOT NULL,
Agendamento DATE NOT NULL,
Estado BIT,
)

CREATE TABLE Paciente
(
IdPaciente INT PRIMARY KEY IDENTITY,
IdProntuario INT FOREIGN KEY REFERENCES Prontuario(IdProntuario),
IdPerfil INT FOREIGN KEY REFERENCES Perfil(IdPerfil) NOT NULL,
Convenio BIT NOT NULL,
)

CREATE TABLE Feedback
(
IdFeedback INT PRIMARY KEY IDENTITY,
IdPaciente INT FOREIGN KEY REFERENCES Paciente(IdPaciente) NOT NULL,
Comentario VARCHAR(250) NOT NULL,
)

CREATE TABLE Prontuario 
(
IdProntuario INT PRIMARY KEY IDENTITY,
Descricao TEXT NOT NULL,
)

CREATE TABLE Perfil
(
IdPerfil INT PRIMARY KEY IDENTITY,
IdUsuario INT FOREIGN KEY REFERENCES Usuario(IdUsuario),
Email VARCHAR(300) NOT NULL,
Senha VARCHAR(100),
)

CREATE TABLE Especialidade
(
IdEspecialidade INT PRIMARY KEY IDENTITY,
Especialidade VARCHAR(150),
)

CREATE TABLE Medico
(
IdMedico INT PRIMARY KEY IDENTITY,
IdPerfil INT FOREIGN KEY REFERENCES Perfil(IdPerfil),
IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade(IdEspecialidade),
Nome VARCHAR(75) NOT NULL,
)

CREATE TABLE Usuario
(
IdUsuario INT PRIMARY KEY IDENTITY,
CPF VARCHAR(17) UNIQUE NOT NULL,
Nome VARCHAR(75) NOT NULL,
)