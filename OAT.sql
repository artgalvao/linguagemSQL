-- Criação das tabelas:

CREATE TABLE Projetos (
  ID_projeto INT PRIMARY KEY AUTO_INCREMENT,
  titulo VARCHAR(50) NOT NULL,
  dataProjeto DATE,
  url VARCHAR(50));
  
CREATE TABLE Usuarios (
   ID_usuario INT PRIMARY KEY AUTO_INCREMENT,
   nome VARCHAR(45) NOT NULL,
   email VARCHAR(45) NOT NULL,
   senha VARCHAR(45) NOT NULL);
  
 CREATE TABLE Comentario (
  ID_comentario INT PRIMARY KEY,
  comentario TEXT,
  dataComentario DATE,
  ID_usuario INT,
  ID_projeto INT);
 
 CREATE TABLE LikesPorProjeto (
   ID_projeto0 INT,
   ID_usuario0 INT);
   
 CREATE TABLE LikesPorComentario (
     ID_comentario0 INT,
     ID_usuario1 INT);

-- Criação das FKs:

ALTER TABLE LikesPorProjeto ADD CONSTRAINT fk_projeto FOREIGN key (ID_projeto0) REFERENCES Projetos(ID_projeto);
ALTER TABLE LikesPorProjeto ADD CONSTRAINT fk_usuario FOREIGN key (ID_usuario0) REFERENCES Usuarios(ID_usuario);

ALTER TABLE Comentario ADD CONSTRAINT fk_projeto_comentario FOREIGN key (ID_usuario) REFERENCES Usuarios(ID_usuario);
ALTER TABLE Comentario ADD CONSTRAINT fk_usuario_comentario FOREIGN key (ID_projeto) REFERENCES Projetos(ID_projeto);

ALTER TABLE LikesPorComentario ADD CONSTRAINT fk_comentario FOREIGN key (ID_comentario0) REFERENCES Comentario(ID_comentario);
ALTER TABLE LikesPorComentario ADD CONSTRAINT fk_usuario0 FOREIGN key (ID_usuario1) REFERENCES Usuarios(ID_usuario);

-- Inserindo dados nas tabelas:

INSERT INTO Projetos
	(titulo, dataProjeto)
VALUES
	('Aplicação C#', '2018-04-01'),
    ('Aplicação Ionic', '2018-05-07'),
    ('Aplicação Python', '2018-08-05');

INSERT INTO Comentario
	(id_comentario, comentario, id_projeto, id_usuario)
VALUES
	(1, 'A Microsoft acertou com essa linguagem!', 1, 1),
    (2, 'Parabéns pelo projeto! bem legal!', 1, 3),
    (3, 'Super interessante! Fácil e rápido', 2, 4),
    (4, 'Cara, que simples fazer um app assim!', 2, 1),
    (5, 'Linguagem muito diferente.', 3, 3),
    (6, 'Adorei aprender Python! Parabéns!', 3, 2),
    (7, 'Muito maneiro esse framework!', 2, 2);

insert into Usuarios
	(nome, email, senha)
values
	('Bruna Luiza', 'bruninha@gmail.com', 'abc123.'),
    ('Thiago Braga', 'thiagobraga_1@hotmail.com', 'pena093'),
    ('Osvaldo Justino', 'osvaltino@yahoo.com.br', 'oswaldit1_s'),
    ('Gabriel Fernando', 'gabriel_fnd@gmail.com', 'gabss34');

INSERT into LikesPorProjeto
	(id_projeto0, id_usuario0)
VALUES
	(1,1),
    (1,3),
    (2,4),
    (2,1),
    (3,3),
    (3,2),
    (2,2);

INSERT into LikesPorComentario
	(id_comentario0, id_usuario1)
VALUES
	(7,1),
    (7,2),
    (7,4);