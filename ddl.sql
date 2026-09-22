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