TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE
);

CREATE TABLE Funcionario (
idFuncionario INT PRIMARY KEY AUTO_INCREMENT, 
nomeFuncionario VARCHAR(50) NOT NULL
cpf CHAR(11) NOT NULL UNIQUE,
celular CHAR(11) NOT NULL
);

CREATE TABLE Equipamento (
idEquipamento INT PRIMARY KEY AUTO_INCREMENT,
nomeEquipamento VARCHAR (50) NOT NULL,
qtd INT NOT NULL,
valorHora DECIMAL(5,2) NOT NULL
);


CREATE TABLE Aluguel (
idAluguel INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL,
idEquipamento INT NOT NULL,
idFuncionario INT NOT NULL,
dataHoraRetirada DATETIME NOT NULL,
dataHoraDevolucao DATETIME,
valorAPagar DECIMAL(10,2),
pago BIT,
formaPagamento VARCHAR(50),
qtVezes INT,
CONSTRAINT fk_aluguel_cliente
FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente),
CONSTRAINT fk_aluguel_equipamento
FOREIGN KEY (idEquipamento) REFERENCES Equipamento(idEquipamento),
CONSTRAINT fk_aluguel_funcionario FOREIGN KEY (idFuncionario) 
REFERENCES Funcionario(idFuncionario)
);

