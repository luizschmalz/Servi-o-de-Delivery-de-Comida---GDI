--alter table
ALTER TABLE PESSOA
ADD(Idade NUMBER);

--create index
CREATE INDEX salario_idx ON COZINHEIRO(SALARIO)

--insert into
INSERT INTO pessoa (CPF,nome) VALUES ('536.639.350-90', 'Ian Gabriel');

--update
UPDATE COZINHEIRO SET SALARIO = 12000 
WHERE CPF_pessoa = '639.330.890-77'

--delete
INSERT INTO pessoa (CPF,nome) VALUES ('566.555.760-93', 'Jaquin');
INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('566.555.760-93', 15000, null);
DELETE FROM COZINHEIRO WHERE SALARIO = 15000

--where
SELECT * FROM COZINHEIRO WHERE SALARIO >5000

--between
SELECT * FROM COZINHEIRO WHERE SALARIO BETWEEN 1000 AND 3000 

--in
SELECT * FROM ENDERECO
WHERE BAIRRO IN ('Casa Forte')

--like
SELECT NOME FROM PESSOA
WHERE nome LIKE 'L%' 

--is / is not null
SELECT CPF_pessoa FROM COZINHEIRO
WHERE CPF_conzinheiro_chefe is/is NOT NULL

--inner join
SELECT C.SALARIO, P.nome FROM COZINHEIRO C
INNER JOIN PESSOA P
ON CPF_pessoa = CPF

--max
SELECT CPF_pessoa, SALARIO FROM COZINHEIRO
WHERE SALARIO IN (SELECT MAX(SALARIO) FROM COZINHEIRO)

--min
SELECT CPF_pessoa, SALARIO FROM COZINHEIRO
WHERE SALARIO IN (SELECT MIN(SALARIO) FROM COZINHEIRO)

--avg
SELECT AVG(SALARIO) FROM COZINHEIRO

--count
SELECT CPF_pessoa COUNT FROM COZINHEIRO WHERE SALARIO >5000

--full outer join
SELECT C.SALARIO, P.nome FROM COZINHEIRO C
FULL OUTER JOIN PESSOA P
ON CPF_pessoa = CPF

--subconsultas 
SELECT * FROM ENDERECO WHERE CEP = (SELECT CEP FROM RESTAURANTE WHERE CEP = '69313-281')

SELECT * FROM INFO_PEDIDO WHERE PEDIDO = (SELECT ID FROM PEDIDO WHERE STATUS IN 'Preparo')

SELECT * FROM RESTAURANTE WHERE CEP = ANY (SELECT CEP FROM ENDERECO WHERE BAIRRO LIKE 'C%')

SELECT * FROM RESTAURANTE WHERE CEP != ALL (SELECT CEP FROM ENDERECO WHERE BAIRRO LIKE 'C%')

SELECT * FROM COZINHEIRO ORDER BY SALARIO

--group by
SELECT FORMA_PAGAMENTO, COUNT(*) FROM PEDIDO GROUP BY FORMA_PAGAMENTO

--having
SELECT FORMA_PAGAMENTO, COUNT(*) FROM PEDIDO GROUP BY FORMA_PAGAMENTO HAVING COUNT(*) > 1

--intersect
SELECT CEP FROM ENDERECO INTERSECT (SELECT CEP FROM RESTAURANTE)

--crateview
CREATE VIEW CLIENTE_NOME AS
SELECT C.CPF_pessoa, C.EMAIL, P.NOME, P.CPF FROM PESSOA P, CLIENTE C
WHERE C.CPF_PESSOA = P.CPF

--grant
GRANT SELECT ON CLIENTE_NOME TO PUBLIC

--USO DE RECORD and BLOCO ANÔNIMO

DECLARE

  TYPE restaurante_record IS RECORD (
    CNPJ VARCHAR2(50),
    nome VARCHAR2(50),
    CEP VARCHAR2(50),
    numero NUMBER,
    complemento VARCHAR2(50)
  );

  restaurante_data restaurante_record;

  v_restaurante_cnpj VARCHAR2(50) := '52.693.877/0001-09';
