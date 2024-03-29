--Creating the data that will store the data of 2022 and 2023
CREATE TABLE demostracoes_contabeis(
    DATA DATE,
    REG_ANS BIGINT ,
    CD_CONTA_CONTABIL VARCHAR(20),
    DESCRICAO VARCHAR(200),
    VL_SALDO_INCIAL DECIMAL(15,2),
    VL_SALDO_FINAL  DECIMAL(15,2),
    FOREIGN KEY (REG_ANS) REFERENCES dados_cadastrais_das_operadoras_ativas_na_ANS (Registro_ANS)
);

--Creating table that will be used to store the data imported from "dados_cadastrais_das_operadoras_ativas_na_ANS"
CREATE TABLE dados_cadastrais_das_operadoras_ativas_na_ANS(
    Registro_ANS BIGINT PRIMARY KEY,
    CNPJ BIGINT,
    Razao_Social VARCHAR(200),
    Nome_Fantasia  VARCHAR(80),
    Modalidade VARCHAR(50),
    Logradouro VARCHAR(40),
    Numero VARCHAR(40),
    Complemento VARCHAR(80),
    Bairro VARCHAR(30),
    Cidade VARCHAR(30),
    UF VARCHAR(2),
    CEP VARCHAR(20),
    DDD  VARCHAR(4),
    Telefone VARCHAR(20),
    Fax VARCHAR(20),
    Endereco_eletronico VARCHAR(60),
    Representante VARCHAR(50),
    Cargo_Representante VARCHAR(50),
    Regiao_de_Comercializacao VARCHAR(5),
    Data_Registro_ANS DATE
);

DROP TABLE dados_cadastrais_das_operadoras_ativas_na_ANS;
DROP TABLE demostracoes_contabeis;

--Used to import the data from Dados_cadastrais_das_operadoras_ativas_na_ANS.csv to the table
--dados_cadastrais_das_operadoras_ativas_na_ANS
LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE dados_cadastrais_das_operadoras_ativas_na_ANS
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS;


--All LOAD DATA INFILE commands from now on will import the data from 2022 and 2023 to the table 
--demostracoes_contabeis
LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
ESCAPED by ' '
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');

LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');

LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');

LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');

LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');

LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');

LOAD DATA INFILE '\\path\\to\\file.csv'  /*In path to file, enter the path to the directory that the csv is located*/
INTO TABLE demostracoes_contabeis
FIELDS TERMINATED by ';'
ENCLOSED by '"'
LINES TERMINATED by '\n'
IGNORE 1 ROWS
(@DATA,@REG_ANS,@CD_CONTA_CONTABIL,@DESCRICAO,@VL_SALDO_INICIAL,@VL_SALDO_FINAL)
SET VL_SALDO_INCIAL = REPLACE(@VL_SALDO_INICIAL, ',','.'),VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',','.');