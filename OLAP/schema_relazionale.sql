--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.2
-- Dumped by pg_dump version 9.5.2

-- Started on 2016-05-12 15:43:06 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 8 (class 2615 OID 16802)
-- Name: ava; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ava;


ALTER SCHEMA ava OWNER TO postgres;

--
-- TOC entry 1 (class 3079 OID 12397)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2229 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = ava, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 183 (class 1259 OID 16927)
-- Name: anno_accademico; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE anno_accademico (
    k_anno_accademico integer NOT NULL,
    nome_a_acc text
);


ALTER TABLE anno_accademico OWNER TO postgres;

--
-- TOC entry 182 (class 1259 OID 16925)
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE anno_accademico_k_anno_accademico_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE anno_accademico_k_anno_accademico_seq OWNER TO postgres;

--
-- TOC entry 2230 (class 0 OID 0)
-- Dependencies: 182
-- Name: anno_accademico_k_anno_accademico_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE anno_accademico_k_anno_accademico_seq OWNED BY anno_accademico.k_anno_accademico;


--
-- TOC entry 185 (class 1259 OID 16938)
-- Name: corso; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE corso (
    k_corso integer NOT NULL,
    nome_corso text,
    ssd text,
    codice_corso text,
    numero_crediti_corso integer
);


ALTER TABLE corso OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16949)
-- Name: corso_di_studi; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE corso_di_studi (
    k_corso_di_studi integer NOT NULL,
    tipo_cds text,
    codice_ateneo text,
    nome_dipartimento text,
    ha_numero_programmato boolean,
    durata_legale integer,
    numero_programmato integer,
    codice_dipartimento text,
    nome_cds text,
    codice_corso_di_studi text,
    data_inizio_validita integer
);


ALTER TABLE corso_di_studi OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 16947)
-- Name: corso_di_studi_k_corso_di_studi_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE corso_di_studi_k_corso_di_studi_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_di_studi_k_corso_di_studi_seq OWNER TO postgres;

--
-- TOC entry 2231 (class 0 OID 0)
-- Dependencies: 186
-- Name: corso_di_studi_k_corso_di_studi_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE corso_di_studi_k_corso_di_studi_seq OWNED BY corso_di_studi.k_corso_di_studi;


--
-- TOC entry 184 (class 1259 OID 16936)
-- Name: corso_k_corso_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE corso_k_corso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE corso_k_corso_seq OWNER TO postgres;

--
-- TOC entry 2232 (class 0 OID 0)
-- Dependencies: 184
-- Name: corso_k_corso_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE corso_k_corso_seq OWNED BY corso.k_corso;


--
-- TOC entry 189 (class 1259 OID 16961)
-- Name: data; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE data (
    k_data integer NOT NULL,
    giorno integer,
    mese integer,
    anno integer
);


ALTER TABLE data OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16959)
-- Name: data_k_data_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE data_k_data_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE data_k_data_seq OWNER TO postgres;

--
-- TOC entry 2233 (class 0 OID 0)
-- Dependencies: 188
-- Name: data_k_data_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE data_k_data_seq OWNED BY data.k_data;


--
-- TOC entry 194 (class 1259 OID 17009)
-- Name: esami; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE esami (
    k_corso_di_studi integer NOT NULL,
    k_studente integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_corso integer NOT NULL,
    k_data integer NOT NULL,
    voto integer,
    cfu_acquisiti integer
);


ALTER TABLE esami OWNER TO postgres;

--
-- TOC entry 195 (class 1259 OID 17034)
-- Name: ingressi; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE ingressi (
    k_studente integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_tipo_immatricolazione integer NOT NULL,
    k_data integer DEFAULT ((0 - 0) - 0) NOT NULL,
    punteggio_test integer,
    immatricolato boolean,
    k_data_nascita integer NOT NULL
);


