-- 2TDSPH-2024
-- Integrantes do grupo:
-- 1. Gabriel Eringer de Oliveira - RM99632
-- 2. Andre Sant'Ana Boim - RM551575
-- 3. Marcelo Hespanhol Dias - RM98251

-----------------------------------------------------------------------------------------------------------

-- Apagando as tabelas (a ordem eh importante devido as foreign keys)
DROP TABLE T_SMO_PRODUTO_AVALIACAO CASCADE CONSTRAINTS;
DROP TABLE T_SMO_PRODUTO CASCADE CONSTRAINTS;
DROP TABLE T_SMO_PRODUTO_CATEGORIA CASCADE CONSTRAINTS;
DROP TABLE T_SMO_PRODUTO_DEPARTAMENTO CASCADE CONSTRAINTS;
DROP TABLE T_SMO_PRODUTO_MODELO CASCADE CONSTRAINTS;
DROP TABLE T_SMO_PRODUTO_MARCA CASCADE CONSTRAINTS;
DROP TABLE T_SMO_FUNCIONARIO CASCADE CONSTRAINTS;
DROP TABLE T_SMO_FUNCIONARIO_CARGO CASCADE CONSTRAINTS;
DROP TABLE T_SMO_CLIENTE CASCADE CONSTRAINTS;
DROP TABLE T_SMO_PESSOA CASCADE CONSTRAINTS;

-----------------------------------------------------------------------------------------------------------
-- Criando as tabelas

CREATE TABLE T_SMO_PESSOA (
    id_pessoa NUMBER PRIMARY KEY,
    nome VARCHAR2(255) NOT NULL,
    email VARCHAR2(255) NOT NULL,
    telefone VARCHAR2(20),
    data_nascimento DATE,
    genero CHAR(1) -- M ou F
    -- TODO: CEP
);

CREATE TABLE T_SMO_CLIENTE (
    id_cliente NUMBER PRIMARY KEY,
    id_pessoa NUMBER,   
    username VARCHAR2(50) NOT NULL,
    senha VARCHAR2(50) NOT NULL,
    FOREIGN KEY (id_pessoa) REFERENCES T_SMO_PESSOA(id_pessoa)
);

CREATE TABLE T_SMO_PRODUTO_DEPARTAMENTO (
    id_departamento NUMBER PRIMARY KEY,
    nome VARCHAR2(255) NOT NULL,
    descricao VARCHAR2(255) -- TODO: Talvez aumentar este n?mero
);

CREATE TABLE T_SMO_FUNCIONARIO_CARGO (
    id_cargo NUMBER PRIMARY KEY,
    nome VARCHAR2(255) NOT NULL,
    salario_mensal NUMBER(10, 2) NOT NULL,
    descricao VARCHAR2(255) -- TODO: Talvez aumentar este n?mero
);

CREATE TABLE T_SMO_FUNCIONARIO (
    id_funcionario NUMBER PRIMARY KEY,
    id_pessoa NUMBER,
    id_cargo NUMBER,
    data_entrada DATE NOT NULL,
    data_saida DATE,
    FOREIGN KEY (id_pessoa) REFERENCES T_SMO_PESSOA(id_pessoa),
    FOREIGN KEY (id_cargo) REFERENCES T_SMO_FUNCIONARIO_CARGO(id_cargo)
);

CREATE TABLE T_SMO_PRODUTO_MARCA (
    id_marca NUMBER PRIMARY KEY,
    nome VARCHAR2(255) NOT NULL,
    descricao VARCHAR2(255) -- TODO: Talvez aumentar este n?mero
);

CREATE TABLE T_SMO_PRODUTO_MODELO (
    id_modelo NUMBER PRIMARY KEY,
    id_marca NUMBER,
    nome VARCHAR2(255),
    FOREIGN KEY (id_marca) REFERENCES T_SMO_PRODUTO_MARCA(id_marca)
);

