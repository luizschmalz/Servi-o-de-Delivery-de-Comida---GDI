-- Populando as tabelas

-- Preenchendo a tabela de pessoas
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('776.833.020-07', 'Matheus Braga', 12345677));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('427.206.230-16', 'Luiz Eduardo', 88994422));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('935.839.570-24', 'Mader Gabriel', 67679292));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('536.639.350-78', 'Pedro Calheiros', 31322848));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('002.515.090-10', 'Henrique Melo', 31674346));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('449.558.940-70', 'Joao Victor Paranhos', 26967258));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('805.741.820-63', 'Luis Mendes', 38464688));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('367.615.290-50', 'Victor Porto', 34482567));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('049.550.500-50', 'Lucas Braga', 30862266));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('600.056.680-85', 'Marina Silva', 32118644));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('639.330.890-77', 'Beatriz Nunes', 32923573));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('287.706.320-81', 'Paolla Carocelli', 12345421));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('001.178.450-43', 'Henrique Fogaça', 12349087));
INSERT INTO tb_pessoa (CPF, nome, telefone)
VALUES (tb_pessoa('566.555.760-91', 'Jaquin', 89235676));



-- Preenchendo a tabela de restaurantes
INSERT INTO tb_restaurante (CNPJ, nome, num_tel, endereco)
VALUES ('52.693.877/0001-09', 'Stock burger', tp_telefone('11', '12345678'), tp_endereco('53020-070', 'Rua Alameda', 'Centro', 'Recife', 'Pe', '10'));

INSERT INTO tb_restaurante (CNPJ, nome, num_tel, endereco)
VALUES ('86.206.681/0001-64', 'Napoli pizza', tp_telefone('11', '87654321'), tp_endereco('68909-711', 'Rua das Flores', 'Parnamirim', 'Recife', 'PE', '11'));

INSERT INTO tb_restaurante (CNPJ, nome, num_tel, endereco)
VALUES ('20.206.200/0001-64', 'Nirai sushi', tp_telefone('11', '12348765'), tp_endereco('66640-215', 'Rua das Freiras', 'Boa Viagem', 'Recife', 'PE', '12'));

INSERT INTO tb_restaurante (CNPJ, nome, num_tel, endereco)
VALUES ('92.878.639/0001-92', 'Henrique Melo burger', tp_telefone('11', '45671238'), tp_endereco('52090-156', 'Rua das Pragas', 'Casa forte', 'Recife', 'PE', '21'));

INSERT INTO tb_restaurante (CNPJ, nome, num_tel, endereco)
VALUES ('58.163.488/0001-58', 'Taalin food', tp_telefone('11', '09871234'), tp_endereco('69313-281', 'Rua das Pestes', 'Espinheiro', 'Recife', 'PE', '5'));


-- Preenchendo a tabela de clientes
INSERT INTO tb_cliente (CPF, nome, email, endereco)
VALUES ('776.833.020-07', 'Maria Silva', 'mbb4@gmail.com', tp_endereco('59110-690', 'Rua do Amor Divino', 'Espinheiro', 'Recife', 'PE', 'apt 102'));
INSERT INTO tb_cliente (CPF, nome, email, endereco)
VALUES ('427.206.230-16', 'Maria Silva', 'lefvs@gmail.com', tp_endereco('60812-516', 'Rua Chico Buarque', 'Graças', 'Recife', 'PE', 'apt 101'));
INSERT INTO tb_cliente (CPF, nome, email, endereco)
VALUES ('935.839.570-24', 'Maria Silva', 'mgsb@gmail.com', tp_endereco('65058-498', 'Rua Principal', 'Bangu', 'Recife', 'PE', 'apt 502'));
INSERT INTO tb_cliente (CPF, nome, email, endereco)
VALUES ('536.639.350-78', 'Maria Silva', 'pca@gmail.com', tp_endereco('17602-132', 'Rua Coadjuvante', 'Hipodromo', 'Recife', 'PE', 'apt 305'));
INSERT INTO tb_cliente (CPF, nome, email, endereco)
VALUES ('002.515.090-10', 'Maria Silva', 'hcm@gmail.com', tp_endereco('69902-109', 'Rua Antagonista', 'Barro', 'Recife', 'PE', 'apt 865'));


-- Preenchendo a tabela de entregadores
INSERT INTO tb_entregador (CPF, nome, placa)
VALUES ('449.558.940-70', 'Joao Victor Paranhos', 'HTR-9225');

INSERT INTO tb_entregador (CPF, nome, placa)
VALUES ('805.741.820-63', 'Luis Mendes','AIJ-5162');

INSERT INTO tb_entregador (CPF, nome, placa)
VALUES ('367.615.290-50', 'Victor Porto','MZX-6138');


-- Preenchendo a tabela de cozinheiros
INSERT INTO tb_cozinheiro (CPF, nome, salario)
VALUES ('287.706.320-81', 'Paolla Carocelli', 7000);

INSERT INTO tb_cozinheiro (CPF, nome, salario)
VALUES ('001.178.450-43', 'Henrique Fogaça', 8500);

INSERT INTO tb_cozinheiro (CPF, nome, salario)
VALUES ('566.555.760-91', 'Jaquin', 10500);

