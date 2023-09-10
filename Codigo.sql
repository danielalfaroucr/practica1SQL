


-- LLAMADO A LA BASE DE DATOS: En esta parte, se indica que todas las acciones y consultas que se lleven a cabo se hagan a la base de datos 'negocio'.
	USE negocio; --Con la linea USE negocio, se establece que todas las consultas que se hagan se apliquen a la base de datos negocio.
	GO --GO sirve como un separador para indicar que todas las instrucciones SQL anteriores deben ejecutarse como un conjunto antes de pasar a las siguientes.

--CREACIÓN DE TABLAS PARA LA BASE DE DATOS: En esta sección, se crean las tablas en las que se almacenarán los datos ingresados. 
--Una tabla en una base de datos SQL es una estructura organizada para almacenar y gestionar datos de manera tabular, con filas y columnas. Cada fila representa un registro y cada columna contiene un atributo o campo de datos específico. 

	CREATE TABLE Categoria( --Con CREATE TABLE se inicia la creación de la tabla Categoria. 
		id_categoria INT NOT NULL CHECK (id_categoria >= 0) CONSTRAINT id_categoria PRIMARY KEY, -- Se crea el atributo id_categoria, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK) y se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. Una primary key (llave primaria) es un atributo o conjunto de atributos que identifica de manera única cada registro en una tabla.
		nombre CHAR(40) NOT NULL --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
	) --Con este paréntesis, se termina la creación de la tabla Categoría. 
			
	CREATE TABLE Subcategoria( --Con CREATE TABLE se inicia la creación de la tabla Subcategoria.  
		id_subcategoria INT NOT NULL CHECK (id_subcategoria >= 0) CONSTRAINT id_subcategoria PRIMARY KEY, -- Se crea el atributo id_subcategoria, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK) y se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. Una primary key (llave primaria) es un atributo o conjunto de atributos que identifica de manera única cada registro en una tabla.
		nombre CHAR(40) NOT NULL, --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de caracteres de 40 , se indica que no puede quedar vacío el atributo (NOT NULL).
		id_categoria INT NOT NULL CHECK (id_categoria >= 0), -- Se crea el atributo id_categoria, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK).	
		FOREIGN KEY (id_categoria) REFERENCES Categoria(id_categoria) --Se establece la relación entre la tabla Categoria y Subcategoria. Una "foreign key" (llave foránea) es un campo en una tabla que se relaciona con la clave primaria de otra tabla, estableciendo así una conexión entre ellas. Se indica con función FOREIGN KEY que el atributo id_categoria de esta tabla se relacione con el atributo id_categoria de la tabla Categoria (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Subcategoría. 

	CREATE TABLE Provincia( --Con CREATE TABLE se inicia la creación de la tabla Provincia.  
		id_provincia INT NOT NULL IDENTITY(1,1) CONSTRAINT id_provincia PRIMARY KEY, --Se crea el atributo id_provincia, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. 
		nombre CHAR(40) NOT NULL --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
	)--Con este paréntesis, se termina la creación de la tabla Provincia.


	CREATE TABLE Canton( --Con CREATE TABLE se inicia la creación de la tabla Canton.  
		id_canton INT NOT NULL IDENTITY(1,1) CONSTRAINT id_canton PRIMARY KEY, --Se crea el atributo id_canton, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. 
		nombre CHAR(40) NOT NULL, --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		id_provincia INT NOT NULL, --Se crea el atributo id_provincia, indicando que sea de tipo INT (número entero) y que no pueda quedar vacío (NOT NULL).
		FOREIGN KEY (id_provincia) REFERENCES Provincia(id_provincia) --Se establece la relación entre la tabla Provincia y Canton. Se indica con función FOREIGN KEY que el atributo id_provincia de esta tabla se relacione con el atributo id_provincia de la tabla Provincia (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Provincia.
	
	CREATE TABLE Distrito( --Con CREATE TABLE se inicia la creación de la tabla Distrito.
		id_distrito INT NOT NULL IDENTITY(1,1) CONSTRAINT id_distrito PRIMARY KEY, --Se crea el atributo id_distrito, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. 
		nombre CHAR(40) NOT NULL, --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		id_canton INT NOT NULL, --Se crea el atributo id_canton, indicando que sea de tipo INT (número entero) y que no pueda quedar vacío (NOT NULL).
		FOREIGN KEY (id_canton) REFERENCES Canton(id_canton) --Se establece la relación entre la tabla Canton y Distrito. Se indica con función FOREIGN KEY que el atributo id_canton de esta tabla se relacione con el atributo id_canton de la tabla Canton (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Distrito.
	
	CREATE TABLE CedulaTipo(  --Con CREATE TABLE se inicia la creación de la tabla CedulaTipo.
		id_tipo INT NOT NULL IDENTITY(1,1) CONSTRAINT id_tipo PRIMARY KEY, --Se crea el atributo id_tipo, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. 
		descripcion CHAR(40) NOT NULL --Se crea el atributo descripcion, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
	)--Con este paréntesis, se termina la creación de la tabla CedulaTipo.
	
	CREATE TABLE Proveedor(  --Con CREATE TABLE se inicia la creación de la tabla Proveedor.
		cedula INT NOT NULL   CHECK (cedula >= 0) CONSTRAINT id_proveedor PRIMARY KEY, -- Se crea el atributo cedula, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK) y se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla.-- Se crea el atributo id_subcategoria, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK) y se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla.		
		nombre CHAR(40) NOT NULL, --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		correo CHAR(40) NOT NULL, --Se crea el atributo correo, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		telefono INT NOT NULL, --Se crea el atributo telefono, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		id_distrito INT NOT NULL, --Se crea el atributo id_distrito, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		id_tipo INT NOT NULL, --Se crea el atributo id_tipo, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		FOREIGN KEY (id_distrito) REFERENCES Distrito(id_distrito), --Se establece la relación entre la tabla Distrito y Proveedor. Se indica con función FOREIGN KEY que el atributo id_distrito de esta tabla se relacione con el atributo id_distrito de la tabla Distrito (REFERENCES).
		FOREIGN KEY (id_tipo) REFERENCES CedulaTipo(id_tipo)--Se establece la relación entre la tabla CedulaTipo y Proveedor. Se indica con función FOREIGN KEY que el atributo id.tipo de esta tabla se relacione con el atributo id_tipo de la tabla CedulaTipo (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Proveedor.

	CREATE TABLE Producto( --Con CREATE TABLE se inicia la creación de la tabla Producto.
		consecutivo INT NOT NULL IDENTITY(1,1) CONSTRAINT consecutivo PRIMARY KEY, --Se crea el atributo consecutivo, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. 
		id_universal INT NOT NULL CHECK (id_universal >= 0),   -- Se crea el atributo id_universal, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK).
		nombre CHAR(40) NOT NULL ,  --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		precio DECIMAL(9,2) NOT NULL CHECK (precio >= 0), --Se crea el atributo precio, indicando que sea de tipo DECIMAL (número decimal) con un máximo de 9 dígitos en la parte entera y 2 en la parte decimal (paréntesis junto a DECIMAL), se indica que no puede quedar vacío (NOT NULL) y con la función CHECK se verifica que el número sea mayor a cero.
		id_subcat INT NOT NULL, --Se crea el atributo id_subcat, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		tamano INT  CHECK (tamano >= 0), --Se crea el atributo tamano, indicando que sea de tipo INT (número entero), no se indica que no puede quedar vacío el atributo (se omite NOT NULL) y por medio de CHECK se verifica que el numero sea mayor a cero.
		color CHAR(40) NOT NULL,  --Se crea el atributo color, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		cedula INT NOT NULL, --Se crea el atributo cedula, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		FOREIGN KEY (cedula) REFERENCES Proveedor(cedula), --Se establece la relación entre la tabla Proveedor y Producto. Se indica con función FOREIGN KEY que el atributo cedula de esta tabla se relacione con el atributo cedula de la tabla Proveedor (REFERENCES).
		FOREIGN KEY (id_subcat) REFERENCES Subcategoria (id_subcategoria) --Se establece la relación entre la tabla Subcategoria y Producto. Se indica con función FOREIGN KEY que el atributo id_subcat de esta tabla se relacione con el atributo id_subcategoria de la tabla Subcategoria (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Producto.

	CREATE TABLE Cliente(--Con CREATE TABLE se inicia la creación de la tabla Cliente.
		cedula INT NOT NULL CHECK (cedula >=0) CONSTRAINT cedula PRIMARY KEY, -- Se crea el atributo cedula, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK) y se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla.-- Se crea el atributo id_subcategoria, se indica que sea de tipo INT (número entero), que no pueda quedar vacío (con instrucción NOT NULL), se indica que debe ser un número mayor o igual a cero (con función CHECK) y se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla.	
		nombre CHAR(40) NOT NULL,   --Se crea el atributo nombre, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		direccion CHAR(40) NOT NULL,  --Se crea el atributo direccion, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		correo CHAR(40) NOT NULL,  --Se crea el atributo correo, indicando que sea de tipo CHAR (datos de tipo caracter) con una longitud máxima de 40 caracteres, se indica que no puede quedar vacío el atributo (NOT NULL).
		id_tipo INT NOT NULL, --Se crea el atributo id_tipo, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		id_distrito INT NOT NULL, --Se crea el atributo id_distrito, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		FOREIGN KEY (id_distrito) REFERENCES Distrito(id_distrito), --Se establece la relación entre la tabla Distrito y Cliente. Se indica con función FOREIGN KEY que el atributo id_distrito de esta tabla se relacione con el atributo id_distrito de la tabla Distrito (REFERENCES).
		FOREIGN KEY (id_tipo) REFERENCES CedulaTipo(id_tipo) --Se establece la relación entre la tabla CedulaTipo y Cliente. Se indica con función FOREIGN KEY que el atributo id_tipo de esta tabla se relacione con el atributo id_tipo de la tabla CedulaTipo (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Cliente.
	
	CREATE TABLE Factura( --Con CREATE TABLE se inicia la creación de la tabla Factura.
		id_factura INT NOT NULL IDENTITY(1,1) CONSTRAINT id_factura PRIMARY KEY, --Se crea el atributo id_factura, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla. 
		cedula INT NOT NULL,  --Se crea el atributo cedula, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		fecha DATE NOT NULL, --Se crea el atributo fecha, indicando que sea de tipo DATE (fecha), se indica que no puede quedar vacío el atributo (NOT NULL).
		FOREIGN KEY (cedula) REFERENCES Cliente(cedula)--Se establece la relación entre la tabla Cliente y Factura. Se indica con función FOREIGN KEY que el atributo cedula de esta tabla se relacione con el atributo cedula de la tabla Cliente (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla Cliente.
	
	CREATE TABLE productofactura(--Con CREATE TABLE se inicia la creación de la tabla productofactura.
		id_prodfac INT NOT NULL IDENTITY(1,1) CONSTRAINT id_prodfac PRIMARY KEY, --Se crea el atributo id_prodfac, se indica que sea de tipo entero (INT), que no pueda quedar vacío (NOT NULL), se indica por medio de la función IDENTITY que este atributo se llene automáticamente con cada entrada de datos (cada línea), empezando con 1 (primer uno en el paréntesis junto a la palabra IDENTITY) y que vaya aumentando en uno con cada línea ingresada (segundo uno en el paréntesis junto a la palabra IDENTITY). Se indica la restricción o limitación (Constraint) para indicar que este atributo es la llave primaria (PRIMARY KEY) de la tabla.
		id_factura INT NOT NULL,  --Se crea el atributo id_factura, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		consecutivo INT NOT NULL, --Se crea el atributo consecutivo, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL).
		cantidad INT NOT NULL CHECK (cantidad >0),  --Se crea el atributo cantidad, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL). Por medio de CHECK se verifica que este número sea mayor a cero. 
		porcimpuesto INT NOT NULL CHECK (porcimpuesto >=0 AND porcimpuesto <= 100) , --Se crea el atributo porcimpuesto, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL). Por medio de CHECK se verifica que este número sea mayor o igual a cero y menor o igual a cien.
		porcdescuento INT NOT NULL CHECK (porcdescuento >=0 AND porcdescuento <= 100) --Se crea el atributo porcdescuento, indicando que sea de tipo INT (número entero), se indica que no puede quedar vacío el atributo (NOT NULL). Por medio de CHECK se verifica que este número sea mayor o igual a cero y menor o igual a cien. 
		FOREIGN KEY (id_factura) REFERENCES Factura(id_factura), --Se establece la relación entre la tabla Factura y productofactura. Se indica con función FOREIGN KEY que el atributo id_factura de esta tabla se relacione con el atributo id_factura de la tabla Factura (REFERENCES).
		FOREIGN KEY (consecutivo) REFERENCES Producto(consecutivo) --Se establece la relación entre la tabla Producto y productofactura. Se indica con función FOREIGN KEY que el atributo consecutivo de esta tabla se relacione con el atributo consecutivo de la tabla Producto (REFERENCES).
	)--Con este paréntesis, se termina la creación de la tabla productofactura.

--HASTA AQUÍ LA CREACIÓN DE LAS TABLAS DE LA BASE DE DATOS.

-- LLENADO DE DATOS: En esta sección se llenarán las tablas previamente creadas con datos de prueba.
--El llenado de datos tiene una sintaxis de la siguiente manera:  INSERT INTO nombredetabla (atributo 1, atributo 2,...,atributo n) VALUES (atributo 1 del registro j , atributo 2 del primer registro j, ... , atributo n del primer registro j)
--El llenado de datos se hace cumpliendo las restricciones de las llaves primarias y secundarias, así como las relaciones que estas conllevan entre tablas.

--Llenado de tabla Categoría	
	INSERT INTO Categoria (id_categoria, nombre) VALUES (1, 'Electrónica'); --Notar que para datos numéricos (INT O DECIMAL) no hace falta usar comillas. Se usan comillas para datos de tipo CHAR.
	INSERT INTO Categoria (id_categoria, nombre) VALUES (2, 'Ropa');
	INSERT INTO Categoria (id_categoria, nombre) VALUES (3, 'Muebles');
	INSERT INTO Categoria (id_categoria, nombre) VALUES (4, 'Alimentos');
	INSERT INTO Categoria (id_categoria, nombre) VALUES (5, 'Juguetes');

--Llenado de tabla Subcategoria		
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (1, 'Teléfonos móviles', 1);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (2, 'Computadoras', 1);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (3, 'Televisores', 1);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (4, 'Cámaras', 1);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (5, 'Accesorios electrónicos', 1);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (6, 'Camisetas', 2);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (7, 'Pantalones', 2);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES(8, 'Vestidos', 2);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (9, 'Calzado', 2);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (10, 'Ropa interior', 2);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (11, 'Sofás', 3);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (12, 'Mesas', 3);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (13, 'Sillas', 3);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (14, 'Armarios', 3);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (15, 'Camas', 3);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (16, 'Frutas', 4);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (17, 'Verduras', 4);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (18, 'Productos lácteos', 4);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (19, 'Carnes', 4);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (20, 'Panes', 4);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (21, 'Muñecos', 5);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (22, 'Juegos de mesa', 5);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (23, 'Pelotas', 5);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (24, 'Rompecabezas', 5);
	INSERT INTO Subcategoria (id_subcategoria, nombre, id_categoria) VALUES (25, 'Juguetes educativos', 5);

--Llenado de tabla Provincia: notar que no se especifica el valor de id_provincia para ningún registro, pues se estableció en la creación de la tabla que el campo se llene con la función IDENTITY.
	INSERT INTO Provincia (nombre) VALUES ('San Jose');
	INSERT INTO Provincia (nombre) VALUES ('Alajuela');
	INSERT INTO Provincia (nombre) VALUES ('Cartago');
	INSERT INTO Provincia (nombre) VALUES ('Heredia');
	INSERT INTO Provincia (nombre) VALUES ('Guanacaste');
	INSERT INTO Provincia (nombre) VALUES ('Puntarenas');
	INSERT INTO Provincia (nombre) VALUES ('Limon');



--Llenado de la tabla Canton: a diferencia de las tablas anteriores, en esta no se escribe la instrucción INSERT INTO en todos los registros. Se escribe la instrucción una sola vez y los siguientes registros se escriben separados por una coma. Al igual que la tabla anterior (Provincia), no se especifica el valor del atributo id_canton, por haber hecho uso de la función IDENTITY en la creación de la tabla.
	INSERT INTO Canton (nombre, id_provincia) VALUES
		('San José', 1),
		('Escazú', 1),
		('Desamparados', 1),
		('Puriscal', 1),
		('Tarrazú', 1),
		('Aserrí', 1),
		('Mora', 1),
		('Goicoechea', 1),
		('Santa Ana', 1),
		('Alajuelita', 1),
		('Vásquez de Coronado', 1),
		('Acosta', 1),
		('Tibás', 1),
		('Moravia', 1),
		('Montes de Oca', 1),
		('Turrubares', 1),
		('Dota', 1),
		('Curridabat', 1),
		('Pérez Zeledón', 1),
		('Alajuela', 2),
		('San Ramón', 2),
		('Grecia', 2),
		('San Mateo', 2),
		('Atenas', 2),
		('Naranjo', 2),
		('Palmares', 2),
		('Poás', 2),
		('Orotina', 2),
		('San Carlos', 2),
		('Zarcero', 2),
		('Valverde Vega', 2),
		('Upala', 2),
		('Los Chiles', 2),
		('Guatuso', 2),
		('Cartago', 3),
		('Paraíso', 3),
		('La Unión', 3),
		('Jiménez', 3),
		('Turrialba', 3),
		('Alvarado', 3),
		('Oreamuno', 3),
		('El Guarco', 3),
		('Heredia', 4),
		('Barva', 4),
		('Santo Domingo', 4),
		('Santa Bárbara', 4),
		('San Rafael', 4),
		('San Isidro', 4),
		('Belén', 4),
		('Flores', 4),
		('Liberia', 5),
		('Nicoya', 5),
		('Santa Cruz', 5),
		('Bagaces', 5),
		('Carrillo', 5),
		('Cañas', 5),
		('Abangares', 5),
		('Tilarán', 5),
		('Nandayure', 5),
		('La Cruz', 5),
		('Hojancha', 5),
		('Puntarenas', 6),
		('Esparza', 6),
		('Buenos Aires', 6),
		('Montes de Oro', 6),
		('Osa', 6),
		('Quepos', 6),
		('Golfito', 6),
		('Coto Brus', 6),
		('Parrita', 6),
		('Corredores', 6),
		('Garabito', 6),
		('Limón', 7),
		('Pococí', 7),
		('Siquirres', 7),
		('Talamanca', 7),
		('Matina', 7),
		('Guácimo', 7);


--Llenado de la tabla Distrito.
	INSERT INTO Distrito (nombre, id_canton) VALUES
		('Carmen', 1), 
		('Merced', 1),
		('Escazú Centro', 2),
		('San Antonio', 2),
		('San Juan', 3),
		('Patarrá', 3),
		('Puriscal', 4),
		('Candelarita', 4),
		('San Marcos', 5),
		('San Lorenzo', 5),
		('Aserrí', 6),
		('Tarbaca', 6),
		('Mora', 7),
		('Colón', 7),
		('Guadalupe', 8),
		('San Francisco', 8),
		('Santa Ana', 9),
		('Salitral', 9),
		('Alajuelita', 10),
		('San Josecito', 10),
		('San Isidro', 11),
		('San Rafael', 11),
		('Acosta', 12),
		('Palmichal', 12),
		('San Juan', 13),
		('Cinco Esquinas', 13),
		('San Vicente', 14),
		('San Jerónimo', 14),
		('San Pedro', 15),
		('Sabanilla', 15),
		('San Pablo', 16),
		('San Pedro', 16),
		('Santa María', 17),
		('Jardín', 17),
		('Curridabat', 18),
		('Granadilla', 18),
		('San Isidro de El General', 19),
		('Daniel Flores', 19),
		('Alajuela', 20),
		('San José', 20),
		('San Ramón', 21),
		('Santiago', 21),
		('Grecia', 22),
		('San Isidro', 22),
		('San Mateo', 23),
		('Labrador', 23),
		('Atenas', 24),
		('Jesús', 24),
		('Naranjo', 25),
		('San Miguel', 25),
		('Palmares', 26),
		('Zaragoza', 26),
		('San Pedro', 27),
		('San Juan', 27),
		('Orotina', 28),
		('El Mastate', 28),
		('Quesada', 29),
		('Florencia', 29),
		('Zarcero', 30),
		('Laguna', 30),
		('Sarchí Norte', 31),
		('Sarchí Sur', 31),
		('Upala', 32),
		('Aguas Claras', 32),
		('Los Chiles', 33),
		('El Amparo', 33),
		('San Rafael', 34),
		('Buenavista', 34),
		('Oriental', 35),
		('Occidental', 35),
		('Paraíso', 36),
		('Santiago', 36),
		('Tres Ríos', 37),
		('San Diego', 37),
		('Juan Viñas', 38),
		('Tucurrique', 38),
		('Turrialba', 39),
		('La Suiza', 39),
		('Pacayas', 40),
		('Cervantes', 40),
		('San Rafael', 41),
		('San Juan', 41),
		('El Tejar', 42),
		('San Isidro', 42),
		('Heredia', 43),
		('Mercedes', 43),
		('San Pedro', 44),
		('San Pablo', 44),
		('Santo Domingo', 45),
		('San Vicente', 45),
		('Santa Bárbara', 46),
		('San Pedro', 46),
		('San Rafael', 47),
		('San Josecito', 47),
		('San Isidro', 48),
		('San José', 48),
		('San Antonio', 49),
		('La Ribera', 49),
		('San Joaquín', 50),
		('Barrantes', 50),
		('Liberia', 51),
		('Cañas Dulces', 51),
		('Nicoya', 52),
		('Mansión', 52),
		('Santa Cruz', 53),
		('Bolsón', 53),
		('Bagaces', 54),
		('La Fortuna', 54),
		('Filadelfia', 55),
		('Palmira', 55),
		('Cañas', 56),
		('Palmira', 56),
		('Las Juntas', 57),
		('Sierra', 57),
		('Tilarán', 58),
		('Quebrada Grande', 58),
		('Nandayure', 59),
		('San Pablo', 59),
		('La Cruz', 60),
		('Santa Elena', 60),
		('Hojancha', 61),
		('Monte Romo', 61),
		('Puntarenas', 62),
		('Pitahaya', 62),
		('Espíritu Santo', 63),
		('San Juan Grande', 63),
		('Buenos Aires', 64),
		('Volcán', 64),
		('Miramar', 65),
		('La Unión', 65),
		('Ciudad Cortés', 66),
		('Palmar', 66),
		('Quepos', 67),
		('Savegre', 67),
		('Golfito', 68),
		('Puerto Jiménez', 68),
		('San Vito', 69),
		('Sabalito', 69),
		('Parrita', 70),
		('Jesús María', 70),
		('Corredores', 71),
		('La Cuesta', 71),
		('Jacó', 72),
		('Tárcoles', 72),
		('Limón', 73),
		('Valle La Estrella', 73),
		('Guápiles', 74),
		('Cariari', 74),
		('Siquirres', 75),
		('Pacuarito', 75),
		('Bribri', 76),
		('Bratsi', 76),
		('Matina', 77),
		('Batán', 77),
		('Guácimo', 78),
		('Mercedes', 78);

--Llenado de tabla CedulaTipo	
	INSERT INTO CedulaTipo (descripcion) VALUES
		('Fisica'),
		('Juridica');
	
--Llenado de la tabla Proveedor.
	INSERT INTO Proveedor (cedula, nombre, correo, telefono, id_distrito,id_tipo) VALUES
		(123456789, 'Proveedor 1', 'proveedor1@email.com', 12345678, 1,1),  
		(234567890, 'Proveedor 2', 'proveedor2@email.com', 23456789, 2,1),  
		(345678901, 'Proveedor 3', 'proveedor3@email.com', 34567890, 3,1),  
		(456789012, 'Proveedor 4', 'proveedor4@email.com', 45678901, 4,2),
		(567890123, 'Proveedor 5', 'proveedor5@email.com', 56789012, 20,2), 
		(678901234, 'Proveedor 6', 'proveedor6@email.com', 67890123, 21,2),
		(789012345, 'Proveedor 7', 'proveedor7@email.com', 78901234, 35,1),
		(890123456, 'Proveedor 8', 'proveedor8@email.com', 89012345, 36,1),
		(901234567, 'Proveedor 9', 'proveedor9@email.com', 90123456, 43,1),
		(112233445, 'Proveedor 10', 'proveedor10@email.com', 22000000, 44,2),
		(223344556, 'Proveedor 11', 'proveedor11@email.com', 22334455, 51,2),  
		(334455667, 'Proveedor 12', 'proveedor12@email.com', 22279540,52,1),
		(445566778, 'Proveedor 13', 'proveedor13@email.com', 44556677, 62,2),  
		(556677889, 'Proveedor 14', 'proveedor14@email.com', 50164181,63,1),
		(667788990, 'Proveedor 15', 'proveedor15@email.com', 66778899, 73,2),  
		(778899001, 'Proveedor 16', 'proveedor16@email.com', 54789635, 74,2),
		(889900112, 'Proveedor 17', 'proveedor17@email.com', 88990011, 65,1),
		(990011223, 'Proveedor 18', 'proveedor18@email.com', 56432158,78,1);  


--Llenado de tabla Producto.
	INSERT INTO Producto (id_universal, nombre, precio, id_subcat, tamano, color, cedula) VALUES
		(101, 'Producto 1-1', 19.99, 1, 10, 'Rojo', 123456789),  
		(102, 'Producto 1-2', 29.99, 1, 12, 'Verde', 234567890),  
		(103, 'Producto 1-3', 14.99, 1, 8, 'Azul', 345678901),  
		(104, 'Producto 2-1', 24.99, 2, 14, 'Amarillo', 456789012), 
		(105, 'Producto 2-2', 39.99, 2, 16, 'Blanco', 567890123),  
		(106, 'Producto 2-3', 9.99, 2, 6, 'Negro', 678901234),
		(107, 'Producto 3-1', 17.99, 3, 10, 'Rojo', 789012345),  
		(108, 'Producto 3-2', 27.99, 3, 12, 'Verde', 890123456),  
		(109, 'Producto 3-3', 12.99, 3, 8, 'Azul', 901234567),
		(110, 'Producto 4-1', 22.99, 4, 10, 'Rojo', 112233445),  
		(111, 'Producto 4-2', 32.99, 4, 12, 'Verde', 223344556),  
		(112, 'Producto 4-3', 16.99, 4, 8, 'Azul', 334455667),
		(113, 'Producto 5-1', 21.99, 5, 14, 'Amarillo', 445566778), 
		(114, 'Producto 5-2', 36.99, 5, 16, 'Blanco', 556677889),  
		(115, 'Producto 5-3', 8.99, 5, 6, 'Negro', 667788990),
		(116, 'Producto 6-1', 18.99, 6, 10, 'Rojo', 778899001),  
		(117, 'Producto 6-2', 28.99, 6, 12, 'Verde', 889900112),  
		(118, 'Producto 6-3', 13.99, 6, 8, 'Azul', 990011223),
		(119, 'Producto 7-1', 20.99, 7, 14, 'Amarillo', 123456789),  
		(120, 'Producto 7-2', 30.99, 7, 16, 'Blanco', 234567890),  
		(121, 'Producto 7-3', 15.99, 7, 8, 'Azul', 345678901),
		(122, 'Producto 8-1', 23.99, 8, 10, 'Rojo', 456789012),  
		(123, 'Producto 8-2', 33.99, 8, 12, 'Verde', 567890123),  
		(124, 'Producto 8-3', 17.99, 8, 8, 'Azul', 678901234),
		(125, 'Producto 9-1', 21.99, 9, 14, 'Amarillo', 789012345), 
		(126, 'Producto 9-2', 31.99, 9, 16, 'Blanco', 890123456),  
		(127, 'Producto 9-3', 14.99, 9, 8, 'Azul', 901234567),
		(128, 'Producto 10-1', 25.99, 10, 10, 'Rojo', 112233445),  
		(129, 'Producto 10-2', 35.99, 10, 12, 'Verde', 223344556),  
		(130, 'Producto 10-3', 19.99, 10, 8, 'Azul', 334455667),
		(131, 'Producto 11-1', 20.99, 11, 14, 'Amarillo', 445566778), 
		(132, 'Producto 11-2', 30.99, 11, 16, 'Blanco', 556677889),
		(133, 'Producto 11-3', 15.99, 11, 8, 'Azul', 667788990),
		(134, 'Producto 12-1', 23.99, 12, 10, 'Rojo', 778899001),  
		(135, 'Producto 12-2', 33.99, 12, 12, 'Verde', 889900112),  
		(136, 'Producto 12-3', 17.99, 12, 8, 'Azul', 990011223),
		(137, 'Producto 13-1', 19.99, 13, 10, 'Rojo', 123456789),  
		(138, 'Producto 13-2', 29.99, 13, 12, 'Verde', 234567890),  
		(139, 'Producto 13-3', 14.99, 13, 8, 'Azul', 345678901),
		(140, 'Producto 14-1', 24.99, 14, 14, 'Amarillo', 456789012),  
		(141, 'Producto 14-2', 39.99, 14, 16, 'Blanco', 567890123),  
		(142, 'Producto 14-3', 9.99, 14, 6, 'Negro', 678901234),
		(143, 'Producto 15-1', 17.99, 15, 10, 'Rojo', 789012345),  
		(144, 'Producto 15-2', 27.99, 15, 12, 'Verde', 890123456), 
		(145, 'Producto 15-3', 12.99, 15, 8, 'Azul', 901234567),
		(146, 'Producto 16-1', 22.99, 16, 10, 'Rojo', 112233445),  
		(147, 'Producto 16-2', 32.99, 16, 12, 'Verde', 223344556),  
		(148, 'Producto 16-3', 16.99, 16, 8, 'Azul', 334455667),
		(149, 'Producto 17-1', 21.99, 17, 14, 'Amarillo', 445566778), 
		(150, 'Producto 17-2', 36.99, 17, 16, 'Blanco', 556677889), 
		(151, 'Producto 17-3', 8.99, 17, 6, 'Negro', 667788990),
		(152, 'Producto 18-1', 18.99, 18, 10, 'Rojo', 778899001),  
		(153, 'Producto 18-2', 28.99, 18, 12, 'Verde', 889900112),  
		(154, 'Producto 18-3', 13.99, 18, 8, 'Azul', 990011223),
		(155, 'Producto 19-1', 20.99, 19, 14, 'Amarillo', 123456789),
		(156, 'Producto 19-2', 30.99, 19, 16, 'Blanco', 234567890), 
		(157, 'Producto 19-3', 15.99, 19, 8, 'Azul', 345678901),
		(158, 'Producto 20-1', 23.99, 20, 10, 'Rojo', 456789012),  
		(159, 'Producto 20-2', 33.99, 20, 12, 'Verde', 567890123),  
		(160, 'Producto 20-3', 17.99, 20, 8, 'Azul', 678901234),
		(161, 'Producto 21-1', 21.99, 21, 14, 'Amarillo', 789012345),  
		(162, 'Producto 21-2', 31.99, 21, 16, 'Blanco', 890123456),  
		(163, 'Producto 21-3', 14.99, 21, 8, 'Azul', 901234567),
		(164, 'Producto 22-1', 25.99, 22, 10, 'Rojo', 112233445),  
		(165, 'Producto 22-2', 35.99, 22, 12, 'Verde', 223344556),  
		(166, 'Producto 22-3', 19.99, 22, 8, 'Azul', 334455667),
		(167, 'Producto 23-1', 20.99, 23, 14, 'Amarillo', 445566778),  
		(168, 'Producto 23-2', 30.99, 23, 16, 'Blanco', 556677889),  
		(169, 'Producto 23-3', 15.99, 23, 8, 'Azul', 667788990),
		(170, 'Producto 24-1', 18.99, 24, 10, 'Rojo', 778899001),  
		(171, 'Producto 24-2', 28.99, 24, 12, 'Verde', 889900112),  
		(172, 'Producto 24-3', 13.99, 24, 8, 'Azul', 990011223),
		(173, 'Producto 25-1', 20.99, 25, 14, 'Amarillo', 123456789),  
		(174, 'Producto 25-2', 30.99, 25, 16, 'Blanco', 234567890),  
		(175, 'Producto 25-3', 15.99, 25, 8, 'Azul', 345678901); 

--Llenado de tabla Cliente
	INSERT INTO Cliente (cedula, nombre, direccion, correo,id_tipo, id_distrito) VALUES
		(123456789, 'Cliente 1', 'Dirección 1', 'cliente1@example.com',1,12),
		(234567890, 'Cliente 2', 'Dirección 2', 'cliente2@example.com',1,2),
		(345678901, 'Cliente 3', 'Dirección 3', 'cliente3@example.com',2,8),
		(456789012, 'Cliente 4', 'Dirección 4', 'cliente4@example.com',1,37),
		(567890123, 'Cliente 5', 'Dirección 5', 'cliente5@example.com',2,13),
		(678901234, 'Cliente 6', 'Dirección 6', 'cliente6@example.com',2,15),
		(789012345, 'Cliente 7', 'Dirección 7', 'cliente7@example.com',1,29),
		(890123456, 'Cliente 8', 'Dirección 8', 'cliente8@example.com',1,34),
		(901234567, 'Cliente 9', 'Dirección 9', 'cliente9@example.com',1,13),
		(112233445, 'Cliente 10', 'Dirección 10', 'cliente10@example.com',2,19),
		(223344556, 'Cliente 11', 'Dirección 11', 'cliente11@example.com',2,65),
		(334455667, 'Cliente 12', 'Dirección 12', 'cliente12@example.com',2,15),
		(445566778, 'Cliente 13', 'Dirección 13', 'cliente13@example.com',1,58),
		(556677889, 'Cliente 14', 'Dirección 14', 'cliente14@example.com',2,50),
		(667788990, 'Cliente 15', 'Dirección 15', 'cliente15@example.com',1,36),
		(778899001, 'Cliente 16', 'Dirección 16', 'cliente16@example.com',2,47),
		(889900112, 'Cliente 17', 'Dirección 17', 'cliente17@example.com',1,53),
		(990011223, 'Cliente 18', 'Dirección 18', 'cliente18@example.com',1,52),
		(101122334, 'Cliente 19', 'Dirección 19', 'cliente19@example.com',1,62),
		(202233445, 'Cliente 20', 'Dirección 20', 'cliente20@example.com',2,70);

--Llenado de tabla Factura: los datos de tipo DATE deben ir entre comillas.
	INSERT INTO Factura (cedula, fecha) VALUES
		(123456789, '2023-01-05'),
		(234567890, '2023-02-10'),
		(345678901, '2023-03-15'),
		(456789012, '2023-04-20'),
		(567890123, '2023-05-25'),
		(678901234, '2023-06-30'),
		(789012345, '2023-07-05'),
		(890123456, '2023-08-10'),
		(901234567, '2023-09-15'),
		(112233445, '2023-10-20'),
		(223344556, '2023-11-25'),
		(334455667, '2023-12-30'),
		(445566778, '2023-01-02'),
		(556677889, '2023-02-07'),
		(667788990, '2023-03-12'),
		(778899001, '2023-04-17'),
		(889900112, '2023-05-22'),
		(990011223, '2023-06-27'),
		(101122334, '2023-07-03'),
		(202233445, '2023-08-08'),
		(123456789, '2023-09-13'),
		(234567890, '2023-10-18'),
		(345678901, '2023-11-23'),
		(456789012, '2023-12-28'),
		(567890123, '2023-01-03'),
		(678901234, '2023-02-08'),
		(789012345, '2023-03-15'),
		(890123456, '2023-04-20'),
		(901234567, '2023-05-25'),
		(112233445, '2023-06-30'),
		(223344556, '2023-07-05'),
		(334455667, '2023-08-10'),
		(445566778, '2023-09-15'),
		(556677889, '2023-10-20'),
		(667788990, '2023-11-25'),
		(778899001, '2023-12-30'),
		(889900112, '2023-01-02'),
		(990011223, '2023-02-07'),
		(101122334, '2023-03-12'),
		(202233445, '2023-04-17'),
		(123456789, '2023-05-22'),
		(234567890, '2023-06-27'),
		(345678901, '2023-07-03'),
		(456789012, '2023-08-08'),
		(567890123, '2023-09-13'),
		(678901234, '2023-10-18'),
		(789012345, '2023-11-23'),
		(890123456, '2023-12-28'),
		(445566778, '2023-02-02'),
		(556677889, '2023-03-07'),
		(667788990, '2023-04-12'),
		(778899001, '2023-05-17'),
		(889900112, '2023-06-22'),
		(990011223, '2023-07-27'),
		(101122334, '2023-08-03'),
		(202233445, '2023-09-08'),
		(123456789, '2023-10-13'),
		(234567890, '2023-11-18'),
		(345678901, '2023-12-23'),
		(456789012, '2023-01-28')

--Llenado de tabla productofactura
	INSERT INTO productofactura (id_factura, consecutivo, cantidad,porcimpuesto,porcdescuento) VALUES
		(1, 1, 1,13,0),
		(2, 2, 1,13,0),
		(3, 3, 1,13,5),
		(4, 4, 1,13,0),
		(5, 5, 1,13,0),
		(6, 6, 1,5,0),
		(6, 7, 1,13,0),
		(7, 8, 1,13,0),
		(8, 9, 2,13,5),
		(9, 10, 1,13,0),
		(10, 11, 1,5,5),
		(11, 12, 1,13,0),
		(11, 13, 2,13,0),
		(12, 14, 1,13,0),
		(13, 15, 1,13,0),
		(14, 16, 1,13,0),
		(15, 17, 2,13,5),
		(16, 18, 1,13,0),
		(16, 19, 1,13,0),
		(17, 20, 1,13,0),
		(18, 21, 1,5,0),
		(19, 22, 1,13,0),
		(20, 23, 1,13,5),
		(21, 24, 1,13,0),
		(22, 25, 2,13,0),
		(22, 26, 1,13,0),
		(23, 27, 1,13,0),
		(24, 28, 1,13,0),
		(25, 29, 1,13,0),
		(26, 30, 1,13,0),
		(26, 31, 1,13,0),
		(27, 32, 1,5,0),
		(28, 33, 1,13,5),
		(29, 34, 2,5,5),
		(30, 35, 1,13,0),
		(31, 36, 1,13,5),
		(31, 37, 1,13,0),
		(32, 38, 1,13,5),
		(33, 39, 1,13,0),
		(34, 40, 1,13,0),
		(35, 41, 1,13,0),
		(36, 42, 1,13,0),
		(36, 43, 1,13,5),
		(37, 44, 1,13,0),
		(38, 45, 1,13,0),
		(39, 46, 1,13,0),
		(40, 47, 1,13,0),
		(41, 48, 1,5,0),
		(41, 49, 1,5,0),
		(42, 50, 2,13,5),
		(43, 51, 2,13,0),
		(44, 52, 1,13,0),
		(45, 53, 1,13,0),
		(46, 54, 1,13,0),
		(46, 55, 1,13,0),
		(47, 56, 1,13,0),
		(48, 57, 1,13,0),
		(49, 58, 1,13,0),
		(50, 59, 1,13,0),
		(51, 60, 1,13,5),
		(51, 61, 1,13,0),
		(52, 62, 1,13,0),
		(53, 63, 1,5,0),
		(54, 64, 1,13,0),
		(55, 65, 1,13,0),
		(56, 66, 2,13,0),
		(56, 67, 2,13,0),
		(57, 68, 1,5,0),
		(58, 69, 1,13,0),
		(59, 70, 1,13,5),
		(60, 71, 1,13,0);