ALTER TABLE ingressi OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 17065)
-- Name: lauree; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE lauree (
    k_data integer NOT NULL,
    k_anno_accademico integer NOT NULL,
    k_studente integer NOT NULL,
    k_corso_di_studi integer NOT NULL,
    voto text
);


ALTER TABLE lauree OWNER TO postgres;

--
-- TOC entry 191 (class 1259 OID 16989)
-- Name: studente; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE studente (
    k_studente integer NOT NULL,
    data_nascita date,
    voto_maturita text,
    cf text,
    coorte text,
    stato_residenza text,
    comune_residenza text,
    titolo_diploma text,
    nazione_diploma text,
    regione_residenza text,
    provincia_residenza text,
    anno_diploma text,
    tipo_scuola_superiore text,
    istituto_scuola_superiore text,
    sesso text,
    cittadinanza text
);


ALTER TABLE studente OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16987)
-- Name: studente_k_studente_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE studente_k_studente_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE studente_k_studente_seq OWNER TO postgres;

--
-- TOC entry 2234 (class 0 OID 0)
-- Dependencies: 190
-- Name: studente_k_studente_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE studente_k_studente_seq OWNED BY studente.k_studente;


--
-- TOC entry 193 (class 1259 OID 17000)
-- Name: tipo_immatricolazione; Type: TABLE; Schema: ava; Owner: postgres
--

CREATE TABLE tipo_immatricolazione (
    k_tipo_immatricolazione integer NOT NULL,
    tipo_immatricolazione text,
    cod_tipo_immatricolazione text
);


ALTER TABLE tipo_immatricolazione OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 16998)
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE; Schema: ava; Owner: postgres
--

CREATE SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNER TO postgres;

--
-- TOC entry 2235 (class 0 OID 0)
-- Dependencies: 192
-- Name: tipo_immatricolazione_k_tipo_immatricolazione_seq; Type: SEQUENCE OWNED BY; Schema: ava; Owner: postgres
--

ALTER SEQUENCE tipo_immatricolazione_k_tipo_immatricolazione_seq OWNED BY tipo_immatricolazione.k_tipo_immatricolazione;


--
-- TOC entry 2070 (class 2604 OID 16930)
-- Name: k_anno_accademico; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY anno_accademico ALTER COLUMN k_anno_accademico SET DEFAULT nextval('anno_accademico_k_anno_accademico_seq'::regclass);


--
-- TOC entry 2071 (class 2604 OID 16941)
-- Name: k_corso; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso ALTER COLUMN k_corso SET DEFAULT nextval('corso_k_corso_seq'::regclass);


--
-- TOC entry 2072 (class 2604 OID 16952)
-- Name: k_corso_di_studi; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi ALTER COLUMN k_corso_di_studi SET DEFAULT nextval('corso_di_studi_k_corso_di_studi_seq'::regclass);


--
-- TOC entry 2073 (class 2604 OID 16964)
-- Name: k_data; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY data ALTER COLUMN k_data SET DEFAULT nextval('data_k_data_seq'::regclass);


--
-- TOC entry 2074 (class 2604 OID 16992)
-- Name: k_studente; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY studente ALTER COLUMN k_studente SET DEFAULT nextval('studente_k_studente_seq'::regclass);


--
-- TOC entry 2075 (class 2604 OID 17003)
-- Name: k_tipo_immatricolazione; Type: DEFAULT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione ALTER COLUMN k_tipo_immatricolazione SET DEFAULT nextval('tipo_immatricolazione_k_tipo_immatricolazione_seq'::regclass);


--
-- TOC entry 2078 (class 2606 OID 16935)
-- Name: anno_accademico_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY anno_accademico
    ADD CONSTRAINT anno_accademico_pkey PRIMARY KEY (k_anno_accademico);


--
-- TOC entry 2082 (class 2606 OID 16957)
-- Name: corso_di_studi_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso_di_studi
    ADD CONSTRAINT corso_di_studi_pkey PRIMARY KEY (k_corso_di_studi);


