-- Creación de la tabla para Países
CREATE TABLE paises (
    pais_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL
);

-- Creación de la tabla para Departamentos
CREATE TABLE departamentos (
    departamento_id SERIAL PRIMARY KEY,
    pais_id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT fk_pais
        FOREIGN KEY(pais_id) 
        REFERENCES paises(pais_id)
        ON DELETE CASCADE
);

-- Creación de la tabla para Municipios
CREATE TABLE municipios (
    municipio_id SERIAL PRIMARY KEY,
    departamento_id INT NOT NULL,
    nombre VARCHAR(255) NOT NULL,
    CONSTRAINT fk_departamento
        FOREIGN KEY(departamento_id) 
        REFERENCES departamentos(departamento_id)
        ON DELETE CASCADE
);

-- Creación de la tabla para Usuarios
CREATE TABLE usuarios (
    usuario_id SERIAL PRIMARY KEY,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(50),
    direccion VARCHAR(255),
    pais_id INT NOT NULL,
    departamento_id INT NOT NULL,
    municipio_id INT NOT NULL,
    CONSTRAINT fk_usuario_pais
        FOREIGN KEY(pais_id) 
        REFERENCES paises(pais_id),
    CONSTRAINT fk_usuario_departamento
        FOREIGN KEY(departamento_id) 
        REFERENCES departamentos(departamento_id),
    CONSTRAINT fk_usuario_municipio
        FOREIGN KEY(municipio_id) 
        REFERENCES municipios(municipio_id)
);


-- Stored Procedure para validar el país
CREATE OR REPLACE PROCEDURE ValidarPais(paisId int)
LANGUAGE plpgsql
AS $$
DECLARE
    paisExiste BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM paises WHERE pais_id = paisId) INTO paisExiste;
    IF NOT paisExiste THEN
        RAISE EXCEPTION 'El país no existe.';
    END IF;
END;
$$;

-- Stored Procedure para validar el departamento
CREATE OR REPLACE PROCEDURE ValidarDepartamento(departamentoId int)
LANGUAGE plpgsql
AS $$
DECLARE
    departamentoExiste BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM departamentos WHERE departamento_id = departamentoId) INTO departamentoExiste;
    IF NOT departamentoExiste THEN
        RAISE EXCEPTION 'El departamento no existe.';
    END IF;
END;
$$;

-- Stored Procedure para validar el departamento
CREATE OR REPLACE PROCEDURE ValidarMunicipio(municipioId int)
LANGUAGE plpgsql
AS $$
DECLARE
    municipioExiste BOOLEAN;
BEGIN
    SELECT EXISTS(SELECT 1 FROM municipios WHERE municipio_id = municipioId) INTO municipioExiste;
    IF NOT municipioExiste THEN
        RAISE EXCEPTION 'El municipio no existe.';
    END IF;
END;
$$;





