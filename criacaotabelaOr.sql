CREATE OR REPLACE TYPE tp_endereco AS OBJECT(
    CEP VARCHAR2(10),
    rua VARCHAR2(50),
    bairro VARCHAR2(50),
    cidade VARCHAR2(50),
    estado VARCHAR2(50),
    complemento VARCHAR2(50)
);
/

CREATE OR REPLACE TYPE tp_telefone AS OBJECT (
    cod_area VARCHAR2(2),
    numero VARCHAR2(8)
);
/

CREATE OR REPLACE TYPE tp_restaurante AS OBJECT(
    nome VARCHAR2(50),
    CNPJ VARCHAR2(14),
    num_tel tp_telefone,
    endereco tp_endereco
);
/

CREATE OR REPLACE TYPE tp_pessoa AS OBJECT(
    nome VARCHAR2(50),
    CPF VARCHAR2(11),
    telefone tp_telefone
) NOT FINAL NOT INSTANTIABLE;
/

CREATE OR REPLACE TYPE tp_cliente UNDER tp_pessoa(
    email VARCHAR2(50),
    endereco tp_endereco,
    CONSTRUCTOR FUNCTION tp_cliente(email VARCHAR2, endereco tp_endereco, pessoa tp_pessoa) RETURN SELF AS RESULT,
    MEMBER PROCEDURE dados_cliente,
    MEMBER PROCEDURE endereco_cliente
);
/


CREATE OR REPLACE TYPE tp_entregador AS OBJECT(
    pessoa tp_pessoa,
    placa VARCHAR2(7)
);
/

CREATE OR REPLACE TYPE tp_cozinheiro AS OBJECT(
    pessoa tp_pessoa,
    salario NUMBER,
    chefe REF tp_cozinheiro,
    ORDER MEMBER FUNCTION compara_salario(X tp_cozinheiro) RETURN NUMBER
) NOT FINAL;
/

CREATE OR REPLACE TYPE BODY tp_cozinheiro AS
    MAP MEMBER FUNCTION compara_salario(X tp_cozinheiro) RETURN NUMBER IS
    BEGIN
        IF SELF.salario > X.salario THEN
            RETURN 1;
        ELSIF SELF.salario < X.salario THEN
            RETURN -1;
        ELSE
            RETURN 0;
        END IF;
    END;

END;
/

CREATE OR REPLACE TYPE tp_cupom AS OBJECT(
    codigo VARCHAR2(20),
    desconto NUMBER
);
/

ALTER TYPE tp_cupom
ADD ATTRIBUTE (validade REF tp_cupom) CASCADE;
/

CREATE OR REPLACE TYPE BODY tp_cliente AS
    CONSTRUCTOR FUNCTION tp_cliente(email VARCHAR2, endereco tp_endereco, pessoa tp_pessoa) RETURN SELF AS RESULT IS
    BEGIN   
        SELF.email := email;
        SELF.endereco := endereco;
        SELF.pessoa := pessoa;
        RETURN;
    END;

    MEMBER PROCEDURE dados_cliente IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Nome: ' || SELF.pessoa.nome);
        DBMS_OUTPUT.PUT_LINE('Email: ' || SELF.email);
        FOR i IN 1..SELF.telefone.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Número de Telefone ' || i || ': ' || SELF.telefone(i).numero);
        END LOOP;
    END;

    MEMBER PROCEDURE endereco_cliente IS
    BEGIN
        DBMS_OUTPUT.PUT_LINE('Rua: ' || SELF.endereco.rua);
        DBMS_OUTPUT.PUT_LINE('Bairro: ' || SELF.endereco.bairro);
        DBMS_OUTPUT.PUT_LINE('Cidade: ' || SELF.endereco.cidade);
        DBMS_OUTPUT.PUT_LINE('Estado: ' || SELF.endereco.estado);
        DBMS_OUTPUT.PUT_LINE('CEP: ' || SELF.endereco.CEP);
        DBMS_OUTPUT.PUT_LINE('Complemento: ' || SELF.endereco.complemento);
    END;
END;
/

CREATE OR REPLACE TYPE tp_pedido AS OBJECT(
    ID NUMBER,
    status_pedido VARCHAR2(50),
    taxa_entrega NUMBER,
    forma_pagamento VARCHAR2(50),
    entregador tp_entregador
);
/

CREATE OR REPLACE TYPE tp_info_pedido AS OBJECT(
    pedido REF tp_pedido,
    cupom REF tp_cupom,
    data_pedido DATE,
    hora_pedido DATE,
    data_previsao DATE,
    hora_previsao DATE
);
/

CREATE OR REPLACE TYPE tp_itens AS OBJECT(
    codigo_item NUMBER,
    nome VARCHAR2(50),
    quantidade NUMBER,
    preco NUMBER
);
/

CREATE OR REPLACE TYPE tp_prepara AS OBJECT(
    cozinheiro REF tp_cozinheiro,
    itens REF tp_itens,
    restaurante REF tp_restaurante
) NOT FINAL;
/

----TABELAS

CREATE TABLE tb_pessoa OF tp_pessoa(
    CPF PRIMARY KEY
);
/

CREATE TABLE tb_restaurante OF tp_restaurante(
    CNPJ PRIMARY KEY
);
/

CREATE TABLE tb_cliente of tp_cliente(
    CPF PRIMARY KEY
);
/

CREATE TABLE tb_entregador of tp_entregador(
    pessoa PRIMARY KEY
);
/

CREATE TABLE tb_cozinheiro of tp_cozinheiro(
    pessoa PRIMARY KEY
);
/

CREATE TABLE tb_cupom of tp_cupom(
    codigo PRIMARY KEY
);
/

CREATE TABLE tb_pedido of tp_pedido(
    ID PRIMARY KEY,
    entregador WITH ROWID REFERENCES tb_entregador
);
/

CREATE TABLE tb_info_pedido of tp_info_pedido(
    pedido WITH ROWID REFERENCES tb_pedido,
    cupom WITH ROWID REFERENCES tb_cupom
);
/

CREATE TABLE tb_itens of tp_itens(
    codigo_item PRIMARY KEY,
    ID WITH ROWID REFERENCES tb_pedido
);
/

CREATE TABLE tb_prepara of tp_prepara(
    cozinheiro WITH ROWID REFERENCES tb_cozinheiro,
    itens WITH ROWID REFERENCES tb_itens,
    restaurante WITH ROWID REFERENCES tb_restaurante
);
/