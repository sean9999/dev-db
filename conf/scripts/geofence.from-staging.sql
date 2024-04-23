--
-- PostgreSQL database dump
--

-- Dumped from database version 13.13
-- Dumped by pg_dump version 16.2

-- Started on 2024-04-23 16:32:17 EDT

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
-- TOC entry 6 (class 2615 OID 18175)
-- Name: geofence; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA geofence;


SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 18178)
-- Name: restrict_region; Type: TABLE; Schema: geofence; Owner: -
--

CREATE TABLE geofence.restrict_region (
    id bigint NOT NULL,
    country_code character varying(4) NOT NULL,
    region_code character varying(4) NOT NULL,
    ts timestamp with time zone DEFAULT now() NOT NULL
);


--
-- TOC entry 208 (class 1259 OID 18176)
-- Name: restrict_region_id_seq; Type: SEQUENCE; Schema: geofence; Owner: -
--

CREATE SEQUENCE geofence.restrict_region_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- TOC entry 3688 (class 0 OID 0)
-- Dependencies: 208
-- Name: restrict_region_id_seq; Type: SEQUENCE OWNED BY; Schema: geofence; Owner: -
--

ALTER SEQUENCE geofence.restrict_region_id_seq OWNED BY geofence.restrict_region.id;


--
-- TOC entry 210 (class 1259 OID 18183)
-- Name: settings; Type: TABLE; Schema: geofence; Owner: -
--

CREATE TABLE geofence.settings (
    key text NOT NULL,
    value jsonb DEFAULT '{}'::jsonb NOT NULL
);


--
-- TOC entry 3546 (class 2604 OID 18181)
-- Name: restrict_region id; Type: DEFAULT; Schema: geofence; Owner: -
--

ALTER TABLE ONLY geofence.restrict_region ALTER COLUMN id SET DEFAULT nextval('geofence.restrict_region_id_seq'::regclass);


--
-- TOC entry 3681 (class 0 OID 18178)
-- Dependencies: 209
-- Data for Name: restrict_region; Type: TABLE DATA; Schema: geofence; Owner: -
--

COPY geofence.restrict_region (id, country_code, region_code, ts) FROM stdin;
1	CA	QC	2023-09-12 17:34:32.805463+00
2	US	WA	2023-09-12 17:34:45.481163+00
4	US	TN	2023-09-12 17:35:49.903902+00
6	AF		2023-10-10 18:08:29.598471+00
7	NR		2023-10-10 18:09:33.698836+00
9	CA	ON	2024-03-19 16:23:28.946336+00
\.


--
-- TOC entry 3682 (class 0 OID 18183)
-- Dependencies: 210
-- Data for Name: settings; Type: TABLE DATA; Schema: geofence; Owner: -
--

COPY geofence.settings (key, value) FROM stdin;
log	{"level": "DEBUG"}
geofence	{}
ipCheckerPriority	[{"ord": 1, "name": "ipinfo"}, {"ord": 3, "name": "ipqualityscore"}, {"ord": 2, "name": "vpnapi"}]
ipLookuper	{"ttlLookup": "2h"}
\.


--
-- TOC entry 3689 (class 0 OID 0)
-- Dependencies: 208
-- Name: restrict_region_id_seq; Type: SEQUENCE SET; Schema: geofence; Owner: -
--

SELECT pg_catalog.setval('geofence.restrict_region_id_seq', 9, true);


--
-- TOC entry 3549 (class 1259 OID 18190)
-- Name: settings_key_uindex; Type: INDEX; Schema: geofence; Owner: -
--

CREATE UNIQUE INDEX settings_key_uindex ON geofence.settings USING btree (key);


-- Completed on 2024-04-23 16:32:20 EDT

--
-- PostgreSQL database dump complete
--