INSERT INTO tb_cozinheiro (CPF, nome, salario)
VALUES ('049.550.500-50', 'Lucas Braga', 2000);

INSERT INTO tb_cozinheiro (CPF, nome, salario)
VALUES ('600.056.680-85', 'Marina Silva', 3000);

INSERT INTO tb_cozinheiro (CPF, nome, salario)
VALUES ('639.330.890-77', 'Beatriz Nunes', 2800);


-- Preenchendo a tabela de cupons
INSERT INTO tb_cupom (codigo, desconto)
VALUES ("0", 10);

INSERT INTO tb_cupom (codigo, desconto)
VALUES ("1", 5);

INSERT INTO tb_cupom (codigo, desconto)
VALUES ("2", 15);

INSERT INTO tb_cupom (codigo, desconto)
VALUES ("3", 10);

INSERT INTO tb_cupom (codigo, desconto)
VALUES ("4", 20);


-- Preenchendo a tabela de pedidos
INSERT INTO tb_pedido (ID, status_pedido, taxa_entrega, forma_pagamento, entregador)
VALUES (0, 'Pronto', 7, 'Pix', '449.558.940-70');

INSERT INTO tb_pedido (ID, status_pedido, taxa_entrega, forma_pagamento, entregador)
VALUES (1, 'Em espera do motoboy', 6, 'Débito', '449.558.940-70');

INSERT INTO tb_pedido (ID, status_pedido, taxa_entrega, forma_pagamento, entregador)
VALUES (2, 'A confirmar', 8, 'Pix', '805.741.820-63');

INSERT INTO tb_pedido (ID, status_pedido, taxa_entrega, forma_pagamento, entregador)
VALUES (3, 'Preparo', 5, 'Dinheiro', '367.615.290-50');

INSERT INTO tb_pedido (ID, status_pedido, taxa_entrega, forma_pagamento, entregador)
VALUES (4, 'Pronto', 7, 'Crédito', '805.741.820-63');

INSERT INTO tb_pedido (ID, status_pedido, taxa_entrega, forma_pagamento, entregador)
VALUES (1, 'Em andamento', 5.0, 'Cartão de crédito', '45678912301');

-- Preenchendo a tabela de informações de pedido
INSERT INTO tb_info_pedido (pedido, cupom, data_pedido, hora_pedido, data_previsao, hora_previsao)
VALUES (100, '0', SYSDATE, SYSTIMESTAMP, SYSDATE + 1, SYSTIMESTAMP + INTERVAL '1' HOUR);
INSERT INTO tb_info_pedido (pedido, cupom, data_pedido, hora_pedido, data_previsao, hora_previsao)
VALUES (101, '1', SYSDATE, SYSTIMESTAMP, SYSDATE + 1, SYSTIMESTAMP + INTERVAL '1' HOUR);
INSERT INTO tb_info_pedido (pedido, cupom, data_pedido, hora_pedido, data_previsao, hora_previsao)
VALUES (102, '2', SYSDATE, SYSTIMESTAMP, SYSDATE + 1, SYSTIMESTAMP + INTERVAL '1' HOUR);
INSERT INTO tb_info_pedido (pedido, cupom, data_pedido, hora_pedido, data_previsao, hora_previsao)
VALUES (103, '3', SYSDATE, SYSTIMESTAMP, SYSDATE + 1, SYSTIMESTAMP + INTERVAL '1' HOUR);
INSERT INTO tb_info_pedido (pedido, cupom, data_pedido, hora_pedido, data_previsao, hora_previsao)
VALUES (104, '4', SYSDATE, SYSTIMESTAMP, SYSDATE + 1, SYSTIMESTAMP + INTERVAL '1' HOUR);

-- Preenchendo a tabela de itens
INSERT INTO tb_itens (codigo_item, nome, quantidade, preco) VALUES (100, 'Duplo Cheddar', 1, 35);

INSERT INTO tb_itens (codigo_item, nome, quantidade, preco) VALUES (101, 'Papas Fritas', 1, 15);

INSERT INTO tb_itens (codigo_item, nome, quantidade, preco) VALUES (102, 'Sashimi', 10, 40);

INSERT INTO tb_itens (codigo_item, nome, quantidade, preco) VALUES (103, 'Borda de pizza(fatia)', 5, 20);

INSERT INTO tb_itens (codigo_item, nome, quantidade, preco) VALUES (104, 'Barata alioli', 4, 15);

-- Preenchendo a tabela de preparações
INSERT INTO tb_prepara (cozinheiro, itens, restaurante) VALUES ('049.550.500-50', 100, '52.693.877/0001-09');
INSERT INTO tb_prepara (cozinheiro, itens, restaurante) VALUES ('600.056.680-85', 101, '86.206.681/0001-64');
INSERT INTO tb_prepara (cozinheiro, itens, restaurante) VALUES ('639.330.890-77', 102, '20.206.200/0001-64');
INSERT INTO tb_prepara (cozinheiro, itens, restaurante) VALUES ('287.706.320-81', 103, '92.878.639/0001-92');
INSERT INTO tb_prepara (cozinheiro, itens, restaurante) VALUES ('001.178.450-43', 104, '58.163.488/0001-58');