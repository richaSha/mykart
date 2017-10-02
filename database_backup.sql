--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
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


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE addresses (
    id integer NOT NULL,
    user_id integer,
    house_no integer,
    street character varying,
    city character varying,
    state character varying,
    country character varying,
    zipcode integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE addresses OWNER TO richa;

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO richa;

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: cards; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE cards (
    id integer NOT NULL,
    user_id integer,
    card_no integer,
    exp_year integer,
    exp_month integer,
    name_on_card character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE cards OWNER TO richa;

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cards_id_seq OWNER TO richa;

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE cards_id_seq OWNED BY cards.id;


--
-- Name: cart_items; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE cart_items (
    id integer NOT NULL,
    cart_id integer,
    product_id integer,
    quantity integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE cart_items OWNER TO richa;

--
-- Name: cart_items_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE cart_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cart_items_id_seq OWNER TO richa;

--
-- Name: cart_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE cart_items_id_seq OWNED BY cart_items.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE carts (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE carts OWNER TO richa;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carts_id_seq OWNER TO richa;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE carts_id_seq OWNED BY carts.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE categories OWNER TO richa;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO richa;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE order_items (
    id integer NOT NULL,
    order_id integer,
    product_id integer,
    price integer,
    quantity integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE order_items OWNER TO richa;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_items_id_seq OWNER TO richa;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE order_items_id_seq OWNED BY order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    status character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE orders OWNER TO richa;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO richa;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE product_images (
    id integer NOT NULL,
    product_id integer,
    url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE product_images OWNER TO richa;

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_images_id_seq OWNER TO richa;

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE product_images_id_seq OWNED BY product_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE products (
    id integer NOT NULL,
    name character varying,
    category_id integer,
    description character varying,
    quantity integer,
    list_price integer,
    sale_price integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE products OWNER TO richa;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO richa;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE reviews (
    id integer NOT NULL,
    product_id integer,
    user_id integer,
    rating integer,
    comment character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE reviews OWNER TO richa;

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO richa;

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO richa;

--
-- Name: users; Type: TABLE; Schema: public; Owner: richa
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    email character varying,
    first_name character varying,
    last_name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE users OWNER TO richa;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: richa
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO richa;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: richa
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY cards ALTER COLUMN id SET DEFAULT nextval('cards_id_seq'::regclass);


--
-- Name: cart_items id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY cart_items ALTER COLUMN id SET DEFAULT nextval('cart_items_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY order_items ALTER COLUMN id SET DEFAULT nextval('order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY product_images ALTER COLUMN id SET DEFAULT nextval('product_images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: richa
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY addresses (id, user_id, house_no, street, city, state, country, zipcode, created_at, updated_at) FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('addresses_id_seq', 1, false);


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY cards (id, user_id, card_no, exp_year, exp_month, name_on_card, created_at, updated_at) FROM stdin;
\.


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('cards_id_seq', 1, false);


--
-- Data for Name: cart_items; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY cart_items (id, cart_id, product_id, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Name: cart_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('cart_items_id_seq', 1, false);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY carts (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('carts_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('categories_id_seq', 1, false);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY order_items (id, order_id, product_id, price, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('order_items_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY orders (id, user_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY product_images (id, product_id, url, created_at, updated_at) FROM stdin;
\.


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('product_images_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY products (id, name, category_id, description, quantity, list_price, sale_price, created_at, updated_at) FROM stdin;
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('products_id_seq', 1, false);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY reviews (id, product_id, user_id, rating, comment, created_at, updated_at) FROM stdin;
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('reviews_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY schema_migrations (version) FROM stdin;
20171001204440
20171001204557
20171001204644
20171001204755
20171001204821
20171001204927
20171001204936
20171001204950
20171001205011
20171001230626
20171001230633
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: richa
--

COPY users (id, username, password, email, first_name, last_name, created_at, updated_at) FROM stdin;
1	richa	$2a$06$Zebm87K5D4jfvsPescNMDu.7D3YvxND5YrBZ8tnKVe3yPIP27nrMe	richa@gmail.com	richa	shaurabh	\N	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: richa
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: cart_items cart_items_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY cart_items
    ADD CONSTRAINT cart_items_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: richa
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: richa
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

