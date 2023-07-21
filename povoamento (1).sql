CREATE SEQUENCE seq INCREMENT by 1 START WITH 1;
CREATE SEQUENCE seq2 INCREMENT by 1 START WITH 100;
CREATE SEQUENCE seq3 INCREMENT by 1 START WITH 200;

INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('59110-690', 'Rua do Amor Divino', 'Madalena', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('60812-516', 'Travessa Chico Mendes', 'Torre', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('65058-498', 'Rua Ernani Braga', 'Torre', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('17602-132', 'Rua Eduardo Zamataro', 'Casa Forte', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('69902-109', 'Rua Amelia', 'Espinheiro', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('53020-070', 'Rua Alameda', 'Casa Forte', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('68909-711', 'Rua Joaquim Nabuco', 'Derby', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('66640-215', 'Rua Batman', 'Espinheiro', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('52090-156', 'Rua Henrique Melo', 'Casa Amarela', 'Recife', 'Pernambuco', 'Brasil');
INSERT INTO endereco (CEP, rua, bairro, cidade, estado, pais) VALUES ('69313-281', 'Rua Jaden', 'Brooklyn BR', 'Recife', 'Pernambuco', 'Brasil');


INSERT INTO restaurante (CNPJ, nome, CEP, numero, complemento) VALUES ('52.693.877/0001-09', 'Stock burger', '53020-070', 1002, NULL);
INSERT INTO restaurante (CNPJ, nome, CEP, numero, complemento) VALUES ('86.206.681/0001-64', 'Napoli pizza', '68909-711', 1652, NULL);
INSERT INTO restaurante (CNPJ, nome, CEP, numero, complemento) VALUES ('20.206.200/0001-64', 'Nirai sushi', '66640-215', 76, NULL);
INSERT INTO restaurante (CNPJ, nome, CEP, numero, complemento) VALUES ('92.878.639/0001-92', 'Henrique Melo burger', '52090-156', 756, NULL);
INSERT INTO restaurante (CNPJ, nome, CEP, numero, complemento) VALUES ('58.163.488/0001-58', 'Taalin food', '69313-281', 325, NULL);

INSERT INTO pessoa (CPF,nome) VALUES ('776.833.020-07', 'Matheus Braga');
INSERT INTO pessoa (CPF,nome) VALUES ('427.206.230-16', 'Luiz Eduardo');
INSERT INTO pessoa (CPF,nome) VALUES ('935.839.570-24', 'Mader Gabriel');
INSERT INTO pessoa (CPF,nome) VALUES ('536.639.350-78', 'Pedro Calheiros');
INSERT INTO pessoa (CPF,nome) VALUES ('002.515.090-10', 'Henrique Melo');
INSERT INTO pessoa (CPF,nome) VALUES ('449.558.940-70', 'Joao Victor Paranhos');
INSERT INTO pessoa (CPF,nome) VALUES ('805.741.820-63', 'Luis Mendes');
INSERT INTO pessoa (CPF,nome) VALUES ('367.615.290-50', 'Victor Porto');
INSERT INTO pessoa (CPF,nome) VALUES ('049.550.500-50', 'Lucas Braga');
INSERT INTO pessoa (CPF,nome) VALUES ('600.056.680-85', 'Marina Silva');
INSERT INTO pessoa (CPF,nome) VALUES ('639.330.890-77', 'Beatriz Nunes');
INSERT INTO pessoa (CPF,nome) VALUES ('287.706.320-81', 'Paolla Carocelli');
INSERT INTO pessoa (CPF,nome) VALUES ('001.178.450-43', 'Henrique Fogaça');
INSERT INTO pessoa (CPF,nome) VALUES ('566.555.760-91', 'Jaquin');

INSERT INTO telefone_rest (CNPJ, num_tel) VALUES ('52.693.877/0001-09', 25451661);
INSERT INTO telefone_rest (CNPJ, num_tel) VALUES ('20.206.200/0001-64', 27472523);
INSERT INTO telefone_rest (CNPJ, num_tel) VALUES ('86.206.681/0001-64', 28161398);
INSERT INTO telefone_rest (CNPJ, num_tel) VALUES ('92.878.639/0001-92', 28911398);
INSERT INTO telefone_rest (CNPJ, num_tel) VALUES ('58.163.488/0001-58', 24436695);

INSERT INTO telefone (CPF, num_tel) VALUES ('776.833.020-07', 12345677);
INSERT INTO telefone (CPF, num_tel) VALUES ('427.206.230-16', 88994422);
INSERT INTO telefone (CPF, num_tel) VALUES ('935.839.570-24', 67679292);
INSERT INTO telefone (CPF, num_tel) VALUES ('536.639.350-78', 31322848);
INSERT INTO telefone (CPF, num_tel) VALUES ('002.515.090-10', 31674346);
INSERT INTO telefone (CPF, num_tel) VALUES ('449.558.940-70', 26967258);
INSERT INTO telefone (CPF, num_tel) VALUES ('805.741.820-63', 38464688);
INSERT INTO telefone (CPF, num_tel) VALUES ('367.615.290-50', 34482567);
INSERT INTO telefone (CPF, num_tel) VALUES ('049.550.500-50', 30862266);
INSERT INTO telefone (CPF, num_tel) VALUES ('600.056.680-85', 32118644);
INSERT INTO telefone (CPF, num_tel) VALUES ('639.330.890-77', 32923573);

INSERT INTO cliente (CPF_pessoa, email, CEP, numero, complemento) VALUES ('776.833.020-07', 'mbb4@gmail.com', '59110-690', 377, 'apto 102');
INSERT INTO cliente (CPF_pessoa, email, CEP, numero, complemento) VALUES ('427.206.230-16', 'lefvs@gmail.com', '60812-516', 57, 'apto 101');
INSERT INTO cliente (CPF_pessoa, email, CEP, numero, complemento) VALUES ('935.839.570-24', 'mgsb@gmail.com', '65058-498', 454, 'apto 502');
INSERT INTO cliente (CPF_pessoa, email, CEP, numero, complemento) VALUES ('536.639.350-78', 'pca@gmail.com', '17602-132', 45, 'apto 305');
INSERT INTO cliente (CPF_pessoa, email, CEP, numero, complemento) VALUES ('002.515.090-10', 'hcm@gmail.com', '69902-109', 896, 'apto 865');

INSERT INTO entregador (CPF_pessoa, placa) VALUES ('449.558.940-70', 'HTR-9225');
INSERT INTO entregador (CPF_pessoa, placa) VALUES ('805.741.820-63', 'AIJ-5162');
INSERT INTO entregador (CPF_pessoa, placa) VALUES ('367.615.290-50', 'MZX-6138');


INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('287.706.320-81', 7000, NULL);
INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('001.178.450-43', 8500, NULL);
INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('566.555.760-91', 10500, NULL);
INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('049.550.500-50', 2000, '287.706.320-81');
INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('600.056.680-85', 3000, '001.178.450-43');
INSERT INTO cozinheiro (CPF_pessoa, salario, CPF_conzinheiro_chefe) VALUES ('639.330.890-77', 2800, '566.555.760-91');

INSERT INTO cupom (codigo, desconto, validade) VALUES (seq.NEXTVAL, 10, to_date('01/08/2023', 'dd/mm/yyyy'));
INSERT INTO cupom (codigo, desconto, validade) VALUES (seq.NEXTVAL, 5, to_date('05/09/2023', 'dd/mm/yyyy'));
INSERT INTO cupom (codigo, desconto, validade) VALUES (seq.NEXTVAL, 15, to_date('10/11/2023', 'dd/mm/yyyy'));
INSERT INTO cupom (codigo, desconto, validade) VALUES (seq.NEXTVAL, 10, to_date('30/08/2023', 'dd/mm/yyyy'));
INSERT INTO cupom (codigo, desconto, validade) VALUES (seq.NEXTVAL, 20, to_date('25/10/2023', 'dd/mm/yyyy'));

INSERT INTO pedido (ID, status, taxa_entrega, forma_pagamento, entregador) VALUES (seq2.NEXTVAL, 'Pronto', 7, 'Pix', '449.558.940-70');
INSERT INTO pedido (ID, status, taxa_entrega, forma_pagamento, entregador) VALUES (seq2.NEXTVAL, 'Em espera do motoboy', 6, 'Débito', '449.558.940-70');
INSERT INTO pedido (ID, status, taxa_entrega, forma_pagamento, entregador) VALUES (seq2.NEXTVAL, 'A confirmar', 8, 'Pix', '805.741.820-63');
INSERT INTO pedido (ID, status, taxa_entrega, forma_pagamento, entregador) VALUES (seq2.NEXTVAL, 'Preparo', 5, 'Dinheiro', '367.615.290-50');
INSERT INTO pedido (ID, status, taxa_entrega, forma_pagamento, entregador) VALUES (seq2.NEXTVAL, 'Pronto', 7, 'Crédito', '805.741.820-63');

INSERT INTO pede_entidade_rel (cliente, pedido) VALUES ('776.833.020-07', 100);
INSERT INTO pede_entidade_rel (cliente, pedido) VALUES ('427.206.230-16', 101);
INSERT INTO pede_entidade_rel (cliente, pedido) VALUES ('935.839.570-24', 102);
INSERT INTO pede_entidade_rel (cliente, pedido) VALUES ('536.639.350-78', 103);
INSERT INTO pede_entidade_rel (cliente, pedido) VALUES ('002.515.090-10', 104);

INSERT INTO info_pedido  (pedido, cupom, data_pedido, hora_pedido, data_previsao_entrega, hora_previsao_entrega) VALUES (100, 1, to_date('09/08/2023', 'dd/mm/yyyy'), to_date('20:45', 'HH24:MI'), to_date('09/08/2023', 'dd/mm/yyyy'), to_date('21:45', 'HH24:MI'));
INSERT INTO info_pedido  (pedido, cupom, data_pedido, hora_pedido, data_previsao_entrega, hora_previsao_entrega) VALUES (101, 2, to_date('10/08/2023', 'dd/mm/yyyy'), to_date('00:15', 'HH24:MI'), to_date('10/08/2023', 'dd/mm/yyyy'), to_date('01:15', 'HH24:MI'));
INSERT INTO info_pedido  (pedido, cupom, data_pedido, hora_pedido, data_previsao_entrega, hora_previsao_entrega) VALUES (102, 3, to_date('10/08/2023', 'dd/mm/yyyy'), to_date('01:30', 'HH24:MI'), to_date('10/08/2023', 'dd/mm/yyyy'), to_date('02:45', 'HH24:MI'));
INSERT INTO info_pedido  (pedido, cupom, data_pedido, hora_pedido, data_previsao_entrega, hora_previsao_entrega) VALUES (103, 4, to_date('09/08/2023', 'dd/mm/yyyy'), to_date('22:30', 'HH24:MI'), to_date('09/08/2023', 'dd/mm/yyyy'), to_date('23:45', 'HH24:MI'));
INSERT INTO info_pedido  (pedido, cupom, data_pedido, hora_pedido, data_previsao_entrega, hora_previsao_entrega) VALUES (104, 5, to_date('09/08/2023', 'dd/mm/yyyy'), to_date('23:00', 'HH24:MI'), to_date('10/08/2023', 'dd/mm/yyyy'), to_date('00:20', 'HH24:MI'));

INSERT INTO itens (pedido, codigo_item, nome, quantidade, preco) VALUES (100, seq3.NEXTVAL, 'Duplo Cheddar', 1, 35);
INSERT INTO itens (pedido, codigo_item, nome, quantidade, preco) VALUES (101, seq3.NEXTVAL, 'Papas Fritas', 1, 15);
INSERT INTO itens (pedido, codigo_item, nome, quantidade, preco) VALUES (102, seq3.NEXTVAL, 'Sashimi', 10, 40);
INSERT INTO itens (pedido, codigo_item, nome, quantidade, preco) VALUES (103, seq3.NEXTVAL, 'Borda de pizza(fatia)', 5, 20);
INSERT INTO itens (pedido, codigo_item, nome, quantidade, preco) VALUES (104, seq3.NEXTVAL, 'Barata alioli', 4, 15);

INSERT INTO prepara (ID, cozinheiro, itens, pedido_fk, restaurante) VALUES (100, '049.550.500-50', 200, 100,'52.693.877/0001-09');
INSERT INTO prepara (ID, cozinheiro, itens, pedido_fk, restaurante) VALUES (101, '600.056.680-85', 201, 101,'86.206.681/0001-64');
INSERT INTO prepara (ID, cozinheiro, itens, pedido_fk, restaurante) VALUES (102, '639.330.890-77', 202, 102,'20.206.200/0001-64');
INSERT INTO prepara (ID, cozinheiro, itens, pedido_fk, restaurante) VALUES (103, '287.706.320-81', 203, 103,'92.878.639/0001-92');
INSERT INTO prepara (ID, cozinheiro, itens, pedido_fk, restaurante) VALUES (104, '001.178.450-43', 204, 104,'58.163.488/0001-58');