BEGIN

  SELECT CNPJ, nome, CEP, numero, complemento
  INTO restaurante_data
  FROM restaurante
  WHERE CNPJ = v_restaurante_cnpj;

  DBMS_OUTPUT.PUT_LINE('Restaurant CNPJ: ' || restaurante_data.CNPJ);
  DBMS_OUTPUT.PUT_LINE('Restaurant Name: ' || restaurante_data.nome);
  DBMS_OUTPUT.PUT_LINE('Address CEP: ' || restaurante_data.CEP);
  DBMS_OUTPUT.PUT_LINE('Address Number: ' || restaurante_data.numero);
  DBMS_OUTPUT.PUT_LINE('Address Complement: ' || restaurante_data.complemento);

END;

--CREATE PROCEDURE and SELECT… INTO

CREATE OR REPLACE PROCEDURE GetOrderDetails(
  p_order_id IN NUMBER,
  p_order_status OUT VARCHAR2,
  p_order_forma_pagamento OUT VARCHAR2,
  p_order_entregador OUT VARCHAR2
)
IS
BEGIN

  SELECT status, forma_pagamento, entregador
  INTO p_order_status, p_order_forma_pagamento, p_order_entregador
  FROM pedido
  WHERE ID = p_order_id;
END;
/

DECLARE
  v_order_id NUMBER := 100;
  v_order_status VARCHAR2(50);
  v_order_forma_pagamento VARCHAR2(50);
  v_order_entregador VARCHAR2(50);
BEGIN
  GetOrderDetails(v_order_id, v_order_status, v_order_forma_pagamento, v_order_entregador);

  DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_id);
  DBMS_OUTPUT.PUT_LINE('Status: ' || v_order_status);
  DBMS_OUTPUT.PUT_LINE('Forma de Pagamento: ' || v_order_forma_pagamento);
  DBMS_OUTPUT.PUT_LINE('Entregador: ' || v_order_entregador);
END;
/

--CREATE FUNCTION

CREATE OR REPLACE FUNCTION GetOrderStatus(
  p_order_id IN NUMBER
) RETURN VARCHAR2
IS
  v_order_status VARCHAR2(50);
BEGIN

  SELECT status
  INTO v_order_status
  FROM pedido
  WHERE ID = p_order_id;

  RETURN v_order_status;
END;
/


DECLARE
  v_order_id NUMBER := 100; 
  v_order_status VARCHAR2(50);
BEGIN

  v_order_status := GetOrderStatus(v_order_id);

  DBMS_OUTPUT.PUT_LINE('Order ID ' || v_order_id || ' Status: ' || v_order_status);
END;
/

--%TYPE

DECLARE
  TYPE restaurante_record IS RECORD (
    CNPJ restaurante.CNPJ%TYPE,
    nome restaurante.nome%TYPE,
    CEP restaurante.CEP%TYPE,
    numero restaurante.numero%TYPE,
    complemento restaurante.complemento%TYPE
  );

  restaurante_data restaurante_record;
  v_restaurante_cnpj VARCHAR2(50) := '52.693.877/0001-09';
BEGIN
  SELECT *
  INTO restaurante_data
  FROM restaurante
  WHERE CNPJ = v_restaurante_cnpj;

  DBMS_OUTPUT.PUT_LINE('Restaurant CNPJ: ' || restaurante_data.CNPJ);
  DBMS_OUTPUT.PUT_LINE('Restaurant Name: ' || restaurante_data.nome);
  DBMS_OUTPUT.PUT_LINE('Address CEP: ' || restaurante_data.CEP);
  DBMS_OUTPUT.PUT_LINE('Address Number: ' || restaurante_data.numero);
  DBMS_OUTPUT.PUT_LINE('Address Complement: ' || restaurante_data.complemento);
END;
/

--%ROWTYPE

DECLARE
  restaurante_data restaurante%ROWTYPE;
  v_restaurante_cnpj VARCHAR2(50) := '52.693.877/0001-09';
BEGIN
  SELECT *
  INTO restaurante_data
  FROM restaurante
  WHERE CNPJ = v_restaurante_cnpj;

  DBMS_OUTPUT.PUT_LINE('Restaurant CNPJ: ' || restaurante_data.CNPJ);
  DBMS_OUTPUT.PUT_LINE('Restaurant Name: ' || restaurante_data.nome);
  DBMS_OUTPUT.PUT_LINE('Address CEP: ' || restaurante_data.CEP);
  DBMS_OUTPUT.PUT_LINE('Address Number: ' || restaurante_data.numero);
  DBMS_OUTPUT.PUT_LINE('Address Complement: ' || restaurante_data.complemento);
