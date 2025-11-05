INSERT INTO tiposervico (nomeservico, valor)
VALUES 
('Consulta Padrão',150),
('Consulta Emergência',250),
('Exame - Sangue',100),
('Exame - Ultrassom|Raio X',300),
('Vacina - Geral',100),
('Castração',80),
('Internação',600);
 
SELECT * FROM tiposervico
INSERT INTO animal (idCliente, nomeAnimal, especie, raca, peso, porte, sexo, datadenascimento)
VALUES
(1,  'Thor',  'Canino', 'SRD', 12.40, 'M', 'M', 2021),
(7,  'Maya',  'Felino', 'Siames', 4.20, 'P', 'F', 2023),
(12, 'Pingo', 'Canino', 'Pinscher', 3.10, 'P', 'M', 2022),
(18, 'Luna',  'Felino', 'Persa', 3.80, 'P', 'F', 2020),
(22, 'Zeca',  'Ave',    'Calopsita', 0.09, 'P', 'M', 2024);

INSERT INTO vet (nomeVeterinario, crmv, especialidade)
VALUES 
('Farinhas Breno', 19234511070, 'Vet de Animais Intolerantes Celíacos'),
('Camila Souza', 20234511111, 'Cirurgiã de Pequenos Animais'),
('Rafael Nogueira', 18256722222, 'Clínico Geral e Emergencista'),
('Larissa Almeida', 17287633333, 'Especialista em Felinos'),
('Pedro Henrique', 16234544444, 'Anestesista Veterinário'),
('Juliana Ribeiro', 19298755555, 'Dermatologista de Animais Domésticos'),
('Lucas Fernandes', 15287666666, 'Ortopedista Veterinário'),
('Ana Beatriz Costa', 14234577777, 'Especialista em Animais Silvestres'),
('Gabriel Martins', 13287688888, 'Cardiologista Veterinário'),
('Patrícia Lima', 12234599999, 'Nutricionista Animal');

INSERT INTO consulta ( idAnimal, idVeterinario, dataHora, pago, formaPagamento, quantidadeDvezes, valorTotal, valorPago)
VALUES 
(1,3, '2025-11-03 18:00', 1, 'cartão de débito', 1, 700.00, 700.00),
(2,5, '2025-11-04 15:30', 1, 'cartão de crédito', 3, 850.00, 850.00),
(3,6, '2025-11-05 12:30', 1, 'dinheiro', 1, 750.00, 750.00),
(4,9, '2025-11-06 11:30', 1, 'dinheiro', 1, 500.00, 500.00),
(5,2, '2025-11-07 10:30', 1, 'cartão de crédito', 5, 800.00, 800.00);

INSERT INTO consulta_tiposervico (idConsulta, idTipoServico, valorServico)
VALUES
(1, 7, 600.00),
(2, 6, 80.00),
(3, 2, 250.00),
(4, 5, 100.00),
(5, 4, 300.00);
 
SELECT * FROM tiposervico
SELECT * FROM consulta
SELECT * FROM consulta_tiposervico
SELECT * FROM animal

DELETE FROM tiposervico
WHERE idTipoServico = 8;

DELETE FROM tiposervico
WHERE idTipoServico = 9;

DELETE FROM tiposervico
WHERE idTipoServico = 10;

DELETE FROM tiposervico
WHERE idTipoServico = 11;

DELETE FROM tiposervico
WHERE idTipoServico = 12;

DELETE FROM tiposervico
WHERE idTipoServico = 13;

DELETE FROM tiposervico
WHERE idTipoServico = 14; 
 
/*Inserir 2 consultas com 1 procedimento cada para um mesmo animal da clínica, mas em dias diferentes; (2 coins por linha afetada corretamente)*/
INSERT INTO consulta (idAnimal, idVeterinario, dataHora, Pago, formaPagamento, quantidadeDvezes, valorTotal, valorPago)
VALUES
(1, 2, '2025-11-05 12:30', 1, 'pix', 1, 600.00, 600.00);

INSERT INTO consulta (idAnimal, idVeterinario, dataHora, Pago, formaPagamento, quantidadeDvezes, valorTotal, valorPago)
VALUES 
(1, 2, '2025-11-06 13:30', 0, 'Dinheiro', 1, 600.00, 0.00);

INSERT INTO consulta_tiposervico (idConsulta, idTipoServico, valorServico)
VALUES 
(6, 7, 600.00),
(7, 7, 600.00);

/*Inserir 1 cosulta com 2 procedimentos para um mesmo animal da clínica. (2 coins por linha afetada corretamente)*/
INSERT INTO consulta (idAnimal, idVeterinario, dataHora, Pago, formaPagamento, quantidadeDvezes, valorTotal, valorPago)
VALUES
(1, 1, '2025-11-05 12:30', 1, 'pix', 1, 150.00, 150.00),
(1, 5, '2025-11-05 13:30', 0, 'pix', 1, 600.00, 0.00);

INSERT INTO consulta_tiposervico (idConsulta, idTipoServico, valorServico)
VALUES 
(8, 1, 150.00),
(7, 7, 600.00);
 
UPDATE consulta_tiposervico
SET idConsulta = 18
WHERE idConsultaTipoServico = 19;

/*VETERINÁRIOS (NOME, CRMV) apenas dos que atenderan yna cibsykta (dataHora) */
/*INNER JOIN*/ 
SELECT nomeVeterinario, crmv, dataHora FROM vet
INNER JOIN consulta 
ON vet.idVeterinario = consulta.idVeterinario
ORDER BY nomeVeterinario, dataHora ASC

/*LEFT JOIN*/ 
SELECT nomeVeterinario, crmv, dataHora, valorTotal 
FROM vet LEFT JOIN consulta
ON vet.idveterinario = consulta.idVeterinario

/*LEFT JOIN - ordenado por nome, depois por data*/ 
SELECT nomeVeterinario, crmv, dataHora, valorTotal 
FROM vet LEFT JOIN consulta
ON vet.idveterinario = consulta.idVeterinario
ORDER BY nomeVeterinario,dataHora ASC

/*LEFT JOIN - ordenado por nome, depois por data - apenas veterinarios com a Letra P */
SELECT nomeVeterinario, crmv, dataHora, valorTotal
FROM vet LEFT JOIN consulta
ON vet.idVeterinario = consulta.idVeterinario
WHERE nomeVeterinario LIKE 'P%'
ORDER BY nomeVeterinario, dataHora ASC

/*Nome do animal, nome do cliente, contatos do cliente em ordem alfabética por nome do animal apenas clientes que morem no estado SP*/
SELECT nomeAnimal, nomeCliente, estado, Email
FROM cliente INNER JOIN animal
ON  animal.idAnimal = cliente.idCliente 
WHERE estado LIKE 'SP'
ORDER BY nomeAnimal, nomeCliente ASC