/*Busca genérica de dados */
SELECT * FROM animal 

/*Busca específica de dados */
SELECT nomeAnimal,peso FROM animal

/*Inserção Explícita */
INSERT INTO Cliente (nomeCliente,cpf,Email,cidade,estado,CEP,tipoLogadouro,nomeLogradouro,numero,complemento)
VALUES ('Juquinha','77755566622','juquinha@uol','Santos','SP', '11054999', 'Avenida', 'Conselheiro Nébias', '78', 'ap54');

SELECT * FROM cliente
SELECT nomeCliente, celular, email FROM cliente

/*Inserção Implícita */
INSERT INTO cliente
VALUES (2,'Margarida','77755566611','margarida@uol','São Vicente','SP', '11054888', 'Rua', 'Emílio Ribas', '01', 'ap92');

SELECT * FROM cliente

/*Alteração de dados*/
UPDATE cliente
SET cidade='São Paulo',
cep='11088777',
nomeLogradouro='Jabaquara',
numero='132',
complemento='ap 55'
WHERE idcliente=2
 
/*exclusão de dados*/
DELETE FROM cliente
WHERE idcliente=2
 
/*buscas básicas*/
/*1*/
SELECT * FROM cliente
WHERE nomeCliente LIKE '%M%'
/*2*/
SELECT nomeCliente,cpf,cidade FROM cliente
WHERE cidade<>'São Paulo' /* >, <, >=, <=, =, <>, and, or, not */
/*3*/
SELECT nomeCliente,email FROM cliente
ORDER BY nomeCliente DESC

INSERT INTO cliente (nomeCliente,cpf,Email,cidade,estado,CEP,tipoLogadouro,nomeLogradouro,numero,complemento) 
VALUES
('João da Silva' , '12345678900' ,'joao.silva@email.com' , 'São Paulo' , 'SP' , '01001000' , 'Rua' , 'Augusta' , '123' , 'Apto 12'),
('Ana Pereira' , '98765432199' ,'ana.pereira@email.com' , 'Rio de Janeiro' , 'RJ' , '22041001' , 'Avenida' , 'Atlântica' , '456' , 'Bloco B'),
('Carlos Souza' , '34567890122' ,'carlos.souza@email.com' , 'Belo Horizonte' , 'MG' , '30130110' , 'Rua' , 'da Bahia' , '890' , 'Sala 3'),
('Mariana Oliveira' , '45678901233' ,'mariana.oliveira@email.com' , 'Curitiba' , 'PR' , '80010000' , 'Alameda' , 'Cabral' , '77' , 'Casa 2'),
('Pedro Gomes' , '56789012344' ,'pedro.gomes@email.com' , 'Porto Alegre' , 'RS' , '90010150' , 'Rua' , 'dos Andradas' , '345' , 'Fundos'),
('Luciana Alves' , '67890123455' ,'luciana.alves@email.com' , 'Brasília' , 'DF' , '70040010' , 'Setor' , 'Comercial Norte' , '25' , 'Sala 201'),
('Rafael Lima' , '78901234566' ,'rafael.lima@email.com' , 'Fortaleza' , 'CE' , '60060350' , 'Avenida' , 'Beira Mar' , '999' , 'Cobertura'),
('Patrícia Ferreira' , '89012345677' ,'patricia.ferreira@email.com' , 'Salvador' , 'BA' , '40015970' , 'Ladeira' , 'da Barra' , '58' , null),
('Fernando Costa' , '90123456788' ,'fernando.costa@email.com' , 'Campinas' , 'SP' , '13010200' , 'Rua' , 'Conceição' , '312' , 'Sala 5'),
('Gabriela Santos' , '01234567899' ,'gabriela.santos@email.com' , 'Vitória' , 'ES' , '29010180' , 'Avenida' , 'Beira Rio' , '500' , null),
('Bruno Rocha' , '11122233344' ,'bruno.rocha@email.com' , 'Goiânia' , 'GO' , '74003010' , 'Rua' , '24 de Outubro' , '210' , 'Loja 1'),
('Isabela Mendes' , '22233344455' ,'isabela.mendes@email.com' , 'Boa Vista' , 'RR' , '69301040' , 'Travessa' , 'das Flores' , '14' , null),
('Felipe Araújo' , '33344455566' ,'felipe.araujo@email.com' , 'Manaus' , 'AM' , '69005040' , 'Avenida' , 'Eduardo Ribeiro' , '801' , 'Apto 303'),
('Larissa Martins' , '44455566677' ,'larissa.martins@email.com' , 'Florianópolis' , 'SC' , '88010400' , 'Rua' , 'Felipe Schmidt' , '230' , null),
('André Teixeira' , '55566677788' ,'andre.teixeira@email.com' , 'São Luís' , 'MA' , '65010030' , 'Avenida' , 'Pedro II' , '77' , 'Casa 1'),
('Beatriz Nogueira' , '66677788899' ,'beatriz.nogueira@email.com' , 'Santos' , 'SP' , '11010001' , 'Rua' , 'Conselheiro Nébias' , '920' , 'Bloco A'),
('Rodrigo Ribeiro' , '77788899900' ,'rodrigo.ribeiro@email.com' , 'Ribeirão Preto' , 'SP' , '14010060' , 'Avenida' , 'Independência' , '410' , null),
('Carla Fernandes' , '88899900011' ,'carla.fernandes@email.com' , 'Natal' , 'RN' , '59020120' , 'Rua' , 'das Dunas' , '199' , null),
('Ricardo Barbosa' , '99900011122' ,'ricardo.barbosa@email.com' , 'Campo Grande' , 'MS' , '79002970' , 'Avenida' , 'Afonso Pena' , '321' , 'Sala 10'),
('Vanessa Castro' , '10120230344' ,'vanessa.castro@email.com' , 'Maceió' , 'AL' , '57020000' , 'Rua' , 'do Sol' , '76' , 'Fundos');