END;

--IF ELSIF
 
DECLARE
  v_cozinheiro_salary NUMBER;
  v_cozinheiro_name VARCHAR2(50);
  v_salary_range VARCHAR2(50);
BEGIN
  FOR cozinheiro_rec IN (SELECT c.CPF_pessoa, c.salario, p.nome
                         FROM cozinheiro c
                         JOIN pessoa p ON c.CPF_pessoa = p.CPF)
  LOOP
    v_cozinheiro_salary := cozinheiro_rec.salario;
    v_cozinheiro_name := cozinheiro_rec.nome;

    IF v_cozinheiro_salary < 3000 THEN
      v_salary_range := 'low';
    ELSIF v_cozinheiro_salary >= 3000 AND v_cozinheiro_salary < 8000 THEN
      v_salary_range := 'moderate';
    ELSE
      v_salary_range := 'high';
    END IF;

    DBMS_OUTPUT.PUT_LINE(v_cozinheiro_name || ' has a ' || v_salary_range || ' salary.');
  END LOOP;
END;
/

--CASE WHEN

SELECT p.nome AS Nome,
       CASE WHEN COUNT(pr.pedido_fk) >= 1 THEN 'trabalhando' ELSE 'ocioso' END AS status
FROM cozinheiro c
LEFT JOIN prepara pr ON c.CPF_pessoa = pr.cozinheiro
JOIN pessoa p ON c.CPF_pessoa = p.CPF
GROUP BY p.nome;


--LOOP EXIT WHEN  and CURSOR (OPEN, FETCH e CLOSE)

DECLARE
  v_nome_pessoa pessoa.nome%TYPE;
  v_email_cliente cliente.email%TYPE;
  
  v_cliente_cpf VARCHAR2(50);
  
  CURSOR cliente_cursor IS
    SELECT p.nome, c.email
    FROM pessoa p
    JOIN cliente c ON p.CPF = c.CPF_pessoa;
BEGIN
  OPEN cliente_cursor;
  
  LOOP
    FETCH cliente_cursor INTO v_nome_pessoa, v_email_cliente;
    
    EXIT WHEN cliente_cursor%NOTFOUND;
    
    DBMS_OUTPUT.PUT_LINE('Nome Cliente: ' || v_nome_pessoa);
    DBMS_OUTPUT.PUT_LINE('Email Cliente: ' || v_email_cliente);
  END LOOP;
  
  CLOSE cliente_cursor;
END;
/

--WHILE LOOP

--FOR IN LOOP

DECLARE
    
  v_codigo cupom.codigo%TYPE;
  v_desconto cupom.desconto%TYPE;
  v_validade cupom.validade%TYPE
      
BEGIN
  FOR cupom_rec IN (SELECT codigo, desconto, validade FROM cupom) LOOP
    v_codigo := cupom_rec.codigo;
    v_desconto := cupom_rec.desconto;
    v_validade := cupom_rec.validade;

    DBMS_OUTPUT.PUT_LINE('Cupom Codigo: ' || v_codigo);
    DBMS_OUTPUT.PUT_LINE('Desconto: ' || v_desconto || '%');
    DBMS_OUTPUT.PUT_LINE('Validade: ' || v_validade);
    DBMS_OUTPUT.PUT_LINE('------------------------');
  END LOOP;
END;
/

---EXCEPTION WHEN

DECLARE
    v_cpf_pessoa VARCHAR2(50) := '2827.706.320-81'; -- Existing CPF in the table
    v_new_salary NUMBER := 11000; -- Invalid (negative) salary value
    v_max_salary NUMBER := 10000; -- Maximum allowed salary value

    v_old_salary NUMBER;
BEGIN

    SELECT salario INTO v_old_salary
    FROM cozinheiro
    WHERE CPF_pessoa = v_cpf_pessoa;

    IF v_new_salary < 0 OR v_new_salary > v_max_salary THEN
        RAISE VALUE_ERROR;
    END IF;

    UPDATE cozinheiro
    SET salario = v_new_salary
    WHERE CPF_pessoa = v_cpf_pessoa;

    DBMS_OUTPUT.PUT_LINE('Salary updated successfully.');
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Error: Cozinheiro with CPF ' || v_cpf_pessoa || ' not found.');

    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('Error: Invalid salary value. Salary must be between 0 and ' || v_max_salary || '.');

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred.');
        DBMS_OUTPUT.PUT_LINE(SQLERRM);
