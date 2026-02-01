-- Crear base de datos
CREATE DATABASE IF NOT EXISTS AlkeWallet;
USE AlkeWallet;


-- Tabla Usuario
-- ===============================
CREATE TABLE usuario (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo_electronico VARCHAR(150) NOT NULL UNIQUE,
    contrasena VARCHAR(100) NOT NULL,
    saldo DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    fecha_creacion DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- ===============================
-- Tabla Moneda
-- ===============================
CREATE TABLE moneda (
    currency_id INT AUTO_INCREMENT PRIMARY KEY,
    currency_name VARCHAR(50) NOT NULL,
    currency_symbol VARCHAR(10) NOT NULL
);

-- ===============================
-- Tabla Transaccion
-- ===============================
CREATE TABLE transaccion (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    sender_user_id INT NOT NULL,
    receiver_user_id INT NOT NULL,
    currency_id INT NOT NULL,
    importe DECIMAL(10,2) NOT NULL,
    transaction_date DATETIME NOT NULL,
    FOREIGN KEY (sender_user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (receiver_user_id) REFERENCES usuario(user_id),
    FOREIGN KEY (currency_id) REFERENCES moneda(currency_id)
);
