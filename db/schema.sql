DROP TABLE IF EXISTS detalle_pedido;
DROP TABLE IF EXISTS pedidos;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;

CREATE TABLE categorias (
    id      SERIAL PRIMARY KEY,
    nombre  VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE productos (
    id            SERIAL PRIMARY KEY,
    nombre        VARCHAR(150) NOT NULL,
    categoria_id  INT NOT NULL,
    precio        NUMERIC(10,2) NOT NULL CHECK (precio >= 0),
    stock         INT NOT NULL DEFAULT 0 CHECK (stock >= 0),
    CONSTRAINT fk_producto_categoria
        FOREIGN KEY (categoria_id) REFERENCES categorias(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE clientes (
    id        SERIAL PRIMARY KEY,
    nombre    VARCHAR(150) NOT NULL,
    telefono  VARCHAR(30),
    email     VARCHAR(150) NOT NULL UNIQUE
);

CREATE TABLE pedidos (
    id          SERIAL PRIMARY KEY,
    cliente_id  INT NOT NULL,
    fecha       DATE NOT NULL DEFAULT CURRENT_DATE,
    estado      VARCHAR(30) NOT NULL DEFAULT 'pendiente',
    CONSTRAINT fk_pedido_cliente
        FOREIGN KEY (cliente_id) REFERENCES clientes(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE detalle_pedido (
    id              SERIAL PRIMARY KEY,
    pedido_id       INT NOT NULL,
    producto_id     INT NOT NULL,
    cantidad        INT NOT NULL CHECK (cantidad > 0),
    precio_unitario NUMERIC(10,2) NOT NULL CHECK (precio_unitario >= 0),
    CONSTRAINT fk_detalle_pedido
        FOREIGN KEY (pedido_id) REFERENCES pedidos(id)
        ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT fk_detalle_producto
        FOREIGN KEY (producto_id) REFERENCES productos(id)
        ON UPDATE CASCADE ON DELETE CASCADE
);