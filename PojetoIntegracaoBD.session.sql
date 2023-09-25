USE projetounifametro;


CREATE TABLE usuario(
    id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
    nome VARCHAR(100) NOT NULL,s
    idade INT NOT NULL,
    email VARCHAR(50) NOT NULL
);

/*Realizando o CRUD*/
INSERT INTO usuario(nome, idade, email) VALUES ("João", 20, "joao@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Aurora", 27, "aurora@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("André", 22, "andre@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Leonan", 32, "leonan@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Junior", 27, "junior@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Carlos", 20, "carlos@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Alexandre", 40, "alexandre@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Matheus", 24, "matheus@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Andrew", 40, "andrew@email.com");
INSERT INTO usuario(nome, idade, email) VALUES ("Emma", 33, "emma@email.com");


SELECT * FROM usuario;
SELECT * FROM usuario WHERE nome = "Aurora";


UPDATE usuario SET idade = 28 WHERE nome = "Junior";


DELETE FROM usuario WHERE id = 7;


/*Criando VIEW*/
CREATE VIEW menoresDe30 AS SELECT * FROM usuario WHERE idade < 30;
SELECT * FROM menoresDe30;


/*Criando Stored Procedure*/
CREATE PROCEDURE atualizarIdade(IN id_usuario INT, IN nova_idade INT)
BEGIN
    UPDATE usuario SET idade = nova_idade WHERE id = id_usuario;
END;


/*Criando Function*/
CREATE FUNCTION mediaIdade()
RETURNS DECIMAL(10, 2)
DETERMINISTIC
NO SQL
BEGIN
    DECLARE media DECIMAL(10, 2);
    SELECT AVG(idade) INTO media FROM usuario;
    RETURN media;
END;

SELECT mediaIdade() AS media_idade;


/*Criando TRIGGERS*/
CREATE TABLE logs(
    id INT PRIMARY KEY AUTO_INCREMENT,
    mensagem VARCHAR(1000) NOT NULL,
    data_insert DATE NOT NULL,
    id_user INT NOT NULL
);

CREATE TRIGGER registro_usuario
AFTER INSERT ON usuario
FOR EACH ROW
BEGIN 
    INSERT INTO logs (mensagem, data_insert, id_user) VALUES ("Usuário inserido com sucesso", NOW(), LAST_INSERT_ID());
END;