--
-- TOC entry 2080 (class 2606 OID 16946)
-- Name: corso_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY corso
    ADD CONSTRAINT corso_pkey PRIMARY KEY (k_corso);


--
-- TOC entry 2084 (class 2606 OID 16966)
-- Name: data_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY data
    ADD CONSTRAINT data_pkey PRIMARY KEY (k_data);


--
-- TOC entry 2090 (class 2606 OID 17013)
-- Name: esami_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_pkey PRIMARY KEY (k_corso_di_studi, k_studente, k_anno_accademico, k_corso, k_data);


--
-- TOC entry 2092 (class 2606 OID 17039)
-- Name: ingressi_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_pkey PRIMARY KEY (k_studente, k_corso_di_studi, k_anno_accademico, k_tipo_immatricolazione, k_data, k_data_nascita);


--
-- TOC entry 2094 (class 2606 OID 17072)
-- Name: lauree_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_pkey PRIMARY KEY (k_data, k_anno_accademico, k_studente, k_corso_di_studi);


--
-- TOC entry 2086 (class 2606 OID 16997)
-- Name: studente_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY studente
    ADD CONSTRAINT studente_pkey PRIMARY KEY (k_studente);


--
-- TOC entry 2088 (class 2606 OID 17008)
-- Name: tipo_immatricolazione_pkey; Type: CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY tipo_immatricolazione
    ADD CONSTRAINT tipo_immatricolazione_pkey PRIMARY KEY (k_tipo_immatricolazione);


--
-- TOC entry 2095 (class 2606 OID 17014)
-- Name: esami_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2096 (class 2606 OID 17019)
-- Name: esami_k_corso_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_corso_fkey FOREIGN KEY (k_corso) REFERENCES corso(k_corso) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2097 (class 2606 OID 17024)
-- Name: esami_k_data_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_data_fkey FOREIGN KEY (k_data) REFERENCES data(k_data) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2098 (class 2606 OID 17029)
-- Name: esami_k_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY esami
    ADD CONSTRAINT esami_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2099 (class 2606 OID 17040)
-- Name: ingressi_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2100 (class 2606 OID 17045)
-- Name: ingressi_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2101 (class 2606 OID 17050)
-- Name: ingressi_k_data_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_data_fkey FOREIGN KEY (k_data) REFERENCES data(k_data) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2102 (class 2606 OID 17055)
-- Name: ingressi_k_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 2103 (class 2606 OID 17060)
-- Name: ingressi_k_tipo_immatricolazione_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY ingressi
    ADD CONSTRAINT ingressi_k_tipo_immatricolazione_fkey FOREIGN KEY (k_tipo_immatricolazione) REFERENCES tipo_immatricolazione(k_tipo_immatricolazione) ON UPDATE SET NULL ON DELETE SET NULL;


--
-- TOC entry 2104 (class 2606 OID 17073)
-- Name: lauree_k_anno_accademico_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_anno_accademico_fkey FOREIGN KEY (k_anno_accademico) REFERENCES anno_accademico(k_anno_accademico) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2105 (class 2606 OID 17078)
-- Name: lauree_k_corso_di_studi_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_corso_di_studi_fkey FOREIGN KEY (k_corso_di_studi) REFERENCES corso_di_studi(k_corso_di_studi) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2106 (class 2606 OID 17083)
-- Name: lauree_k_data_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_data_fkey FOREIGN KEY (k_data) REFERENCES data(k_data) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2107 (class 2606 OID 17088)
-- Name: lauree_k_studente_fkey; Type: FK CONSTRAINT; Schema: ava; Owner: postgres
--

ALTER TABLE ONLY lauree
    ADD CONSTRAINT lauree_k_studente_fkey FOREIGN KEY (k_studente) REFERENCES studente(k_studente) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 2228 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2016-05-12 15:43:07 CEST

--
-- PostgreSQL database dump complete
--