CREATE TABLE T_SMO_PRODUTO_CATEGORIA (
    id_categoria NUMBER PRIMARY KEY,
    id_departamento NUMBER,
    nome VARCHAR2(255),
    descricao VARCHAR2(255), -- TODO: Talvez aumentar este n?mero
    FOREIGN KEY (id_departamento) REFERENCES T_SMO_PRODUTO_DEPARTAMENTO(id_departamento)
);

CREATE TABLE T_SMO_PRODUTO (
    id_produto NUMBER PRIMARY KEY,
    id_categoria NUMBER,
    id_modelo NUMBER,
    nome VARCHAR2(255) NOT NULL,
    preco NUMBER(10, 2) NOT NULL,
    estoque NUMBER NOT NULL,
    descricao VARCHAR2(255) NOT NULL, -- TODO: Talvez aumentar este n?mero
    FOREIGN KEY (id_categoria) REFERENCES T_SMO_PRODUTO_CATEGORIA(id_categoria),
    FOREIGN KEY (id_modelo) REFERENCES T_SMO_PRODUTO_MODELO(id_modelo)
);

CREATE TABLE T_SMO_PRODUTO_AVALIACAO (
    id_avaliacao NUMBER PRIMARY KEY,
    id_produto NUMBER,
    id_cliente NUMBER,
    estrelas NUMBER NOT NULL,
    comentario VARCHAR2(255),
    FOREIGN KEY (id_produto) REFERENCES T_SMO_PRODUTO(id_produto),
    FOREIGN KEY (id_cliente) REFERENCES T_SMO_CLIENTE(id_cliente)
);


-----------------------------------------------------------------------------------------------------------
-- Inserindo dados nas tabelas

-- Inserindo pessoas na tabela
INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (1, 'Joao Silva', 'joao.silva@example.com', '11987654321', TO_DATE('1980-01-15', 'YYYY-MM-DD'), 'M');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (2, 'Maria Oliveira', 'maria.oliveira@example.com', '11987654322', TO_DATE('1990-02-20', 'YYYY-MM-DD'), 'F');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (3, 'Carlos Souza',  'carlos.souza@example.com', '11987654323', TO_DATE('1985-03-25', 'YYYY-MM-DD'), 'M');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (4, 'Ana Pereira', 'ana.pereira@example.com', '11987654324', TO_DATE('1995-04-30', 'YYYY-MM-DD'), 'F');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (5, 'Pedro Santos', 'pedro.santos@example.com', '11987654325', TO_DATE('2000-05-05', 'YYYY-MM-DD'), 'M');
    
    
INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (6, 'Matheus Pereira', 'mat.pereira@example.com', '11987654321', TO_DATE('1995-01-08', 'YYYY-MM-DD'), 'M');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (7, 'Maria da Silva', 'maria.silva@example.com', '11987654322', TO_DATE('2002-06-28', 'YYYY-MM-DD'), 'F');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (8, 'Roberto Barros',  'robbarros@example.com', '11987654323', TO_DATE('1982-03-25', 'YYYY-MM-DD'), 'M');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (9, 'Claudiana Alves', 'claud.alves@example.com', '11987654324', TO_DATE('2002-08-27', 'YYYY-MM-DD'), 'F');

INSERT INTO T_SMO_PESSOA (id_pessoa, nome, email, telefone, data_nascimento, genero)
    VALUES (10, 'Pedro Edinaldo', 'pedro.ed@example.com', '11987654325', TO_DATE('2000-05-06', 'YYYY-MM-DD'), 'M');

-- Inserindo departamentos de produto na tabela
INSERT INTO T_SMO_PRODUTO_DEPARTAMENTO (id_departamento, nome)
    VALUES (1, 'AR_E_VENTILACAO');
    
INSERT INTO T_SMO_PRODUTO_DEPARTAMENTO (id_departamento, nome)
    VALUES (2, 'TELEFONIA');
    
INSERT INTO T_SMO_PRODUTO_DEPARTAMENTO (id_departamento, nome)
    VALUES (3, 'TVS_E_AUDIO');
    
INSERT INTO T_SMO_PRODUTO_DEPARTAMENTO (id_departamento, nome)
    VALUES (4, 'INFORMATICA');
    
