CREATE DATABASE CompareAqui;

USE CompareAqui;

CREATE TABLE Cliente
(
	id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone CHAR(9),
    senha CHAR(60), -- bcrypt
    id_verificacao CHAR(36), -- UUID
    verificacao BOOLEAN,
    imagem_p TEXT,
    imagem_m TEXT,
    imagem_g TEXT
);

CREATE TABLE AlteracaoSenha 
(
	id INT PRIMARY KEY,
    id_cliente INT, 
    id_verificacao CHAR(36), -- UUID
    gerada_em DATETIME,
    utilizada BOOL,
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Forum 
(
	id INT PRIMARY KEY,
    titulo VARCHAR(100),
    descricao VARCHAR(100),
    data_hora DATETIME
);

CREATE TABLE ForumCliente
(
	id_cliente INT,
    id_forum INT,
    PRIMARY KEY (id_cliente, id_forum),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY(id_forum) REFERENCES Forum(id)
);	

CREATE TABLE Localizacao 
(
	id INT PRIMARY KEY, 
    id_cliente INT,
    CEP CHAR(8),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Historico 
(
	id INT PRIMARY KEY,
    id_cliente INT, 
    categoria VARCHAR(100),
    descricao VARCHAR(300),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Produto
(
	id INT PRIMARY KEY,
    configuracao VARCHAR(500),
    modelo VARCHAR(100),
    imagem_p TEXT,
    imagem_m TEXT,
    imagem_g TEXT
);

CREATE TABLE Empresa
(
	id INT PRIMARY KEY,
    nome VARCHAR(100),
    endereco VARCHAR(200)
);

CREATE TABLE Ofertas
(
	id INT PRIMARY KEY,
    id_produto INT,
    id_empresa INT,
    preco DOUBLE,
    FOREIGN KEY(id_produto) REFERENCES Produto(id),
    FOREIGN KEY(id_empresa) REFERENCES Empresa(id)
);


CREATE TABLE OfertaFavorita
(
	id_cliente INT,
    id_ofertas INT,
    PRIMARY KEY (id_cliente, id_ofertas),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY(id_ofertas) REFERENCES Ofertas(id)
);

CREATE TABLE Marca
(
	id INT PRIMARY KEY,
    id_produto INT,
    nome VARCHAR(100),
    FOREIGN KEY(id_produto) REFERENCES Produto(id)
);

CREATE TABLE Categoria
(
	id INT PRIMARY KEY,
    id_produto INT,
    nome VARCHAR(100),
    FOREIGN KEY(id_produto) REFERENCES Produto(id)
);

CREATE TABLE SeloQualidade 
(
	id INT PRIMARY KEY,
    id_empresa INT,
    descricao VARCHAR(100),
    imagem_p TEXT,
    FOREIGN KEY(id_empresa) REFERENCES Empresa(id)
);

CREATE TABLE CategoriaCaracteristica
(
	id INT PRIMARY KEY,
    descricao VARCHAR(100)
);

CREATE TABLE Apresenta
(
	id_categoria INT ,
    id_categoriaCaracteristica INT,
    PRIMARY KEY (id_categoria, id_categoriaCaracteristica),
    FOREIGN KEY(id_categoria) REFERENCES Categoria(id),
    FOREIGN KEY(id_categoriaCaracteristica) REFERENCES CategoriaCaracteristica(id)
);	

CREATE TABLE ProdutoValorCategoriaCaracteristica
(
	id INT,
    id_produto INT,
    FOREIGN KEY(id_produto) REFERENCES Produto(id)
);

CREATE TABLE ValorCategoriaCaracteristica
(
	id INT PRIMARY KEY,
	id_categoriaCaracteristica INT, 
    descricao VARCHAR (100),
    FOREIGN KEY(id_categoriaCaracteristica) REFERENCES categoriaCaracteristica(id)
);

INSERT INTO Cliente VALUES (1, 'João', 'joao@gmail.com', '928372635', '$2a$12$CuXt5ufIwcRE9jE5PrrLVuTFp3ji5QVrljVfw5W6zrZLmj61LHaw6', '336c525a-f0d4-11ec-8ea0-0242ac120002', true, 'cliente/1/p.jpg', 'cliente/1/m.jpg', 'cliente/1/g.jpg');
INSERT INTO Cliente VALUES (2, 'Maria', 'maria@gmail.com', '909534813', '$2a$12$8sfojE24mpHkEMjaCAhcPu6IaUefe.N17r1TTQj.6.h4riDokNlHO', 'ed40516c-f0d5-11ec-8ea0-0242ac120002', true, 'cliente/2/p.jpg', 'cliente/2/m.jpg', 'cliente/2/g.jpg');
INSERT INTO Cliente VALUES (3, 'Ana', 'anab@gmail.com', '965384672', '$2a$12$7vEopxOcOunsg9lzp7wu6.ZJrE8lZFpEupP7fLH8fPpsNBrEzMmua', '67ddf442-f0d6-11ec-8ea0-0242ac120002', true, 'cliente/3/p.jpg', 'cliente/3/m.jpg', 'cliente/3/g.jpg');
INSERT INTO Cliente VALUES (4, 'Laís', 'laish@gmail.com', '976356410', '$2a$12$B/8AkU.KInk88e2HgVIejuActjVg40CJpOM8EL9fCOl.nnrDX0SMy', 'caff043a-f0d6-11ec-8ea0-0242ac120002', true, 'cliente/4/p.jpg', 'cliente/4/m.jpg', 'cliente/4/g.jpg');
INSERT INTO Cliente VALUES (5, 'Gabriel', 'gabriel@gmail.com', '989624532', '$2a$12$Hjj0yz3KSoKq7viLMOn9DuJl4iVizEwTaUdS9ZzJk2aRLwY0iL9cK', '37883a0e-f0d7-11ec-8ea0-0242ac120002', true,'cliente/5/p.jpg', 'cliente/5/m.jpg', 'cliente/5/g.jpg');
INSERT INTO Cliente VALUES (6, 'Pedro', 'pedro@gmail.com', '976543987', '$2a$12$52bedt/j1yoS60Dnnls5le2wn5jIiM5vq/1Z.c5LfwmfjlhRhpPvS', '950c7884-f0d7-11ec-8ea0-0242ac120002', true, 'cliente/6/p.jpg', 'cliente/6/m.jpg', 'cliente/6/g.jpg');
INSERT INTO Cliente VALUES (7, 'Lie', 'lie@gmail.com', '967134098', '$2a$12$jtiyVEYdwu8sV.uSUQIfeugDCwGjn5hl0wEcEQSaYtwsSLFX9Xo6K', '47ee4f54-f0d8-11ec-8ea0-0242ac120002', true, 'cliente/7/p.jpg', 'cliente/7/m.jpg', 'cliente/7/g.jpg');
INSERT INTO Cliente VALUES (8, 'Felipe', 'felipe@gmail.com', '909156475', '$2a$12$xR5IzAxzfGlWt0I2914J/.5EugiPl2cB9103lHikpMSKWgYwcA/sO', 'c6322e26-f0d8-11ec-8ea0-0242ac120002', true, 'cliente/8/p.jpg', 'cliente/8/m.jpg', 'cliente/8/g.jpg');
INSERT INTO Cliente VALUES (9, 'Fernanda', 'fernanda@gmail.com', '978152349', '$2a$12$cilUFD7BTBgjhpj/4eDom.RVfJlPB1KaQZS3eGzTztj2wN448njGm', '116b2b2c-f0d9-11ec-8ea0-0242ac120002', true, 'cliente/9/p.jpg', 'cliente/9/m.jpg', 'cliente/9/g.jpg');
INSERT INTO Cliente VALUES (10, 'Kauanne', 'kauanne@gmail.com', '913293674', '$2a$12$qDZAC6NRzAp/yYVhPIUBbuIvTnrmFyX/jNBX4H.ypniK3fk/3DOrS', '4aa72300-f0d9-11ec-8ea0-0242ac120002', true, 'cliente/10/p.jpg', 'cliente/10/m.jpg', 'cliente/10/g.jpg');
INSERT INTO Cliente VALUES (11, 'Latorre', 'latorre@gmail.com', '972340976', '$2a$12$RZOCYEButbFAZw0LsuLH.O6LWi9LgML3cn77pmoobAE6qAvoIi3IK', '0af83716-f0da-11ec-8ea0-0242ac120002', true, 'cliente/11/p.jpg', 'cliente/11/m.jpg', 'cliente/11/g.jpg');
INSERT INTO Cliente VALUES (12, 'Lucas', 'lucas@gmail.com', '998452631', '$2y$10$ZsC7p/x/elG/i1ojRM1/1.Rkf0x6AskXIb5.HVgOF5qy.4.Ypffx6', '8e9efba4-795e-4493-b88a-1849e37cd3b1', true, 'cliente/12/p.jpg', 'cliente/12/m.jpg', 'cliente/12/g.jpg');  -- foek
INSERT INTO Cliente VALUES (13, 'Amanda', 'amanda@gmail.com', '965497832', '$2y$10$z3LdkqGtL9M.oSYq.mxXGOdN1lqvYOAmubrnW9Uj.iCZdf0lPQAO.', 'd0dc28ab-8bcc-459a-bae1-4ecea3cc2ab5', true, 'cliente/13/p.jpg', 'cliente/13/m.jpg', 'cliente/13/g.jpg');
INSERT INTO Cliente VALUES (14, 'Abur', 'abur@gmail.com', '917283965', '$2y$10$Rs7XAhBcientMqnp6EoNzOJytD8CF26vJsiWYJqdTC.Qjp/TRgmOq', 'f4d6cba4-c4cd-47f9-b545-0417e0896de8', true, 'cliente/14/p.jpg', 'cliente/14/m.jpg', 'cliente/14/g.jpg');
INSERT INTO Cliente VALUES (15, 'Breno', 'breno@gmail.com', '91234576', '$2y$10$HZ35eRCX1Eus5LQGKx8vuOh8qCWMCZuAZ6bqGHFKFXDbVDGeawY36', '7f4460c5-b235-4f96-8d3e-e6e9c20ff4dc', true, 'cliente/15/p.jpg', 'cliente/15/m.jpg', 'cliente/15/g.jpg');
INSERT INTO Cliente VALUES (16, 'Leticia', 'lele@gmail.com', '98765431', '$2y$10$33UgbCoP7Y/gLDN/ZJeo/ufGzZooh2Fih2EB.vBHIJguWy0rtom7K', '79f5ff54-6bb9-43fb-a3a0-9cd11ab5a518', true, 'cliente/16/p.jpg', 'cliente/16/m.jpg', 'cliente/16/g.jpg');
INSERT INTO Cliente VALUES (17, 'Igor', 'igu@gmail.com', '976134832', '$2y$10$zNfLgZcPt8PPmk8HTAx0deOXf/AiZFNgrhupg34y23g7XbA/vDyP.', '1a6e687e-7ecf-4160-8822-7973db6e2a3d', true, 'cliente/17/p.jpg', 'cliente/17/m.jpg', 'cliente/17/g.jpg');
INSERT INTO Cliente VALUES (18, 'Sidoka', 'doka@gmail.com', '965871342', '$2y$10$f1FJFIW/.g7OJN9rUbxMD.ukeIyDZIYPVyBPrm63KgqNH2oK65vUq', '397303ba-9029-4f38-aae7-d29df144283d', true, 'cliente/18/p.jpg', 'cliente/18/m.jpg', 'cliente/18/g.jpg');
INSERT INTO Cliente VALUES (19, 'Djonga', 'djonga@gmail.com', '963527841', '$2y$10$y0ZyXaKmPZSpby3BFyFgeuAAempV.b7T/bdIgVsO/VgyP4WxxdJ3u', '14c39d21-e8cc-4d6e-8ff3-7ebd5b761130 ', true, 'cliente/19/p.jpg', 'cliente/19/m.jpg', 'cliente/19/g.jpg');
INSERT INTO Cliente VALUES (20, 'Karlos', 'kaka@gmail.com', '958163247', '$2y$10$dUhUtLjayLvtYyOtnWQiUOYYXAgSeIdYy/jEAp1PJKQL1FM9PJFP.', 'bf998794-b26e-4e33-adc4-38854d7a625c', true, 'cliente/20/p.jpg', 'cliente/20/m.jpg', 'cliente/20/g.jpg');
INSERT INTO Cliente VALUES (21, 'Diogo', 'vulgod@gmail.com', '946132785', '$2y$10$6avBLqNQOfZD01C1HcmoGeTi6TbDoVeUdi8FkNaqn.VM9eLWrl1Ae', '8927e04d-68fc-49be-ab9a-fce710b3d2ea', true, 'cliente/21/p.jpg', 'cliente/21/m.jpg', 'cliente/21/g.jpg');
INSERT INTO Cliente VALUES (22, 'Suse', 'susu@gmail.com', '946317825', '$2y$10$3DyUvm6XUy.JU8wDdVVgv.qkfhHUeeOrHfoSrEtHzKBcMSgUvkwb6', '32c3caea-55ae-4e09-b9a7-2912c9e4cd01', true, 'cliente/22/p.jpg', 'cliente/22/m.jpg', 'cliente/22/g.jpg');

INSERT INTO AlteracaoSenha VALUES (1, 1, '33736ff9-fa05-4c24-8928-590cdc66dbaf', '2022-01-10 18:00:00', false);
INSERT INTO AlteracaoSenha VALUES (2, 2, '85b03972-d85c-41af-ac26-c5090601b7c5', '2022-02-04 19:00:00', true);
INSERT INTO AlteracaoSenha VALUES (3, 3, 'f8448d55-04fa-4033-b2ac-2f1ad9035fdb', '2022-03-11 20:00:03', true);
INSERT INTO AlteracaoSenha VALUES (4, 4, '32a4d699-48b5-4db6-bbfc-e547140b5064', '2022-04-15 19:00:05', true);
INSERT INTO AlteracaoSenha VALUES (5, 5, '870925ac-b1c5-471f-90e7-4d95830affd0', '2022-05-14 18:00:04', false);
INSERT INTO AlteracaoSenha VALUES (6, 6, 'd62b1fd4-1caa-4297-942f-f7b4682678d9', '2022-06-13 17:00:07', true);
INSERT INTO AlteracaoSenha VALUES (7, 7, '74629c61-7832-4a3f-8d89-a79743d7ea07', '2022-07-12 16:00:04', false);
INSERT INTO AlteracaoSenha VALUES (8, 8, '037e346b-e39b-4573-a7c1-29fed67b4a2f', '2022-08-26 15:00:00', true);
INSERT INTO AlteracaoSenha VALUES (9, 9, 'b4829e96-98c4-481e-88c8-9eb4c92c1d6b', '2022-09-21 14:00:04', false);
INSERT INTO AlteracaoSenha VALUES (10, 10, '9410734b-48d6-4434-a7d9-a8b961405717', '2022-10-22 13:05:00', true);
INSERT INTO AlteracaoSenha VALUES (11, 11, 'e8361006-e5c0-4257-93b6-d94491c3537e', '2022-11-23 12:00:00', true);
INSERT INTO AlteracaoSenha VALUES (12, 12, 'fe774b2a-a2c9-4679-b24b-99f360c3d7a5', '2022-12-24 11:45:00', true);
INSERT INTO AlteracaoSenha VALUES (13, 13, '5a28a7ff-6a8d-4f95-b9ea-2b902be8fdd0', '2022-11-25 10:00:00', false);
INSERT INTO AlteracaoSenha VALUES (14, 14, 'e740ac5f-ffe3-466a-9dbf-f45f9bc26abe', '2022-10-26 09:56:04', true);
INSERT INTO AlteracaoSenha VALUES (15, 15, '01ecafc5-6feb-4be1-84eb-39ba3ea9e197', '2022-09-27 08:00:04', true);
INSERT INTO AlteracaoSenha VALUES (16, 16, 'b843dab1-dcb9-4fcb-b22a-601d195b57ef', '2022-08-28 07:00:04', false);
INSERT INTO AlteracaoSenha VALUES (17, 17, '0d242f51-8e48-41ad-a80c-59b14d30da66', '2022-07-29 06:00:04', true);
INSERT INTO AlteracaoSenha VALUES (18, 18, 'd6028fe4-2c97-4fb2-8f70-36783a866658', '2022-06-30 05:00:00', false);
INSERT INTO AlteracaoSenha VALUES (19, 19, '55a3bddc-3027-4377-97a4-eee0c6fd2d09', '2022-05-01 04:00:04', true);
INSERT INTO AlteracaoSenha VALUES (20, 20, 'a6185458-5a55-40d3-bc2e-c6c3bb1afaca', '2022-04-07 03:00:04', false);
INSERT INTO AlteracaoSenha VALUES (21, 21, '4d984782-3d05-44ee-843e-5459b1aa63e2', '2022-03-12 02:00:04', true);
INSERT INTO AlteracaoSenha VALUES (22, 22, '886549c7-98fe-4c1b-bd21-6de91cf479fd', '2022-02-06 01:00:04', true);

INSERT INTO Forum VALUES (1, 'Cor', 'Como selecionar apenas uma cor de determinado produto?', '2022-01-02 01:00:04');
INSERT INTO Forum VALUES (2, 'Perfil', 'Como mudar o nome do perfil?', '2022-03-04 02:00:04');
INSERT INTO Forum VALUES (3, 'Perfil', 'Como mudar o email do perfil?', '2022-10-26 03:00:04');
INSERT INTO Forum VALUES (4, 'Localização', 'Como colocar masi de uma localização do perfil', '2022-06-12 04:00:04');
INSERT INTO Forum VALUES (5, 'Perfil', 'Como mudar a foto do perfil?', '2022-04-05 05:00:04');
INSERT INTO Forum VALUES (6, 'Produto', 'Quero saber como er o valor mais caro', '2022-06-07 06:00:04');
INSERT INTO Forum VALUES (7, 'Produto', 'Gostaria de saber onde pegar as informações sobre as empresas', '2022-08-09 07:00:04');
INSERT INTO Forum VALUES (8, 'Selo', 'O que é o selo próximo ao nome das lojas', '2022-10-11 01:00:04');
INSERT INTO Forum VALUES (9, 'Filtro', 'o meu filtro não está funcionando, poderia me ajudar?', '2022-12-13 08:00:04');
INSERT INTO Forum VALUES (10, 'Site', 'o site é compatível com windowns piratão', '2022-01-14 09:00:04');
INSERT INTO Forum VALUES (11, 'Favoritos', 'como faço para favoritar se não tenho conta?', '2022-02-15 10:00:04');
INSERT INTO Forum VALUES (12, 'Contas', 'Posso ter várias contas?', '2022-03-16 11:00:04');
INSERT INTO Forum VALUES (13, 'Perfil', 'Como eu posso criar uma conta? ', '2022-04-17 12:00:04');
INSERT INTO Forum VALUES (14, 'Fórum', 'Eu consigo incluir imagens da tela ou vídeos no fórum? ', '2022-05-18 13:00:04');
INSERT INTO Forum VALUES (15, 'Fórum', 'Como eu encontro as minhas perguntas no fórum? #', '2022-06-19 14:00:04');
INSERT INTO Forum VALUES (16, 'Perfil', 'Como responder uma pergunta do fórum', '2022-07-20 15:00:04');
INSERT INTO Forum VALUES (17, 'Tópico', 'Como excluir um tópico', '2022-08-21 16:00:04');
INSERT INTO Forum VALUES (18, 'Dúvida', 'Por que o meu tópico desapareceu? ', '2022-09-22 17:00:04');
INSERT INTO Forum VALUES (19, 'Conta', 'Eu consigo apagar a minha conta?', '2022-11-23 18:00:04');
INSERT INTO Forum VALUES (20, 'Senha', 'Perdi minha senha, como recuperar?', '2022-12-24 19:00:04');
INSERT INTO Forum VALUES (21, 'Site', 'Quais celulares são compatíveis', '2022-11-06 20:00:04');
INSERT INTO Forum VALUES (22, 'Site', 'vão liberar um tutorial de como mexer?', '2022-12-06 21:00:04');

INSERT INTO ForumCliente VALUES (1, 1);
INSERT INTO ForumCliente VALUES (2, 2);
INSERT INTO ForumCliente VALUES (3, 3);
INSERT INTO ForumCliente VALUES (4, 4);
INSERT INTO ForumCliente VALUES (5, 5);
INSERT INTO ForumCliente VALUES (6, 6);
INSERT INTO ForumCliente VALUES (7, 7);
INSERT INTO ForumCliente VALUES (8, 8);
INSERT INTO ForumCliente VALUES (9, 9);
INSERT INTO ForumCliente VALUES (10, 10);
INSERT INTO ForumCliente VALUES (11, 11);
INSERT INTO ForumCliente VALUES (12, 12);
INSERT INTO ForumCliente VALUES (13, 13);
INSERT INTO ForumCliente VALUES (14, 14);
INSERT INTO ForumCliente VALUES (15, 15);
INSERT INTO ForumCliente VALUES (16, 16);
INSERT INTO ForumCliente VALUES (17, 17);
INSERT INTO ForumCliente VALUES (18, 18);
INSERT INTO ForumCliente VALUES (19, 19);
INSERT INTO ForumCliente VALUES (20, 20);
INSERT INTO ForumCliente VALUES (21, 21);
INSERT INTO ForumCliente VALUES (22, 22);

INSERT INTO Localizacao VALUES (1, 1, '64764098');
INSERT INTO Localizacao VALUES (2, 2, '35620913');
INSERT INTO Localizacao VALUES (3, 3, '25309549');
INSERT INTO Localizacao VALUES (4, 4, '17349620');
INSERT INTO Localizacao VALUES (5, 5, '19359460');
INSERT INTO Localizacao VALUES (6, 6, '18243500');
INSERT INTO Localizacao VALUES (7, 7, '84531053');
INSERT INTO Localizacao VALUES (8, 8, '62494254');
INSERT INTO Localizacao VALUES (9, 9, '16452074');
INSERT INTO Localizacao VALUES (10, 10, '83538254');
INSERT INTO Localizacao VALUES (11, 12, '74529457');
INSERT INTO Localizacao VALUES (13, 14, '14471648');
INSERT INTO Localizacao VALUES (15, 16, '64538642');
INSERT INTO Localizacao VALUES (17, 17, '63429811');
INSERT INTO Localizacao VALUES (18, 18, '64025638');
INSERT INTO Localizacao VALUES (19, 19, '19273454');
INSERT INTO Localizacao VALUES (20, 20, '98453473');
INSERT INTO Localizacao VALUES (21, 21, '45473563');
INSERT INTO Localizacao VALUES (22, 22, '65462546');

INSERT INTO Historico VALUES (1, 1, 'Videogame', 'Vídeo Game Portátil Jogos Arcade Mp5');
INSERT INTO Historico VALUES (2, 1, 'Videogame', 'Vídeo Game 8 Bits Retro Com 2 Controles 620 Jogos Clássicos');
INSERT INTO Historico VALUES (3, 2, 'Lavadeira', 'lavadeira pequena cor violeta');
INSERT INTO Historico VALUES (4, 2, 'Blusa', 'blusa corte feminino rosa');
INSERT INTO Historico VALUES (5, 3, 'Blusa', 'blusa corte feminino verde');
INSERT INTO Historico VALUES (6, 3, 'Blusa', 'blusa corte feminino azul');
INSERT INTO Historico VALUES (7, 4, 'Celular', 'Smartphone Samsung Galaxy A03 Preto, 64GB, 4GB RAM, Tela Infinita de 6.5", Câmera Dupla Traseira, Bateria 5000 mAh e Processador Octa Core');
INSERT INTO Historico VALUES (8, 4, 'Celular', 'iPhone 11 Apple 64GB branco, Tela de 6,1, Câmera Dupla de 12MP, iOS');
INSERT INTO Historico VALUES (9, 5, 'Celular', 'iPhone 13 Apple 128GB Rosa Tela de 6,1, Câmera Dupla de 12MP');
INSERT INTO Historico VALUES (10, 5, 'Celular', 'iPhone 11 Apple Branco, 64GB Desbloqueado - MHDC3BZ/A');
INSERT INTO Historico VALUES (11, 6, 'Cama', 'Cama de Solteiro Villa Incabrás');
INSERT INTO Historico VALUES (12, 6, 'Cama', 'Cama de Solteiro Madeira Maciça');
INSERT INTO Historico VALUES (13, 7, 'Cama', 'Cama de Solteiro Santos Andirá Invicta Atacama com Baú e 2 Gavetas');
INSERT INTO Historico VALUES (14, 7, 'Bola', 'Bola Nike Brasil Strike');
INSERT INTO Historico VALUES (15, 8, 'Bola', 'Bola Nike CBF Society');
INSERT INTO Historico VALUES (16, 8, 'Bola', 'Bola Nike FC Barcelona Strike');
INSERT INTO Historico VALUES (17, 9, 'Sapatos', 'Tênis Couro Cadarço Flatform Dourado ');
INSERT INTO Historico VALUES (18, 9, 'Sapatos', 'Bota Tratorada Verde Musgo');
INSERT INTO Historico VALUES (19, 10, 'Sapatos', 'Mule Nude Flats Bico Fino');
INSERT INTO Historico VALUES (20, 10, 'Sapatos', 'Sandália Branca Couro Meia Pata Salto Flare Megan ');
INSERT INTO Historico VALUES (21, 11, 'Roupa', 'RELÓGIO NATAN AUTOMÁTICO CALIBRE 911 MASCULINO EM COURO PRETO');
INSERT INTO Historico VALUES (22, 11, 'Livro', 'Evelyn Hugo');
INSERT INTO Historico VALUES (23, 12, 'Livro', 'Harry Potter');
INSERT INTO Historico VALUES (24, 12, 'Livro', 'Trono de Vidro');
INSERT INTO Historico VALUES (25, 13, 'Prudente', 'Sabor churros');
INSERT INTO Historico VALUES (26, 13, 'Prudence', 'Sabor picante');
INSERT INTO Historico VALUES (27, 14, 'Barbie', 'Barbie veterinária');
INSERT INTO Historico VALUES (28, 14, 'Brinco', 'Brinco de pato');
INSERT INTO Historico VALUES (29, 15, 'Aliança', 'Aliança fina');
INSERT INTO Historico VALUES (30, 15, 'Perfume', 'Perfume Floratta Rose');
INSERT INTO Historico VALUES (31, 16, 'Caderno', 'Caderno BTS');
INSERT INTO Historico VALUES (32, 17, 'Vaso', 'Vaso pequeno');
INSERT INTO Historico VALUES (33, 17, 'Coleira', 'Coleira anti-pulga');
INSERT INTO Historico VALUES (34, 18, 'Violão', 'Violão corda de aço');
INSERT INTO Historico VALUES (35, 18, 'Maquiagem', 'Delineador Ruby Rose');
INSERT INTO Historico VALUES (36, 19, 'Maquiagem', 'Pó banana');
INSERT INTO Historico VALUES (37, 19, 'Protetor', 'Protetor solar 30');
INSERT INTO Historico VALUES (38, 20, 'Chupeta', 'Chupeta azul');
INSERT INTO Historico VALUES (39, 20, 'Geladeira', 'Geladeira Eletrolux');
INSERT INTO Historico VALUES (40, 21, 'Anti-arlégico', 'Loratadina');
INSERT INTO Historico VALUES (41, 21, 'Calmante', 'Rivotril');
INSERT INTO Historico VALUES (42, 22, 'Asma', 'Alenia');
INSERT INTO Historico VALUES (43, 22, 'Enjoo', 'Dramin');

INSERT INTO  Produto VALUES (1, 'Ano: 2019/2020, Câmbio: Manual, KM: 21.300, Combustível: Gasolina e álcool, Carroceria: Hatchback, cor: cinza', 'FIAT UNO 1.0 FIRE FLEX ATTRACTIVE MANUAL', 'produto/1/p.jpg', 'produto/1/m.jpg', 'produto/1/g.jpg');
INSERT INTO  Produto VALUES (2, 'Bico: Redondo, Pisada: Neutra, Material Externo: Têxtil, Material Interno: Têxtil, Fechamento: Cadarço', 'Tênis Nike Downshifter 11', 'produto/2/p.jpg', 'produto/2/m.jpg', 'produto/2/g.jpg');
INSERT INTO  Produto VALUES (3, 'Dimensões do produto: 1 x 1 x 1 cm; 0.97 g, Fabricante: ADIDAS, ASIN: B07QFF2BQL, Número do modelo: EE7692, Departamento: Masculino', 'TENIS ADIDAS CASUAL ADVANTAGE', 'produto/3/p.jpg', 'produto/3/m.jpg', 'produto/3/g.jpg');
INSERT INTO  Produto VALUES (4, '02 Portas Frost Free com 425 Litros e Painel Easy Touch Aço Escovado - BB53', 'Geladeira Panasonic Econavi NR-BB53PV3X Frost Free Inverse', 'produto/4/p.jpg', 'produto/4/m.jpg', 'produto/4/g.jpg');
INSERT INTO  Produto VALUES (5, 'Colorida, Wi-fi, Conexão USB, Bivolt - HP CX 1 UN', 'Impressora Multifuncional Deskjet Ink Advantage 2774 7FR22A', 'produto/5/p.jpg', 'produto/5/m.jpg', 'produto/5/g.jpg');
INSERT INTO  Produto VALUES (6, 'Ano: 2021/2021, Câmbio: Automatica, KM: 30.000, Combustível: Gasolina, Carroceria: Utilitário esportivo, cor: vermelho', 'FORD BRONCO SPORT 2.0 ECOBOOST GASOLINA WILDTRAK 4X4 SELECTSHIFT', 'produto/6/p.jpg', 'produto/6/m.jpg', 'produto/6/g.jpg');
INSERT INTO  Produto VALUES (7, 'Ano: 2021/2021, Câmbio: Automatica, KM: 21.260, Combustível: Gasolina e álcool, Carroceria: Utilitário esportivo, Cor: Preto', 'JEEP COMPASS 2.0 16V FLEX LONGITUDE AUTOMÁTICO', 'produto/7/p.jpg', 'produto/7/m.jpg', 'produto/7/g.jpg');
INSERT INTO  Produto VALUES (8, 'Gênero:Masculino, Indicado para:Dia a Dia, Estilo da Peça:Lisa, Material:Sintético, Material Interno:Têxtil, Altura do Cano:Cano Baixo, Fechamento:Cadarço, Solado:Borracha, Peso do Produto:323 g (o pesodo produto varia de acordo com a numeração)Garantia do Fabricante:Contra defeito de fabricação, Origem:Nacional', 'TENIS FILA EURO JOGGER SPORT', 'produto/8/p.jpg', 'produto/8/m.jpg', 'produto/8/g.jpg');
INSERT INTO  Produto VALUES (9, 'Sem Fio Comfort Usb Preto PP400005', 'Microsoft Teclado E Mouse Sem Fio', 'produto/9/p.jpg', 'produto/9/m.jpg', 'produto/9/g.jpg');
INSERT INTO  Produto VALUES (10, 'Capacidade de armazenamento da memória: 128 GB, Tela Super Retina XDR de 6,1 polegadas, Sistema avançado de câmera dupla com câmeras Wide e Ultra Wide de 12MP; Estilos fotográficos, Smart HDR 4, modo noturno, gravação 4K Dolby Vision HDR, Câmera frontal TrueDepth de 12 MP com modo noturno, gravação 4K Dolby Vision HDR, Chip biônico A15 para desempenho ultrarrápido', 'iPhone 13', 'produto/10/p.jpg', 'produto/10/m.jpg', 'produto/10/g.jpg');
INSERT INTO  Produto VALUES (11, 'Ano: 2020/2021, Câmbio: Manual, KM: 17.066, Combustível: Gasolina e álcool, Carroceria: Picape, Cor: Preto', 'FIAT STRADA 1.3 FIREFLY FLEX FREEDOM CS MANUAL', 'produto/11/p.jpg', 'produto/11/m.jpg', 'produto/11/g.jpg');
INSERT INTO  Produto VALUES (12, 'Ano: 2015/2015, Câmbio: Automática, KM: 96.705, Combustível: Gasolina e álcool, Carroceria: Hatchback, Cor: Preto', 'FIAT PUNTO 1.8 SPORTING 16V FLEX 4P AUTOMATIZADO', 'produto/12/p.jpg', 'produto/12/m.jpg', 'produto/12/g.jpg');
INSERT INTO  Produto VALUES (13, 'Ano: 2011/2012, Câmbio: Manual, KM: 93.000, Combustível: Gasolina e álcool, Carroceria: Perua/SW, Cor: Branco', 'FIAT PALIO 1.8 MPI ADVENTURE WEEKEND 16V FLEX 4P MANUAL', 'produto/13/p.jpg', 'produto/13/m.jpg', 'produto/13/g.jpg');
INSERT INTO  Produto VALUES (14, 'Capacidade de armazenamento: 128GB, Memória RAM: 8GB, Tela Infinita de 6.2', 'Smartphone Samsung Galaxy S21 Phantom Gray', 'produto/14/p.jpg', 'produto/14/m.jpg', 'produto/14/g.jpg');
INSERT INTO  Produto VALUES (15, 'Capacidade de armazenamento: 128GB, Memória RAM: 6GB, Sistema operacional	Android 12', 'Xiaomi Redmi Note 10S', 'produto/15/p.jpg', 'produto/15/m.jpg', 'produto/15/g.jpg');
INSERT INTO  Produto VALUES (16, 'Core i5-1135G7 8GB 256GB SSD Tela Full HD 15.6” Windows 11 Book NP550XDA-KH2BR', 'Notebook Samsung', 'produto/16/p.jpg', 'produto/16/m.jpg', 'produto/16/g.jpg');
INSERT INTO  Produto VALUES (17, 'Hd Pro Full Hd 960-001257', 'Webcam Logitech C920s', 'produto/17/p.jpg', 'produto/17/m.jpg', 'produto/17/g.jpg');
INSERT INTO  Produto VALUES (18, 'Material da blusa: Moletom, Tipo de manga: Longa, Temporada de lançamento: Outono/Inverno, Gênero: Sem gênero', 'Blusa de frio Diverse', 'produto/18/p.jpg', 'produto/18/m.jpg', 'produto/18/g.jpg');
INSERT INTO  Produto VALUES (19, 'Cor:Preto, Dimensões:375x215x439mm, Cooler:- Cooler Frontal: 3x120mm (não incluso)., Cooler Superior: 2x120mm (não incluso).', 'Gabinete Gamer MID Tower HOLT', 'produto/19/p.jpg', 'produto/19/m.jpg', 'produto/19/g.jpg');
INSERT INTO  Produto VALUES (20, 'Cor: Preto; Tamanho da Tela Polegadas: 32; Tipo de Tela: Tela led; Conversor Digital: Sim; Wi-Fi; Ethernet; Portas usb: 1; hdmi: 2; Potencia de Saída de Áudio: 5W + 5W; Tipo de Auto Falante: 2CH; Consumo de Energia: 117W; Tensão: AC100-240V 50/60Hz; Vesa: 100 x 100 mm; Frequência:60 Hz; Sistema Operacional: Tizen; Tipo de Painel: led;', 'Tv Led Samsung 32', 'produto/20/p.jpg', 'produto/20/m.jpg', 'produto/20/g.jpg');
INSERT INTO  Produto VALUES (21, '32GB HAC-001-01 1 Controle Joy-Con - Vermelho e Azul', 'Nintendo Switch', 'produto/21/p.jpg', 'produto/21/m.jpg', 'produto/21/g.jpg');
INSERT INTO  Produto VALUES (22, '39 x 55 x 21 cm (comprimento x Altura x Profundidade), Volume: 34L, Alça de Mão:Dupla, Peso 3.6 kg ', 'PÉGASE', 'produto/22/p.jpg', 'produto/22/m.jpg', 'produto/22/g.jpg');

INSERT INTO  Empresa VALUES (1, 'Fiat', 'Av. Pacaembu, 1934');
INSERT INTO  Empresa VALUES (2, 'Nike', 'Av. Mutinga, 4375');
INSERT INTO  Empresa VALUES (3, 'Adidas', 'R. Campante, 586');
INSERT INTO  Empresa VALUES (4, 'Panasonic', 'Av. das Nações Unidas, 17007');
INSERT INTO  Empresa VALUES (5, 'HP', 'R. Augusta, 510');
INSERT INTO  Empresa VALUES (6, 'Ford', 'Av. Nove de Julho, 585');
INSERT INTO  Empresa VALUES (7, 'Jeep', 'R. Estela, 615');
INSERT INTO  Empresa VALUES (8, 'FILA', 'Av. Santos Dummont, 508');
INSERT INTO  Empresa VALUES (9, 'Microsoft', 'Av. Brg. Faria Lima, 1713');
INSERT INTO  Empresa VALUES (10, 'Ponto do Iphone', 'Av. Paulista, 1159');
INSERT INTO  Empresa VALUES (11, 'Fiat', 'Av. Pacaembu, 1934 ');
INSERT INTO  Empresa VALUES (12, 'Fiat', 'Av. Pacaembu, 1934 ');
INSERT INTO  Empresa VALUES (13, 'Fiat', 'Av. Pacaembu, 1934 ');
INSERT INTO  Empresa VALUES (14, 'Samsung', 'Av. Pedroso de Morais, 670');
INSERT INTO  Empresa VALUES (15, 'Xiome', 'R. Apeninos, 222');
INSERT INTO  Empresa VALUES (16, 'Casas Bahia', 'Praça Ramos de Azevedo, 131');
INSERT INTO  Empresa VALUES (17, 'Mercado Extra', 'R. Frei Caneca, 763');
INSERT INTO  Empresa VALUES (18, 'Mercado livre', 'Av. Benedito Andrade, 568');
INSERT INTO  Empresa VALUES (19, 'Ponto Frio', 'R. Cap. Tiago Luz, 134');
INSERT INTO  Empresa VALUES (20, 'Shoptime', 'R. Augusta, 1894');
INSERT INTO  Empresa VALUES (21, 'Magazineluiza', 'Ladeira Velha, 17');
INSERT INTO  Empresa VALUES (22, 'Louis Vuitton', 'Av. Magalhães de Castro, 12000');

INSERT INTO  Ofertas VALUES (1, 1, 1, 50000.00);
INSERT INTO  Ofertas VALUES (2, 2, 2, 198.99);
INSERT INTO  Ofertas VALUES (3, 3, 3, 229.00);
INSERT INTO  Ofertas VALUES (4, 4, 4, 4609.00);
INSERT INTO  Ofertas VALUES (5, 5, 5, 345.00);
INSERT INTO  Ofertas VALUES (6, 6, 6, 239990.00);
INSERT INTO  Ofertas VALUES (7, 7, 7, 139.90);
INSERT INTO  Ofertas VALUES (8, 8, 8, 242.52);
INSERT INTO  Ofertas VALUES (9, 9, 9, 674.99);
INSERT INTO  Ofertas VALUES (10, 10, 10, 5489.00);
INSERT INTO  Ofertas VALUES (11, 11, 11, 94900.00);
INSERT INTO  Ofertas VALUES (12, 12, 12, 48900.00);
INSERT INTO  Ofertas VALUES (13, 13, 13, 34990.00);
INSERT INTO  Ofertas VALUES (14, 14, 14, 2450.00);
INSERT INTO  Ofertas VALUES (15, 15, 15, 1276.00);
INSERT INTO  Ofertas VALUES (16, 16, 16, 3549.00);
INSERT INTO  Ofertas VALUES (17, 17, 17, 499.99);
INSERT INTO  Ofertas VALUES (18, 18, 18, 179.90);
INSERT INTO  Ofertas VALUES (19, 19, 19, 314.22);
INSERT INTO  Ofertas VALUES (20, 20, 20, 1635.00);
INSERT INTO  Ofertas VALUES (21, 21, 21, 2213.00);
INSERT INTO  Ofertas VALUES (22, 22, 22, 17100.00);

INSERT INTO OfertaFavorita VALUES (1, 1);
INSERT INTO OfertaFavorita VALUES (2, 2);
INSERT INTO OfertaFavorita VALUES (3, 3);
INSERT INTO OfertaFavorita VALUES (4, 4);
INSERT INTO OfertaFavorita VALUES (5, 5);
INSERT INTO OfertaFavorita VALUES (6, 6);
INSERT INTO OfertaFavorita VALUES (7, 7);
INSERT INTO OfertaFavorita VALUES (8, 8);
INSERT INTO OfertaFavorita VALUES (9, 9);
INSERT INTO OfertaFavorita VALUES (10, 10);
INSERT INTO OfertaFavorita VALUES (11, 11);
INSERT INTO OfertaFavorita VALUES (12, 12);
INSERT INTO OfertaFavorita VALUES (13, 13);
INSERT INTO OfertaFavorita VALUES (14, 14);
INSERT INTO OfertaFavorita VALUES (15, 15);
INSERT INTO OfertaFavorita VALUES (16, 16);
INSERT INTO OfertaFavorita VALUES (17, 17);

INSERT INTO Marca VALUES (1, 1, 'Fiat');
INSERT INTO Marca VALUES (2, 2, 'Nike');
INSERT INTO Marca VALUES (3, 3, 'Adidas');
INSERT INTO Marca VALUES (4, 4, 'Panasonic');
INSERT INTO Marca VALUES (5, 5, 'HP');
INSERT INTO Marca VALUES (6, 6, 'Ford');
INSERT INTO Marca VALUES (7, 7, 'Jeep');
INSERT INTO Marca VALUES (8, 8, 'FILA');
INSERT INTO Marca VALUES (9, 9, 'Microsoft');
INSERT INTO Marca VALUES (10, 10, 'Apple');
INSERT INTO Marca VALUES (11, 11, 'Saraiva');
INSERT INTO Marca VALUES (12, 12, 'Converse');
INSERT INTO Marca VALUES (13, 13, 'Asus');
INSERT INTO Marca VALUES (14, 14, 'Eletrolux');
INSERT INTO Marca VALUES (15, 15, 'Xiaomi');
INSERT INTO Marca VALUES (16, 16, 'Samsung');
INSERT INTO Marca VALUES (17, 17, 'Logitech');
INSERT INTO Marca VALUES (18, 18, 'Diverse');
INSERT INTO Marca VALUES (19, 19, 'Mid Tower');
INSERT INTO Marca VALUES (20, 20, 'Prudence');
INSERT INTO Marca VALUES (21, 21, 'Nintendo');
INSERT INTO Marca VALUES (22, 22, 'Renner');

INSERT INTO SeloQualidade VALUES (1, 1, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (2, 2, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (3, 3, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (4, 4, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (5, 5, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (6, 6, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (7, 7, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (8, 8, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (9, 9, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (10, 10, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (11, 11, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (12, 12, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (13, 13, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (14, 14, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (15, 15, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (16, 16, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (17, 17, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (18, 18, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (19, 19, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (20, 20, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (21, 21, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');
INSERT INTO SeloQualidade VALUES (22, 22, 'Este selo informa que a empresa tem produtos confiaveis', 'SeloQualidade/1/p.jpg');

INSERT INTO Categoria VALUES (1, 1, 'Automóveis');
INSERT INTO Categoria VALUES (2, 2, 'Celular');
INSERT INTO Categoria VALUES (3, 3, 'Notebook');
INSERT INTO Categoria VALUES (4, 4, 'Eletrodomesticos');
INSERT INTO Categoria VALUES (5, 5, 'Informática');
INSERT INTO Categoria VALUES (6, 6, 'Brinquedo');
INSERT INTO Categoria VALUES (7, 7, 'Remédio');
INSERT INTO Categoria VALUES (8, 8, 'Jardinagem');
INSERT INTO Categoria VALUES (9, 9, 'Games');
INSERT INTO Categoria VALUES (10, 10, 'Livro');
INSERT INTO Categoria VALUES (11, 11, 'Papelaria');
INSERT INTO Categoria VALUES (12, 12, 'Perfumaria');
INSERT INTO Categoria VALUES (13, 13, 'Pet-Shop');
INSERT INTO Categoria VALUES (14, 14, 'Calçados');
INSERT INTO Categoria VALUES (15, 15, 'Instrumento Musical');
INSERT INTO Categoria VALUES (16, 16, 'Beleza e Saúde');
INSERT INTO Categoria VALUES (17, 17, 'Infantil');
INSERT INTO Categoria VALUES (18, 18, 'Roupas');
INSERT INTO Categoria VALUES (19, 19, 'Esporte');
INSERT INTO Categoria VALUES (20, 20, 'Decoração');
INSERT INTO Categoria VALUES (21, 21, 'Sex shop');
INSERT INTO Categoria VALUES (22, 22, 'Acessórios');

INSERT INTO CategoriaCaracteristica VALUES (1, 'Cor');
INSERT INTO CategoriaCaracteristica VALUES (2, 'Tecido');
INSERT INTO CategoriaCaracteristica VALUES (3, 'Processador');
INSERT INTO CategoriaCaracteristica VALUES (4, 'Câmeras');
INSERT INTO CategoriaCaracteristica VALUES (5, 'Conexão');
INSERT INTO CategoriaCaracteristica VALUES (6, 'Bola');
INSERT INTO CategoriaCaracteristica VALUES (7, 'Carroceria');
INSERT INTO CategoriaCaracteristica VALUES (8, 'Tamanho');
INSERT INTO CategoriaCaracteristica VALUES (9, 'Altura');
INSERT INTO CategoriaCaracteristica VALUES (10, 'Armazenamento');
INSERT INTO CategoriaCaracteristica VALUES (11, 'Memória');
INSERT INTO CategoriaCaracteristica VALUES (12, 'Volume');
INSERT INTO CategoriaCaracteristica VALUES (13, 'Madeira');
INSERT INTO CategoriaCaracteristica VALUES (14, 'Voltagem');
INSERT INTO CategoriaCaracteristica VALUES (15, 'Sabor');
INSERT INTO CategoriaCaracteristica VALUES (16, 'Gênero');
INSERT INTO CategoriaCaracteristica VALUES (17, 'Corda');
INSERT INTO CategoriaCaracteristica VALUES (18, 'Peso');

INSERT INTO Apresenta VALUES (1, 1);
INSERT INTO Apresenta VALUES (2, 2);
INSERT INTO Apresenta VALUES (3, 3);
INSERT INTO Apresenta VALUES (4, 4);
INSERT INTO Apresenta VALUES (5, 5);
INSERT INTO Apresenta VALUES (6, 6);
INSERT INTO Apresenta VALUES (7, 7);
INSERT INTO Apresenta VALUES (8, 8);
INSERT INTO Apresenta VALUES (9, 9);
INSERT INTO Apresenta VALUES (10, 10);
INSERT INTO Apresenta VALUES (11, 11);
INSERT INTO Apresenta VALUES (12, 12);
INSERT INTO Apresenta VALUES (13, 13);
INSERT INTO Apresenta VALUES (14, 14);
INSERT INTO Apresenta VALUES (15, 15);
INSERT INTO Apresenta VALUES (16, 16);
INSERT INTO Apresenta VALUES (17, 17);

INSERT INTO ValorCategoriaCaracteristica VALUES (1, 1, 'Cinza');
INSERT INTO ValorCategoriaCaracteristica VALUES (2, 1,'Preto');
INSERT INTO ValorCategoriaCaracteristica VALUES (3, 1, 'Azul');
INSERT INTO ValorCategoriaCaracteristica VALUES (4, 1, 'Vermelho');
INSERT INTO ValorCategoriaCaracteristica VALUES (5, 2, 'Malha');
INSERT INTO ValorCategoriaCaracteristica VALUES (6, 2, 'Cetim');
INSERT INTO ValorCategoriaCaracteristica VALUES (7, 2, 'Algodão');
INSERT INTO ValorCategoriaCaracteristica VALUES (8, 2, 'Couro');
INSERT INTO ValorCategoriaCaracteristica VALUES (9, 3, 'FM2');
INSERT INTO ValorCategoriaCaracteristica VALUES (10, 3, 'AM3');
INSERT INTO ValorCategoriaCaracteristica VALUES (11, 3, 'LGA1366/ B');
INSERT INTO ValorCategoriaCaracteristica VALUES (12, 3, 'LGA755/T');
INSERT INTO ValorCategoriaCaracteristica VALUES (13, 4, 'Câmera instantânea');
INSERT INTO ValorCategoriaCaracteristica VALUES (14, 4, 'Câmera Quádrupla');
INSERT INTO ValorCategoriaCaracteristica VALUES (15, 4, 'Câmera Dupla');
INSERT INTO ValorCategoriaCaracteristica VALUES (16, 4, 'Câmera de 360 graus');
INSERT INTO ValorCategoriaCaracteristica VALUES (17, 5, '4G');
INSERT INTO ValorCategoriaCaracteristica VALUES (18, 5, 'Wi-Fi');
INSERT INTO ValorCategoriaCaracteristica VALUES (19, 6, 'Basquete');
INSERT INTO ValorCategoriaCaracteristica VALUES (20, 6, 'Vôlei');
INSERT INTO ValorCategoriaCaracteristica VALUES (21, 6, 'Futebol');
INSERT INTO ValorCategoriaCaracteristica VALUES (22, 6, 'Tenis');
INSERT INTO ValorCategoriaCaracteristica VALUES (23, 7, 'Hatch compacto');
INSERT INTO ValorCategoriaCaracteristica VALUES (24, 7, 'SUV grande');
INSERT INTO ValorCategoriaCaracteristica VALUES (25, 7, 'Crossover');
INSERT INTO ValorCategoriaCaracteristica VALUES (26, 7, 'Picape leve');
INSERT INTO ValorCategoriaCaracteristica VALUES (27, 8, 'cm');
INSERT INTO ValorCategoriaCaracteristica VALUES (28, 8, 'pp');
INSERT INTO ValorCategoriaCaracteristica VALUES (29, 8, 'p');
INSERT INTO ValorCategoriaCaracteristica VALUES (30, 8, 'm');
INSERT INTO ValorCategoriaCaracteristica VALUES (31, 8, 'g');
INSERT INTO ValorCategoriaCaracteristica VALUES (32, 8, 'gg');
INSERT INTO ValorCategoriaCaracteristica VALUES (33, 9, 'cm');
INSERT INTO ValorCategoriaCaracteristica VALUES (34, 9, 'metros');
INSERT INTO ValorCategoriaCaracteristica VALUES (35, 10, 'Magnético');
INSERT INTO ValorCategoriaCaracteristica VALUES (36, 10, 'Óptico');
INSERT INTO ValorCategoriaCaracteristica VALUES (37, 10, 'Eletrônico');
INSERT INTO ValorCategoriaCaracteristica VALUES (38, 11, 'Curto prazo');
INSERT INTO ValorCategoriaCaracteristica VALUES (39, 11, 'Imediata');
INSERT INTO ValorCategoriaCaracteristica VALUES (40, 11, 'Trabalho');
INSERT INTO ValorCategoriaCaracteristica VALUES (41, 11, 'Longo prazo');
INSERT INTO ValorCategoriaCaracteristica VALUES (42, 11, 'Episódica');
INSERT INTO ValorCategoriaCaracteristica VALUES (43, 11, 'Semântica');
INSERT INTO ValorCategoriaCaracteristica VALUES (44, 12, 'Litro');
INSERT INTO ValorCategoriaCaracteristica VALUES (45, 12, 'Mililitros');
INSERT INTO ValorCategoriaCaracteristica VALUES (46, 13, 'Aroeira');
INSERT INTO ValorCategoriaCaracteristica VALUES (47, 13, 'Carvalho');
INSERT INTO ValorCategoriaCaracteristica VALUES (48, 13, 'Cedro');
INSERT INTO ValorCategoriaCaracteristica VALUES (49, 13, 'Cerejeira');
INSERT INTO ValorCategoriaCaracteristica VALUES (50, 14, '115 Volts');
INSERT INTO ValorCategoriaCaracteristica VALUES (51, 14, '127 Volts');
INSERT INTO ValorCategoriaCaracteristica VALUES (52, 14, '220 Volts');
INSERT INTO ValorCategoriaCaracteristica VALUES (53, 14, '254 Volts');
INSERT INTO ValorCategoriaCaracteristica VALUES (54, 15, 'Morango');
INSERT INTO ValorCategoriaCaracteristica VALUES (55, 15, 'Carne');
INSERT INTO ValorCategoriaCaracteristica VALUES (56, 15, 'Picanha');
INSERT INTO ValorCategoriaCaracteristica VALUES (57, 15, 'Menta');
INSERT INTO ValorCategoriaCaracteristica VALUES (58, 15, 'Salmão');
INSERT INTO ValorCategoriaCaracteristica VALUES (59, 15, 'Churros');
INSERT INTO ValorCategoriaCaracteristica VALUES (60, 15, 'Frango');
INSERT INTO ValorCategoriaCaracteristica VALUES (61, 15, 'Uva');
INSERT INTO ValorCategoriaCaracteristica VALUES (62, 15, 'Chocolate');
INSERT INTO ValorCategoriaCaracteristica VALUES (63, 16, 'Romance');
INSERT INTO ValorCategoriaCaracteristica VALUES (64, 16, 'Fantasia');
INSERT INTO ValorCategoriaCaracteristica VALUES (65, 16, 'Ação');
INSERT INTO ValorCategoriaCaracteristica VALUES (66, 16, 'Terror');
INSERT INTO ValorCategoriaCaracteristica VALUES (67, 16, 'Juvenil');
INSERT INTO ValorCategoriaCaracteristica VALUES (68, 16, 'Infantil');
INSERT INTO ValorCategoriaCaracteristica VALUES (69, 16, 'LGBTQIAP+');
INSERT INTO ValorCategoriaCaracteristica VALUES (70, 16, 'Mistério');
INSERT INTO ValorCategoriaCaracteristica VALUES (71, 17, 'Pinçadas');
INSERT INTO ValorCategoriaCaracteristica VALUES (72, 17, 'Friccionadas');
INSERT INTO ValorCategoriaCaracteristica VALUES (73, 17, 'Percutidas');
INSERT INTO ValorCategoriaCaracteristica VALUES (74, 18, 'Gramas');
INSERT INTO ValorCategoriaCaracteristica VALUES (75, 18, 'Kilogramas');
INSERT INTO ValorCategoriaCaracteristica VALUES (76, 18, 'Miligramas');

INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (1, 1);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (2, 2);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (3, 3);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (4, 4);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (5, 5);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (6, 6);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (7, 7);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (8, 8);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (9, 9);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (10, 10);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (11, 11);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (12, 12);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (13, 13);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (14, 14);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (15, 15);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (16, 16);
INSERT INTO ProdutoValorCategoriaCaracteristica VALUES (17, 17);

SELECT * FROM Cliente; 
SELECT * FROM Produto; 
SELECT * FROM Empresa; 
SELECT * FROM Marca;
SELECT * FROM Forum; 
SELECT * FROM Historico; 
SELECT * FROM Categoria;
SELECT * FROM CategoriaCaracteristica;
SELECT * FROM ValorCategoriaCaracteristica;
SELECT * FROM Ofertas;

SELECT * FROM ValorCategoriaCaracteristica
WHERE descricao LIKE 'c%';
