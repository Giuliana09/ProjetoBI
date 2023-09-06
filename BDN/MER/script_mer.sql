CREATE TABLE Pedidos (
  idPedidos INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  qtdProdutos INT  NULL  ,
  valorUnitario DOUBLE  NULL  ,
  valorTotal DOUBLE  NULL  ,
  dataPedido DATETIME  NULL  ,
  enderecoEntrega VARCHAR(25)  NULL  ,
  desconto VARCHAR(20)  NULL    ,
PRIMARY KEY(idPedidos));



CREATE TABLE Fornecedores (
  cnpj VARCHAR(15)  NOT NULL   AUTO_INCREMENT,
  razaoSocial VARCHAR(50)  NOT NULL  ,
  eMail VARCHAR(30)  NOT NULL  ,
  telefone VARCHAR(15)  NULL  ,
  categoria VARCHAR(20)  NULL  ,
  cidade VARCHAR(30)  NULL  ,
  estado VARCHAR(2)  NULL  ,
  nome VARCHAR(20)  NULL    ,
PRIMARY KEY(cnpj));



CREATE TABLE Tranportadoras (
  cnpj VARCHAR(15)  NOT NULL   AUTO_INCREMENT,
  email VARCHAR(45)  NULL  ,
  telefone VARCHAR(10)  NULL  ,
  tipodeEntrega VARCHAR(20)  NULL    ,
PRIMARY KEY(cnpj));



CREATE TABLE Produtos (
  idProduto INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  valorUnitaro DOUBLE  NULL  ,
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
INDEX Contratos_FKIndex1(Fornecedores_cnpj),
  FOREIGN KEY(Fornecedores_cnpj)
    REFERENCES Fornecedores(cnpj)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Sessoes (
  Clientes_idCliente INTEGER UNSIGNED  NOT NULL  ,
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  dispositivoUsado VARCHAR(25)  NULL  ,
  tempo DATETIME  NULL  ,
  acesso INTEGER UNSIGNED  NULL    ,
INDEX Sessoes_FKIndex1(Clientes_idCliente),
  FOREIGN KEY(Clientes_idCliente)
    REFERENCES Clientes(idCliente)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Pagamentos (
  id INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL  ,
  valorTotal DOUBLE  NULL  ,
  dataPago DATETIME  NULL  ,
  metodo VARCHAR(20)  NULL    ,
PRIMARY KEY(id)  ,
INDEX Pagamentos_FKIndex1(Pedidos_idPedidos),
  FOREIGN KEY(Pedidos_idPedidos)
    REFERENCES Pedidos(idPedidos)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Entregas (
  idEntregas INTEGER UNSIGNED  NOT NULL   AUTO_INCREMENT,
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL  ,
  Tranportadoras_cnpj VARCHAR(15)  NOT NULL  ,
  numeroRastreio VARCHAR(20)  NULL  ,
  frete DOUBLE  NULL    ,
PRIMARY KEY(idEntregas, Pedidos_idPedidos)  ,
INDEX Entregas_FKIndex1(Pedidos_idPedidos)  ,
INDEX Entregas_FKIndex2(Tranportadoras_cnpj),
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
PRIMARY KEY(Clientes_idCliente, Produtos_idProduto)  ,
INDEX Clientes_has_Produtos_FKIndex1(Clientes_idCliente)  ,
INDEX Clientes_has_Produtos_FKIndex2(Produtos_idProduto),
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
PRIMARY KEY(Fornecedores_cnpj, Produtos_idProduto)  ,
INDEX Fornecedores_has_Produtos_FKIndex1(Fornecedores_cnpj)  ,
INDEX Fornecedores_has_Produtos_FKIndex2(Produtos_idProduto),
  FOREIGN KEY(Fornecedores_cnpj)
    REFERENCES Fornecedores(cnpj)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Produtos_idProduto)
    REFERENCES Produtos(idProduto)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);



CREATE TABLE Item_Pedido (
  Pedidos_idPedidos INTEGER UNSIGNED  NOT NULL  ,
  Produtos_idProduto INTEGER UNSIGNED  NOT NULL  ,
  quantidade INT  NULL  ,
  precoUnitario DOUBLE  NULL  ,
  subtotal DOUBLE  NULL    ,
PRIMARY KEY(Pedidos_idPedidos, Produtos_idProduto)  ,
INDEX Item_Pedido_FKIndex1(Produtos_idProduto)  ,
INDEX Item_Pedido_FKIndex2(Pedidos_idPedidos),
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
PRIMARY KEY(Clientes_idCliente, Pedidos_idPedidos)  ,
INDEX Clientes_has_Pedidos_FKIndex1(Clientes_idCliente)  ,
INDEX Clientes_has_Pedidos_FKIndex2(Pedidos_idPedidos),
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
  bancoEmissor INTEGER UNSIGNED  NULL    ,
PRIMARY KEY(id)  ,
INDEX Parcelas_FKIndex1(Pagamentos_id),
  FOREIGN KEY(Pagamentos_id)
    REFERENCES Pagamentos(id)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION);