INSERT INTO T_SMO_PRODUTO_DEPARTAMENTO (id_departamento, nome)
    VALUES (5, 'ELETRODOMESTICOS');

-- Inserindo cargos de funcionario na tabela
INSERT INTO T_SMO_FUNCIONARIO_CARGO (id_cargo, nome, salario_mensal)
    VALUES (1, 'GERENTE', 50000.00);

INSERT INTO T_SMO_FUNCIONARIO_CARGO (id_cargo, nome, salario_mensal)
    VALUES (2, 'ANALISTA', 4500.00);

INSERT INTO T_SMO_FUNCIONARIO_CARGO (id_cargo, nome, salario_mensal)
    VALUES (3, 'DESENVOLVEDOR', 8500.00);

INSERT INTO T_SMO_FUNCIONARIO_CARGO (id_cargo, nome, salario_mensal)
    VALUES (4, 'ASSISTENTE', 2800.00);

INSERT INTO T_SMO_FUNCIONARIO_CARGO (id_cargo, nome, salario_mensal)
    VALUES (5, 'ESTAGIARIO', 2100.00);

-- Inserindo funcionarios na tabela
INSERT INTO T_SMO_FUNCIONARIO (id_funcionario, id_pessoa, id_cargo, data_entrada, data_saida)
    VALUES (1, 1, 1, TO_DATE('2010-01-01', 'YYYY-MM-DD'), NULL);

INSERT INTO T_SMO_FUNCIONARIO (id_funcionario, id_pessoa, id_cargo, data_entrada, data_saida)
    VALUES (2, 2, 2, TO_DATE('2015-02-01', 'YYYY-MM-DD'), NULL);

INSERT INTO T_SMO_FUNCIONARIO (id_funcionario, id_pessoa, id_cargo, data_entrada, data_saida)
    VALUES (3, 3, 3, TO_DATE('2020-03-01', 'YYYY-MM-DD'), NULL);

INSERT INTO T_SMO_FUNCIONARIO (id_funcionario, id_pessoa, id_cargo, data_entrada, data_saida)
    VALUES (4, 4, 4, TO_DATE('2018-04-01', 'YYYY-MM-DD'), NULL);

INSERT INTO T_SMO_FUNCIONARIO (id_funcionario, id_pessoa, id_cargo, data_entrada, data_saida)
    VALUES (5, 5, 5, TO_DATE('2021-05-01', 'YYYY-MM-DD'), NULL);

-- Inserindo clientes na tabela
INSERT INTO T_SMO_CLIENTE (id_cliente, id_pessoa, username, senha)
    VALUES (1, 6, 'mateus_pereira', 'senha123');
    
INSERT INTO T_SMO_CLIENTE (id_cliente, id_pessoa, username, senha)
    VALUES (2, 7, '@mariasilva', 'senha123');
    
INSERT INTO T_SMO_CLIENTE (id_cliente, id_pessoa, username, senha)
    VALUES (3, 8, 'elRoberto_Barros', 'senha123');
    
INSERT INTO T_SMO_CLIENTE (id_cliente, id_pessoa, username, senha)
    VALUES (4, 9, 'Claudiana.Alves', 'senha123');
    
INSERT INTO T_SMO_CLIENTE (id_cliente, id_pessoa, username, senha)
    VALUES (5, 10, 'PedroEdin', 'senha123');

-- Inserindo marcas de produto na tabela
INSERT INTO T_SMO_PRODUTO_MARCA (id_marca, nome)
    VALUES (1, 'Mondial');

INSERT INTO T_SMO_PRODUTO_MARCA (id_marca, nome)
    VALUES (2, 'Motorola');

INSERT INTO T_SMO_PRODUTO_MARCA (id_marca, nome)
    VALUES (3, 'androidtv');

INSERT INTO T_SMO_PRODUTO_MARCA (id_marca, nome)
    VALUES (4, 'Dell');

INSERT INTO T_SMO_PRODUTO_MARCA (id_marca, nome)
    VALUES (5, 'Consul');

