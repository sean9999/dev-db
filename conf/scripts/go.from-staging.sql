--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-23 16:27:46 EDT

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
-- TOC entry 7 (class 2615 OID 19099)
-- Name: go; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA go;


--
-- TOC entry 695 (class 1247 OID 19336)
-- Name: cafe_promotion_type; Type: TYPE; Schema: go; Owner: -
--

CREATE TYPE go.cafe_promotion_type AS ENUM (
    'drink',
    'pin',
    'dessert',
    'referral'
);


SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 19347)
-- Name: cafe_locations; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.cafe_locations (
    id integer NOT NULL,
    code character varying(6) NOT NULL,
    name text NOT NULL,
    offer_kind go.cafe_promotion_type NOT NULL
);


--
-- TOC entry 217 (class 1259 OID 19345)
-- Name: cafe_locations_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.cafe_locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3731 (class 0 OID 0)
-- Dependencies: 217
-- Name: cafe_locations_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.cafe_locations_id_seq OWNED BY go.cafe_locations.id;


--
-- TOC entry 214 (class 1259 OID 19113)
-- Name: location_countries; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_countries (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    list_id integer NOT NULL
);


--
-- TOC entry 213 (class 1259 OID 19111)
-- Name: location_countries_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.location_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3732 (class 0 OID 0)
-- Dependencies: 213
-- Name: location_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.location_countries_id_seq OWNED BY go.location_countries.id;


--
-- TOC entry 212 (class 1259 OID 19102)
-- Name: location_lists; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_lists (
    id integer NOT NULL,
    name text NOT NULL,
    description text
);


--
-- TOC entry 223 (class 1259 OID 19527)
-- Name: location_lists2_countries; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_lists2_countries (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    code character(2) NOT NULL
);


--
-- TOC entry 222 (class 1259 OID 19525)
-- Name: location_lists2_countries_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.location_lists2_countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3733 (class 0 OID 0)
-- Dependencies: 222
-- Name: location_lists2_countries_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.location_lists2_countries_id_seq OWNED BY go.location_lists2_countries.id;


--
-- TOC entry 221 (class 1259 OID 19516)
-- Name: location_lists2_lists; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_lists2_lists (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    description text
);


--
-- TOC entry 220 (class 1259 OID 19514)
-- Name: location_lists2_lists_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.location_lists2_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3734 (class 0 OID 0)
-- Dependencies: 220
-- Name: location_lists2_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.location_lists2_lists_id_seq OWNED BY go.location_lists2_lists.id;


--
-- TOC entry 226 (class 1259 OID 19546)
-- Name: location_lists2_location_x_subdivision; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_lists2_location_x_subdivision (
    location_list_id integer NOT NULL,
    subdivision_id integer NOT NULL
);


--
-- TOC entry 225 (class 1259 OID 19535)
-- Name: location_lists2_subdivisions; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_lists2_subdivisions (
    id integer NOT NULL,
    name character varying(64) NOT NULL,
    code character(2) NOT NULL,
    country_id integer NOT NULL
);


--
-- TOC entry 224 (class 1259 OID 19533)
-- Name: location_lists2_subdivisions_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.location_lists2_subdivisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3735 (class 0 OID 0)
-- Dependencies: 224
-- Name: location_lists2_subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.location_lists2_subdivisions_id_seq OWNED BY go.location_lists2_subdivisions.id;


--
-- TOC entry 211 (class 1259 OID 19100)
-- Name: location_lists_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.location_lists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3736 (class 0 OID 0)
-- Dependencies: 211
-- Name: location_lists_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.location_lists_id_seq OWNED BY go.location_lists.id;


--
-- TOC entry 216 (class 1259 OID 19129)
-- Name: location_subdivisions; Type: TABLE; Schema: go; Owner: -
--

CREATE TABLE go.location_subdivisions (
    id integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    country_id integer NOT NULL
);


