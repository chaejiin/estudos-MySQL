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

/*7)Inserir o aluguel de 1 cadeiras 2 posições para o Pateta feita pelo Cebolinha, em 08/12/24. Fazer o update da quantidade retirando uma do estoque. */

DESCRIBE aluguel

START TRANSACTION;

INSERT INTO Aluguel (idCliente, idFuncionario, dataHoraRetirada) 
VALUES (31, 1, '2024-12-08 00:00:00');

INSERT INTO AluguelEquipamento (idAluguel, idEquipamento, qtd, valorUnitario, valorItem)
VALUES (LAST_INSERT_ID(), 1, 1, 2.00, (2.00 * 1));

UPDATE Equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 1;

COMMIT;

SELECT * FROM Aluguel 
ORDER BY idAluguel DESC 
LIMIT 1;

SELECT nomeEquipamento, qtd FROM Equipamento 
WHERE idEquipamento = 1;

SELECT * FROM AluguelEquipamento 
ORDER BY idAluguelEquipamento DESC 
LIMIT 1;

/*8)Inserir o aluguel de 2 cadeiras 4 posições e um guarda sol G para o Mickey feita pelo Chico Bento, em dez 10/12/24. 
Fazer o update da quantidade retirando do estoque.*/
SELECT idCliente, nomeCliente FROM Cliente WHERE nomeCliente = 'Mickey';

SELECT idFuncionario, nomeFuncionario FROM Funcionario WHERE nomeFuncionario = 'Chico Bento';

SELECT idEquipamento, valorHora FROM Equipamento WHERE nomeEquipamento = 'Cadeira 04 posições';

SELECT idEquipamento, valorHora FROM Equipamento WHERE nomeEquipamento = 'Guarda Sol G';

START TRANSACTION;

INSERT INTO Aluguel (idCliente, idFuncionario, dataHoraRetirada) 
VALUES (29, 3, '2024-12-10 00:00:00');

INSERT INTO AluguelEquipamento (idAluguel, idEquipamento, qtd, valorUnitario, valorItem)
VALUES (LAST_INSERT_ID(), 2, 2, 3.50, (3.50 * 2));

INSERT INTO AluguelEquipamento (idAluguel, idEquipamento, qtd, valorUnitario, valorItem)
VALUES (LAST_INSERT_ID(), 4, 1, 3.00, (3.00 * 1));

UPDATE Equipamento
SET qtd = qtd - 2
WHERE idEquipamento = 2;

UPDATE Equipamento
SET qtd = qtd - 1
WHERE idEquipamento = 4;

COMMIT;

SELECT nomeEquipamento, qtd 
FROM Equipamento 
WHERE idEquipamento IN (2, 4);

SELECT * FROM AluguelEquipamento 
ORDER BY idAluguelEquipamento DESC 
LIMIT 2;


/*9)Inserir o aluguel de 1 guarda sol P para 3 pessoas quaisquer feita pelo Cebolinha, em 27/12/24.Fazer o update da quantidade retirando do estoque.*/

/*10)Inserir o aluguel de 2 cadeiras 4 posições e um guarda sol G para 6 pessoas aleatórias feitas pelo Chico Bento, em dez 28/12/24. Fazer o update da quantidade retirando do estoque.*/

/*11)Listar o nome e os contatos de todos os clientes da barraca em ordem alfabética. */
SELECT nomeCliente, email 
FROM cliente
ORDER BY nomeCliente ASC

/*12)Listar o nome e o contato telefônico de todos os funcionários da barraca em ordem alfabética. */
SELECT nomeFuncionario, celular 
FROM funcionario
ORDER BY nomeFuncionario ASC

/*13)Listar todos os dados dos aluguéis realizados em ordem de data da mais antiga para a mais nova.*/

/*14)Listar nome, cidade e estado de todos os clientes da baixada santista em ordem alfabética por nome.*/

/*15)Listar todos os produtos e a quantidade de estoque do produto que tem mais itens para o que tem menos.*/

/*16)Listar o nome, a cidade e o estado de todos os clientes que moram em casa em ordem alfabética.*/
SELECT nomeCliente, cidade, estado FROM cliente 
WHERE (complemento IS NULL) OR (complemento like'Bloco%') OR (complemento like'Casa%')
ORDER BY nomeCliente ASC 

/*17)Listar o nome de todos os clientes e o estado daqueles que não vivem no estado de SP.*/

SELECT nomeCliente, estado
FROM Cliente
WHERE estado <> 'SP';

/* estado <> 'SP' significa "onde o estado for diferente de SP" */

/*18)Listar o nome de todos os clientes que começam com a letra A.*/
SELECT nomeCliente FROM cliente
WHERE nomeCliente LIKE 'A%' 


/*19)Listar todos os dados dos clientes que começam com a letra M e vivam no estado de PE.*/
SELECT * FROM cliente
WHERE (nomeCliente LIKE 'M%' AND estado ='PE')
 


/*20)Listar apenas as cadeiras e a quantidade que possui em estoque em ordem de quantidade, da que mais possui itens para a que menos possui.*/ 

/*21)Listar todos os dados dos alugueis que ocorreram entre 25/12 e 31/12 de 2024 em ordem de data da mais antiga para a mais nova.*/ 