-- Inserindo modelos de produto na tabela
INSERT INTO T_SMO_PRODUTO_MODELO (id_modelo, id_marca, nome)
    VALUES (1, 1, 'Super Power');

INSERT INTO T_SMO_PRODUTO_MODELO (id_modelo, id_marca, nome)
    VALUES (2, 2,'Edge 50 Fusion');

INSERT INTO T_SMO_PRODUTO_MODELO (id_modelo, id_marca, nome)
    VALUES (3, 3,'Smart TV');

INSERT INTO T_SMO_PRODUTO_MODELO (id_modelo, id_marca, nome)
    VALUES (4, 4,'Inspiron 15');

INSERT INTO T_SMO_PRODUTO_MODELO (id_modelo, id_marca, nome)
    VALUES (5, 5,'Inox');

-- Inserindo categoria de produto na tabela
INSERT INTO T_SMO_PRODUTO_CATEGORIA (id_categoria, id_departamento, nome)
    VALUES (1, 1, 'VENTILADORES_E_CIRCULADORES');

INSERT INTO T_SMO_PRODUTO_CATEGORIA (id_categoria, id_departamento, nome)
    VALUES (2, 2, 'SMARTPHONES');

INSERT INTO T_SMO_PRODUTO_CATEGORIA (id_categoria, id_departamento, nome)
    VALUES (3, 3, 'TELEVISORES');

INSERT INTO T_SMO_PRODUTO_CATEGORIA (id_categoria, id_departamento, nome)
    VALUES (4, 4, 'NOTEBOOKS');

INSERT INTO T_SMO_PRODUTO_CATEGORIA (id_categoria, id_departamento, nome)
    VALUES (5, 5, 'FOGOES');

-- Inserindo produtos na tabela
INSERT INTO T_SMO_PRODUTO (id_produto, id_categoria, id_modelo, nome, preco, estoque, descricao)
    VALUES (1, 1, 1, 'Ventilador de Coluna 40cm Mondial Super Power VSP40C 6 Pás 3 Velocidades - Preto/Prata', 259.00, 50, 'Fogão Consul 4 Bocas CFO4NAR com Mesa de Inox, Acendimento Automático e Design Frente Única Bivolt - Inox');
    
INSERT INTO T_SMO_PRODUTO (id_produto, id_categoria, id_modelo, nome, preco, estoque, descricao)
    VALUES (2, 2, 2, 'Smartphone Motorola Edge 50 Fusion 5G Blue Teal com Snapdragon, 256GB, Sony AI Camera, 8GB RAM + 8GB RAM Boost, Tela 6.7", IP68 e NFC', 2249.10, 50, 'Fogão Consul 4 Bocas CFO4NAR com Mesa de Inox, Acendimento Automático e Design Frente Única Bivolt - Inox');
    
INSERT INTO T_SMO_PRODUTO (id_produto, id_categoria, id_modelo, nome, preco, estoque, descricao)
    VALUES (3, 3, 3, 'Smart TV 32" Aiwa HD AWS-TV-32-BL-02-A Android, Comando de Voz, Dolby Audio, HDR10, Borda Ultrafina', 1019.90, 50, 'Fogão Consul 4 Bocas CFO4NAR com Mesa de Inox, Acendimento Automático e Design Frente Única Bivolt - Inox');
    
INSERT INTO T_SMO_PRODUTO (id_produto, id_categoria, id_modelo, nome, preco, estoque, descricao)
    VALUES (4, 4, 4, 'Notebook Dell Inspiron 15 com processador Intel Core i5 de 12° Geração, 8GB RAM, 512GB SSD, Tela Full HD 15,6" e Windows 11 - I120K-A25P', 2986.20, 50, 'Fogão Consul 4 Bocas CFO4NAR com Mesa de Inox, Acendimento Automático e Design Frente Única Bivolt - Inox');
    
INSERT INTO T_SMO_PRODUTO (id_produto, id_categoria, id_modelo, nome, preco, estoque, descricao)
    VALUES (5, 5, 5, 'Fogão Consul 4 Bocas CFO4NAR com Mesa de Inox, Acendimento Automático e Design Frente Única Bivolt - Inox', 1198.00, 50, 'Fogão Consul 4 Bocas CFO4NAR com Mesa de Inox, Acendimento Automático e Design Frente Única Bivolt - Inox');

INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (1, 1, 1, 5, 'Excelente produto!');
    
INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (2, 2, 2, 4, 'Muito bom, mas poderia ser mais barato.');
    
INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (3, 3, 3, 3, 'Bom, mas a bateria n?o dura muito.');
    
INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (4, 4, 4, 2, 'N?o gostei, esperava mais.');
    
INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (5, 5, 5, 1, 'P?ssimo, n?o recomendo.');
    


-----------------------------------------------------------------------------------------------------------
-- Verificando os dados inseridos

SELECT * FROM T_SMO_PESSOA;
SELECT * FROM T_SMO_PRODUTO_DEPARTAMENTO;
SELECT * FROM T_SMO_FUNCIONARIO_CARGO;
SELECT * FROM T_SMO_CLIENTE;
SELECT * FROM T_SMO_FUNCIONARIO;
SELECT * FROM T_SMO_PRODUTO_MODELO;
SELECT * FROM T_SMO_PRODUTO_MARCA;
SELECT * FROM T_SMO_PRODUTO_CATEGORIA;
SELECT * FROM T_SMO_PRODUTO;
SELECT * FROM T_SMO_PRODUTO_AVALIACAO;

-----------------------------------------------------------------------------------------------------------
-- Function: Calcula o valor total de um produto multiplicando o preço pela quantidade.
CREATE OR REPLACE FUNCTION calcular_valor_total(
    p_id_produto NUMBER,
    p_quantidade NUMBER
) RETURN NUMBER IS
    v_preco NUMBER;
    v_total NUMBER;
BEGIN
    -- Busca o preço do produto no banco de dados
    SELECT preco INTO v_preco
        FROM T_SMO_PRODUTO
            WHERE id_produto = p_id_produto;

    -- Calcula o valor total multiplicando o preço pela quantidade
    v_total := v_preco * p_quantidade;
    
    -- Retorna o valor total
    RETURN v_total;
    
EXCEPTION
    -- Se o produto não for encontrado, retorna 0
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
        
END calcular_valor_total;

-- Testando a função
SELECT calcular_valor_total(1, 2) AS total FROM dual;  -- Espera-se que retorne 518 (259 * 2)

-----------------------------------------------------------------------------------------------------------

-- Procedure: Atualiza o estoque de um produto após a venda
CREATE OR REPLACE PROCEDURE atualizar_estoque(
    p_id_produto NUMBER,
    p_quantidade_vendida NUMBER
) IS
BEGIN
    -- Reduz o estoque do produto vendido
    UPDATE T_SMO_PRODUTO
        SET estoque = estoque - p_quantidade_vendida
            WHERE id_produto = p_id_produto;

    COMMIT;
    
END atualizar_estoque;

-- Testando a procedure
BEGIN
    atualizar_estoque(2, 50);  -- Atualiza o estoque do produto com id 1 (Ventilador de Coluna [...]) reduzindo em 5 unidades
END;


-- Verificando se o estoque foi atualizado corretamente
SELECT estoque FROM T_SMO_PRODUTO WHERE id_produto = 1;  -- Espera-se que retorne 45 (50 - 5)

-----------------------------------------------------------------------------------------------------------

-- Trigger: Verifica se o produto tem estoque suficiente antes de permitir uma nova avaliação
CREATE OR REPLACE TRIGGER verificar_estoque
BEFORE INSERT ON T_SMO_PRODUTO_AVALIACAO
FOR EACH ROW
DECLARE
    v_estoque NUMBER;  -- Variável para armazenar o estoque do produto
BEGIN
    -- Verifica o estoque do produto
    SELECT estoque INTO v_estoque
    FROM T_SMO_PRODUTO
    WHERE id_produto = :NEW.id_produto;

    -- Se o estoque for insuficiente (zero ou negativo), impede a inserção
    IF v_estoque <= 0 THEN
        RAISE_APPLICATION_ERROR(-20001, 'Estoque insuficiente para realizar a venda.');
    END IF;

