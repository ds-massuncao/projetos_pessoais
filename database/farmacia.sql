CREATE SCHEMA Farmacia;


CREATE TABLE Farmacia.Tipo_Adminstracao ( id_solucao SMALLINT NOT NULL, solucao VARCHAR NOT NULL, CONSTRAINT tipo_adminstracao_pk PRIMARY KEY (id_solucao) );


CREATE TABLE Farmacia.Principio_Ativo ( id_principio SMALLINT NOT NULL, nome_principio VARCHAR NOT NULL, CONSTRAINT principio_ativo_pk PRIMARY KEY (id_principio) );


CREATE TABLE Farmacia.Classe_Terapeutica ( id_classe SMALLINT NOT NULL, nome_classe VARCHAR NOT NULL, CONSTRAINT classe_terapeutica_pk PRIMARY KEY (id_classe) );


CREATE TABLE Farmacia.Categoria ( id_categoria SMALLINT NOT NULL, nome_categoria VARCHAR NOT NULL, CONSTRAINT categoria_pk PRIMARY KEY (id_categoria) );


CREATE TABLE Farmacia.Mediacamento ( registro SMALLINT NOT NULL, nome VARCHAR NOT NULL, id_categoria SMALLINT NOT NULL, id_classe SMALLINT NOT NULL, id_principio SMALLINT NOT NULL, situacao_registro VARCHAR(50) NOT NULL, CONSTRAINT mediacamento_pk PRIMARY KEY (registro) ); 

CREATE TABLE Farmacia.CEP ( cep VARCHAR(8) NOT NULL, endereco VARCHAR NOT NULL, complemento VARCHAR, bairro VARCHAR NOT NULL, cidade VARCHAR NOT NULL, estado VARCHAR(2) NOT NULL, CONSTRAINT cep_pk PRIMARY KEY (cep) );


CREATE TABLE Farmacia.Empresa ( empresa_id INTEGER NOT NULL, razao_social VARCHAR NOT NULL, nome_fantasia VARCHAR NOT NULL, cnpj SMALLINT NOT NULL, inscricao_estadual SMALLINT NOT NULL, telefone VARCHAR(11) NOT NULL, email VARCHAR NOT NULL, cep VARCHAR(8) NOT NULL, CONSTRAINT empresa_pk PRIMARY KEY (empresa_id) );


CREATE TABLE Farmacia.Manipulao ( id_manipulacao SMALLINT NOT NULL, empresa_id INTEGER NOT NULL, registro SMALLINT NOT NULL, lote VARCHAR(7) NOT NULL, fabricacao DATE NOT NULL, validade DATE NOT NULL, dosagem VARCHAR NOT NULL, id_solucao SMALLINT NOT NULL, CONSTRAINT manipulao_pk PRIMARY KEY (id_manipulacao, empresa_id, registro) );


ALTER TABLE Farmacia.Manipulao ADD CONSTRAINT tipo_adminstracao_manipula__o_fk FOREIGN KEY (id_solucao) REFERENCES Farmacia.Tipo_Adminstracao (id_solucao)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE Farmacia.Mediacamento ADD CONSTRAINT principio_ativo_mediacamento_fk FOREIGN KEY (id_principio) REFERENCES Farmacia.Principio_Ativo (id_principio)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE Farmacia.Mediacamento ADD CONSTRAINT classe_terapeutica_mediacamento_fk FOREIGN KEY (id_classe) REFERENCES Farmacia.Classe_Terapeutica (id_classe)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE Farmacia.Mediacamento ADD CONSTRAINT categoria_mediacamento_fk FOREIGN KEY (id_categoria) REFERENCES Farmacia.Categoria (id_categoria)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE Farmacia.Manipulao ADD CONSTRAINT mediacamento_manipula__o_fk FOREIGN KEY (registro) REFERENCES Farmacia.Mediacamento (registro)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE Farmacia.Empresa ADD CONSTRAINT cep_empresa_fk FOREIGN KEY (cep) REFERENCES Farmacia.CEP (cep)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;

ALTER TABLE Farmacia.Manipulao ADD CONSTRAINT empresa_manipula__o_fk FOREIGN KEY (empresa_id) REFERENCES Farmacia.Empresa (empresa_id)
    ON DELETE NO ACTION
    ONUPDATE NO ACTION NOT DEFERRABLE;