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
| Ordem_Manutencao | prioridade | varchar | 100 | Nível de prioridade (ex: Alta, Média, Baixa) |
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
| Manutencao | id_tecnico | int |  |Identificador da ordem de técnico, FK referenciando tecnico(id) |
| Manutencao | descricao_servico | varchar | 100 | Descrição do serviço executado pelo técnico |
| Manutencao | data_execucao | date |  | Data em que a manutenção foi executada |
| Manutencao | horas_trabalhadas | time |  | Total de horas trabalhadas no serviço |
| Manutencao | observacoes | text |  | Observações gerais sobre a execução do serviço |
| Peca_Manutencao | id | int |  | Identificador, PK |
| Peca_Manutencao | id_manutencao | int |  | Identificador da manutenção, FK referenciando manutencao(id) |
| Peca_Manutencao | id_peca | int |  | Identificador da peça, FK referenciando peca(id) |
| Peca_Manutencao | quantidade | int |  | Quantidade da peça utilizada na manutenção |