--
-- TOC entry 215 (class 1259 OID 19127)
-- Name: location_subdivisions_id_seq; Type: SEQUENCE; Schema: go; Owner: -
--

CREATE SEQUENCE go.location_subdivisions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3737 (class 0 OID 0)
-- Dependencies: 215
-- Name: location_subdivisions_id_seq; Type: SEQUENCE OWNED BY; Schema: go; Owner: -
--

ALTER SEQUENCE go.location_subdivisions_id_seq OWNED BY go.location_subdivisions.id;


--
-- TOC entry 3556 (class 2604 OID 19350)
-- Name: cafe_locations id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.cafe_locations ALTER COLUMN id SET DEFAULT nextval('go.cafe_locations_id_seq'::regclass);


--
-- TOC entry 3554 (class 2604 OID 19116)
-- Name: location_countries id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_countries ALTER COLUMN id SET DEFAULT nextval('go.location_countries_id_seq'::regclass);


--
-- TOC entry 3553 (class 2604 OID 19105)
-- Name: location_lists id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists ALTER COLUMN id SET DEFAULT nextval('go.location_lists_id_seq'::regclass);


--
-- TOC entry 3558 (class 2604 OID 19530)
-- Name: location_lists2_countries id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_countries ALTER COLUMN id SET DEFAULT nextval('go.location_lists2_countries_id_seq'::regclass);


--
-- TOC entry 3557 (class 2604 OID 19519)
-- Name: location_lists2_lists id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_lists ALTER COLUMN id SET DEFAULT nextval('go.location_lists2_lists_id_seq'::regclass);


--
-- TOC entry 3559 (class 2604 OID 19538)
-- Name: location_lists2_subdivisions id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_subdivisions ALTER COLUMN id SET DEFAULT nextval('go.location_lists2_subdivisions_id_seq'::regclass);


--
-- TOC entry 3555 (class 2604 OID 19132)
-- Name: location_subdivisions id; Type: DEFAULT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_subdivisions ALTER COLUMN id SET DEFAULT nextval('go.location_subdivisions_id_seq'::regclass);


--
-- TOC entry 3718 (class 0 OID 19347)
-- Dependencies: 218
-- Data for Name: cafe_locations; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.cafe_locations (id, code, name, offer_kind) FROM stdin;
26	1109	Hard Rock Cafe Atlanta	drink
49	1107	Hard Rock Cafe Washington DC	pin
36	1216	Hard Rock Cafe Las Vegas	pin
29	1204	Hard Rock Cafe Biloxi	pin
30	1133	Hard Rock Cafe Chicago	drink
31	1160	Hard Rock Cafe Foxwoods	drink
32	1202	Hard Rock Cafe Hollywood FL	pin
33	1228	Hard Rock Cafe Hollywood Blvd	drink
34	1230	Hard Rock Cafe Honolulu	drink
35	1117	Hard Rock Cafe Key West	pin
37	1110	Hard Rock Cafe Miami	pin
38	1268	Hard Rock Cafe Myrtle Beach	pin
39	1111	Hard Rock Cafe Nashville	drink
40	1242	Hard Rock Cafe New Orleans	pin
41	1101	Hard Rock Cafe New York	drink
42	1115	Hard Rock Cafe Niagara Falls	drink
43	11591	Hard Rock Cafe Orlando	pin
44	1155	Hard Rock Cafe Philadelphia	drink
45	1252	Hard Rock Cafe Pigeon Forge	drink
46	1185	Hard Rock Cafe Pittsburgh	drink
47	1112	Hard Rock Cafe San Antonio	drink
48	1132	Hard Rock Cafe San Francisco	drink
50	1220	Hard Rock Cafe Yankee Stadium	drink
27	1293	Hard Rock Cafe Atlantic City	pin
28	1154	Hard Rock Cafe Baltimore	pin
\.


