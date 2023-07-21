-- criando tabelas

DROP TABLE telefone_rest;
DROP TABLE telefone;
DROP TABLE endereco;
DROP TABLE pessoa;
DROP TABLE cliente;
DROP TABLE entregador;
DROP TABLE cozinheiro;
DROP TABLE restaurante;
DROP TABLE cupom;
DROP TABLE pedido;
DROP TABLE pede_entidade_rel;
DROP TABLE info_pedido;
DROP TABLE itens;
DROP TABLE prepara;

CREATE TABLE endereco (
    CEP VARCHAR2(50) NOT NULL,
    rua VARCHAR2(50) NOT NULL,
    bairro VARCHAR2(50) NOT NULL,
    cidade VARCHAR2(50) NOT NULL,
    estado VARCHAR2(50) NOT NULL,
    pais VARCHAR2(50) NOT NULL,
    CONSTRAINT endereco_pk PRIMARY KEY (CEP)
);

CREATE TABLE restaurante (
    CNPJ VARCHAR2(50) NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    CEP VARCHAR2(50) NOT NULL,
    numero NUMBER NOT NULL,
    complemento VARCHAR2(50),
    CONSTRAINT restaurante_pk PRIMARY KEY (CNPJ),
    CONSTRAINT restaurante_CEP_fk FOREIGN KEY (CEP) REFERENCES endereco (CEP)
);

CREATE TABLE telefone_rest (
    CNPJ VARCHAR2(50) NOT NULL,
    num_tel NUMBER NOT NULL,
    CONSTRAINT telefone_rest_pk PRIMARY KEY (CNPJ, num_tel),
    CONSTRAINT telefone_rest_CNPJ_fk FOREIGN KEY (CNPJ) REFERENCES restaurante (CNPJ)
);

CREATE TABLE pessoa (
	CPF VARCHAR2(50) NOT NULL,
	nome VARCHAR2(30) NOT NULL,
	CONSTRAINT pessoa_pk PRIMARY KEY (CPF)
);

CREATE TABLE telefone (
    num_tel NUMBER NOT NULL,
    CPF VARCHAR2(50) NOT NULL,
    CONSTRAINT telefone_pk PRIMARY KEY (num_tel, CPF),
    CONSTRAINT telefone_CPF_fk FOREIGN KEY (CPF) REFERENCES pessoa (CPF)
);

CREATE TABLE cliente (
    CPF_pessoa VARCHAR2(50) NOT NULL,
    email VARCHAR2(50) NOT NULL,
    CEP VARCHAR2(50) NOT NULL,
    numero NUMBER NOT NULL,
    complemento VARCHAR2(50),
    CONSTRAINT cliente_pk PRIMARY KEY (CPF_pessoa),
    CONSTRAINT cliente_CPF_fk FOREIGN KEY (CPF_pessoa) REFERENCES pessoa (CPF),
    CONSTRAINT cliente_CEP_fk FOREIGN KEY (CEP) REFERENCES endereco (CEP)
);

CREATE TABLE entregador (
    CPF_pessoa VARCHAR2(50) NOT NULL,
    placa VARCHAR2(10) NOT NULL,
    CONSTRAINT entregador_pk PRIMARY KEY (CPF_pessoa),
    CONSTRAINT entregador_CPF_fk FOREIGN KEY (CPF_pessoa) REFERENCES pessoa (CPF)
);

CREATE TABLE cozinheiro (
    CPF_pessoa VARCHAR2(50) NOT NULL,
    salario NUMBER NOT NULL,
    CPF_conzinheiro_chefe VARCHAR2(50),
    CONSTRAINT cozinheiro_pk PRIMARY KEY (CPF_pessoa),
    CONSTRAINT cozinheiro_CPF_fk FOREIGN KEY (CPF_pessoa) REFERENCES pessoa (CPF),
    CONSTRAINT cozinheiro_CPF_conzinheiro_chefe_fk FOREIGN KEY (CPF_conzinheiro_chefe) REFERENCES cozinheiro (CPF_pessoa)
);

CREATE TABLE cupom (
    codigo NUMBER NOT NULL,
    desconto NUMBER NOT NULL,
    validade DATE NOT NULL,
    CONSTRAINT cupom_pk PRIMARY KEY (codigo)
);

CREATE OR REPLACE TRIGGER trg_cupom_validade
BEFORE INSERT OR UPDATE ON cupom
FOR EACH ROW
BEGIN
    IF :NEW.validade <= SYSDATE THEN
        RAISE_APPLICATION_ERROR(-20000, 'A data de validade do cupom deve ser maior que a data atual.');
    END IF;
END;
/

CREATE TABLE pedido (
    ID NUMBER NOT NULL,
    status VARCHAR2(50) NOT NULL,
    taxa_entrega NUMBER NOT NULL,
    forma_pagamento VARCHAR2(50) NOT NULL,
    entregador VARCHAR2(50) NOT NULL,
    CONSTRAINT pedido_pk PRIMARY KEY (ID),
    CONSTRAINT pedido_entregador_fk FOREIGN KEY (entregador) REFERENCES entregador (CPF_pessoa)
);

CREATE TABLE pede_entidade_rel (
    cliente VARCHAR2(50) NOT NULL,
    pedido NUMBER NOT NULL,
    CONSTRAINT pede_entidade_rel_pk PRIMARY KEY (cliente, pedido),
    CONSTRAINT pede_entidade_rel_cliente_fk FOREIGN KEY (cliente) REFERENCES cliente (CPF_pessoa),
    CONSTRAINT pede_entidade_rel_pedido_fk FOREIGN KEY (pedido) REFERENCES pedido (ID)
);

CREATE TABLE info_pedido (
    pedido NUMBER NOT NULL,
    cupom NUMBER,
    data_pedido DATE NOT NULL,
    hora_pedido DATE NOT NULL,
    data_previsao_entrega DATE NOT NULL,
    hora_previsao_entrega DATE NOT NULL,
    CONSTRAINT info_pedido_pk PRIMARY KEY (pedido),
    CONSTRAINT info_pedido_pedido_fk FOREIGN KEY (pedido) REFERENCES pedido (ID),
    CONSTRAINT info_pedido_cupom_fk FOREIGN KEY (cupom) REFERENCES cupom (codigo)
);

CREATE TABLE itens (
    pedido NUMBER NOT NULL,
    codigo_item NUMBER NOT NULL,
    nome VARCHAR2(50) NOT NULL,
    quantidade NUMBER NOT NULL,
    preco NUMBER NOT NULL,
    CONSTRAINT itens_pk PRIMARY KEY (pedido, codigo_item),
    CONSTRAINT itens_pedido_fk FOREIGN KEY (pedido) REFERENCES pedido (ID)
);

CREATE TABLE prepara (
    ID NUMBER NOT NULL,
    cozinheiro VARCHAR2(50) NOT NULL,
    itens NUMBER NOT NULL,
    pedido_fk NUMBER NOT NULL,
    restaurante VARCHAR2(50) NOT NULL,
    CONSTRAINT prepara_pk PRIMARY KEY (ID, cozinheiro, itens, pedido_fk),
    CONSTRAINT prepara_cozinheiro_fk FOREIGN KEY (cozinheiro) REFERENCES cozinheiro (CPF_pessoa),
    CONSTRAINT prepara_itens_fk FOREIGN KEY (itens, pedido_fk) REFERENCES itens (codigo_item, pedido),
    CONSTRAINT prepara_restaurante_fk FOREIGN KEY (restaurante) REFERENCES restaurante (CNPJ)
);