SELECT nomeCliente,email FROM cliente
ORDER BY nomeCliente

/*4
Listar nome dos clientes, cidade e estado de SP
*/

SELECT nomeCliente, cidade, estado FROM cliente
WHERE estado ='SP'	

/*5
Listar nome dos clientes, cidade e estado de todos aqueles que são dos estados de SP e RJ, cujos nomes comecem com a Letra A
*/

SELECT nomeCliente, cidade, estado FROM cliente
WHERE nomeCliente LIKE 'A%' AND estado ='SP' OR estado = 'RJ' 

/*6
Listar nome dos clientes, cidade e estado de todos aqueles que são dos estados de SP, RJ, MG e ES (região sudeste), cujos nomes comecem com a Letra F, em ordem alfabética por nome
*/
SELECT nomeCliente, cidade, estado FROM cliente
WHERE (nomeCliente LIKE 'F%' AND estado ='SP') OR (nomeCliente LIKE 'F%' AND estado = 'RJ') OR (nomeCliente LIKE 'F%' AND estado ='MG') OR (nomeCliente LIKE 'F%' AND estado = 'ES') 
ORDER BY nomeCliente DESC 

/*7

Listar o nome do cliente e a cidade de todos os clientes que morem em casa,

em ordem alfabética por nome
*/

SELECT nomeCliente, cidade FROM cliente 
WHERE (complemento IS NULL) OR (complemento like'Bloco%') OR (complemento like'Casa%')
ORDER BY nomeCliente DESC 
 
 
/*8 Listar todos os dados dos clientes que morem no estado de SP e morem em Avenidas,

em ordem decrescente por nome
*/
SELECT nomeCliente,cpf,Email,cidade,estado,CEP,tipoLogadouro,nomeLogradouro,numero,complemento FROM cliente 
WHERE tipoLogadouro = 'Avenida' AND estado ='SP'