--
-- TOC entry 3714 (class 0 OID 19113)
-- Dependencies: 214
-- Data for Name: location_countries; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_countries (id, name, code, list_id) FROM stdin;
1	United States	US	1
2	United States	US	2
\.


--
-- TOC entry 3712 (class 0 OID 19102)
-- Dependencies: 212
-- Data for Name: location_lists; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_lists (id, name, description) FROM stdin;
1	merch	List of locations where HR merch can be shipped to
2	Cafe	Cafe locations
\.


--
-- TOC entry 3722 (class 0 OID 19527)
-- Dependencies: 223
-- Data for Name: location_lists2_countries; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_lists2_countries (id, name, code) FROM stdin;
1	United States	US
2	Canada	CA
6	Australia	AU
\.


--
-- TOC entry 3720 (class 0 OID 19516)
-- Dependencies: 221
-- Data for Name: location_lists2_lists; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_lists2_lists (id, name, description) FROM stdin;
2	merch	List of locations where HR merch can be shipped to
7	Cafe	Cafe Locations
\.


--
-- TOC entry 3725 (class 0 OID 19546)
-- Dependencies: 226
-- Data for Name: location_lists2_location_x_subdivision; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_lists2_location_x_subdivision (location_list_id, subdivision_id) FROM stdin;
2	41
2	15
2	14
2	32
2	34
2	29
7	1
\.


--
-- TOC entry 3724 (class 0 OID 19535)
-- Dependencies: 225
-- Data for Name: location_lists2_subdivisions; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_lists2_subdivisions (id, name, code, country_id) FROM stdin;
1	Alabama	AL	1
2	Arizona	AZ	1
3	Arkansas	AR	1
4	California	CA	1
5	Colorado	CO	1
6	Connecticut	CT	1
7	Delaware	DE	1
8	Florida	FL	1
9	Georgia	GA	1
10	Idaho	ID	1
11	Illinois	IL	1
12	Indiana	IN	1
13	Iowa	IA	1
14	Kansas	KS	1
15	Kentucky	KY	1
16	Louisiana	LA	1
17	Maine	ME	1
18	Maryland	MD	1
19	Massachusetts	MA	1
20	Michigan	MI	1
21	Minnesota	MN	1
22	Mississippi	MS	1
23	Missouri	MO	1
24	Montana	MT	1
25	Nebraska	NE	1
26	Nevada	NV	1
27	New Hampshire	NH	1
28	New Jersey	NJ	1
29	New Mexico	NM	1
30	New York	NY	1
31	North Carolina	NC	1
32	North Dakota	ND	1
33	Ohio	OH	1
34	Oklahoma	OK	1
35	Oregon	OR	1
36	Pennsylvania	PA	1
37	Rhode Island	RI	1
38	South Carolina	SC	1
39	South Dakota	SD	1
40	Tennessee	TN	1
41	Texas	TX	1
42	Utah	UT	1
43	Vermont	VT	1
44	Virginia	VA	1
45	Washington	WA	1
46	West Virginia	WV	1
47	Wisconsin	WI	1
48	Wyoming	WY	1
49	Alberta	AB	2
50	British Columbia	BC	2
51	Manitoba	MB	2
52	New Brunswick	NB	2
53	Newfoundland and Labrador	NL	2
55	Nova Scotia	NS	2
56	Nunavut	NU	2
57	Ontario	ON	2
58	Prince Edward Island	PE	2
59	Québec	QC	2
60	Saskatchewan	SK	2
65	Queensland	QL	6
\.


--
-- TOC entry 3716 (class 0 OID 19129)
-- Dependencies: 216
-- Data for Name: location_subdivisions; Type: TABLE DATA; Schema: go; Owner: -
--

