/*1) Utilizando o comando ALTER TABLE, adicionar à tabela cliente já criada os seguintes atributos: 
email, cidade, estado, endereço (lembre-se que trata-se de atributo composto) */

ALTER TABLE Cliente 
ADD email VARCHAR(50) NOT NULL,
ADD cidade VARCHAR(50) NOT NULL,
ADD estado CHAR(2) NOT NULL,
ADD cep CHAR(8) NOT NULL,
ADD logradouro VARCHAR(50) NOT NULL,
ADD numero INT NOT NULL,
ADD complemento VARCHAR(50);



/*2) Apagar da Tabela Aluguel o atributo idEquipamento, pois criaremos uma outra tabela para conter tal atributo. Use o comando para dropar colunas para fazer isso. */
ALTER TABLE Aluguel
DROP FOREIGN KEY fk_aluguel_equipamento;

ALTER TABLE Aluguel
DROP COLUMN idEquipamento;

/*3) Criar a tabela associativa AluguelEquipamento com os seguintes atributos:
 
idAluguemEquipamento PK
idAluguel FK
idEquipamento FK
valorUnitario 
valorItem
quantidade */

CREATE TABLE AluguelEquipamento(
idAluguelEquipamento INT PRIMARY KEY AUTO_INCREMENT,
idEquipamento INT NOT NULL,
idAluguel INT NOT NULL,
valorItem DECIMAL(10,2),
valorUnitario DECIMAL(10,2),
qtd INT,
CONSTRAINT fk_aluguelEquipamento_Equipamento
FOREIGN KEY (idEquipamento) REFERENCES Equipamento(idEquipamento),
CONSTRAINT fk_aluguelEquipamento_Aluguel
FOREIGN KEY (idAluguel) REFERENCES Aluguel(idAluguel)
);




/*4) Inserção 20 clientes */
INSERT INTO Cliente (nomeCliente, email, cidade, estado, cep, logradouro, numero, complemento, cpf) 
VALUES
('Donald', 'donald@uol.com.br', 'Santos', 'SP', '11010100', 'Rua das Gaivotas', '15', 'casa', '11122233344'),
('Margarida', 'margarida@uol.com.br', 'São Vicente', 'SP', '11310200', 'Avenida da Praia', '120', 'Apto 32', '22233344455'),
('Patinhas', 'patinhas@uol.com.br', 'Florianópolis', 'SC', '88015300', 'Rua da Moeda', '1', 'casa', '33344455566'),
('Huguinho', 'huguinho@gmail.com', 'Santos', 'SP', '11050400', 'Travessa dos Escoteiros', '101', 'Bloco A', '44455566677'),
('Luizinho', 'luizinho@gmail.com', 'Praia Grande', 'SP', '11700110', 'Avenida Castelo Branco', '4500', 'Apto 1010', '55566677788'),
('Zezinho', 'zezinho@gmail.com', 'São Vicente', 'SP', '11320150', 'Alameda Piauí', '45', 'casa', '66677788899'),
('Pardal', 'professor.pardal@uol.com.br', 'Santos', 'SP', '11080300', 'Rua da Inovação', '88', 'casa / Oficina', '77788899900'),
('Zé Carioca', 'zecarioca@gmail.com', 'Rio de Janeiro', 'RJ', '22040010', 'Avenida Copacabana', '500', 'casa', '88899900011'),
('Mickey', 'mickey.mouse@hotmail.com', 'Recife', 'PE', '50030230', 'Rua da Boa Viagem', '1928', 'Apto 501', '99900011122'),
('Minie', 'minie.m@gmail.com', 'Recife', 'PE', '50030240', 'Rua da Aurora', '1930', 'Apto 502', '00011122233'),
('Pateta', 'pateta@gmail.com', 'Curitiba', 'PR', '80010010', 'Avenida Sete de Setembro', '1234', 'Bloco Z, Apto 13', '12345678901'),
('Branca de Neve', 'branca.neve@hotmail.com', 'São Joaquim', 'SC', '88600000', 'Alameda dos Sete Anões', '7', 'Cabana', '23456789012'),
('Aladin', 'aladin@gmail.com', 'Belém', 'PA', '66010020', 'Rua do Mercado Ver-o-Peso', '1001', 'Apto 20', '34567890123'),
('Cinderela', 'cinderela@hotmail.com', 'Goiânia', 'GO', '74013010', 'Rua dos Cristais', '12', 'casa', '45678901234'),
('Mulan', 'mulan.fa@gmail.com', 'Rio das Ostras', 'RJ', '28890000', 'Estrada do Imperador', '50', 'Apto 303', '56789012345'),
('Moana', 'moana@gmail.com', 'Parati', 'RJ', '23970000', 'Travessa da Praia', '10', 'Pousada', '67890123456'),
('Asnésio', 'asnesio@uol.com.br', 'Belo Horizonte', 'MG', '30110010', 'Rua da Bahia', '999', 'Sala 10', '78901234567'),
('Maga Patalógica', 'maga.patalogica@gmail.com', 'Cubatão', 'SP', '11510100', 'Rua do Vulcão', '666', 'Apto 13', '89012345678'),
('Capitão Boeing', 'capitao.boeing@uol.com.br', 'Manaus', 'AM', '69010010', 'Alameda dos Hangares', '747', 'casa', '90123456789'),
('Pão Duro Mac Money', 'macmoney@ig.com.br', 'Osasco', 'SP', '06010010', 'Avenida dos Autonomistas', '1500', 'Sala 50', '01234567890');


/*5)Inserir 03 funcionários com dados aleatórios, mas com os seguintes nomes:
Cebolinha,
Cascão, 
Chico Bento */

INSERT INTO Funcionario (nomeFuncionario, cpf, celular) 
VALUES
('Cebolinha', '12121231344','11988776655'),
('Cascão', '23232342455','13991234567'),
('Chico Bento', '34343453566','19987654321');


/*6)Inserir os seguintes equipamentos:
 
Cadeira 02 posições - 50 unidades - R$2,00
Cadeira 04 posições - 100 unidades - R$3,50
Guarda Sol P - 40 unidades - R$2,00
Guarda Sol G - 60 unidades - R$3,00
Mesinha - 30 unidades - R$1,50 */

INSERT INTO equipamento (nomeEquipamento, qtd,valorHora)
VALUES 
('Cadeira 02 posições','50','2.00'),
('Cadeira 04 posições','100','3.50'),
('Guarda Sol P','40','2.00'),
('Guarda Sol G','60','3.00'),
('Mesinha','30','1.50');

SELECT * FROM cliente
ORDER BY idCliente 

UPDATE cliente 
SET cidade = 'Manaus', estado = 'AM'
WHERE idCliente = 31;

SELECT * FROM cliente 
ORDER BY idCliente 
