CREATE TABLE Pedidos (
  idPedidos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  qtdProdutos INT  NULL  ,
  valorTotal DECIMAL(10,2)  NULL  ,
  dataPedido DATETIME  NULL  ,
  enderecoEntrega VARCHAR(25)  NULL  ,
  desconto DECIMAL(10,2)  NULL    ,
PRIMARY KEY(idPedidos));



CREATE TABLE Fornecedores (
  cnpj VARCHAR(15)  NOT NULL   AUTO_INCREMENT,
  razaoSocial VARCHAR(50)  NOT NULL  ,
  nomeFantasia VARCHAR(20)  NULL  ,
  categoria VARCHAR(30)  NULL  ,
  telefone VARCHAR(15)  NULL  ,
  email VARCHAR(45)  NULL  ,
  endereco VARCHAR(30)  NULL  ,
  numero VARCHAR(10)  NULL  ,
  cep VARCHAR(12)  NULL  ,
  cidade VARCHAR(30)  NULL  ,
  estado VARCHAR(2)  NULL    ,
PRIMARY KEY(cnpj));



CREATE TABLE Tranportadoras (
  cnpj VARCHAR(15)  NOT NULL   AUTO_INCREMENT,
  email VARCHAR(45)  NULL  ,
  telefone VARCHAR(15)  NULL  ,
  tipodeEntrega VARCHAR(20)  NULL    ,
PRIMARY KEY(cnpj));



CREATE TABLE Produtos (
  idProduto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  qtdEstoque INT  NULL  ,
  detalheProduto TEXT  NULL    ,
PRIMARY KEY(idProduto));



CREATE TABLE Clientes (
  idCliente INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  nome VARCHAR(15)  NULL  ,
  sobrenome VARCHAR(25)  NULL  ,
  email VARCHAR(45)  NULL  ,
  telefone VARCHAR(15)  NULL  ,
  endereco VARCHAR(30)  NULL  ,
  numero VARCHAR(10)  NULL  ,
  complemento VARCHAR(10)  NULL  ,
  cep VARCHAR(15)  NULL  ,
  cidade VARCHAR(30)  NULL  ,
  estado VARCHAR(2)  NULL    ,
PRIMARY KEY(idCliente));



CREATE TABLE Contratos (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Fornecedores_cnpj VARCHAR(15)  NOT NULL  ,
  inicio DATETIME  NULL  ,
  final DATETIME  NULL  ,
  condicoes TEXT  NULL    ,
PRIMARY KEY(id),
  FOREIGN KEY(Fornecedores_cnpj)
    REFERENCES Fornecedores(cnpj)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Sessoes (
  Clientes_idCliente INTEGER UNSIGNED  NOT NULL  ,
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  dispositivoUsado VARCHAR(25)  NULL  ,
  tempo DATETIME  NULL  ,
  acesso INTEGER UNSIGNED  NULL  ,
  FOREIGN KEY(Clientes_idCliente)
    REFERENCES Clientes(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Pagamentos (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL  ,
  valorPagar DECIMAL(10,2)  NULL  ,
  dataPagto DATETIME  NULL  ,
  metodo VARCHAR(20)  NULL    ,
PRIMARY KEY(id),
  FOREIGN KEY(Pedidos_idPedidos)
    REFERENCES Pedidos(idPedidos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Entregas (
  idEntregas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL  ,
  Tranportadoras_cnpj VARCHAR(15)  NOT NULL  ,
  numeroRastreio VARCHAR(20)  NULL  ,
  frete DECIMAL(10,2)  NULL    ,
PRIMARY KEY(idEntregas, Pedidos_idPedidos),
  FOREIGN KEY(Pedidos_idPedidos)
    REFERENCES Pedidos(idPedidos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Tranportadoras_cnpj)
    REFERENCES Tranportadoras(cnpj)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Avaliacoes (
  Clientes_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Produtos_idProduto INTEGER UNSIGNED  NOT NULL  ,
  comentario TEXT  NULL  ,
  estrelas INT  NULL  ,
  favoritos INT  NULL  ,
  imagem BLOB  NULL    ,
PRIMARY KEY(Clientes_idCliente, Produtos_idProduto),
  FOREIGN KEY(Clientes_idCliente)
    REFERENCES Clientes(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Produtos_idProduto)
    REFERENCES Produtos(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE EstoqueFornecedor (
  Fornecedores_cnpj VARCHAR(15)  NOT NULL  ,
  Produtos_idProduto INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Fornecedores_cnpj, Produtos_idProduto),
  FOREIGN KEY(Fornecedores_cnpj)
    REFERENCES Fornecedores(cnpj)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Produtos_idProduto)
    REFERENCES Produtos(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Itens_Pedidos (
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL  ,
  Produtos_idProduto INTEGER UNSIGNED  NOT NULL  ,
  quantidade INT  NULL  ,
  valorUnitario DECIMAL(10,2)  NULL  ,
  subtotal DECIMAL(10,2)  NULL    ,
PRIMARY KEY(Pedidos_idPedidos, Produtos_idProduto),
  FOREIGN KEY(Produtos_idProduto)
    REFERENCES Produtos(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pedidos_idPedidos)
    REFERENCES Pedidos(idPedidos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE DadosPedidos (
  Clientes_idCliente INTEGER UNSIGNED  NOT NULL  ,
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL    ,
PRIMARY KEY(Clientes_idCliente, Pedidos_idPedidos),
  FOREIGN KEY(Clientes_idCliente)
    REFERENCES Clientes(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Pedidos_idPedidos)
    REFERENCES Pedidos(idPedidos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Parcelas (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pagamentos_id INTEGER UNSIGNED  NOT NULL  ,
  numeroCartao VARCHAR(20)  NULL  ,
  dataVencimento DATE  NULL  ,
  nomeTitular VARCHAR(20)  NULL  ,
  codigoSeguranca VARCHAR(3))  NULL  ,
  qtdDeParcelas INT  NULL  ,
  juros DOUBLE  NULL  ,
  bancoEmissor INT  NULL    ,
PRIMARY KEY(id),
  FOREIGN KEY(Pagamentos_id)
    REFERENCES Pagamentos(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




