CREATE DATABASE Oficina;
USE Oficina;

-- Tabela Cliente
CREATE TABLE Cliente (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    endereco VARCHAR(255)
);

-- Tabela Equipe
CREATE TABLE Equipe (
    idEquipe INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

-- Tabela Mecanico (cada mecânico pertence a uma equipe)
CREATE TABLE Mecanico (
    idMecanico INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    endereco VARCHAR(255),
    especialidade VARCHAR(100),
    idEquipe INT,
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Tabela OS (Ordem de Serviço)
CREATE TABLE OS (
    idOS INT AUTO_INCREMENT PRIMARY KEY,
    dataEmissao DATE NOT NULL,
    valor DECIMAL(10,2),
    conclusao DATE,
    status VARCHAR(50),
    idCliente INT,     -- Cliente que autorizou a OS
    idEquipe INT,      -- Equipe responsável pela execução
    FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
    FOREIGN KEY (idEquipe) REFERENCES Equipe(idEquipe)
);

-- Tabela Peca (peças utilizadas em serviços, associadas à OS via tabela auxiliar)
CREATE TABLE Peca (
    idPeca INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL(10,2) NOT NULL
);

-- Tabela auxiliar: peças utilizadas em cada OS
CREATE TABLE OS_Peca (
    idOS INT,
    idPeca INT,
    quantidade INT DEFAULT 1,
    PRIMARY KEY (idOS, idPeca),
    FOREIGN KEY (idOS) REFERENCES OS(idOS),
    FOREIGN KEY (idPeca) REFERENCES Peca(idPeca)
);
