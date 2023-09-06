create database vendasFeliz;

use vendasFeliz;

CREATE TABLE Pedidos (
  idPedidos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  qtdProdutos INT  NULL  ,
  valorUnitario NUMERIC(10, 2)  NULL  ,
  valorTotal NUMERIC(10, 2)  NULL  ,
  dataPedido DATETIME  NULL  ,
  enderecoEntrega VARCHAR(25)  NULL  ,
  desconto NUMERIC(10, 2)  NULL    ,
PRIMARY KEY(idPedidos));



CREATE TABLE Fornecedores (
  cnpj VARCHAR(15)  NOT NULL   ,
  nome VARCHAR(20)  NULL    ,
  razaoSocial VARCHAR(50)  NOT NULL  ,
  eMail VARCHAR(30)  NOT NULL  ,
  telefone VARCHAR(15)  NULL  ,
  categoria VARCHAR(20)  NULL  ,
  cidade VARCHAR(30)  NULL  ,
  estado VARCHAR(2)  NULL  ,
  pais VARCHAR(50)  NULL  ,
PRIMARY KEY(cnpj));



CREATE TABLE Tranportadoras (
  cnpj VARCHAR(15)  NOT NULL   ,
  email VARCHAR(45)  NULL  ,
  telefone VARCHAR(10)  NULL  ,
  tipoDeEntrega VARCHAR(20)  NULL    ,
PRIMARY KEY(cnpj));



CREATE TABLE Produtos (
  idProduto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  valorUnitario NUMERIC(10,2)  NULL  ,
  quantidade INT  NULL  ,
  qtdEstoque INT  NULL  ,
  detalheProduto TEXT  NULL    ,
PRIMARY KEY(idProduto));



CREATE TABLE Clientes (
  idCliente INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(15)  NULL  ,
  sobrenome VARCHAR(25)  NULL  ,
  email VARCHAR(45)  NULL  ,
  telefone VARCHAR(15)  NULL  ,
  endereco VARCHAR(45)  NULL  ,
  numero VARCHAR(10)  NULL  ,
  complemento VARCHAR(10)  NULL  ,
  cep VARCHAR(15)  NULL  ,
  cidade VARCHAR(30)  NULL  ,
  estado VARCHAR(2)  NULL    ,
PRIMARY KEY(idCliente));



CREATE TABLE Contratos (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Fornecedores_cnpj VARCHAR(15)  NOT NULL  ,
  tipo VARCHAR(50)  NULL  ,
  inicio DATETIME  NULL  ,
  final DATETIME  NULL  ,
  condicoes TEXT  NULL    ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(Fornecedores_cnpj)
    REFERENCES Fornecedores(cnpj));



CREATE TABLE Sessoes (
  idCliente INTEGER UNSIGNED  NOT NULL  ,
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  dispositivoUsado VARCHAR(25)  NULL  ,
  tempo DATETIME  NULL  ,
  acesso INTEGER UNSIGNED  NULL    ,
  PRIMARY KEY(id),
  FOREIGN KEY(idCliente)
    REFERENCES Clientes(idCliente));



CREATE TABLE Pagamentos (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  idPedidos INTEGER UNSIGNED  NOT NULL  ,
  valorTotal NUMERIC(10, 2)  NULL  ,
  dataPago DATETIME  NULL  ,
  metodo VARCHAR(20)  NULL    ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(idPedidos)
    REFERENCES Pedidos(idPedidos));



CREATE TABLE Entregas (
  idEntregas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  idPedidos INTEGER UNSIGNED  NOT NULL  ,
  Tranportadoras_cnpj VARCHAR(15)  NOT NULL  ,
  numeroRastreio VARCHAR(20)  NULL  ,
  frete NUMERIC(10, 2)  NULL    ,
PRIMARY KEY(idEntregas)  ,
  FOREIGN KEY(idPedidos)
    REFERENCES Pedidos(idPedidos),
  FOREIGN KEY(Tranportadoras_cnpj)
    REFERENCES Tranportadoras(cnpj));



CREATE TABLE Avaliacoes (
  idCliente INTEGER UNSIGNED  NOT NULL  ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  comentario TEXT  NULL  ,
  estrelas INT  NULL  ,
  favoritos INT  NULL  ,
  imagem BLOB  NULL    ,
PRIMARY KEY(idCliente, idProduto)  ,
  FOREIGN KEY(idCliente)
    REFERENCES Clientes(idCliente),
  FOREIGN KEY(idProduto)
    REFERENCES Produtos(idProduto));



CREATE TABLE EstoqueFornecedor (
  Fornecedores_cnpj VARCHAR(15)  NOT NULL  ,
  idProduto INTEGER UNSIGNED  NOT NULL    ,
  FOREIGN KEY(Fornecedores_cnpj)
    REFERENCES Fornecedores(cnpj),
  FOREIGN KEY(idProduto)
    REFERENCES Produtos(idProduto));



CREATE TABLE ItemPedido (
  idPedidos INTEGER UNSIGNED  NOT NULL  ,
  idProduto INTEGER UNSIGNED  NOT NULL  ,
  quantidade INT  NULL  ,
  precoUnitario NUMERIC(10, 2)  NULL  ,
  subtotal NUMERIC(10, 2)  NULL    ,
PRIMARY KEY(idPedidos, idProduto)  ,
  FOREIGN KEY(idProduto)
    REFERENCES Produtos(idProduto),
  FOREIGN KEY(idPedidos)
    REFERENCES Pedidos(idPedidos));



CREATE TABLE DadosPedidos (
  idCliente INTEGER UNSIGNED  NOT NULL  ,
  idPedidos INTEGER UNSIGNED  NOT NULL    ,
  FOREIGN KEY(idCliente)
    REFERENCES Clientes(idCliente),
  FOREIGN KEY(idPedidos)
    REFERENCES Pedidos(idPedidos));



CREATE TABLE Parcelas (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pagamentos_id INTEGER UNSIGNED  NOT NULL  ,
  numeroCartao VARCHAR(20)  NULL  ,
  dataVencimento DATE  NULL  ,
  nomeTitular VARCHAR(20)  NULL  ,
  codigoSeguranca VARCHAR(3)  NULL  ,
  valorParcela NUMERIC(10, 2),
  qtdDeParcelas INT  NULL  ,
  juros DOUBLE  NULL  ,
  bancoEmissor INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
  FOREIGN KEY(Pagamentos_id)
    REFERENCES Pagamentos(id));
    

      








