use manutencao_equipamentos;
insert into equipamento (nome, tipo, marca, modelo, numero_serie, data_aquisicao, status, setor, valor_da_aquisicao) values
('Controle de Play Station 5', 'Controle', 'Play Station', 'DualSense', 'G11A01M103427954B', '2026-07-21', 'ATIVO', 'Testes', 450.00),
('Empilhadeira Elétrica', 'Maquinário', 'Toyota', '8FBN25', 'EP20260981X', '2023-03-15', 'ATIVO', 'Logística', 85000.00),
('Torno CNC', 'Usinagem', 'Romi', 'Centur 30D', 'TRM9928172', '2021-11-02', 'ATIVO', 'Produção', 120000.00),
('Controle Remoto', 'Controle', 'LG', 'SolarCell Remote', 'CMP881203', '2022-05-10', 'ATIVO', 'Manutenção', 73.00);

insert into tecnico (nome, especialidade, telefone, email) values
('Carlos Eduardo Silva', 'Mecânica Industrial', '19998765432', 'carlos.silva@empresa.com'),
('Mariana Rocha', 'Eletroeletrônica', '19987654321', 'mariana.rocha@empresa.com'),
('Lucas Mendes', 'Técnico em Eletrônica', '19976543210', 'lucas.mendes@empresa.com');

insert into peca (nome, descricao, quantidade_estoque, estoque_minimo, preco) values
('Módulo Analógico PS5', 'Componente para reparo de drift no controle', 25, 5, 35.00),
('Óleo Lubrificante ISO VG 68', 'Galão de 5L para sistemas hidráulicos', 12, 3, 150.00),
('Correia de Transmissão', 'Correia dentada em borracha reforçada', 8, 2, 85.50),
('LED emissor infravermelho', 'LED que faz a emissão do infravermelho', 15, 4, 15.00);

insert into ordem_manutencao (id_equipamento, tipo, descricao, data_abertura, data_inicio, data_fim, status, prioridade) values
(1, 'Corretiva', 'Troca de analógico com drift', '2026-08-01', '2026-08-01', '2026-08-02', 'INATIVO', 'Média'),
(2, 'Preventiva', 'Revisão periódica de 1000 horas', '2026-08-10', '2026-08-11', '2026-08-11', 'INATIVO', 'Alta'),
(3, 'Corretiva', 'Ajuste e troca de correia de transmissão', '2026-09-01', '2026-09-02', '2026-09-03', 'ATIVO', 'Urgente'),
(4, 'Corretiva', 'Troca do LED emissor', '2026-09-15', '2026-09-15', '2026-09-15', 'INATIVO', 'Baixa');

insert into manutencao (id_ordem, id_tecnico, descricao_servico, data_execucao, horas_trabalhadas, observacoes) values
(1, 3, 'Substituição do analógico esquerdo e limpeza interna.', '2026-08-01', '01:30:00', 'Equipamento testado e validado.'),
(2, 1, 'Troca de óleo hidráulico e lubrificação geral das engrenagens.', '2026-08-11', '04:00:00', 'Nenhuma irregularidade encontrada.'),
(3, 2, 'Substituição da correia gasta e alinhamento do eixo.', '2026-09-02', '03:15:00', 'Recomenda-se nova verificação em 30 dias.'),
(4, 3, 'Substituição do Emissor de LED do controle Remoto.', '2026-09-15', '01:10:00', 'A troca foi bem sucedida e não houve nenhum ocorrido durante o processo.');

insert into peca_manutencao (id_manutencao, id_peca, quantidade) values
(1,1,1),
(2,2,1),
(3,3,1),
(4,4,1);



select * from equipamento;
select * from tecnico;
select * from peca;
select * from ordem_manutencao;
select * from manutencao;
select * from peca_manutencao;
