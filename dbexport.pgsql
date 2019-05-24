--
-- PostgreSQL database dump
--

-- Dumped from database version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.8 (Ubuntu 10.8-0ubuntu0.18.04.1)

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: note; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.note (
    id bigint NOT NULL,
    content text,
    title character varying(255),
    author_id bigint
);


ALTER TABLE public.note OWNER TO example;

--
-- Name: note_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.note_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.note_id_seq OWNER TO example;

--
-- Name: note_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.note_id_seq OWNED BY public.note.id;


--
-- Name: privilege; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.privilege (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.privilege OWNER TO example;

--
-- Name: privilege_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.privilege_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.privilege_id_seq OWNER TO example;

--
-- Name: privilege_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.privilege_id_seq OWNED BY public.privilege.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    name character varying(255)
);


ALTER TABLE public.role OWNER TO example;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO example;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.role_id_seq OWNED BY public.role.id;


--
-- Name: role_privileges; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.role_privileges (
    role_id bigint NOT NULL,
    privilege_id bigint NOT NULL
);


ALTER TABLE public.role_privileges OWNER TO example;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.user_roles (
    user_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE public.user_roles OWNER TO example;

--
-- Name: users; Type: TABLE; Schema: public; Owner: example
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    account_non_expired boolean NOT NULL,
    account_non_locked boolean NOT NULL,
    credentials_non_expired boolean NOT NULL,
    email character varying(255),
    enabled boolean NOT NULL,
    login character varying(255),
    password character varying(255)
);


ALTER TABLE public.users OWNER TO example;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: example
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO example;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: example
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: note id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.note ALTER COLUMN id SET DEFAULT nextval('public.note_id_seq'::regclass);


--
-- Name: privilege id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.privilege ALTER COLUMN id SET DEFAULT nextval('public.privilege_id_seq'::regclass);


--
-- Name: role id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.role ALTER COLUMN id SET DEFAULT nextval('public.role_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: note; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.note (id, content, title, author_id) FROM stdin;
\.


--
-- Data for Name: privilege; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.privilege (id, name) FROM stdin;
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.role (id, name) FROM stdin;
\.


--
-- Data for Name: role_privileges; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.role_privileges (role_id, privilege_id) FROM stdin;
\.


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.user_roles (user_id, role_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: example
--

COPY public.users (id, account_non_expired, account_non_locked, credentials_non_expired, email, enabled, login, password) FROM stdin;
\.


--
-- Name: note_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.note_id_seq', 1, false);


--
-- Name: privilege_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.privilege_id_seq', 1, false);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.role_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: example
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: note note_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT note_pkey PRIMARY KEY (id);


--
-- Name: privilege privilege_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.privilege
    ADD CONSTRAINT privilege_pkey PRIMARY KEY (id);


--
-- Name: role role_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: role_privileges fk9bh6h5cm4bq0u3q9pcotkydq8; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fk9bh6h5cm4bq0u3q9pcotkydq8 FOREIGN KEY (privilege_id) REFERENCES public.privilege(id);


--
-- Name: role_privileges fkgelpp2j5e63axp7bcguwaqec5; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.role_privileges
    ADD CONSTRAINT fkgelpp2j5e63axp7bcguwaqec5 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: user_roles fkhfh9dx7w3ubf1co1vdev94g3f; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkhfh9dx7w3ubf1co1vdev94g3f FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: user_roles fkrhfovtciq1l558cw6udg0h0d3; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.user_roles
    ADD CONSTRAINT fkrhfovtciq1l558cw6udg0h0d3 FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- Name: note fkslvrt3e5dpkx0tm8wbtcxy093; Type: FK CONSTRAINT; Schema: public; Owner: example
--

ALTER TABLE ONLY public.note
    ADD CONSTRAINT fkslvrt3e5dpkx0tm8wbtcxy093 FOREIGN KEY (author_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

