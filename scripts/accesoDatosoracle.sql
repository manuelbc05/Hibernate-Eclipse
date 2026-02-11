-- =========================
-- CREAR TABLAS
-- =========================

CREATE TABLE Tiendas (
    id_tienda NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    direccion VARCHAR2(200) NOT NULL,
    telefono VARCHAR2(20),
    correo VARCHAR2(100)
);

CREATE TABLE Empleados (
    id_empleado NUMBER PRIMARY KEY,
    nombre VARCHAR2(100) NOT NULL,
    apellidos VARCHAR2(150) NOT NULL,
    nif VARCHAR2(20) UNIQUE NOT NULL,
    telefono VARCHAR2(20),
    correo VARCHAR2(100),
    puesto VARCHAR2(50),
    salario NUMBER(10,2),
    id_tienda NUMBER,
    FOREIGN KEY(id_tienda) REFERENCES Tiendas(id_tienda)
);

CREATE TABLE Clientes (
    id_cliente NUMBER PRIMARY KEY,
    nombre_completo VARCHAR2(200) NOT NULL,
    nif_cif VARCHAR2(20) UNIQUE NOT NULL,
    telefono VARCHAR2(20),
    correo VARCHAR2(100),
    ciudad VARCHAR2(100)
);

CREATE TABLE Proveedores (
    id_proveedor NUMBER PRIMARY KEY,
    nombre VARCHAR2(150) NOT NULL,
    nif_cif VARCHAR2(20) UNIQUE NOT NULL,
    telefono VARCHAR2(20),
    correo VARCHAR2(100),
    direccion VARCHAR2(200)
);

CREATE TABLE Articulos (
    id_articulo NUMBER PRIMARY KEY,
    nombre VARCHAR2(150) NOT NULL,
    categoria VARCHAR2(50),
    precio NUMBER(10,2),
    stock NUMBER,
    id_proveedor NUMBER,
    FOREIGN KEY(id_proveedor) REFERENCES Proveedores(id_proveedor)
);

CREATE TABLE Pedidos (
    id_pedido NUMBER PRIMARY KEY,
    id_cliente NUMBER,
    id_empleado NUMBER,
    id_tienda NUMBER,
    fecha DATE,
    estado VARCHAR2(50),
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY(id_tienda) REFERENCES Tiendas(id_tienda)
);

CREATE TABLE LineasPedido (
    id_linea NUMBER PRIMARY KEY,
    id_pedido NUMBER,
    id_articulo NUMBER,
    cantidad NUMBER,
    precio_unitario NUMBER(10,2),
    FOREIGN KEY(id_pedido) REFERENCES Pedidos(id_pedido),
    FOREIGN KEY(id_articulo) REFERENCES Articulos(id_articulo)
);