END;
/

--USO DE PAR METROS (IN, OUT ou IN OUT) and USO DE ESTRUTURA DE DADOS DO TIPO TABLE

CREATE OR REPLACE TYPE restaurantes_list AS TABLE OF VARCHAR2(100);
/

CREATE OR REPLACE PROCEDURE get_restaurantes_by_bairro(
    bairro_in IN endereco.bairro%TYPE,
    restaurantes_out OUT restaurantes_list
)
AS
BEGIN
    SELECT r.nome
    BULK COLLECT INTO restaurantes_out
    FROM restaurante r
    JOIN endereco e ON r.CEP = e.CEP
    WHERE e.bairro = bairro_in;

    IF restaurantes_out.COUNT = 0 THEN
        RAISE NO_DATA_FOUND;
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No restaurants found in ' || bairro_in);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END;
/
DECLARE
    v_bairro endereco.bairro%TYPE := 'Casa Amarela';
    v_restaurantes restaurantes_list;
BEGIN
    get_restaurantes_by_bairro(v_bairro, v_restaurantes);

    IF v_restaurantes.COUNT > 0 THEN
        FOR i IN 1..v_restaurantes.COUNT LOOP
            DBMS_OUTPUT.PUT_LINE('Restaurant in ' || v_bairro || ': ' || v_restaurantes(i));
        END LOOP;
    ELSE
        DBMS_OUTPUT.PUT_LINE('No restaurants found in ' || v_bairro);
    END IF;
END;

--CREATE OR REPLACE PACKAGE and CREATE OR REPLACE PACKAGE BODY

CREATE OR REPLACE PACKAGE cupom_pkg AS
    PROCEDURE insert_cupom(p_desconto NUMBER, p_validade DATE);
END cupom_pkg;
/

CREATE OR REPLACE PACKAGE BODY cupom_pkg AS
    PROCEDURE insert_cupom(p_desconto NUMBER, p_validade DATE) IS
    BEGIN
        IF p_validade <= SYSDATE THEN
            DBMS_OUTPUT.PUT_LINE('A data de validade do cupom deve ser maior que a data atual.');
        ELSE
            INSERT INTO cupom (codigo, desconto, validade)
            VALUES (seq.NEXTVAL, p_desconto, p_validade);

            COMMIT; 
            DBMS_OUTPUT.PUT_LINE('New cupom inserted successfully.');
        END IF;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error occurred: ' || SQLERRM);
    END insert_cupom;
END cupom_pkg;
/
BEGIN
    cupom_pkg.insert_cupom(10, TO_DATE('01/01/2020', 'DD/MM/YYYY'));
END;
/
BEGIN
    cupom_pkg.insert_cupom(10, TO_DATE('30/09/2023', 'DD/MM/YYYY'));
END;
/


--CREATE OR REPLACE TRIGGER (COMANDO)

--CREATE OR REPLACE TRIGGER (LINHA)

CREATE OR REPLACE TRIGGER trg_valida_placa_entregador
BEFORE INSERT ON entregador
FOR EACH ROW
DECLARE
    v_pattern VARCHAR2(7) := 'LLL9999';
BEGIN
    IF LENGTH(:NEW.placa) <> 7 THEN
        RAISE_APPLICATION_ERROR(-20000, 'A placa deve ter exatamente 7 caracteres.');
    END IF;

    IF NOT REGEXP_LIKE(:NEW.placa, '^[A-Z]{3}\d{4}$') THEN
        RAISE_APPLICATION_ERROR(-20000, 'A placa deve conter 3 letras seguidas por 4 dígitos (por exemplo: ABC1234).');   
    END IF;
END;
/

INSERT INTO pessoa (CPF, nome) VALUES ('987.654.321-00', 'Nome do Entregador Inválido');
INSERT INTO entregador (CPF_pessoa, placa) VALUES ('987.654.321-00', '1234ABC');
INSERT INTO pessoa (CPF, nome) VALUES ('555.666.777-88', 'Entregador Inválido');
INSERT INTO entregador (CPF_pessoa, placa) VALUES ('555.666.777-88', '1234ABC');


