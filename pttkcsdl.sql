create database qlbh;
use qlbh;

create table Customers(
	customer_number int(11) not null primary key auto_increment,
    customer_full_name nvarchar(100) not null,
    customer_phone nvarchar(15) not null,
    customer_address nvarchar(100) not null,
    salesRepEmployeeNumber int  null,
    credit_limit decimal(10,3),
    constraint pk_customers_employees foreign key (salesRepEmployeeNumber) references Employees(employee_number)
);

create table ProductsLine(
	product_line int(11) not null primary key auto_increment,
    description  nvarchar(400) null,
    product_image text null
);

create table Products(
	product_code int(11) not null primary key auto_increment,
    product_name nvarchar(50) not null,
    product_vendor nvarchar(50) not null,
    product_line int not null,
    product_quantity int not null,
    buy_price decimal(10,3) not null,
    product_msrp decimal(10,3) not null,
    constraint pk_productLine_products foreign key (product_line) references ProductsLine(product_line)
);

create table Orders(
	order_number int(11) not null primary key auto_increment,
    oder_status nvarchar(15) not null,
    purchase_date date not null,
    required_date date not null,
    shipped_date date not null,
    comments nvarchar(100),
    quantity int not null,
    unit_price decimal(10,3) not null,
    customerNumber int(11) not null,
    constraint pk_customer_oders foreign key (customerNumber) references Customers(customer_number)
);

create table OrdersDetail(
	order_number int(11) not null ,
    product_code int(11) not null,
    quantity_ordered int not null,
    price_each decimal(10,3) not null,
    order_line_number int not null,
    primary key(order_number,product_code),
    constraint pk_orderDetail_orders foreign key (order_number) references Orders(order_number),
    constraint pk_orderDetail_products foreign key (product_code) references Products(product_code)
);

create table Payments(
	customer_number int(11) not null primary key auto_increment,
	payment_code int(11) not null,
    date_of_payment date not null,
    total decimal(10,3) not null,
	customerNumber int(11) not null,
    constraint pk_customer_payments foreign key (customerNumber) references Customers(customer_number)
);

create table Employees(
	employee_number int(11)  not null auto_increment primary key,
    employee_full_name nvarchar(100) not null,
    employee_email nvarchar(100) not null,
    employee_job nvarchar(50),
    constraint pk_employees_offices foreign key (employee_number) references Offices(office_code)
);

alter table Employees 
	add employees_management int(11) null;
    
alter table Employees add
 constraint pk_employees_employees 
	foreign key (employees_management) references Employees(employee_number);


create table Offices(
	office_code int(11) not null primary key auto_increment,
    office_phone nvarchar(15)not null,
    office_address nvarchar(100) not null
);


