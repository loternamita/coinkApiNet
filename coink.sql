--
-- PostgreSQL database dump
--

-- Dumped from database version 15.5 (Ubuntu 15.5-0ubuntu0.23.04.1)
-- Dumped by pg_dump version 15.5 (Ubuntu 15.5-0ubuntu0.23.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: validardepartamento(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.validardepartamento(IN departamentoid integer)
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


ALTER PROCEDURE public.validardepartamento(IN departamentoid integer) OWNER TO postgres;

--
-- Name: validarmunicipio(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.validarmunicipio(IN municipioid integer)
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


ALTER PROCEDURE public.validarmunicipio(IN municipioid integer) OWNER TO postgres;

--
-- Name: validarpais(integer); Type: PROCEDURE; Schema: public; Owner: postgres
--

CREATE PROCEDURE public.validarpais(IN paisid integer)
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


ALTER PROCEDURE public.validarpais(IN paisid integer) OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamento_id integer NOT NULL,
    pais_id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_departamento_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamentos_departamento_id_seq OWNER TO postgres;

--
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_departamento_id_seq OWNED BY public.departamentos.departamento_id;


--
-- Name: municipios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipios (
    municipio_id integer NOT NULL,
    departamento_id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.municipios OWNER TO postgres;

--
-- Name: municipios_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipios_municipio_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipios_municipio_id_seq OWNER TO postgres;

--
-- Name: municipios_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipios_municipio_id_seq OWNED BY public.municipios.municipio_id;


--
-- Name: paises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.paises (
    pais_id integer NOT NULL,
    nombre character varying(255) NOT NULL
);


ALTER TABLE public.paises OWNER TO postgres;

--
-- Name: paises_pais_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.paises_pais_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paises_pais_id_seq OWNER TO postgres;

--
-- Name: paises_pais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.paises_pais_id_seq OWNED BY public.paises.pais_id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    usuario_id integer NOT NULL,
    nombre character varying(255) NOT NULL,
    telefono character varying(50),
    direccion character varying(255),
    pais_id integer NOT NULL,
    departamento_id integer NOT NULL,
    municipio_id integer NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_usuario_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.usuarios_usuario_id_seq OWNER TO postgres;

--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_usuario_id_seq OWNED BY public.usuarios.usuario_id;


--
-- Name: departamentos departamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN departamento_id SET DEFAULT nextval('public.departamentos_departamento_id_seq'::regclass);


--
-- Name: municipios municipio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios ALTER COLUMN municipio_id SET DEFAULT nextval('public.municipios_municipio_id_seq'::regclass);


--
-- Name: paises pais_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises ALTER COLUMN pais_id SET DEFAULT nextval('public.paises_pais_id_seq'::regclass);


--
-- Name: usuarios usuario_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN usuario_id SET DEFAULT nextval('public.usuarios_usuario_id_seq'::regclass);


--
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (departamento_id, pais_id, nombre) FROM stdin;
1	1	Atlántico
2	1	Bolívar
3	1	Cesar
4	1	Córdoba
5	1	Bogotá
\.


--
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.municipios (municipio_id, departamento_id, nombre) FROM stdin;
1	1	Medellin
2	4	Montería
3	5	Bogota
4	2	El Guamo
5	3	Valledupar
\.


--
-- Data for Name: paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.paises (pais_id, nombre) FROM stdin;
1	Colombia
2	Argentina
3	Bolivia
4	Mexico
5	Espana
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usuario_id, nombre, telefono, direccion, pais_id, departamento_id, municipio_id) FROM stdin;
2	Camilo	3162220267	calle 70 d bis # 113-60	1	1	1
\.


--
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_departamento_id_seq', 1, false);


--
-- Name: municipios_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipios_municipio_id_seq', 1, false);


--
-- Name: paises_pais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.paises_pais_id_seq', 1, false);


--
-- Name: usuarios_usuario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_usuario_id_seq', 3, true);


--
-- Name: departamentos departamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (departamento_id);


--
-- Name: municipios municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT municipios_pkey PRIMARY KEY (municipio_id);


--
-- Name: paises paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.paises
    ADD CONSTRAINT paises_pkey PRIMARY KEY (pais_id);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (usuario_id);


--
-- Name: municipios fk_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT fk_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id) ON DELETE CASCADE;


--
-- Name: departamentos fk_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT fk_pais FOREIGN KEY (pais_id) REFERENCES public.paises(pais_id) ON DELETE CASCADE;


--
-- Name: usuarios fk_usuario_departamento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_departamento FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id);


--
-- Name: usuarios fk_usuario_municipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_municipio FOREIGN KEY (municipio_id) REFERENCES public.municipios(municipio_id);


--
-- Name: usuarios fk_usuario_pais; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuario_pais FOREIGN KEY (pais_id) REFERENCES public.paises(pais_id);


--
-- PostgreSQL database dump complete
--

