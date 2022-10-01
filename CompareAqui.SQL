CREATE DATABASE estudante;

USE estudante;

CREATE TABLE Cliente
(
id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(100),
    telefone CHAR(14),
    senha CHAR(60), -- bcrypt
    id_verificacao CHAR(36), -- UUID
    verificacao BOOLEAN,
    adm BOOLEAN,
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

CREATE TABLE Topico
(
id INT PRIMARY KEY,
id_cliente INT,
    titulo VARCHAR(100),
    texto TEXT,
    data_hora DATETIME,
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Comentario
(
id_cliente INT,
    id_topico INT,
    texto TEXT,
    data_hora DATETIME,
    PRIMARY KEY (id_cliente, id_topico),
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id),
    FOREIGN KEY(id_topico) REFERENCES Topico(id)
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
    descricao VARCHAR(100),
    data_hora DATETIME,
    FOREIGN KEY(id_cliente) REFERENCES Cliente(id)
);

CREATE TABLE Produto  
(
id INT PRIMARY KEY,
    modelo VARCHAR(100),
    imagem_p TEXT,
    imagem_m TEXT,
    imagem_g TEXT
);

CREATE TABLE Empresa
(
id INT PRIMARY KEY,
    nome VARCHAR(100),
    CNPJ CHAR(18),
    selo_qualidade BOOLEAN,
    imagem_p TEXT,
    imagem_g TEXT,
    imagem_m TEXT
);

CREATE TABLE Endereco
(
id INT PRIMARY KEY,
id_empresa INT,
CEP CHAR(9),
rua VARCHAR(100),
    bairro VARCHAR (100),
    numero INT,
    complemento VARCHAR(100),
    FOREIGN KEY(id_empresa) REFERENCES Empresa(id)
);

CREATE TABLE Ofertas
(
id INT PRIMARY KEY,
    id_produto INT,
    id_empresa INT,
    preco DECIMAL(10,2),
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

CREATE TABLE CategoriaCaracteristica
(
id INT PRIMARY KEY,
id_categoria INT,
    nome VARCHAR(100),
    FOREIGN KEY(id_categoria) REFERENCES Categoria(id)
);

CREATE TABLE Apresenta
(
id_categoria INT ,
    id_categoriaCaracteristica INT,
    PRIMARY KEY (id_categoria, id_categoriaCaracteristica),
    FOREIGN KEY(id_categoria) REFERENCES Categoria(id),
    FOREIGN KEY(id_categoriaCaracteristica) REFERENCES CategoriaCaracteristica(id)
);

CREATE TABLE ValorCategoriaCaracteristica
(
id INT PRIMARY KEY,
id_categoriaCaracteristica INT,
    descricao VARCHAR (100),
    FOREIGN KEY(id_categoriaCaracteristica) REFERENCES CategoriaCaracteristica(id)
);

CREATE TABLE ProdutoValorCategoriaCaracteristica
(
    id_produto INT,
    id_valorCategoriaCaracteristica INT,
PRIMARY KEY (id_produto, id_valorCategoriaCaracteristica),
    FOREIGN KEY(id_produto) REFERENCES Produto(id),
    FOREIGN KEY(id_valorCategoriaCaracteristica) REFERENCES ValorCategoriaCaracteristica(id)
);


INSERT INTO Cliente VALUES (1, 'João', 'joaoEquipe6@gmail.com', '0000000000000', '$2y$10$DUMxJGpwP0rTQGSEYecE0ekwUYC2t5vD9RKA0BmygFUt2M5orQ65u', 'ad3b4d79-0837-46b2-998c-a5356822a93c', true, false, 'cliente/1/p.jpg', 'cliente/1/m.jpg', 'cliente/1/g.jpg');
INSERT INTO Cliente VALUES (2, 'Maria', 'mariaEquipe6@gmail.com', '0000000000000', '$2y$10$SC2qMWLWmyQ3uBUU4x0/I.vliPFxOVOhYoP34BasqL4wPksmzVbgi', 'dd19da6f-a374-4647-9431-f3cb1143d170', true, false, 'cliente/2/p.jpg', 'cliente/2/m.jpg', 'cliente/2/g.jpg');
INSERT INTO Cliente VALUES (3, 'Ana', 'anaEquipe6@gmail.com', '0000000000000', '$2y$10$TMwWNr.lZQeQhe4FRGU6AOhMyy9EdcUrSBm8CGpQz9mxzC72OFY.u', 'ae63b1b9-4edb-487c-93a0-7224aa70abb3', true, false, 'cliente/3/p.jpg', 'cliente/3/m.jpg', 'cliente/3/g.jpg');
INSERT INTO Cliente VALUES (4, 'Laís', 'laisEquipe6@gmail.com', '0000000000000', '$2y$10$T5hfUuuKDtFfIUO7W3gqw.VU2/vSUPXjRE1cnVVjKNVcWXCQrkCOu', 'f6c90419-bee6-46d7-b738-711cf4454472', true, true, 'cliente/4/p.jpg', 'cliente/4/m.jpg', 'cliente/4/g.jpg');
INSERT INTO Cliente VALUES (5, 'Gabriel', 'gabrielEquipe6@gmail.com', '0000000000000', '$2y$10$EayJP27o7RaRW7EmhO5DGej1UVSaenIdAjEz2kbXyR2o2uzzKap5y', '9a6381f1-b111-487d-aa39-16482a81eb09', true, false, 'cliente/5/p.jpg', 'cliente/5/m.jpg', 'cliente/5/g.jpg');
INSERT INTO Cliente VALUES (6, 'Pedro', 'pedroEquipe6@gmail.com', '0000000000000', '$2y$10$6OT.A9sc5w1rvqK.7SclJuB3/4T30SAzhE423ZIPojGl7XVf/kANC', '6ade03f4-28d3-45e6-be16-7b8e9fe1d7a0', true, false, 'cliente/6/p.jpg', 'cliente/6/m.jpg', 'cliente/6/g.jpg');
INSERT INTO Cliente VALUES (7, 'Lie', 'lieEquipe6@gmail.com', '0000000000000', '$2y$10$Hc2A70u30nhM2RIUMBryyuXkQ9iX5evD/pHF9gnKDKJOJC2l4d1sa', '3e3d37b2-1f73-4912-8a51-65ca61c93bff', true, true, 'cliente/7/p.jpg', 'cliente/7/m.jpg', 'cliente/7/g.jpg');
INSERT INTO Cliente VALUES (8, 'Felipe', 'felipeEquipe6@gmail.com', '0000000000000', '$2y$10$Gugj.F0XIBfO8vBbm8oQjeLit/OiaibSb2yVO8hw5t/w1SHuY9DFS', 'f225580c-49ad-45fa-8164-a2271cc00e05', true, false, 'cliente/8/p.jpg', 'cliente/8/m.jpg', 'cliente/8/g.jpg');
INSERT INTO Cliente VALUES (9, 'Fernanda', 'fernandaEquipe6@gmail.com', '0000000000000', '$2y$10$TxtWrfMx.NfCvFSf976gaemGoWeDVgFgRIw7Y3HwXdc6lBLn0zpU2', '076d488b-de71-44d0-b4c8-a6b52bc26463', true, true, 'cliente/9/p.jpg', 'cliente/9/m.jpg', 'cliente/9/g.jpg');
INSERT INTO Cliente VALUES (10, 'Kauanne', 'kauanneEquipe6@gmail.com', '0000000000000', '$2y$10$lhEC.WNJXvBdJChM1MfeGuogy5cAq.6hGGWucucIVNb3WH0a/oXQ.', 'f6b1c099-54f9-4459-b0b4-69a3328102df', true, true, 'cliente/10/p.jpg', 'cliente/10/m.jpg', 'cliente/10/g.jpg');
INSERT INTO Cliente VALUES (11, 'Latorre', 'latorreEquipe6@gmail.com', '0000000000000', '$2y$10$KPZM3TJl7O1PoDafIw5M6uLg0W0Q5lsul5xrsrgcSBvyBhx1wbp6a', 'fc1c9f9b-174b-4cf2-8e71-034205fec345', true, false, 'cliente/11/p.jpg', 'cliente/11/m.jpg', 'cliente/11/g.jpg');
INSERT INTO Cliente VALUES (12, 'Lucas', 'lucasEquipe6@gmail.com', '0000000000000', '$2y$10$US0gByEj3GlDRLVfl1Lw9ODvOpKA9YE.1XKHn1dXHDPEUl5pchy6G', 'a9b5e32b-8aa4-4f0e-aebd-1453f694b522', true, false, 'cliente/12/p.jpg', 'cliente/12/m.jpg', 'cliente/12/g.jpg');
INSERT INTO Cliente VALUES (13, 'Amanda', 'amandaEquipe6@gmail.com', '0000000000000', '$2y$10$b2lIV0dryO2Ty8jdEkinU.OXAGd3.hfZDUgKJ/ok9FMfvCU.80Jme', '7fdb5177-6b08-42e6-a088-2c88a052d61f', true, false, 'cliente/13/p.jpg', 'cliente/13/m.jpg', 'cliente/13/g.jpg');
INSERT INTO Cliente VALUES (14, 'Abur', 'aburEquipe6@gmail.com', '0000000000000', '$2y$10$Q.GfpeWAPxgim0jodu0kXOU84P9IC2p2rCIKAIK/1J8laTUyss8UC', '6327488f-c7b7-42d8-8f59-4f5478dee9a3', true, false, 'cliente/14/p.jpg', 'cliente/14/m.jpg', 'cliente/14/g.jpg');
INSERT INTO Cliente VALUES (15, 'Breno', 'brenoEquipe6@gmail.com','0000000000000', '$2y$10$xf9af8gE1fFuow70pjnwjuQtg4xTrgv0Ft10Y1/BOcyyt1GRjnyPC', '8ab57d4e-5ebd-41a4-94fd-b99b3738f1dd', true, false, 'cliente/15/p.jpg', 'cliente/15/m.jpg', 'cliente/15/g.jpg');
INSERT INTO Cliente VALUES (16, 'Leticia', 'leleEquipe6@gmail.com', '0000000000000', '$2y$10$OtGAopw1apSoYFA5Qoud3OOt3xfN5SLD1nHOeJgJTzLD8/UnRBiMK', '075ef94b-2685-45fd-829c-9055d3d1f732', true, false, 'cliente/16/p.jpg', 'cliente/16/m.jpg', 'cliente/16/g.jpg');
INSERT INTO Cliente VALUES (17, 'Igor', 'iguEquipe6@gmail.com', '0000000000000', '$2y$10$fu90LQT2EQaAB0niDLkwguk.YsaXPEFEfS5tnkVFUXY0BRZ1rezyG', '23719f72-6f90-4068-9b29-610fc66b0b21', true, false, 'cliente/17/p.jpg', 'cliente/17/m.jpg', 'cliente/17/g.jpg');
INSERT INTO Cliente VALUES (18, 'Sidoka', 'dokaEquipe6@gmail.com','0000000000000', '$2y$10$nKmc.uaMTETnrPH2ygR33uGBNoC0RHvk3ILukbKszAWQNjEn7jK3G', 'd8375ff1-057e-4637-a18f-6f7144273ab4', true, false, 'cliente/18/p.jpg', 'cliente/18/m.jpg', 'cliente/18/g.jpg');
INSERT INTO Cliente VALUES (19, 'Djonga', 'djongaEquipe6@gmail.com', '0000000000000', '$2y$10$H5iOYENreFIXDCOb.Ns1mO4u.Lu9ZqWAyMF17eO3GW7d.axHAvhNa', 'b07eceb6-d8bb-48fa-9919-0f6b598fc876', true, false, 'cliente/19/p.jpg', 'cliente/19/m.jpg', 'cliente/19/g.jpg');
INSERT INTO Cliente VALUES (20, 'Karlos', 'kakaEquipe6@gmail.com','0000000000000', '$2y$10$/9RAfM4U6SWeI8.kEF14AusRdw93MvkFNX7lYw9eW2JwqF/iTfxmW', 'a973f458-5fd8-4a07-bc7b-3b773df0b9f4', true, false, 'cliente/20/p.jpg', 'cliente/20/m.jpg', 'cliente/20/g.jpg');
INSERT INTO Cliente VALUES (21, 'Diogo', 'vulgoEquipe6d@gmail.com', '0000000000000', '$2y$10$wTJ4jDHRC0Cz79hu4IropOtTJhFIpQFiSplQ2.6m4GZWiKgwiBL1.', 'eaa8ff6c-4bdd-40ab-8ae2-3d3dfd35ea9f', true, false, 'cliente/21/p.jpg', 'cliente/21/m.jpg', 'cliente/21/g.jpg');
INSERT INTO Cliente VALUES (22, 'Matheus', 'matEquipe6@gmail.com', '0000000000000', '$2y$10$TfNa23gS/lUSWnzppyZwDuHiVbdC7gjgExHmsL2lzMtqWmmfFNyPa', '4284d47d-9527-4155-a6c8-a65a5f4cd6e5', true, true, 'cliente/22/p.jpg', 'cliente/22/m.jpg', 'cliente/22/g.jpg');

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

INSERT INTO Topico VALUES (1, 1, 'Cor', 'Como selecionar apenas uma cor de determinado produto?', '2022-01-02 01:00:04');
INSERT INTO Topico VALUES (2, 2, 'Perfil', 'Como mudar o nome do perfil?', '2022-03-04 02:00:04');
INSERT INTO Topico VALUES (3, 3, 'Perfil', 'Como mudar o email do perfil?', '2022-10-26 03:00:04');
INSERT INTO Topico VALUES (4, 4, 'Localização', 'Como colocar masi de uma localização do perfil', '2022-06-12 04:00:04');
INSERT INTO Topico VALUES (5, 5, 'Perfil', 'Como mudar a foto do perfil?', '2022-04-05 05:00:04');
INSERT INTO Topico VALUES (6, 6, 'Produto', 'Quero saber como er o valor mais caro', '2022-06-07 06:00:04');
INSERT INTO Topico VALUES (7, 7, 'Produto', 'Gostaria de saber onde pegar as informações sobre as empresas', '2022-08-09 07:00:04');
INSERT INTO Topico VALUES (8, 8, 'Selo', 'O que é o selo próximo ao nome das lojas', '2022-10-11 01:00:04');
INSERT INTO Topico VALUES (9, 9, 'Filtro', 'o meu filtro não está funcionando, poderia me ajudar?', '2022-12-13 08:00:04');
INSERT INTO Topico VALUES (10, 10, 'Site', 'o site é compatível com windowns piratão', '2022-01-14 09:00:04');
INSERT INTO Topico VALUES (11, 11, 'Favoritos', 'como faço para favoritar se não tenho conta?', '2022-02-15 10:00:04');
INSERT INTO Topico VALUES (12, 12, 'Contas', 'Posso ter várias contas?', '2022-03-16 11:00:04');
INSERT INTO Topico VALUES (13, 13, 'Perfil', 'Como eu posso criar uma conta? ', '2022-04-17 12:00:04');
INSERT INTO Topico VALUES (14, 14, 'Fórum', 'Eu consigo incluir imagens da tela ou vídeos no fórum? ', '2022-05-18 13:00:04');
INSERT INTO Topico VALUES (15, 15, 'Fórum', 'Como eu encontro as minhas perguntas no fórum? #', '2022-06-19 14:00:04');
INSERT INTO Topico VALUES (16, 16, 'Perfil', 'Como responder uma pergunta do fórum', '2022-07-20 15:00:04');
INSERT INTO Topico VALUES (17, 17, 'Tópico', 'Como excluir um tópico', '2022-08-21 16:00:04');
INSERT INTO Topico VALUES (18, 18, 'Dúvida', 'Por que o meu tópico desapareceu? ', '2022-09-22 17:00:04');
INSERT INTO Topico VALUES (19, 19, 'Conta', 'Eu consigo apagar a minha conta?', '2022-11-23 18:00:04');
INSERT INTO Topico VALUES (20, 20, 'Senha', 'Perdi minha senha, como recuperar?', '2022-12-24 19:00:04');
INSERT INTO Topico VALUES (21, 21, 'Site', 'Quais celulares são compatíveis', '2022-11-06 20:00:04');
INSERT INTO Topico VALUES (22, 22, 'Site', 'vão liberar um tutorial de como mexer?', '2022-12-06 21:00:04');

INSERT INTO Comentario VALUES (1, 1, 'Vixii, sei nem dizer', '2022-12-06 21:00:04');
INSERT INTO Comentario VALUES (2, 2, 'Tenta resertar seu pc', '2022-11-06 21:10:04');
INSERT INTO Comentario VALUES (3, 3, 'Também gostaria de saber', '2022-12-06 21:00:04');
INSERT INTO Comentario VALUES (4, 4, 'Tenta resertar seu celular', '2022-12-16 21:00:04');
INSERT INTO Comentario VALUES (5, 5, 'No meu tbm', '2022-12-06 21:00:04');
INSERT INTO Comentario VALUES (6, 6, 'Clica no botão que está escrito "cadastro"', '2022-01-06 21:00:04');
INSERT INTO Comentario VALUES (7, 7, 'No meu está dando erro na página', '2022-02-06 21:00:04');
INSERT INTO Comentario VALUES (8, 8, 'Esse site é demias mesmo', '2022-03-06 21:00:04');
INSERT INTO Comentario VALUES (9, 9, 'Tem como apagar meu histórico?', '2022-04-06 21:00:04');
INSERT INTO Comentario VALUES (10, 10, 'Como eu faço para alterar a senha?', '2022-12-17 21:00:04');
INSERT INTO Comentario VALUES (11, 11, 'Queria colocar um gif como imagem de perfil, tem como?', '2022-07-06 21:00:04');
INSERT INTO Comentario VALUES (12, 12, 'Posso colocar um apelido como nome?', '2022-06-06 21:00:04');
INSERT INTO Comentario VALUES (13, 13, 'Obrigado pela ajuda amigo', '2022-09-06 21:00:04');
INSERT INTO Comentario VALUES (14, 14, 'O segundo passo é preencher os campos que apareçe', '2022-07-06 21:00:04');
INSERT INTO Comentario VALUES (15, 15, 'Eu queria encontrar lojas de outros países tbm', '2022-06-06 21:00:04');
INSERT INTO Comentario VALUES (16, 16, 'Aqui tem apenas lojas nacionais?', '2022-03-06 21:00:04');
INSERT INTO Comentario VALUES (17, 17, 'Eu amei esse site tbm', '2022-04-06 21:00:04');
INSERT INTO Comentario VALUES (18, 18, 'Eu achei mt ruim essse site no começo, mas to achando bem eficiênte agr', '2014-12-06 21:00:04');
INSERT INTO Comentario VALUES (19, 19, 'O ultimo passo é apertar no botão "concluir"', '2022-05-06 21:00:04');
INSERT INTO Comentario VALUES (20, 20, 'X_X', '2018-12-06 21:00:04');
INSERT INTO Comentario VALUES (21, 21, 'Como achar um loja específica?', '2022-12-03 21:00:04');
INSERT INTO Comentario VALUES (22, 22, 'é só digitar na barra de pesquisa', '2022-12-03 21:10:04');

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

INSERT INTO Historico VALUES (1, 1, 'Vídeo Game Portátil Jogos Arcade Mp5', '2022-01-03 00:10:00' );
INSERT INTO Historico VALUES (2, 1, 'Vídeo Game 8 Bits Retro Com 2 Controles 620 Jogos Clássicos', '2022-02-03 11:10:04');
INSERT INTO Historico VALUES (3, 2, 'lavadeira pequena cor violeta', '2022-03-03 21:12:00');
INSERT INTO Historico VALUES (4, 2, 'blusa corte feminino rosa', '2022-04-03 02:10:04');
INSERT INTO Historico VALUES (5, 3, 'blusa corte feminino verde', '2022-05-03 01:10:04');
INSERT INTO Historico VALUES (6, 3, 'blusa corte feminino azul', '2022-06-03 03:10:04');
INSERT INTO Historico VALUES (7, 4, 'Smartphone Samsung Galaxy A03 Preto', '2022-07-03 17:00:00');
INSERT INTO Historico VALUES (8, 4, 'iPhone 11 Apple 64GB branco, Tela de 6,1, Câmera Dupla de 12MP, iOS', '2022-08-03 04:10:04');
INSERT INTO Historico VALUES (9, 5, 'iPhone 13 Apple 128GB Rosa Tela de 6,1, Câmera Dupla de 12MP', '2022-09-03 05:10:04');
INSERT INTO Historico VALUES (10, 5, 'iPhone 11 Apple Branco, 64GB Desbloqueado - MHDC3BZ/A', '2022-10-04 06:10:04');
INSERT INTO Historico VALUES (11, 6, 'Cama de Solteiro Villa Incabrás', '2022-11-03 07:10:04');
INSERT INTO Historico VALUES (12, 6, 'Cama de Solteiro Madeira Maciça', '2022-12-03 08:10:04');
INSERT INTO Historico VALUES (13, 7, 'Cama de Solteiro Santos Andirá Invicta Atacama com Baú e 2 Gavetas', '2022-12-20 09:10:04');
INSERT INTO Historico VALUES (14, 7, 'Bola Nike Brasil Strike', '2022-11-20 10:10:04');
INSERT INTO Historico VALUES (15, 8, 'Bola Nike CBF Society', '2022-10-23 11:10:04');
INSERT INTO Historico VALUES (16, 8, 'Bola Nike FC Barcelona Strike', '2022-09-06 12:10:04');
INSERT INTO Historico VALUES (17, 9, 'Tênis Couro Cadarço Flatform Dourado ', '2022-08-13 13:10:04');
INSERT INTO Historico VALUES (18, 9, 'Bota Tratorada Verde Musgo', '2022-07-07 14:10:04');
INSERT INTO Historico VALUES (19, 10, 'Mule Nude Flats Bico Fino', '2022-06-24 15:10:04');
INSERT INTO Historico VALUES (20, 10, 'Sandália Branca Couro Meia Pata Salto Flare Megan', '2022-05-30 16:10:04');
INSERT INTO Historico VALUES (21, 11, 'RELÓGIO NATAN AUTOMÁTICO CALIBRE 911 MASCULINO EM COURO PRETO', '2022-04-23 17:10:04');
INSERT INTO Historico VALUES (22, 11, 'Evelyn Hugo', '2021-09,12 18:00:00');
INSERT INTO Historico VALUES (23, 12, 'Harry Potter', '2022-02-12 17:00:00');
INSERT INTO Historico VALUES (24, 12, 'Trono de Vidro', '2022-08-12 10:00:00');
INSERT INTO Historico VALUES (25, 13, 'Sabor churros', '2022-04-14 14:00:00');
INSERT INTO Historico VALUES (26, 13, 'Sabor picante', '2022-12-12 17:00:00');
INSERT INTO Historico VALUES (27, 14, 'Barbie veterinária', '2022-10-11 10:00:00');
INSERT INTO Historico VALUES (28, 14, 'Brinco de pato', '2022-02-12 17:00:00');
INSERT INTO Historico VALUES (29, 15, 'Aliança fina', '2021-09,12 18:00:00');
INSERT INTO Historico VALUES (30, 15, 'Perfume Floratta Rose', '2021-09,12 18:00:50');
INSERT INTO Historico VALUES (31, 16, 'Caderno BTS', '2022-04-14 14:00:00');
INSERT INTO Historico VALUES (32, 17, 'Vaso pequeno', '2022-02-12 17:00:00');
INSERT INTO Historico VALUES (33, 17, 'Coleira anti-pulga', '2022-12-12 17:00:00');
INSERT INTO Historico VALUES (34, 18, 'Violão corda de aço', '2022-04-14 14:00:00');
INSERT INTO Historico VALUES (35, 18, 'Delineador Ruby Rose', '2022-02-12 17:00:00');
INSERT INTO Historico VALUES (36, 19, 'Pó banana', '2022-10-23 11:10:04');
INSERT INTO Historico VALUES (37, 19, 'Protetor solar 30', '2022-04-14 14:00:00');
INSERT INTO Historico VALUES (38, 20, 'Chupeta azul', '2022-04-14 14:00:00');
INSERT INTO Historico VALUES (39, 20, 'Geladeira Eletrolux', '2022-08-12 10:00:00');
INSERT INTO Historico VALUES (40, 21, 'Anti-arlégico Loratadina', '2022-04-03 02:10:04');
INSERT INTO Historico VALUES (41, 21, 'Rivotril', '2022-04-03 02:10:59');
INSERT INTO Historico VALUES (42, 22, 'Alenia', '2022-08-12 10:00:00');
INSERT INTO Historico VALUES (43, 22, 'Dramin', '2022-10-23 11:10:04');

INSERT INTO  Produto VALUES (1, 'FIAT UNO 1.0 FIRE FLEX ATTRACTIVE MANUAL', 'produto/1/p.jpg', 'produto/1/m.jpg', 'produto/1/g.jpg');
INSERT INTO  Produto VALUES (2, 'Tênis Nike Downshifter 11', 'produto/2/p.jpg', 'produto/2/m.jpg', 'produto/2/g.jpg');
INSERT INTO  Produto VALUES (3, 'TENIS ADIDAS CASUAL ADVANTAGE', 'produto/3/p.jpg', 'produto/3/m.jpg', 'produto/3/g.jpg');
INSERT INTO  Produto VALUES (4, 'Geladeira Panasonic Econavi NR-BB53PV3X Frost Free Inverse', 'produto/4/p.jpg', 'produto/4/m.jpg', 'produto/4/g.jpg');
INSERT INTO  Produto VALUES (5, 'Impressora Multifuncional Deskjet Ink Advantage 2774 7FR22A', 'produto/5/p.jpg', 'produto/5/m.jpg', 'produto/5/g.jpg');
INSERT INTO  Produto VALUES (6, 'FORD BRONCO SPORT 2.0 ECOBOOST GASOLINA WILDTRAK 4X4 SELECTSHIFT', 'produto/6/p.jpg', 'produto/6/m.jpg', 'produto/6/g.jpg');
INSERT INTO  Produto VALUES (7, 'JEEP COMPASS 2.0 16V FLEX LONGITUDE AUTOMÁTICO', 'produto/7/p.jpg', 'produto/7/m.jpg', 'produto/7/g.jpg');
INSERT INTO  Produto VALUES (8, 'TENIS FILA EURO JOGGER SPORT', 'produto/8/p.jpg', 'produto/8/m.jpg', 'produto/8/g.jpg');
INSERT INTO  Produto VALUES (9, 'Microsoft Teclado E Mouse Sem Fio', 'produto/9/p.jpg', 'produto/9/m.jpg', 'produto/9/g.jpg');
INSERT INTO  Produto VALUES (10, 'iPhone 13', 'produto/10/p.jpg', 'produto/10/m.jpg', 'produto/10/g.jpg');
INSERT INTO  Produto VALUES (11, 'FIAT STRADA 1.3 FIREFLY FLEX FREEDOM CS MANUAL', 'produto/11/p.jpg', 'produto/11/m.jpg', 'produto/11/g.jpg');
INSERT INTO  Produto VALUES (12, 'FIAT PUNTO 1.8 SPORTING 16V FLEX 4P AUTOMATIZADO', 'produto/12/p.jpg', 'produto/12/m.jpg', 'produto/12/g.jpg');
INSERT INTO  Produto VALUES (13, 'FIAT PALIO 1.8 MPI ADVENTURE WEEKEND 16V FLEX 4P MANUAL', 'produto/13/p.jpg', 'produto/13/m.jpg', 'produto/13/g.jpg');
INSERT INTO  Produto VALUES (14, 'Smartphone Samsung Galaxy S21 Phantom Gray', 'produto/14/p.jpg', 'produto/14/m.jpg', 'produto/14/g.jpg');
INSERT INTO  Produto VALUES (15, 'Xiaomi Redmi Note 10S', 'produto/15/p.jpg', 'produto/15/m.jpg', 'produto/15/g.jpg');
INSERT INTO  Produto VALUES (16,  'Notebook Samsung', 'produto/16/p.jpg', 'produto/16/m.jpg', 'produto/16/g.jpg');
INSERT INTO  Produto VALUES (17, 'Webcam Logitech C920s', 'produto/17/p.jpg', 'produto/17/m.jpg', 'produto/17/g.jpg');
INSERT INTO  Produto VALUES (18, 'Blusa de frio Diverse', 'produto/18/p.jpg', 'produto/18/m.jpg', 'produto/18/g.jpg');
INSERT INTO  Produto VALUES (19, 'Gabinete Gamer MID Tower HOLT', 'produto/19/p.jpg', 'produto/19/m.jpg', 'produto/19/g.jpg');
INSERT INTO  Produto VALUES (20, 'TV led samsung 32', 'produto/20/p.jpg', 'produto/20/m.jpg', 'produto/20/g.jpg');
INSERT INTO  Produto VALUES (21, 'Nintendo Switch', 'produto/21/p.jpg', 'produto/21/m.jpg', 'produto/21/g.jpg');
INSERT INTO  Produto VALUES (22, 'PÉGASE', 'produto/22/p.jpg', 'produto/22/m.jpg', 'produto/22/g.jpg');

INSERT INTO  Empresa VALUES (1, 'Fiat',  '00.000.000/0001-00', true, 'Empresa/1/p.jpg', 'Empresa/1/m.jpg', 'Empresa/1/g.jpg');
INSERT INTO  Empresa VALUES (2, 'Nike', '00.000.000/0001-00', true, 'Empresa/2/p.jpg', 'Empresa/2/m.jpg', 'Empresa/2/g.jpg');
INSERT INTO  Empresa VALUES (3, 'Adidas', '00.000.000/0001-00', true, 'Empresa/3/p.jpg', 'Empresa/3/m.jpg', 'Empresa/3/g.jpg');
INSERT INTO  Empresa VALUES (4, 'Panasonic', '00.000.000/0001-00', false, 'Empresa/4/p.jpg', 'Empresa/4/m.jpg', 'Empresa/4/g.jpg');
INSERT INTO  Empresa VALUES (5, 'HP', '00.000.000/0001-00', true, 'Empresa/5/p.jpg', 'Empresa/5/m.jpg', 'Empresa/5/g.jpg');
INSERT INTO  Empresa VALUES (6, 'Ford', '00.000.000/0001-00', false, 'Empresa/6/p.jpg', 'Empresa/6/m.jpg', 'Empresa/6/g.jpg');
INSERT INTO  Empresa VALUES (7, 'Jeep', '00.000.000/0001-00', true, 'Empresa/7/p.jpg', 'Empresa/7/m.jpg', 'Empresa/7/g.jpg');
INSERT INTO  Empresa VALUES (8, 'FILA', '00.000.000/0001-00', true, 'Empresa/8/p.jpg', 'Empresa/8/m.jpg', 'Empresa/8/g.jpg');
INSERT INTO  Empresa VALUES (9, 'Microsoft', '00.000.000/0001-00', true, 'Empresa/9/p.jpg', 'Empresa/9/m.jpg', 'Empresa/9/g.jpg');
INSERT INTO  Empresa VALUES (10, 'Ponto do Iphone', '00.000.000/0001-00', false, 'Empresa/10/p.jpg', 'Empresa/10/m.jpg', 'Empresa/10/g.jpg');
INSERT INTO  Empresa VALUES (11, 'Loja do 1 Real','00.000.000/0001-00', true, 'Empresa/11/p.jpg', 'Empresa/11/m.jpg', 'Empresa/11/g.jpg');
INSERT INTO  Empresa VALUES (12, 'Camaflex', '00.000.000/0001-00', false, 'Empresa/12/p.jpg', 'Empresa/12/m.jpg', 'Empresa/12/g.jpg');
INSERT INTO  Empresa VALUES (13, 'Loja do Android', '00.000.000/0001-00', true, 'Empresa/13/p.jpg', 'Empresa/13/m.jpg', 'Empresa/13/g.jpg');
INSERT INTO  Empresa VALUES (14, 'Samsung', '00.000.000/0001-00', true, 'Empresa/14/p.jpg', 'Empresa/14/m.jpg', 'Empresa/14/g.jpg');
INSERT INTO  Empresa VALUES (15, 'Xiome', '00.000.000/0001-00', true, 'Empresa/15/p.jpg', 'Empresa/15/m.jpg', 'Empresa/15/g.jpg');
INSERT INTO  Empresa VALUES (16, 'Casas da Cama', '00.000.000/0001-00', true, 'Empresa/16/p.jpg', 'Empresa/16/m.jpg', 'Empresa/16/g.jpg');
INSERT INTO  Empresa VALUES (17, 'Blusas de Time', '00.000.000/0001-00', true, 'Empresa/17/p.jpg', 'Empresa/17/m.jpg', 'Empresa/17/g.jpg');
INSERT INTO  Empresa VALUES (18, 'Chico dos eletrodomésticos', '00.000.000/0001-00', true, 'Empresa/18/p.jpg', 'Empresa/18/m.jpg', 'Empresa/18/g.jpg');
INSERT INTO  Empresa VALUES (19, 'Ponto Quente', '00.000.000/0001-00', false, 'Empresa/19/p.jpg', 'Empresa/19/m.jpg', 'Empresa/19/g.jpg');
INSERT INTO  Empresa VALUES (20, 'Shoptime', '00.000.000/0001-00', false, 'Empresa/20/p.jpg', 'Empresa/20/m.jpg', 'Empresa/20/g.jpg');
INSERT INTO  Empresa VALUES (21, 'Louis Vuitton','00.000.000/0001-00', true, 'Empresa/21/p.jpg', 'Empresa/21/m.jpg', 'Empresa/21/g.jpg');
INSERT INTO  Empresa VALUES (22, 'Magazineluiza', '00.000.000/0001-00', true, 'Empresa/22/p.jpg', 'Empresa/22/m.jpg', 'Empresa/22/g.jpg');

INSERT INTO Endereco VALUES (1, 1, '00000-000', 'Av. Pacaembu', 'Jardim A', '656', 'Z');
INSERT INTO Endereco VALUES (2, 2, '00000-000', 'Av. Mutinga', 'Jardim B', '554', 'W');
INSERT INTO Endereco VALUES (3, 3, '00000-000', 'Av. Magalhães de Castro', 'Jardim C', '785', 'X');
INSERT INTO Endereco VALUES (4, 4, '00000-000', 'Ladeira Velha', 'Jardim D', '576', 'Y');
INSERT INTO Endereco VALUES (5, 5, '00000-000', 'R. Augusta', 'Jardim E', '708', 'R');
INSERT INTO Endereco VALUES (6, 6, '00000-000', 'Ladeira Velha', 'Jardim F', '786', 'Q');
INSERT INTO Endereco VALUES (7, 7, '00000-000', 'Av. Mutinga', 'Jardim G', '675', 'P');
INSERT INTO Endereco VALUES (8, 8, '00000-000', 'Av. Pedroso de Morais', 'Jardim H', '467', 'O');
INSERT INTO Endereco VALUES (9, 9, '00000-000', 'Rua Abilio César', 'Jardim I', '543', 'N');
INSERT INTO Endereco VALUES (10, 10, '00000-000', 'Rua Julio C', 'Jardim J', '908', 'M');
INSERT INTO Endereco VALUES (11, 11, '00000-000', 'Av. Maia', 'Jardim K', '263', 'L');
INSERT INTO Endereco VALUES (12, 12, '00000-000', 'Av. Mucilon', 'Jardim L', '342', 'K');
INSERT INTO Endereco VALUES (13, 13, '00000-000', 'Rua Farinha ', 'Jardim M', '164', 'J');
INSERT INTO Endereco VALUES (14, 14, '00000-000', 'Av. Lopes', 'Jardim N', '13', 'I');
INSERT INTO Endereco VALUES (15, 15, '00000-000', 'Rua Salsa', 'Jardim O', '14', 'H');
INSERT INTO Endereco VALUES (16, 16, '00000-000', 'R. Apeninos', 'Jardim P', '12', 'G');
INSERT INTO Endereco VALUES (17, 17, '00000-000', 'Av. Nove de Julho', 'Jardim Q', '153', 'F');
INSERT INTO Endereco VALUES (18, 18, '00000-000', 'Rua Marcus', 'Jardim R', '176', 'E');
INSERT INTO Endereco VALUES (19, 19, '00000-000', 'Av. Velha', 'Jardim S', '1', 'D');
INSERT INTO Endereco VALUES (20, 20, '00000-000', 'Rua Dado', 'Jardim T', '234', 'C');
INSERT INTO Endereco VALUES (21, 21, '00000-000', 'Av. Bandeira', 'Jardim U', '15', 'B');
INSERT INTO Endereco VALUES (22, 22, '00000-000', 'Rua Chaves', 'Jardim V', '23', 'A');
 
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
INSERT INTO OfertaFavorita VALUES (1, 2);
INSERT INTO OfertaFavorita VALUES (1, 3);
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
 
INSERT INTO CategoriaCaracteristica VALUES (1, 1, 'Cor');
INSERT INTO CategoriaCaracteristica VALUES (2, 2, 'Tecido');
INSERT INTO CategoriaCaracteristica VALUES (3, 3, 'Processador');
INSERT INTO CategoriaCaracteristica VALUES (4, 4, 'Câmeras');
INSERT INTO CategoriaCaracteristica VALUES (5, 5, 'Conexão');
INSERT INTO CategoriaCaracteristica VALUES (6, 6, 'Bola');
INSERT INTO CategoriaCaracteristica VALUES (7, 7, 'Carroceria');
INSERT INTO CategoriaCaracteristica VALUES (8, 8, 'Tamanho');
INSERT INTO CategoriaCaracteristica VALUES (9, 9, 'Altura');
INSERT INTO CategoriaCaracteristica VALUES (10, 10, 'Armazenamento');
INSERT INTO CategoriaCaracteristica VALUES (11, 11, 'Memória');
INSERT INTO CategoriaCaracteristica VALUES (12, 12, 'Volume');
INSERT INTO CategoriaCaracteristica VALUES (13, 13, 'Madeira');
INSERT INTO CategoriaCaracteristica VALUES (14, 14, 'Voltagem');
INSERT INTO CategoriaCaracteristica VALUES (15, 15, 'Sabor');
INSERT INTO CategoriaCaracteristica VALUES (16, 16, 'Gênero');
INSERT INTO CategoriaCaracteristica VALUES (17, 17, 'Corda');
INSERT INTO CategoriaCaracteristica VALUES (18, 18, 'Peso');

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
INSERT INTO Apresenta VALUES (3 , 1);

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
SELECT * FROM Comentario;
SELECT * FROM Historico;
SELECT * FROM Categoria;
SELECT * FROM CategoriaCaracteristica;
SELECT * FROM ValorCategoriaCaracteristica;
SELECT * FROM Ofertas;
SELECT * FROM OfertaFavorita;

SELECT * FROM ValorCategoriaCaracteristica
WHERE descricao LIKE 'c%';

 CREATE VIEW Lista_Oferta as
SELECT o.preco as Oferta, e.nome as Empresa, m.nome as Marca, p.modelo, p.imagem_p, p.imagem_m, p.imagem_g, c.nome as Categoria
FROM Ofertas o
LEFT JOIN  Produto p  ON o.id_produto = p.id
LEFT JOIN Empresa e ON e.id = p.id
LEFT JOIN Marca m ON m.id = p.id
LEFT JOIN Categoria c ON c.id = p.id;

CREATE VIEW Comentario_cliente as
SELECT t.titulo, co.texto, co.data_hora, cl.nome
FROM Comentario co
LEFT JOIN Cliente cl ON cl.id = co.id_cliente
LEFT JOIN Topico t ON co.id_topico = t.id
ORDER BY co.data_hora ASC;

CREATE VIEW Lista_topico as
SELECT t.titulo, t.texto, t.data_hora, c.nome
FROM Topico t
LEFT JOIN Cliente c ON t.id_cliente = c.id
ORDER BY t.data_hora ASC;

CREATE VIEW Oferta_favorita as
SELECT ofv.id_ofertas, o.preco, p.modelo, c.nome
FROM OfertaFavorita ofv
LEFT JOIN Cliente c ON c.id = ofv.id_cliente
LEFT JOIN Ofertas o ON o.id = ofv.id_ofertas
LEFT JOIN Produto p ON p.id = o.id_produto;

 CREATE OR REPLACE VIEW Filtro as
SELECT ca.nome as Categoria, cc.nome as CategoriaCaracteristica, vc.descricao as ValorCategoriaCaracteristica, cc.id as CodigoCategoria
FROM Apresenta a
LEFT JOIN CategoriaCaracteristica cc ON a.id_categoriaCaracteristica = cc.id
LEFT JOIN ValorCategoriaCaracteristica vc ON cc.id = vc.id_categoriaCaracteristica
LEFT JOIN Categoria ca ON ca.id = a.id_categoria;

SELECT * FROM Lista_Oferta;

SELECT * FROM Comentario_cliente;

SELECT * FROM Lista_topico;

SELECT * FROM Oferta_favorita;

SELECT * FROM Filtro
where CodigoCategoria = 3;
