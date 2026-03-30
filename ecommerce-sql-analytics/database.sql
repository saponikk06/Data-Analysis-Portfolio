--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2026-03-30 14:33:24

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 37517)
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    order_id integer NOT NULL,
    user_id integer,
    order_date timestamp without time zone,
    amount numeric(10,2),
    status character varying(20)
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 37516)
-- Name: orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.orders_order_id_seq OWNER TO postgres;

--
-- TOC entry 4863 (class 0 OID 0)
-- Dependencies: 217
-- Name: orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;


--
-- TOC entry 220 (class 1259 OID 37529)
-- Name: shop_events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop_events (
    event_id integer NOT NULL,
    user_id integer,
    event_type character varying(50),
    event_timestamp timestamp without time zone
);


ALTER TABLE public.shop_events OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 37528)
-- Name: shop_events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shop_events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.shop_events_event_id_seq OWNER TO postgres;

--
-- TOC entry 4864 (class 0 OID 0)
-- Dependencies: 219
-- Name: shop_events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shop_events_event_id_seq OWNED BY public.shop_events.event_id;


--
-- TOC entry 216 (class 1259 OID 37510)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    registration_date timestamp without time zone,
    region character varying(50)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 37509)
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_user_id_seq OWNER TO postgres;

--
-- TOC entry 4865 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- TOC entry 4699 (class 2604 OID 37520)
-- Name: orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);


--
-- TOC entry 4700 (class 2604 OID 37532)
-- Name: shop_events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_events ALTER COLUMN event_id SET DEFAULT nextval('public.shop_events_event_id_seq'::regclass);


--
-- TOC entry 4698 (class 2604 OID 37513)
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- TOC entry 4855 (class 0 OID 37517)
-- Dependencies: 218
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.orders (order_id, user_id, order_date, amount, status) VALUES (1, 1, '2026-01-01 00:00:00', 5400.00, 'paid');
INSERT INTO public.orders (order_id, user_id, order_date, amount, status) VALUES (2, 3, '2026-02-10 00:00:00', 12000.00, 'paid');


--
-- TOC entry 4857 (class 0 OID 37529)
-- Dependencies: 220
-- Data for Name: shop_events; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (1, 1, 'view', '2026-01-01 10:00:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (2, 1, 'cart', '2026-01-01 10:05:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (3, 1, 'checkout', '2026-01-01 10:10:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (4, 2, 'view', '2026-01-05 12:00:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (5, 2, 'cart', '2026-01-05 12:10:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (6, 3, 'view', '2026-02-10 14:00:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (7, 3, 'cart', '2026-02-10 14:05:00');
INSERT INTO public.shop_events (event_id, user_id, event_type, event_timestamp) VALUES (8, 3, 'checkout', '2026-02-10 14:15:00');


--
-- TOC entry 4853 (class 0 OID 37510)
-- Dependencies: 216
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (user_id, registration_date, region) VALUES (1, '2026-01-01 00:00:00', 'Москва');
INSERT INTO public.users (user_id, registration_date, region) VALUES (2, '2026-01-05 00:00:00', 'Санкт-Петербург');
INSERT INTO public.users (user_id, registration_date, region) VALUES (3, '2026-02-10 00:00:00', 'Москва');
INSERT INTO public.users (user_id, registration_date, region) VALUES (4, '2026-02-15 00:00:00', 'Казань');


--
-- TOC entry 4866 (class 0 OID 0)
-- Dependencies: 217
-- Name: orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_order_id_seq', 2, true);


--
-- TOC entry 4867 (class 0 OID 0)
-- Dependencies: 219
-- Name: shop_events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shop_events_event_id_seq', 8, true);


--
-- TOC entry 4868 (class 0 OID 0)
-- Dependencies: 215
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- TOC entry 4704 (class 2606 OID 37522)
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);


--
-- TOC entry 4706 (class 2606 OID 37534)
-- Name: shop_events shop_events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_events
    ADD CONSTRAINT shop_events_pkey PRIMARY KEY (event_id);


--
-- TOC entry 4702 (class 2606 OID 37515)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- TOC entry 4707 (class 2606 OID 37523)
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- TOC entry 4708 (class 2606 OID 37535)
-- Name: shop_events shop_events_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop_events
    ADD CONSTRAINT shop_events_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


-- Completed on 2026-03-30 14:33:24

--
-- PostgreSQL database dump complete
--

