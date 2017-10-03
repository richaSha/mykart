--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.3
-- Dumped by pg_dump version 9.6.3

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
-- Name: addresses; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE addresses (
    id integer NOT NULL,
    user_id integer,
    street character varying,
    city character varying,
    state character varying,
    country character varying,
    zipcode integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE addresses OWNER TO "Guest";

--
-- Name: addresses_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE addresses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE addresses_id_seq OWNER TO "Guest";

--
-- Name: addresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE addresses_id_seq OWNED BY addresses.id;


--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE ar_internal_metadata OWNER TO "Guest";

--
-- Name: cards; Type: TABLE; Schema: public; Owner: Guest
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


ALTER TABLE cards OWNER TO "Guest";

--
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE cards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cards_id_seq OWNER TO "Guest";

--
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE cards_id_seq OWNED BY cards.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE carts (
    id integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE carts OWNER TO "Guest";

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carts_id_seq OWNER TO "Guest";

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE carts_id_seq OWNED BY carts.id;


--
-- Name: carts_users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE carts_users (
    id integer NOT NULL,
    cart_id integer,
    user_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE carts_users OWNER TO "Guest";

--
-- Name: carts_users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE carts_users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE carts_users_id_seq OWNER TO "Guest";

--
-- Name: carts_users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE carts_users_id_seq OWNED BY carts_users.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE categories (
    id integer NOT NULL,
    name character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE categories OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE categories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE categories_id_seq OWNER TO "Guest";

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE categories_id_seq OWNED BY categories.id;


--
-- Name: items; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE items (
    id integer NOT NULL,
    cart_id integer,
    product_id integer,
    quantity integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE items OWNER TO "Guest";

--
-- Name: items_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE items_id_seq OWNER TO "Guest";

--
-- Name: items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE items_id_seq OWNED BY items.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: Guest
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


ALTER TABLE order_items OWNER TO "Guest";

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE order_items_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE order_items_id_seq OWNER TO "Guest";

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE order_items_id_seq OWNED BY order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE orders (
    id integer NOT NULL,
    user_id integer,
    status character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE orders OWNER TO "Guest";

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE orders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE orders_id_seq OWNER TO "Guest";

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE orders_id_seq OWNED BY orders.id;


--
-- Name: product_images; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE product_images (
    id integer NOT NULL,
    product_id integer,
    url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE product_images OWNER TO "Guest";

--
-- Name: product_images_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE product_images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE product_images_id_seq OWNER TO "Guest";

--
-- Name: product_images_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE product_images_id_seq OWNED BY product_images.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: Guest
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


ALTER TABLE products OWNER TO "Guest";

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE products_id_seq OWNER TO "Guest";

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE products_id_seq OWNED BY products.id;


--
-- Name: reviews; Type: TABLE; Schema: public; Owner: Guest
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


ALTER TABLE reviews OWNER TO "Guest";

--
-- Name: reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reviews_id_seq OWNER TO "Guest";

--
-- Name: reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE reviews_id_seq OWNED BY reviews.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO "Guest";

--
-- Name: users; Type: TABLE; Schema: public; Owner: Guest
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying,
    password character varying,
    email character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    name character varying,
    cart_id integer,
    admin boolean
);


ALTER TABLE users OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: Guest
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO "Guest";

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: Guest
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: addresses id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY addresses ALTER COLUMN id SET DEFAULT nextval('addresses_id_seq'::regclass);


--
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY cards ALTER COLUMN id SET DEFAULT nextval('cards_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY carts ALTER COLUMN id SET DEFAULT nextval('carts_id_seq'::regclass);


--
-- Name: carts_users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY carts_users ALTER COLUMN id SET DEFAULT nextval('carts_users_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY categories ALTER COLUMN id SET DEFAULT nextval('categories_id_seq'::regclass);


--
-- Name: items id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY items ALTER COLUMN id SET DEFAULT nextval('items_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY order_items ALTER COLUMN id SET DEFAULT nextval('order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY orders ALTER COLUMN id SET DEFAULT nextval('orders_id_seq'::regclass);


--
-- Name: product_images id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY product_images ALTER COLUMN id SET DEFAULT nextval('product_images_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY products ALTER COLUMN id SET DEFAULT nextval('products_id_seq'::regclass);


--
-- Name: reviews id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY reviews ALTER COLUMN id SET DEFAULT nextval('reviews_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY addresses (id, user_id, street, city, state, country, zipcode, created_at, updated_at) FROM stdin;
\.


--
-- Name: addresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('addresses_id_seq', 1, false);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	default_env	2017-10-03 19:02:54.562424	2017-10-03 19:02:54.562424
\.


--
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY cards (id, user_id, card_no, exp_year, exp_month, name_on_card, created_at, updated_at) FROM stdin;
\.


--
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('cards_id_seq', 1, false);


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY carts (id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('carts_id_seq', 1, false);


--
-- Data for Name: carts_users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY carts_users (id, cart_id, user_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: carts_users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('carts_users_id_seq', 1, false);


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY categories (id, name, created_at, updated_at) FROM stdin;
1	Home Appliance	\N	\N
2	Computer	\N	\N
3	Mobile	\N	\N
4	Kitchen Appliance	\N	\N
5	Luggage	\N	\N
6	Musical Instrument	\N	\N
7	Toys	\N	\N
8	Home Decoration	\N	\N
9	Tools & Home Improvement	\N	\N
10	Electronics	\N	\N
\.


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('categories_id_seq', 10, true);


--
-- Data for Name: items; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY items (id, cart_id, product_id, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Name: items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('items_id_seq', 1, false);


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY order_items (id, order_id, product_id, price, quantity, created_at, updated_at) FROM stdin;
\.


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('order_items_id_seq', 1, false);


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY orders (id, user_id, status, created_at, updated_at) FROM stdin;
\.


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('orders_id_seq', 1, false);


--
-- Data for Name: product_images; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY product_images (id, product_id, url, created_at, updated_at) FROM stdin;
\.


--
-- Name: product_images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('product_images_id_seq', 1, false);


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY products (id, name, category_id, description, quantity, list_price, sale_price, created_at, updated_at) FROM stdin;
1	Hamilton Beach Deep Fryer with Cool Touch, 2-Liter Oil Capacity	1	Hamilton Beach Deep Fryers are generously sized for greater versatility -- some even accommodating a whole chicken. What's more, you can fry crispy, mouth-watering foods without the mess you've come to expect. Food can be lowered into hot oil and lifted out while the lid is closed for splatter-free frying. Hamilton Beach Deep Fryers also feature adjustable heat and convenient timers. Hamilton Beach Consumer Deep Fryers for the home are easy to clean and most models include a dishwasher-safe nonstick pot. The breakaway cord featured on most deep fryers makes storage easy too.	12	40	\N	2017-10-03 22:04:17.816875	2017-10-03 22:04:17.816875
2	Collections ETC Set of 4 Fiberglass Stovetop Burner Protectors, 10.5-Inch, Black	1	Hate scrubbing your stovetop? Simply place these fiberglass stovetop protectors over your gas burner areas, and your stovetop will stay clean and protected. Protectors easily catch splatters and spills. Can be wiped clean with soapy water. Set of 4, available in black or silver. Fiberglass. 10 1/2"Sq. Simply cut for a custom fit. Available in Black or Silver.\r\n\r\n	15	9	\N	2017-10-03 22:06:33.68986	2017-10-03 22:06:33.68986
3	Swash SFF1000CLN Express Clothing Care System, Linen	1	The SWASH system is the first in-home system that provides a convenient way to get clothes ready to wear on your schedule, in just 10 to 15 minutes. Filling the space that exists between washing and dry-cleaning, you’ll spend less time visiting the dry-cleaner and more time in your favorite outfits that smell fresh and look great. Best of all it comes to you from trusted brands Whirlpool and Tide, who’ve both been caring for clothes for the past 50 years.	20	345	\N	2017-10-03 22:07:15.377078	2017-10-03 22:07:15.377078
4	Hamilton Beach 38546 3-in-1 Grill/Griddle	1	Hamilton beach 3 in 1 dual zone Griddle/grill, 3 combinations: Griddle/Griddle, grill/grill & grill/Griddle, removable & reversible grill/Griddle grids, each half can be used either as a grill or a Griddle, each grid fits easily in dishwasher or sink, ultimate grease control 2 separate cooking surfaces ensures grease from one side doesn't get on the other side, center mounted dishwasher safe grease tray, 2 heat zones, independent temperature controls ensures proper cooking temperatures, 180 skin of cooking surface, durable pfpa free non stick cooking surface, cool touch handles.	20	37	\N	2017-10-03 22:07:55.868471	2017-10-03 22:07:55.868471
5	URPOWER Humidifier	1	Are you looking for some items to decorate your room? Why not get a URPOWER 5L Ultrasonic Cool Mist Humidifier now? URPOWER 5L Ultrasonic Cool Mist Humidifier uses mature Ultrasonic Technology with sleek body design, makes humidifier to be not only functional but also decorative. The max mist volume reaching to 350ml/h. 5L large capacity allows a full night of humidifying. You do not need to wake up in the midnight to add water. Just as we all know, the humidifier emits cool water vapor to add moisture back into the air. 	25	51	\N	2017-10-03 22:10:16.811149	2017-10-03 22:10:16.811149
\.


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('products_id_seq', 5, true);


--
-- Data for Name: reviews; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY reviews (id, product_id, user_id, rating, comment, created_at, updated_at) FROM stdin;
\.


--
-- Name: reviews_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('reviews_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: Guest
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
20171002172248
20171002172709
20171002172826
20171002175325
20171002180345
20171002183116
20171002202008
20171003023504
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: Guest
--

COPY users (id, username, password, email, created_at, updated_at, name, cart_id, admin) FROM stdin;
1	admin	password	email@yahoo.com	2017-10-03 20:54:51.853121	2017-10-03 20:54:51.853121	Admin	\N	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: Guest
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: carts_users carts_users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY carts_users
    ADD CONSTRAINT carts_users_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: items items_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY items
    ADD CONSTRAINT items_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_images product_images_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY product_images
    ADD CONSTRAINT product_images_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: reviews reviews_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY reviews
    ADD CONSTRAINT reviews_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: Guest
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