COPY go.location_subdivisions (id, name, code, country_id) FROM stdin;
1	Alabama	AL	1
2	Arizona	AZ	1
3	Arkansas	AR	1
4	California	CA	1
5	Colorado	CO	1
6	Connecticut	CT	1
7	Delaware	DE	1
8	Florida	FL	1
9	Georgia	GA	1
10	Idaho	ID	1
11	Illinois	IL	1
12	Indiana	IN	1
13	Iowa	IA	1
14	Kansas	KS	1
15	Kentucky	KY	1
16	Louisiana	LA	1
17	Maine	ME	1
18	Maryland	MD	1
19	Massachusetts	MA	1
20	Michigan	MI	1
21	Minnesota	MN	1
22	Mississippi	MS	1
23	Missouri	MO	1
24	Montana	MT	1
25	Nebraska	NE	1
26	Nevada	NV	1
27	New Hampshire	NH	1
28	New Jersey	NJ	1
29	New Mexico	NM	1
30	New York	NY	1
31	North Carolina	NC	1
32	North Dakota	ND	1
33	Ohio	OH	1
34	Oklahoma	OK	1
35	Oregon	OR	1
36	Pennsylvania	PA	1
37	Rhode Island	RI	1
38	South Carolina	SC	1
39	South Dakota	SD	1
41	Texas	TX	1
42	Utah	UT	1
43	Vermont	VT	1
44	Virginia	VA	1
46	West Virginia	WV	1
47	Wisconsin	WI	1
48	Wyoming	WY	1
49	Alabama	AL	2
50	Arizona	AZ	2
51	Arkansas	AR	2
52	California	CA	2
53	Colorado	CO	2
54	Connecticut	CT	2
55	Delaware	DE	2
56	Florida	FL	2
57	Georgia	GA	2
58	Idaho	ID	2
59	Illinois	IL	2
60	Indiana	IN	2
61	Iowa	IA	2
62	Kansas	KS	2
63	Kentucky	KY	2
64	Louisiana	LA	2
65	Maine	ME	2
66	Maryland	MD	2
67	Massachusetts	MA	2
68	Michigan	MI	2
69	Minnesota	MN	2
70	Mississippi	MS	2
71	Missouri	MO	2
72	Montana	MT	2
73	Nebraska	NE	2
74	Nevada	NV	2
75	New Hampshire	NH	2
76	New Jersey	NJ	2
77	New Mexico	NM	2
78	New York	NY	2
79	North Carolina	NC	2
80	North Dakota	ND	2
81	Ohio	OH	2
82	Oklahoma	OK	2
83	Oregon	OR	2
84	Pennsylvania	PA	2
85	Rhode Island	RI	2
86	South Carolina	SC	2
87	South Dakota	SD	2
88	Tennessee	TN	2
89	Texas	TX	2
90	Utah	UT	2
91	Vermont	VT	2
92	Virginia	VA	2
93	Washington	WA	2
94	West Virginia	WV	2
95	Wisconsin	WI	2
96	Wyoming	WY	2
\.


--
-- TOC entry 3738 (class 0 OID 0)
-- Dependencies: 217
-- Name: cafe_locations_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.cafe_locations_id_seq', 70, true);


--
-- TOC entry 3739 (class 0 OID 0)
-- Dependencies: 213
-- Name: location_countries_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.location_countries_id_seq', 3, true);


--
-- TOC entry 3740 (class 0 OID 0)
-- Dependencies: 222
-- Name: location_lists2_countries_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.location_lists2_countries_id_seq', 6, true);


--
-- TOC entry 3741 (class 0 OID 0)
-- Dependencies: 220
-- Name: location_lists2_lists_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.location_lists2_lists_id_seq', 7, true);


--
-- TOC entry 3742 (class 0 OID 0)
-- Dependencies: 224
-- Name: location_lists2_subdivisions_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.location_lists2_subdivisions_id_seq', 65, true);


--
-- TOC entry 3743 (class 0 OID 0)
-- Dependencies: 211
-- Name: location_lists_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.location_lists_id_seq', 3, true);