CREATE TABLE Reparaciones (
    id_reparacion NUMBER PRIMARY KEY,
    id_cliente NUMBER,
    id_empleado NUMBER,
    id_tienda NUMBER,
    fecha_entrada DATE,
    fecha_salida DATE,
    descripcion VARCHAR2(300),
    diagnostico VARCHAR2(300),
    coste_mano_obra NUMBER(10,2),
    estado VARCHAR2(50),
    FOREIGN KEY(id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY(id_empleado) REFERENCES Empleados(id_empleado),
    FOREIGN KEY(id_tienda) REFERENCES Tiendas(id_tienda)
);

-- -------------------------------------------
-- Puta mierda
-- -------------------------------------------

-- 1. Tiendas
INSERT INTO tiendas (id_tienda, nombre, direccion, telefono, correo) VALUES
(1, 'Pc Componentes', 'Online Plaza, Madrid', '966666666', 'uno@pccomponentes.com');
INSERT INTO tiendas (id_tienda, nombre, direccion, telefono, correo) VALUES
(2, 'Pc Componentes dos', 'Sol, Madrid', '977777777', 'dos@pccomponentes.com');

-- 2. Proveedores
INSERT INTO proveedores (id_proveedor, nombre, nif_cif, telefono, correo, direccion) VALUES
(1, 'Mbr S.L', 'M11111111', '912345678', 'contacto@mbr.com', 'C/ Frambuesa, Huelva');
INSERT INTO proveedores (id_proveedor, nombre, nif_cif, telefono, correo, direccion) VALUES
(2, 'Mike Wheeler', 'M22222222', '987654321', 'mike@wheeler.com', 'C/ Carteles, Madrid');
INSERT INTO proveedores (id_proveedor, nombre, nif_cif, telefono, correo, direccion) VALUES
(3, 'Pourtugueis', 'P33333333', '987651234', 'cr@pourtugueis.com', 'C/ Microchips, Madrid');
INSERT INTO proveedores (id_proveedor, nombre, nif_cif, telefono, correo, direccion) VALUES
(4, 'Nancy', 'N44444444', '912348765', 'wheel@nancy.com', 'C/ Componentes, Madrid');
INSERT INTO proveedores (id_proveedor, nombre, nif_cif, telefono, correo, direccion) VALUES
(5, 'Joyce', 'J55555555', '932654321', 'luces@joyce.com', 'C/ LucesNavidad, Madrid');

-- 3. Clientes
INSERT INTO clientes (id_cliente, nombre_completo, nif_cif, telefono, correo, ciudad) VALUES
(1, 'Gonzalo Bravo', '11111111G', '655555555', 'gonzalo@gmail.com', 'Badajoz');
INSERT INTO clientes (id_cliente, nombre_completo, nif_cif, telefono, correo, ciudad) VALUES
(2, 'Martin Garcia', '22222222M', '600000006', 'martin@gmail.com', 'Toledo');
INSERT INTO clientes (id_cliente, nombre_completo, nif_cif, telefono, correo, ciudad) VALUES
(3, 'Isabel Gonzalez', '33333333I', '677777777', 'isabel@gmail.com', 'Madrid');
INSERT INTO clientes (id_cliente, nombre_completo, nif_cif, telefono, correo, ciudad) VALUES
(4, 'Daniela Ibai', '44444444D', '688888888', 'daniela@gmail.com', 'Madrid');
INSERT INTO clientes (id_cliente, nombre_completo, nif_cif, telefono, correo, ciudad) VALUES
(5, 'Soledad Vega', '55555555E', '699999999', 'soledad@gmail.com', 'Cuenca');

-- 4. Empleados
INSERT INTO empleados (id_empleado, nombre, apellidos, nif, telefono, correo, puesto, salario, id_tienda) VALUES
(1, 'Manuel', 'Bravo Candilejo', '80371234A', '600000000', 'manuel.bravo@gmail.com', 'Técnico', 1, 1);
INSERT INTO empleados (id_empleado, nombre, apellidos, nif, telefono, correo, puesto, salario, id_tienda) VALUES
(2, 'Ariadne', 'Garcia Nikolaeva', '23456789M', '611111111', 'ariadne.garcia@gmail.com', 'Técnico', 2000, 2);
INSERT INTO empleados (id_empleado, nombre, apellidos, nif, telefono, correo, puesto, salario, id_tienda) VALUES
(3, 'Nieves', 'Peña Aranda', '01239774N', '622222222', 'nieves.peña@gmail.com', 'Vendedora', 1800, 1);
INSERT INTO empleados (id_empleado, nombre, apellidos, nif, telefono, correo, puesto, salario, id_tienda) VALUES
(4, 'Pedro', 'Garcia Lopez', '37164838P', '633333333', 'pedro.garcia@gmail.com', 'Vendedor', 1800, 2);
INSERT INTO empleados (id_empleado, nombre, apellidos, nif, telefono, correo, puesto, salario, id_tienda) VALUES
(5, 'Sofia', 'Manolova Boroga', 'X2000280Z', '644444444', 'sofia.manolova@gmail.com', 'Gerente', 2500, 1);

-- 5. Artículos
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(1, 'Teclado logitech razer', 'Periféricos', 250, 50, 1);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(2, 'Ratón NewSkill Patuski', 'Periféricos', 45, 10, 2);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(3, 'Lenovo" Sobremesa', 'Procesadores', 1000, 35, 5);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(4, 'Monitor lenovo" hurra', 'Pantallas', 220, 10, 3);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(5, 'Disco HDD', 'Almacenamiento', 60, 30, 4);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(6, 'Disco SSD 1TB', 'Almacenamiento', 190, 20, 4);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(7, 'CPU Ryzen', 'Procesadores', 180, 22, 5);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(8, 'CPU Intel', 'Procesadores', 200, 44, 5);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(9, 'Radeon', 'Componentes', 150, 25, 1);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(10, 'Nvidia', 'Componentes', 500, 18, 2);
INSERT INTO articulos (id_articulo, nombre, categoria, precio, stock, id_proveedor) VALUES
(11, 'Paco', 'Meme', 100.10, 10, 4);

-- 6. Pedidos
INSERT INTO pedidos (id_pedido, id_cliente, id_empleado, id_tienda, fecha, estado) VALUES
(1, 1, 1, 1, TO_DATE('2025-01-10','YYYY-MM-DD'), 'Procesando');
INSERT INTO pedidos (id_pedido, id_cliente, id_empleado, id_tienda, fecha, estado) VALUES
(2, 3, 4, 2, TO_DATE('2025-01-14','YYYY-MM-DD'), 'Enviado');
INSERT INTO pedidos (id_pedido, id_cliente, id_empleado, id_tienda, fecha, estado) VALUES
(3, 4, 2, 1, TO_DATE('2025-01-16','YYYY-MM-DD'), 'Entregado');

-- 7. LineasPedido
INSERT INTO lineaspedido (id_linea, id_pedido, id_articulo, cantidad, precio_unitario) VALUES
(1, 1, 1, 1, 250);
INSERT INTO lineaspedido (id_linea, id_pedido, id_articulo, cantidad, precio_unitario) VALUES
(2, 1, 10, 1, 65);
INSERT INTO lineaspedido (id_linea, id_pedido, id_articulo, cantidad, precio_unitario) VALUES
(3, 2, 2, 1, 45);
INSERT INTO lineaspedido (id_linea, id_pedido, id_articulo, cantidad, precio_unitario) VALUES
(4, 2, 5, 1, 60);
INSERT INTO lineaspedido (id_linea, id_pedido, id_articulo, cantidad, precio_unitario) VALUES
(5, 3, 7, 1, 180);
INSERT INTO lineaspedido (id_linea, id_pedido, id_articulo, cantidad, precio_unitario) VALUES
(6, 3, 9, 1, 150);

-- 8. Reparaciones
INSERT INTO reparaciones (id_reparacion, id_cliente, id_empleado, id_tienda, fecha_entrada, fecha_salida, descripcion, diagnostico, coste_mano_obra, estado) VALUES
(1, 1, 2, 1, TO_DATE('2025-01-05','YYYY-MM-DD'), NULL, 'Sobremesa no enciende', 'Posible fallo en fuente de alimentación', 45, 'En proceso');
INSERT INTO reparaciones (id_reparacion, id_cliente, id_empleado, id_tienda, fecha_entrada, fecha_salida, descripcion, diagnostico, coste_mano_obra, estado) VALUES
(2, 3, 4, 2, TO_DATE('2025-01-08','YYYY-MM-DD'), NULL, 'Ruido interno', 'Pendiente de diagnóstico', 0, 'Pendiente');
INSERT INTO reparaciones (id_reparacion, id_cliente, id_empleado, id_tienda, fecha_entrada, fecha_salida, descripcion, diagnostico, coste_mano_obra, estado) VALUES
(3, 4, 2, 1, TO_DATE('2025-01-03','YYYY-MM-DD'), TO_DATE('2025-01-07','YYYY-MM-DD'), 'Cambio de batería', 'Reparación completada', 30, 'Finalizada');

