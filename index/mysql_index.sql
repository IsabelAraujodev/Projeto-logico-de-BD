-- criacao do banco de dados para o cenário de E-commerce
create database ecommerce;
use ecommerce;

--criar tabela cliente

create table clients(
    idClient int auto_increment primary key,
    Fname varchar(10),
    Minit char(3),
    Lname varchar(20),
    email varchar(255) default 0,
    CPF char(11) not null,
    Address varchar(30),
    constraint unique_cpf_client unique (CPF)
);

desc clients;
--criar tabela produto
--size = dimensão do produto
create table product(
    idProduct int auto_increment primary key,
    Pname varchar(10) not null,
    classification_kids bool default false,
    category enum('Eletrônico', 'Vestimenta', 'Brinquedos', 'Alimentos', 'Moveis') not null,
    avaliacao float default 0,
    price int auto_increment primary ket,
    size varchar(10),
    constraint unique_cpf_client unique (CPF)
);
--criar tabela pagamentos
create table payments(
    idclient int primary key,
    idPayment int,
    typePayment enum('Boleto', 'Cartão', 'Dois cartões'),
    limitAvailable float,
    primary key(idClient, id_payment)
);

--criar tabela pedido
create table orders(
    idOrders int auto_increment primary key,
    idOrdersClient int,
    ordersStatus enum('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento',
    ordersDescription varchar(255),
    sendValue float default 10,
    paymentCash boolean default false,
    constraint fk_orders_client foreign key (idOrdersClient) references clients(idClient)
        on update cascade
);

--criar tabela estoque
create table productsStorage(
    idProdStorage int auto_increment primary key,
    storageLocation varchar(255),
    quantity int default 0,
);
--criar tabela fornecedor
create table supplier(
    idSupplier in auto_increment primary key,
    SocialName varchar(255) not null,
    email char(255) default 0,
    CNPJ char(15) not null,
    contact char(11) not null,
    constraint unique_supplier unique(CNPJ),
);
--criar tabela vendedor
create table seller(
    idSeller in auto_increment primary key,
    SocialName varchar(255) not null,
    AbsName varchar(255),
    Location char(255) not null,
    email char(255) default 0,
    CNPJ char(15),
    CPF char(9),
    contact char(11) not null,
    constraint unique_seller unique(CNPJ),
    constraint unique_seller unique(CPF)
);

create table productSeller(
    idPSeller int,
    idPproduct int,
    prodQuantity int default 1,
    primary key (idPSeller, idPproduct),
    constraint fk_product_seller foreign key(idpSeller) references seller(idSeller),
    constraint fk_product_product foreign key (idPproduct) references product(idProduct)
)

create table productOrder(
    idPOproduct int,
    idPOorder int,
    poQuantity int default 1,
    poStatus enum ('Disponível', 'Sem estoque') default 'Disponível',
    primary key (idPOproduct, idPOorder),
    constraint fk_product_seller foreign key (idPOproduct) references product(idProduct),
    constraint fk_product_product foreign key (idPOorder) references orders (idOrder)
);

create table storageLocation(
    idLproduct int,
    idLstorage int,
    location varchar(255) not null,
    constraint fk_storage_location_product foreign key (idLproduct) references product(idProduct),
    constraint fk_storage_location_storage foreign key (idLstorage) references orders(productStorage)
);

create table productSupplier(
    idPsSupplier int,
    idPsProduct int,
    quantity int not null,
    primary key (idPsSupplier, idPsProduct),
    constraint fk_product_supplier_supplier foreign key (idPsSupplier) references supplier(idSupplier),
    constraint fk_product_supplier_product foreign key (idPsProduct) references product(idProduct)
);

create table delivery(
    idDelivery int auto_increment primary key, 
    idOrder int,
    deliveryStatus int ('aguardando envio', 'em trânsito', 'entregue'),
    tracking varchar(255) default null
)

show tables;
show databases;

use information_schema;
show tables;
desc referential_constraints;
