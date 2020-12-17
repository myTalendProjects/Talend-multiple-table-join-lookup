--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4 (Debian 12.4-1.pgdg90+1)
-- Dumped by pg_dump version 12.4 (Debian 12.4-1.pgdg90+1)

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
-- Name: service_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.service_type AS ENUM (
    'subscription',
    'on-demand'
);


ALTER TYPE public.service_type OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: device_blacklist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_blacklist (
    id integer NOT NULL,
    service_id integer NOT NULL,
    model_id integer NOT NULL
);


ALTER TABLE public.device_blacklist OWNER TO postgres;

--
-- Name: device_blacklist_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_blacklist_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_blacklist_id_seq OWNER TO postgres;

--
-- Name: device_blacklist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_blacklist_id_seq OWNED BY public.device_blacklist.id;


--
-- Name: device_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.device_model (
    id integer NOT NULL,
    model_code character(20) NOT NULL
);


ALTER TABLE public.device_model OWNER TO postgres;

--
-- Name: device_model_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.device_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.device_model_id_seq OWNER TO postgres;

--
-- Name: device_model_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.device_model_id_seq OWNED BY public.device_model.id;


--
-- Name: service_details; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.service_details (
    id integer NOT NULL,
    service_code character(50) NOT NULL,
    partner_id integer NOT NULL,
    name character(50) NOT NULL,
    managed boolean NOT NULL,
    global_service_whitelist boolean NOT NULL,
    enable_service_whitelist boolean NOT NULL,
    global_service_blacklist boolean NOT NULL,
    enable_service_blacklist boolean NOT NULL,
    enable_global_subscription_blacklist boolean NOT NULL,
    enable_global_charging_blacklist boolean NOT NULL,
    service_type public.service_type NOT NULL
);


ALTER TABLE public.service_details OWNER TO postgres;

--
-- Name: service_details_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.service_details_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.service_details_id_seq OWNER TO postgres;

--
-- Name: service_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.service_details_id_seq OWNED BY public.service_details.id;


--
-- Name: device_blacklist id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_blacklist ALTER COLUMN id SET DEFAULT nextval('public.device_blacklist_id_seq'::regclass);


--
-- Name: device_model id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model ALTER COLUMN id SET DEFAULT nextval('public.device_model_id_seq'::regclass);


--
-- Name: service_details id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_details ALTER COLUMN id SET DEFAULT nextval('public.service_details_id_seq'::regclass);


--
-- Data for Name: device_blacklist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_blacklist (id, service_id, model_id) FROM stdin;
1	3	3
2	6	3
3	11	3
4	2	1
5	2	2
\.


--
-- Data for Name: device_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.device_model (id, model_code) FROM stdin;
1	nova3E              
2	apple 5SE           
3	samsung s8          
\.


--
-- Data for Name: service_details; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.service_details (id, service_code, partner_id, name, managed, global_service_whitelist, enable_service_whitelist, global_service_blacklist, enable_service_blacklist, enable_global_subscription_blacklist, enable_global_charging_blacklist, service_type) FROM stdin;
1	wn100                                             	10	service100                                        	f	f	t	f	t	t	t	on-demand
2	wn101                                             	11	service101                                        	t	f	t	f	t	t	t	on-demand
4	wn103                                             	10	service103                                        	t	t	t	f	t	t	t	on-demand
5	wn104                                             	10	service104                                        	t	f	t	t	t	t	t	on-demand
6	wn105                                             	10	service105                                        	t	f	t	f	t	t	t	on-demand
7	wn106                                             	10	service106                                        	t	f	t	f	t	t	t	on-demand
8	wn107                                             	10	service107                                        	t	f	t	f	t	t	t	on-demand
9	wn108                                             	10	service108                                        	t	f	t	f	t	t	t	on-demand
10	wn109                                             	10	service109                                        	t	f	t	f	t	f	t	on-demand
11	wn110                                             	10	service110                                        	t	f	t	f	t	t	t	on-demand
3	wn102                                             	10	service102                                        	t	f	t	f	t	f	f	on-demand
\.


--
-- Name: device_blacklist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_blacklist_id_seq', 5, true);


--
-- Name: device_model_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.device_model_id_seq', 3, true);


--
-- Name: service_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.service_details_id_seq', 11, true);


--
-- Name: device_blacklist device_blacklist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_blacklist
    ADD CONSTRAINT device_blacklist_pkey PRIMARY KEY (id);


--
-- Name: device_model device_model_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.device_model
    ADD CONSTRAINT device_model_pkey PRIMARY KEY (id);


--
-- Name: service_details service_details_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.service_details
    ADD CONSTRAINT service_details_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

