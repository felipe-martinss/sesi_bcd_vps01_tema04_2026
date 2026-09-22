# Aula07 - VPF01 Manutenção de equipamentos
Um banco de dados de manutenção de equipamentos em uma fábrica, onde o objetivo é controlar os equipamentos, seu histórico de manutenção, os técnicos responsáveis, peças utilizadas e as ordens de serviço.
## Dicionário de dados

| Entidade | Atributo | Tipo | Tamanho | Descrição |
| --- | --- | --- | --- | --- |
| Equipamento | id | int |  | Identificador, PK |
| Equipamento | nome | varchar | 100 | Nome do equipamento ou máquina |
| Equipamento | tipo | varchar | 100 | Categoria ou tipo do equipamento |
| Equipamento | marca | varchar | 100 | Marca fabricante do equipamento |
| Equipamento | modelo | varchar | 100 | Modelo do equipamento |
| Equipamento | numero_serie | varchar | 100 | Número de série do equipamento |
| Equipamento | data_aquisicao | date |  | Data em que o equipamento foi adquirido |
| Equipamento | status | enum |  | Status do equipamento ('ATIVO' ou 'INATIVO') |
| Equipamento | setor | varchar | 100 | Setor onde o equipamento está |
| Equipamento | valor_da_aquisicao | decimal | 10,2 | Valor de compra do equipamento |
| Ordem_Manutencao | id | int |  |Identificador, PK |
| Ordem_Manutencao | id_equipamento | int |  |Identificador do equipamento, FK referenciando equipamento(id) |
| Ordem_Manutencao | tipo | varchar | 100 | Tipo de manutenção (ex: Preventiva, Corretiva) |
| Ordem_Manutencao | descricao | varchar | 100 | Breve descrição da ordem de manutenção |
| Ordem_Manutencao | data_abertura | date |  | Data de abertura da ordem de manutenção |
| Ordem_Manutencao | data_inicio | date |  | Data prevista ou real de início da manutenção |
| Ordem_Manutencao | data_fim | date |  | Data prevista ou real de término da manutenção |
| Ordem_Manutencao | status | enum |  | Status da ordem ('ATIVO' ou 'INATIVO') |
| Ordem_Manutencao | prioridade | varchar | 100 | Nível de prioridade (ex: Urgente, Alta, Média, Baixa) |
| Tecnico | id | int |  | Identificador, PK |
| Tecnico | nome | varchar | 100 | Nome completo do técnico |
| Tecnico | especialidade | varchar | 100 | Especialidade técnica do profissional |
| Tecnico | telefone | varchar | 20 | Telefone de contato do técnico |
| Tecnico | email | varchar | 100 | E-mail de contato do técnico |
| Peca | id | int |  | Identificador, PK |
| Peca | nome | varchar | 100 | Nome da peça ou componente |
| Peca | descricao | varchar | 100 | Descrição detalhada da peça |
| Peca | quantidade_estoque | int |  | Quantidade atual disponível em estoque |
| Peca | estoque_minimo | int |  | Quantidade mínima aceitável no estoque |
| Peca | preco | decimal | 10,2 | Preço unitário da peça |
| Manutencao | id | int |  | Identificador, PK |
| Manutencao | id_ordem | int |  | Identificador da ordem de manutenção, FK referenciando ordem_manutencao(id) |
| Manutencao | id_tecnico | int |  |Identificador do técnico, FK referenciando tecnico(id) |
| Manutencao | descricao_servico | varchar | 100 | Descrição do serviço executado pelo técnico |
| Manutencao | data_execucao | date |  | Data em que a manutenção foi executada |
| Manutencao | horas_trabalhadas | time |  | Total de horas trabalhadas no serviço |
| Manutencao | observacoes | text |  | Observações gerais sobre a execução do serviço |
| Peca_Manutencao | id | int |  | Identificador, PK |
| Peca_Manutencao | id_manutencao | int |  | Identificador da manutenção, FK referenciando manutencao(id) |
| Peca_Manutencao | id_peca | int |  | Identificador da peça, FK referenciando peca(id) |
| Peca_Manutencao | quantidade | int |  | Quantidade da peça utilizada na manutenção |

## MER e DER
<div align="left">
  <br><br/>
  <img src="MER DER Conceitual.drawio.png" alt="image" width="1200" </a>
  <img src="MER DER Lógico.drawio.png" alt="image" width="1200"
  </a>