EXCEPTION
    -- Se o produto não for encontrado, lança um erro
    WHEN NO_DATA_FOUND THEN
        RAISE_APPLICATION_ERROR(-20002, 'Produto não encontrado.');
END verificar_estoque;

-- Tentando inserir uma avaliação para um produto sem estoque (por exemplo, id_produto = 4 que tem 50 em estoque)
BEGIN
    INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (6, 4, 1, 5, 'Teste de inserção com estoque insuficiente.'); -- O produto com id 4 tem apenas 50 em estoque.
END;

-- Agora vamos tentar inserir uma avaliação para um produto que realmente está sem estoque (por exemplo, id_produto = 5)
-- Primeiro, vamos reduzir o estoque do produto com id 5 a zero para testar a restrição.
UPDATE T_SMO_PRODUTO SET estoque = 0 WHERE id_produto = 5;

-- Tentando inserir uma avaliação para um produto sem estoque
BEGIN
    INSERT INTO T_SMO_PRODUTO_AVALIACAO (id_avaliacao, id_produto, id_cliente, estrelas, comentario)
    VALUES (7, 2, 1, 5, 'Teste de inserção com estoque insuficiente no produto sem estoque.'); 
END;

-----------------------------------------------------------------------------------------------------------

-- Package: Gerar Nota Fiscal de Venda
CREATE OR REPLACE PACKAGE nota_fiscal_pkg IS
    PROCEDURE gerar_nota_fiscal(p_id_avaliacao NUMBER);  -- Gera nota com base na avaliação
END nota_fiscal_pkg;

-- Implementação dos procedimentos do pacote
CREATE OR REPLACE PACKAGE BODY nota_fiscal_pkg IS

    -- Gera nota fiscal com base na avaliação
    PROCEDURE gerar_nota_fiscal(p_id_avaliacao NUMBER) IS
        v_cliente_nome VARCHAR2(100);
        v_produto_nome VARCHAR2(100);
        v_estrelas NUMBER;
        v_preco NUMBER;
        v_total NUMBER;
        v_id_produto NUMBER;
    BEGIN
        -- Busca informações do cliente, produto e avaliação
        SELECT c.nome, p.nome, av.estrelas, p.preco, av.id_produto 
            INTO v_cliente_nome, v_produto_nome, v_estrelas, v_preco, v_id_produto
                FROM T_SMO_PRODUTO_AVALIACAO av 
                    JOIN T_SMO_CLIENTE cl ON av.id_cliente = cl.id_cliente 
                    JOIN T_SMO_PESSOA c ON cl.id_pessoa = c.id_pessoa 
                    JOIN T_SMO_PRODUTO p ON av.id_produto = p.id_produto 
                        WHERE av.id_avaliacao = p_id_avaliacao;

        -- Calcula o valor total da compra
        v_total := calcular_valor_total(v_id_produto, v_estrelas);

        DBMS_OUTPUT.PUT_LINE('Nota Fiscal:');
        DBMS_OUTPUT.PUT_LINE('Cliente: ' || v_cliente_nome);
        DBMS_OUTPUT.PUT_LINE('Produto: ' || v_produto_nome);
        DBMS_OUTPUT.PUT_LINE('Quantidade: ' || v_estrelas);
        DBMS_OUTPUT.PUT_LINE('Preço Unitário: ' || v_preco);
        DBMS_OUTPUT.PUT_LINE('Total: ' || v_total);
        
    EXCEPTION
        -- Se a avaliação não for encontrada, exibe uma mensagem de erro
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('Avaliação não encontrada.');
    END gerar_nota_fiscal;

END nota_fiscal_pkg;

-- Habilitar DBMS_OUTPUT para visualizar a saída
SET SERVEROUTPUT ON;

-- Testando o procedimento gerar_nota_fiscal do pacote nota_fiscal_pkg
BEGIN
    nota_fiscal_pkg.gerar_nota_fiscal(1); -- Gera a nota fiscal para a avaliação com id 1
END;