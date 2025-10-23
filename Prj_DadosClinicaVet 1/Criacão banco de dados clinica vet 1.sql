CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nomeCliente VARCHAR(50) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
Email VARCHAR(50) NOT NULL,
cidade VARCHAR(50) NOT NULL,
estado CHAR(2) NOT NULL,
CEP CHAR(8) NOT NULL,
tipoLogadouro VARCHAR (15) NOT NULL,
nomeLogradouro VARCHAR(50) NOT NULL,
numero VARCHAR(6) NOT NULL,
complemento VARCHAR(30)
);

CREATE TABLE celulares (
idCelulares INT PRIMARY KEY AUTO_INCREMENT,
ddi VARCHAR(50) NOT NULL,
ddd VARCHAR(5) NOT NULL,
numero CHAR(9) NOT NULL,
idCliente INT NOT NULL,
CONSTRAINT fk_celulares_Cliente FOREIGN KEY (idCliente)
REFERENCES Cliente (idCliente)
);

CREATE TABLE Animal(
idAnimal INT PRIMARY KEY AUTO_INCREMENT,
idCliente INT NOT NULL,
nomeAnimal VARCHAR(50) NOT NULL ,
especie VARCHAR(50) NOT NULL ,
raca VARCHAR(50) NOT NULL,
peso DECIMAL(5,2) ,
porte CHAR(1),
sexo CHAR(1) NOT NULL,
datadenascimento DATE NOT NULL,
CONSTRAINT fk_Animal_Cliente FOREIGN KEY (idCliente)
REFERENCES Cliente (idCliente)
);

CREATE TABLE tipoServico(
idTipoServico INT PRIMARY KEY AUTO_INCREMENT,
nomeServico VARCHAR(50) NOT NULL,
valor DECIMAL(10,2) NOT NULL 
);

CREATE TABLE Vet(
idVeterinario INT PRIMARY KEY AUTO_INCREMENT,
nomeVeterinario VARCHAR(50) NOT NULL,
crmv VARCHAR(11) NOT NULL,
especialidade VARCHAR(50)
);

CREATE TABLE celularesVet (
idCelularesVet INT PRIMARY KEY AUTO_INCREMENT,
ddi VARCHAR(50) NOT NULL,
ddd VARCHAR(5) NOT NULL,
numero CHAR(9) NOT NULL,
CONSTRAINT fk_celularesVet_Vet FOREIGN KEY (idVeterinario)
REFERENCES Vet (idVeterinario)
);

CREATE TABLE Consulta(
idConsulta INT PRIMARY KEY AUTO_INCREMENT,
CONSTRAINT fk_Consula_Vet FOREIGN KEY (idVeterinario)
REFERENCES Vet (idVeterinario),
CONSTRAINT fk_Consulta_Animal FOREIGN KEY (idAnimal)
REFERENCES Animal (idAnimal),
dataHora DATETIME NOT NULL,
pago BIT NOT NULL,
formaPagamento VARCHAR(50) NOT NULL,
valorTotal(10,2) NOT NULL,
quantidadeDvezes TINYINT,
valorPago DECIMAL(10,2)
);

CREATE TABLE consulta_tipoServico(
idConsultaTipoServico INT PRIMARY KEY AUTO_INCREMENT,
CONSTRAINT fk_consulta_tipoServico_TipoServico FOREIGN KEY (idTipoServico)
REFERENCES TipoServico (idTipoServico),
CONSTRAINT fk_consulta_tipoServico_Consulta FOREIGN KEY (idConsulta)
REFERENCES Consulta (idConsulta),
valorServico DECIMAL(10,2) NOT NULL
);