## Dados de teste em CSV
<p align="left"><a href="equipamento.csv">equipamento.csv</a></p>
<p align="left"><a href="ordem_manutencao.csv">ordem_manutencao.csv</a></p>
<p align="left"><a href="tecnico.csv">tecnico.csv</a></p>
<p align="left"><a href="peca.csv">peca.csv</a></p>
<p align="left"><a href="manutencao.csv">manutencao.csv</a></p>
<p align="left"><a href="peca_manutencao.csv">peca_manutencao.csv</a></p>

## Script SQL DDL (Desenvolvimanto: Criação do Banco de dados)
```sql
drop database if exists manutencao_equipamentos;

create database manutencao_equipamentos;

use manutencao_equipamentos;

create table equipamento(
    id int primary key not null auto_increment,
    nome varchar(100) not null, 
    tipo varchar(100) not null,
    marca varchar(100) not null,
    modelo varchar(100) not null,
    numero_serie varchar(100) not null,
    data_aquisicao date not null,
    status enum('ATIVO','INATIVO'),
    setor varchar(100) not null,
    valor_da_aquisicao decimal(10, 2) not null
);

create table ordem_manutencao(
    id int primary key not null auto_increment,
    id_equipamento int not null,
    tipo varchar(100) not null,
    descricao varchar(100) not null,
    data_abertura date not null, 
    data_inicio date not null,
    data_fim date not null,
    status enum('ATIVO', 'INATIVO'), 
    prioridade varchar(100) not null
);

create table tecnico(
    id int primary key not null auto_increment,
    nome varchar(100) not null,
    especialidade varchar(100) not null,
    telefone varchar(20) not null,
    email varchar(100) not null
);

create table peca(
    id int primary key not null auto_increment, 
    nome varchar(100) not null,
    descricao varchar(100) not null,
    quantidade_estoque int not null,
    estoque_minimo int not null,
    preco decimal (10, 2) not null
);

create table manutencao(
    id int primary key not null auto_increment,
    id_ordem int not null,
    id_tecnico int not null, 
    descricao_servico varchar(100) not null, 
    data_execucao date not null, 
    horas_trabalhadas time not null, 
    observacoes text
);

create table peca_manutencao(
    id int primary key not null auto_increment,
    id_manutencao int not null, 
    id_peca int not null,
    quantidade int not null
);

alter table ordem_manutencao add constraint causa foreign key (id_equipamento) references equipamento(id);
alter table manutencao add constraint possui foreign key (id_ordem) references ordem_manutencao(id);
alter table manutencao add constraint faz foreign key (id_tecnico) references tecnico(id);
alter table peca_manutencao add constraint utiliza foreign key (id_manutencao) references manutencao(id);
alter table peca_manutencao add constraint seleciona foreign key (id_peca) references peca(id);

show tables;
describe equipamento;
describe ordem_manutencao;
describe tecnico;
describe peca;
describe manutencao;
describe peca_manutencao;
```
## Script SQL DML (Manipulação: População com dados de teste)
```sql
use manutencao_equipamentos;
insert into equipamento (nome, tipo, marca, modelo, numero_serie, data_aquisicao, status, setor, valor_da_aquisicao) values
('Controle de Play Station 5', 'Controle', 'Play Station', 'DualSense', 'G11A01M103427954B', '2026-07-21', 'ATIVO', 'Testes', 450.00),
('Empilhadeira Elétrica', 'Maquinário', 'Toyota', '8FBN25', 'EP20260981X', '2023-03-15', 'ATIVO', 'Logística', 85000.00),
('Torno CNC', 'Usinagem', 'Romi', 'Centur 30D', 'TRM9928172', '2021-11-02', 'ATIVO', 'Produção', 120000.00),
('Controle Remoto', 'Controle', 'LG', 'SolarCell Remote', 'CMP881203', '2022-05-10', 'INATIVO', 'Manutenção', 73.00);

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
(4, 'Corretiva', 'Troca do LED emissor', '2026-09-15', '2026-06-15', '2026-06-15', 'INATIVO', 'Baixa');

insert into manutencao (id_ordem, id_tecnico, descricao_servico, data_execucao, horas_trabalhadas, observacoes) values
(1, 3, 'Substituição do analógico esquerdo e limpeza interna.', '2026-08-01', '01:30:00', 'Equipamento testado e validado.'),
(2, 1, 'Troca de óleo hidráulico e lubrificação geral das engrenagens.', '2026-08-11', '04:00:00', 'Nenhuma irregularidade encontrada.'),
(3, 2, 'Substituição da correia gasta e alinhamento do eixo.', '2026-09-02', '03:15:00', 'Recomenda-se nova verificação em 30 dias.'),
(4, 3, 'Substituição do Emissor de LED do controle Remoto.', '2026-09-15', '1:10:00', 'A troca foi bem sucedida e não houve nenhum ocorrido durante o processo.');

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
```
