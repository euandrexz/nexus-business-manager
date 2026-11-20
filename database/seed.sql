-- Seed inicial do projeto Nexus Business Manager

INSERT INTO clientes (nome, email, telefone, cpf_cnpj, endereco) VALUES
('Andre Luiz', 'andre@email.com', '11999999999', '123.456.789-00', 'Rua das Flores, 123 - Sao Paulo/SP'),
('Maria Silva', 'maria@email.com', '11988888888', '987.654.321-00', 'Av. Brasil, 456 - Rio de Janeiro/RJ'),
('Carlos Souza', 'carlos@email.com', '11977777777', '111.222.333-44', 'Rua A, 100 - Belo Horizonte/MG'),
('Fernanda Lima', 'fernanda@email.com', '11966666666', '555.666.777-88', 'Rua B, 200 - Curitiba/PR'),
('Lucas Pereira', 'lucas@email.com', '11955555555', '999.888.777-66', 'Rua C, 300 - Porto Alegre/RS');

INSERT INTO produtos (nome, descricao, preco, estoque, categoria, ativo) VALUES
('Notebook Dell Inspiron', 'Notebook com Intel i5, 16GB RAM e SSD 512GB', 3500.00, 10, 'Informatica', TRUE),
('Mouse Gamer RGB', 'Mouse com 7200 DPI e iluminacao RGB', 150.00, 30, 'Perifericos', TRUE),
('Teclado Mecanico ABNT2', 'Teclado mecanico com switch blue', 280.00, 20, 'Perifericos', TRUE),
('Monitor 24 Polegadas', 'Monitor Full HD com painel IPS', 899.90, 12, 'Monitores', TRUE),
('Headset USB', 'Headset com microfone para reunioes e jogos', 199.90, 25, 'Audio', TRUE),
('Cadeira Escritorio', 'Cadeira ergonomica com ajuste de altura', 650.00, 8, 'Moveis', TRUE);

INSERT INTO servicos (nome, descricao, preco, ativo) VALUES
('Formatacao de Computador', 'Formatacao completa com backup e instalacao de sistema', 120.00, TRUE),
('Manutencao Preventiva', 'Limpeza interna e revisao geral do equipamento', 180.00, TRUE),
('Instalacao de Software', 'Instalacao e configuracao de programas', 80.00, TRUE),
('Suporte Tecnico Remoto', 'Atendimento remoto para solucao de problemas', 100.00, TRUE);

INSERT INTO vendas (cliente_id, data_venda, valor_total, status) VALUES
(1, '2026-11-01 10:30:00', 3650.00, 'CONCLUIDA'),
(2, '2026-11-03 14:15:00', 1179.90, 'CONCLUIDA'),
(3, '2026-11-05 09:00:00', 430.00, 'PENDENTE'),
(1, '2026-11-08 16:20:00', 899.90, 'CONCLUIDA'),
(4, '2026-11-10 11:45:00', 650.00, 'CANCELADA'),
(5, '2026-11-12 13:10:00', 349.90, 'CONCLUIDA');

INSERT INTO itens_venda (venda_id, produto_id, quantidade, preco_unitario, subtotal) VALUES
(1, 1, 1, 3500.00, 3500.00),
(1, 2, 1, 150.00, 150.00),

(2, 4, 1, 899.90, 899.90),
(2, 5, 1, 199.90, 199.90),
(2, 2, 1, 80.10, 80.10),

(3, 2, 1, 150.00, 150.00),
(3, 3, 1, 280.00, 280.00),

(4, 4, 1, 899.90, 899.90),

(5, 6, 1, 650.00, 650.00),

(6, 2, 1, 150.00, 150.00),
(6, 5, 1, 199.90, 199.90);