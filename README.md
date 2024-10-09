# Super Mercado OMCorp (SMO)

## Descrição

O projeto "Super Mercado OMCorp (SMO)" tem como objetivo o desenvolvimento de um sistema de gerenciamento para um supermercado, utilizando tanto bancos de dados relacionais quanto não relacionais. O sistema visa facilitar a administração das informações de clientes, produtos, funcionários e demais operações do supermercado, proporcionando uma interface eficiente e organizada.

## Equipe

| Nome                        | RM     |
| --------------------------- | ------ |
| Gabriel Eringer de Oliveira | 99632  |
| André Sant'Ana Boim         | 551575 |
| Marcelo Hespanhol Dias      | 98251  |

## Estrutura do Banco de Dados

A estrutura do banco de dados é composta por diversas tabelas, cada uma desempenhando um papel fundamental na organização das informações:

**T_SMO_PESSOA:** Armazena dados gerais das pessoas relacionadas ao supermercado, incluindo clientes e funcionários. Campos como nome, email e telefone são essenciais para o contato.

**T_SMO_CLIENTE:** Esta tabela relaciona-se à tabela de pessoas, especificamente para clientes, armazenando informações de login, como username e password.

**T_SMO_FUNCIONARIO:** Armazena informações sobre os funcionários, vinculando-os às suas respectivas identidades na tabela de pessoas, e incluindo dados sobre cargos e datas de entrada/saída.

**T_SMO_FUNCIONARIO_CARGO:** Define os cargos disponíveis no supermercado, com informações sobre salário e descrição das funções.

**T_SMO_PRODUTO:** Contém todos os produtos disponíveis no supermercado, incluindo informações como preço, estoque, descrição, modelo e categoria.

**T_SMO_PRODUTO_MARCA:** Registra as marcas dos produtos, permitindo uma melhor organização e busca por marca.

**T_SMO_PRODUTO_MODELO:** Relaciona-se às marcas, armazenando informações sobre diferentes modelos de produtos.

**T_SMO_PRODUTO_DEPARTAMENTO:** Organiza os produtos em departamentos específicos dentro do supermercado, facilitando a navegação e o gerenciamento de categorias.

**T_SMO_PRODUTO_CATEGORIA:** Permite uma classificação mais detalhada dos produtos dentro de cada departamento.