--
-- TOC entry 3744 (class 0 OID 0)
-- Dependencies: 215
-- Name: location_subdivisions_id_seq; Type: SEQUENCE SET; Schema: go; Owner: -
--

SELECT pg_catalog.setval('go.location_subdivisions_id_seq', 97, true);


--
-- TOC entry 3567 (class 2606 OID 19355)
-- Name: cafe_locations cafe_locations_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.cafe_locations
    ADD CONSTRAINT cafe_locations_pkey PRIMARY KEY (id);


--
-- TOC entry 3575 (class 2606 OID 19550)
-- Name: location_lists2_location_x_subdivision distinct_combinations; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_location_x_subdivision
    ADD CONSTRAINT distinct_combinations UNIQUE (location_list_id, subdivision_id);


--
-- TOC entry 3563 (class 2606 OID 19121)
-- Name: location_countries location_countries_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_countries
    ADD CONSTRAINT location_countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3571 (class 2606 OID 19532)
-- Name: location_lists2_countries location_lists2_countries_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_countries
    ADD CONSTRAINT location_lists2_countries_pkey PRIMARY KEY (id);


--
-- TOC entry 3569 (class 2606 OID 19524)
-- Name: location_lists2_lists location_lists2_lists_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_lists
    ADD CONSTRAINT location_lists2_lists_pkey PRIMARY KEY (id);


--
-- TOC entry 3573 (class 2606 OID 19540)
-- Name: location_lists2_subdivisions location_lists2_subdivisions_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_subdivisions
    ADD CONSTRAINT location_lists2_subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3561 (class 2606 OID 19110)
-- Name: location_lists location_lists_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists
    ADD CONSTRAINT location_lists_pkey PRIMARY KEY (id);


--
-- TOC entry 3565 (class 2606 OID 19137)
-- Name: location_subdivisions location_subdivisions_pkey; Type: CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_subdivisions
    ADD CONSTRAINT location_subdivisions_pkey PRIMARY KEY (id);


--
-- TOC entry 3576 (class 2606 OID 19122)
-- Name: location_countries location_countries_list_id_fkey; Type: FK CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_countries
    ADD CONSTRAINT location_countries_list_id_fkey FOREIGN KEY (list_id) REFERENCES go.location_lists(id);


--
-- TOC entry 3579 (class 2606 OID 19551)
-- Name: location_lists2_location_x_subdivision location_lists2_location_x_subdivision_location_list_id_fkey; Type: FK CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_location_x_subdivision
    ADD CONSTRAINT location_lists2_location_x_subdivision_location_list_id_fkey FOREIGN KEY (location_list_id) REFERENCES go.location_lists2_lists(id);


--
-- TOC entry 3580 (class 2606 OID 19556)
-- Name: location_lists2_location_x_subdivision location_lists2_location_x_subdivision_subdivision_id_fkey; Type: FK CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_location_x_subdivision
    ADD CONSTRAINT location_lists2_location_x_subdivision_subdivision_id_fkey FOREIGN KEY (subdivision_id) REFERENCES go.location_lists2_subdivisions(id);


--
-- TOC entry 3578 (class 2606 OID 19541)
-- Name: location_lists2_subdivisions location_lists2_subdivisions_country_id_fkey; Type: FK CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_lists2_subdivisions
    ADD CONSTRAINT location_lists2_subdivisions_country_id_fkey FOREIGN KEY (country_id) REFERENCES go.location_lists2_countries(id);


--
-- TOC entry 3577 (class 2606 OID 19138)
-- Name: location_subdivisions location_subdivisions_country_id_fkey; Type: FK CONSTRAINT; Schema: go; Owner: -
--

ALTER TABLE ONLY go.location_subdivisions
    ADD CONSTRAINT location_subdivisions_country_id_fkey FOREIGN KEY (country_id) REFERENCES go.location_countries(id);


-- Completed on 2024-04-23 16:27:51 EDT

--
-- PostgreSQL database dump complete
--

