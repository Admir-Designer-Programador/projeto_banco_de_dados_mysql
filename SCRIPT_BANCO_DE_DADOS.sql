-- ------------------------------------------
-- Comandos DDL
-- ------------------------------------------
create database jogo;
use jogo;

-- ------------------------------------------
-- Comandos DDL - Definição de Tabelas 
-- ------------------------------------------
create table jogador
(
	id_jogador int auto_increment,
    nome_jogador varchar(30),
    sobrenome_jogador varchar(50),
    senha_estudante varchar(8),
    email_estudante varchar(50),
    tipo_estudante varchar(30),
    primary key(id_jogador)
);

create table jogo
(
	id_jogo int auto_increment,
    nome_jogo varchar(50),
    primary key(id_jogo)
);

create table regra
(
	id_regra int auto_increment,
    regra_regra varchar(50),
    tempo_jogo_regra int,
    fk_id_jogo_regra int,
    primary key(id_regra),
    constraint fk_id_jogo_regra_re foreign key(fk_id_jogo_regra) references jogo(id_jogo)
);

create table alternativa
(
	id_alternativa int auto_increment,
    pergunta_alternativa varchar(150),
    resposta_certa_alternativa varchar(150),
    etapa_alternativa varchar(50),
    dica_alternativa varchar(50),
    fk_id_jogo_alternativa int,
    primary key(id_alternativa),
    constraint fk_id_jogo_al foreign key(fk_id_jogo_alternativa) references jogo(id_jogo)
);

create table instituicao
(
	id_instituicao int auto_increment,
    nome_instituicao varchar(50),
    primary key(id_instituicao)
);

create table turma
(
	id_turma int auto_increment,
    turma_turma varchar(50),
    fk_id_instituicao_turma int,
    primary key(id_turma),
    constraint fk_id_instituicao_turma_tu foreign key(fk_id_instituicao_turma) references instituicao(id_instituicao)
);

create table jogador_turma
(
	fk_id_jogador_jogador_turma int,
    fk_id_turma_jogador_turma int,
    primary key(fk_id_jogador_jogador_turma,fk_id_turma_jogador_turma),
    constraint fk_id_jogador_jogador_turma_jo_tu foreign key(fk_id_jogador_jogador_turma) references jogador(id_jogador),
    constraint fk_id_turma_jogador_turma_jo_tu foreign key(fk_id_turma_jogador_turma) references turma(id_turma)
);

create table jogo_turma
(
	fk_id_turma_jogo_turma int,
    fk_id_jogo_jogo_turma int,
    primary key(fk_id_turma_jogo_turma,fk_id_jogo_jogo_turma),
    constraint fk_id_turma_jogo_turma_jo_tu foreign key(fk_id_turma_jogo_turma) references turma(id_turma),
    constraint fk_id_jogo_jogo_turma_jo_tu foreign key(fk_id_jogo_jogo_turma) references jogo(id_jogo)
);

create table jogador_jogo
(
	id_jogador_jogo int auto_increment,
    fk_id_jogador_jogador_jogo int,
    fk_id_jogo_jogador_jogo int,
    tempo_jogador_jogo int,
    acerto_jogador_jogo int,
    ponto_jogador_jogo int,
    primary key(id_jogador_jogo,fk_id_jogador_jogador_jogo,fk_id_jogo_jogador_jogo),
    constraint fk_id_jogador_jogador_jogo_jo_jo foreign key(fk_id_jogador_jogador_jogo) references jogador(id_jogador),
    constraint fk_id_jogo_jogador_jogo_jo_jo foreign key(fk_id_jogo_jogador_jogo) references jogo(id_jogo)
);

create table erro_jogador_jogo
(
	fk_id_jogo_erro_jogador_jogo int,
    erro_erro_jogador_jogo varchar(50),
    primary key(fk_id_jogo_erro_jogador_jogo),
    constraint fk_id_jogo_erro_jogador_jogo_jo_jo foreign key(fk_id_jogo_erro_jogador_jogo) references jogo(id_jogo)
);

create table alternativa_alt
(
	fk_id_alternativa_alternativa_alt int,
    alternativa_alternativa_alt varchar(50),
    primary key(fk_id_alternativa_alternativa_alt),
    constraint fk_id_alternativa_alternativa_alt_al_al foreign key(fk_id_alternativa_alternativa_alt) references alternativa(id_alternativa)
);

create table regra_jogo
(
	fk_id_regra_regra_jogo int,
    ponto_fase_regra_jogo varchar(50),
    primary key(fk_id_regra_regra_jogo),
    constraint fk_id_regra_regra_jogo_re_jo foreign key(fk_id_regra_regra_jogo) references regra(id_regra)
);

-- ------------------------------------------
-- Comandos DML - Inclusão de Dados 
-- ------------------------------------------

-- Registros para a tabela 'jogador'
INSERT INTO jogador (nome_jogador, sobrenome_jogador, senha_estudante, email_estudante, tipo_estudante) VALUES 
('João', 'Silva', 'senha123', 'joao.silva@email.com', 'Regular'),
('Maria', 'Oliveira', 'senha456', 'maria.oliveira@email.com', 'Regular'),
('Pedro', 'Santos', 'senha789', 'pedro.santos@email.com', 'VIP'),
('Ana', 'Costa', 'senha000', 'ana.costa@email.com', 'Regular'),
('Lucas', 'Lima', 'senha111', 'lucas.lima@email.com', 'VIP');

-- Registros para a tabela 'jogo'
INSERT INTO jogo (nome_jogo) VALUES 
('Super Jogo 1'),
('Super Jogo 2'),
('Mega Jogo 3'),
('Ultra Jogo 4'),
('Fantástico Jogo 5');

-- Registros para a tabela 'regra' (Assumindo que os jogos inseridos anteriormente têm IDs de 1 a 5)
INSERT INTO regra (regra_regra, tempo_jogo_regra, fk_id_jogo_regra) VALUES 
('Regra 1', 10, 1),
('Regra 2', 20, 2),
('Regra 3', 30, 3),
('Regra 4', 40, 4),
('Regra 5', 50, 5);

-- Registros para a tabela 'alternativa'
INSERT INTO alternativa (pergunta_alternativa, resposta_certa_alternativa, etapa_alternativa, dica_alternativa, fk_id_jogo_alternativa) VALUES 
('Qual é a cor do céu?', 'Azul', 'Etapa 1', 'Olhe para cima', 1),
('Quantas patas tem um gato?', '4', 'Etapa 2', 'Conte as patas', 2),
('Em que país está a Torre Eiffel?', 'França', 'Etapa 3', 'Europa', 3),
('Qual o maior animal terrestre?', 'Elefante', 'Etapa 4', 'Mamífero', 4),
('Qual o planeta mais próximo do Sol?', 'Mercúrio', 'Etapa 5', 'Inferno', 5);

-- Registros para a tabela 'instituicao'
INSERT INTO instituicao (nome_instituicao) VALUES 
('Instituto A'),
('Instituto B'),
('Escola Superior C'),
('Universidade D'),
('Academia E');

-- Registros para a tabela 'turma'
INSERT INTO turma (turma_turma, fk_id_instituicao_turma) VALUES 
('Turma 101', 1),
('Turma 202', 2),
('Turma 303', 3),
('Turma 404', 4),
('Turma 505', 5);

-- Registros para a tabela 'jogador_turma'
INSERT INTO jogador_turma (fk_id_jogador_jogador_turma, fk_id_turma_jogador_turma) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Registros para a tabela 'jogo_turma'
INSERT INTO jogo_turma (fk_id_turma_jogo_turma, fk_id_jogo_jogo_turma) VALUES 
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

-- Registros para a tabela 'jogador_jogo'
INSERT INTO jogador_jogo (fk_id_jogador_jogador_jogo, fk_id_jogo_jogador_jogo, tempo_jogador_jogo, acerto_jogador_jogo, ponto_jogador_jogo) VALUES 
(1, 1, 5, 4, 80),
(2, 2, 10, 3, 60),
(3, 3, 15, 5, 100),
(4, 4, 20, 3, 60),
(5, 5, 25, 2, 40);

-- Registros para a tabela 'erro_jogador_jogo'
INSERT INTO erro_jogador_jogo (fk_id_jogo_erro_jogador_jogo, erro_erro_jogador_jogo) VALUES 
(1, 'Erro A'),
(2, 'Erro B'),
(3, 'Erro C'),
(4, 'Erro D'),
(5, 'Erro E');

-- Registros para a tabela 'alternativa_alt'
INSERT INTO alternativa_alt (fk_id_alternativa_alternativa_alt, alternativa_alternativa_alt) VALUES 
(1, 'Verde'),
(2, '5'),
(3, 'Espanha'),
(4, 'Girafa'),
(5, 'Vênus');

-- Registros para a tabela 'regra_jogo'
INSERT INTO regra_jogo (fk_id_regra_regra_jogo, ponto_fase_regra_jogo) VALUES 
(1, 'Ponto A'),
(2, 'Ponto B'),
(3, 'Ponto C'),
(4, 'Ponto D'),
(5, 'Ponto E');


