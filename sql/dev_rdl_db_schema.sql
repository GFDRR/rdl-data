--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11
-- Dumped by pg_dump version 13.1

-- Started on 2020-11-24 22:26:38

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

DROP DATABASE rdl-dev;
--
-- TOC entry 5707 (class 1262 OID 16399)
-- Name: rdl-dev; Type: DATABASE; Schema: -; Owner: rdl-dev
--

CREATE DATABASE rdl-dev WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';


ALTER DATABASE rdl-dev OWNER TO rdl-dev;

\connect rdl-dev

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
-- TOC entry 6 (class 2615 OID 16416)
-- Name: cf_common; Type: SCHEMA; Schema: -; Owner: commoncontrib
--

CREATE SCHEMA cf_common;


ALTER SCHEMA cf_common OWNER TO commoncontrib;

--
-- TOC entry 5709 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA cf_common; Type: COMMENT; Schema: -; Owner: commoncontrib
--

COMMENT ON SCHEMA cf_common IS 'Common elements for all Challenge Fund Database Schemas';

--
-- TOC entry 1904 (class 1247 OID 17929)
-- Name: occupancy_enum; Type: TYPE; Schema: cf_common; Owner: gedcf
--

CREATE TYPE cf_common.occupancy_enum AS ENUM (
    'Residential',
    'Commercial',
    'Industrial',
    'Infrastructure',
    'Healthcare',
    'Educational',
    'Government',
    'Crop',
    'Livestock',
    'Forestry',
    'Mixed'
);


ALTER TYPE cf_common.occupancy_enum OWNER TO gedcf;

--
-- TOC entry 5457 (class 0 OID 0)
-- Dependencies: 1904
-- Name: TYPE occupancy_enum; Type: COMMENT; Schema: cf_common; Owner: gedcf
--

COMMENT ON TYPE cf_common.occupancy_enum IS 'Types of Occupancy or building/structure use';


SET default_tablespace = '';

--
-- TOC entry 217 (class 1259 OID 17951)
-- Name: hazard_type; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.hazard_type (
    code character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE cf_common.hazard_type OWNER TO commoncontrib;

--
-- TOC entry 5458 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE hazard_type; Type: COMMENT; Schema: cf_common; Owner: commoncontrib
--

COMMENT ON TABLE cf_common.hazard_type IS 'Valid Hazard types';


--
-- TOC entry 218 (class 1259 OID 17957)
-- Name: imt; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.imt (
    process_code character varying NOT NULL,
    hazard_code character varying NOT NULL,
    im_code character varying NOT NULL,
    description character varying NOT NULL,
    units character varying NOT NULL
);


ALTER TABLE cf_common.imt OWNER TO commoncontrib;

--
-- TOC entry 219 (class 1259 OID 17963)
-- Name: license; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.license (
    code character varying NOT NULL,
    name character varying NOT NULL,
    notes text,
    url character varying NOT NULL
);


ALTER TABLE cf_common.license OWNER TO commoncontrib;

--
-- TOC entry 5461 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE license; Type: COMMENT; Schema: cf_common; Owner: commoncontrib
--

COMMENT ON TABLE cf_common.license IS 'List of supported licenses';


--
-- TOC entry 220 (class 1259 OID 17969)
-- Name: process_type; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.process_type (
    code character varying NOT NULL,
    hazard_code character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE cf_common.process_type OWNER TO commoncontrib;

--
-- TOC entry 5446 (class 0 OID 17951)
-- Dependencies: 217
-- Data for Name: hazard_type; Type: TABLE DATA; Schema: cf_common; Owner: commoncontrib
--

COPY cf_common.hazard_type (code, name) FROM stdin;
CS	Convective Storm
EQ	Earthquake
TS	Tsunami
VO	Volcanic
CF	Coastal Flood
FL	Flood
LS	Landslide
WI	Strong Wind
ET	Extreme Temperature
DR	Drought
WF	Wildfire
MH	Multi-Hazard
\.


--
-- TOC entry 5447 (class 0 OID 17957)
-- Dependencies: 218
-- Data for Name: imt; Type: TABLE DATA; Schema: cf_common; Owner: commoncontrib
--

COPY cf_common.imt (process_code, hazard_code, im_code, description, units) FROM stdin;
QGM	EQ	PGA:g	Peak ground acceleration in g	g
QGM	EQ	PGA:m/s2	Peak ground acceleration in m/s2 (meters per second squared)	m/s2
QGM	EQ	PGV:m/s	Peak ground velocity in m/s	m/s
QGM	EQ	SA(0.2):g	Spectral acceleration with 0.2s period	g
QGM	EQ	SA(0.3):g	Spectral acceleration with 0.3s period	g
QGM	EQ	SA(1.0):g	Spectral acceleration with 1.0s period	g
QGM	EQ	SA(3.0):g	Spectral acceleration with 3.0s period	g
QGM	EQ	SA(0.2):m/s2	Spectral acceleration with 0.2s period	m/s2
QGM	EQ	SA(0.3):m/s2	Spectral acceleration with 0.3s period	m/s2
QGM	EQ	SA(1.0):m/s2	Spectral acceleration with 1.0s period	m/s2
QGM	EQ	SA(3.0):m/s2	Spectral acceleration with 3.0s period	m/s2
QGM	EQ	Sd(T1):m	Spectral displacement	m
QGM	EQ	Sv(T1):m/s	Spectral velocity	m/s
QGM	EQ	PGDf:m	Permanent ground deformation	m
QGM	EQ	D_a5-95:s	Significant duration a5-95	s
QGM	EQ	D_a5-75 :s	Significant duration a5-75	s
QGM	EQ	IA:m/s	Arias intensity (Iα) or (IA) or (Ia)	m/s
QGM	EQ	Neq:-	Effective number of cycles	-
QGM	EQ	EMS:-	European macroseismic scale	-
QGM	EQ	AvgSa:m/s2	Average spectral acceleration	m/s2
QGM	EQ	I_Np:m/s2	I_Np by Bojórquez and Iervolino	m/s2
QGM	EQ	MMI:-	Modified Mercalli Intensity	-
QGM	EQ	CAV:m/s	Cumulative absolute velocity	m/s
QGM	EQ	D_B:s	Bracketed duration	s
FFF	FL	d_fff:m	Flood water depth	m
FPF	FL	d_fpf:m	Flood water depth	m
FFF	FL	v_fff:m/s	Flood flow velocity	m/s
FPF	FL	v_fpf:m/s	Flood flow velocity	m/s
TCY	WI	v_tcy(3s):km/h	3-sec at 10m sustained wind speed (kph)	km/h
ETC	WI	v_ect(3s):km/h	3-sec at 10m sustained wind speed (kph)	km/h
TCY	WI	v_tcy(1m):km/h	1-min at 10m sustained wind speed (kph)	km/h
ETC	WI	v_ect(1m):km/h	1-min at 10m sustained wind speed (kph)	km/h
TCY	WI	v_tcy(10m):km/h	10-min sustained wind speed (kph)	km/h
ETC	WI	v_etc(10m):km/h	10-min sustained wind speed (kph)	km/h
TCY	WI	PGWS_tcy:km/h	Peak gust wind speed	km/h
ETC	WI	PGWS_ect:km/h	Peak gust wind speed	km/h
LSL	LS	d_lsl:m	Landslide flow depth	m
LSL	LS	I_DF:m3/s2	Debris-flow intensity index	m3/s2
LSL	LS	v_lsl:m/s2	Landslide flow velocity	m/s2
LSL	LS	MFD_lsl:m	Maximum foundation displacement	m
LSL	LS	SD_lsl:m	Landslide displacement	m
TSI	TS	Rh_tsi:m	Tsunami wave runup height	m
TSI	TS	d_tsi:m	Tsunami inundation depth	m
TSI	TS	MMF:m4/s2	Modified momentum flux	m4/s2
TSI	TS	F_drag:kN	Drag force	kN
TSI	TS	Fr:-	Froude number	-
TSI	TS	v_tsi:m/s	Tsunami velocity	m/s
TSI	TS	F_QS:kN	Quasi-steady force	kN
TSI	TS	MF:m3/s2	Momentum flux	m3/s2
TSI	TS	h_tsi:m	Tsunami wave height	m
TSI	TS	Fh_tsi:m	Tsunami Horizontal Force	kN
VAF	VO	h_vaf:m	Ash fall thickness	m
VAF	VO	L_vaf:kg/m2	Ash loading	kg/m2
FSS	CF	v_fss:m/s	Maximum water velocity	m/s
FSS	CF	d_fss:m	Storm surge inundation depth	m
DTA	DR	CMI:-	Crop Moisture Index	-
DTM	DR	PDSI:-	Palmer Drought Severity Index	-
DTM	DR	SPI:-	Standard Precipitation Index	-
LSL	LS	LSI:-	Landslide susceptibility index	-
LSL	LS	haz_lsl:-	Landslide hazard index	-
\.


--
-- TOC entry 5448 (class 0 OID 17963)
-- Dependencies: 219
-- Data for Name: license; Type: TABLE DATA; Schema: cf_common; Owner: commoncontrib
--

COPY cf_common.license (code, name, notes, url) FROM stdin;
CC0	Creative Commons CCZero (CC0)	Dedicate to the Public Domain (all rights waived)	https://creativecommons.org/publicdomain/zero/1.0/
PDDL	Open Data Commons Public Domain Dedication and Licence (PDDL)	Dedicate to the Public Domain (all rights waived)	https://opendatacommons.org/licenses/pddl/index.html
ODbL	Open Data Commons Open Database License (ODbL)	Attribution-ShareAlike for data(bases)	https://opendatacommons.org/licenses/odbl/summary/
ODC-By	Open Data Commons Attribution License(ODC-BY)	Attribution for data(bases)	https://opendatacommons.org/licenses/by/summary/
CC BY 4.0	Creative Commons Attribution 4.0 (CC-BY-4.0)	\N	https://creativecommons.org/licenses/by/4.0/
CC BY-SA 4.0	Creative Commons Attribution Share-Alike 4.0 (CC-BY-SA-4.0)	\N	http://creativecommons.org/licenses/by-sa/4.0/
\.


--
-- TOC entry 5449 (class 0 OID 17969)
-- Dependencies: 220
-- Data for Name: process_type; Type: TABLE DATA; Schema: cf_common; Owner: commoncontrib
--

COPY cf_common.process_type (code, hazard_code, name) FROM stdin;
QLI	EQ	Liquefaction
QGM	EQ	Ground Motion
Q1R	EQ	Primary Rupture
Q2R	EQ	Secondary Rupture
TSI	TS	Tsunami
VAF	VO	Ashfall
VLH	VO	Lahar
VPF	VO	Pyroclastic Flow
VBL	VO	Ballistics
VLV	VO	Lava
VFH	VO	Proximal hazards
FSS	CF	Storm Surge
FCF	CF	Coastal Flood
FFF	FL	Fluvial Flood
FPF	FL	Pluvial Flood
LAV	LS	Snow Avalanche
LSL	LS	Landslide (general)
TCY	WI	Tropical cyclone
ETC	WI	Extratropical cyclone
EHT	ET	Extreme heat
ECD	ET	Extreme cold
DTS	DR	Socio-economic Drought
DTM	DR	Meteorological Drought
DTH	DR	Hydrological Drought
DTA	DR	Agricultural Drought
WFI	WF	Wildfire
TOR	CS	Tornado
\.


--
-- TOC entry 5302 (class 2606 OID 17976)
-- Name: hazard_type hazard_type_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.hazard_type
    ADD CONSTRAINT hazard_type_pkey PRIMARY KEY (code);


--
-- TOC entry 5304 (class 2606 OID 17978)
-- Name: imt imt_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.imt
    ADD CONSTRAINT imt_pkey PRIMARY KEY (im_code);


--
-- TOC entry 5306 (class 2606 OID 17980)
-- Name: license license_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.license
    ADD CONSTRAINT license_pkey PRIMARY KEY (code);


--
-- TOC entry 5308 (class 2606 OID 17982)
-- Name: process_type process_type_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.process_type
    ADD CONSTRAINT process_type_pkey PRIMARY KEY (code);


--
-- TOC entry 5310 (class 2606 OID 17984)
-- Name: process_type unique_code_hazard_code; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.process_type
    ADD CONSTRAINT unique_code_hazard_code UNIQUE (code, hazard_code);


--
-- TOC entry 5311 (class 2606 OID 17985)
-- Name: imt imt_process_code_fkey; Type: FK CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.imt
    ADD CONSTRAINT imt_process_code_fkey FOREIGN KEY (process_code, hazard_code) REFERENCES cf_common.process_type(code, hazard_code);


--
-- TOC entry 5312 (class 2606 OID 17990)
-- Name: process_type process_type_hazard_code_fkey; Type: FK CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.process_type
    ADD CONSTRAINT process_type_hazard_code_fkey FOREIGN KEY (hazard_code) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5456 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA cf_common; Type: ACL; Schema: -; Owner: commoncontrib
--

GRANT USAGE ON SCHEMA cf_common TO commonusers;


--
-- TOC entry 5459 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE hazard_type; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.hazard_type TO commonusers;


--
-- TOC entry 5460 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE imt; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.imt TO commonusers;


--
-- TOC entry 5462 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE license; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.license TO commonusers;
GRANT SELECT ON TABLE cf_common.license TO commonviewer;


--
-- TOC entry 5463 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE process_type; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.process_type TO commonusers;


--
-- TOC entry 5 (class 2615 OID 16417)
-- Name: ged4all; Type: SCHEMA; Schema: -; Owner: ged4allcontrib
--

CREATE SCHEMA ged4all;


ALTER SCHEMA ged4all OWNER TO ged4allcontrib;

--
-- TOC entry 10 (class 2615 OID 16418)
-- Name: hazard; Type: SCHEMA; Schema: -; Owner: hazardcontrib
--

CREATE SCHEMA hazard;


ALTER SCHEMA hazard OWNER TO hazardcontrib;

--
-- TOC entry 13 (class 2615 OID 16419)
-- Name: loss; Type: SCHEMA; Schema: -; Owner: losscontrib
--

CREATE SCHEMA loss;


ALTER SCHEMA loss OWNER TO losscontrib;

--
-- TOC entry 5713 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA loss; Type: COMMENT; Schema: -; Owner: losscontrib
--

COMMENT ON SCHEMA loss IS 'Schema for Challenge Fund loss database elements';


--
-- TOC entry 7 (class 2615 OID 16420)
-- Name: mover; Type: SCHEMA; Schema: -; Owner: movercontrib
--

CREATE SCHEMA mover;


ALTER SCHEMA mover OWNER TO movercontrib;

--
-- TOC entry 2 (class 3079 OID 16421)
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- TOC entry 5717 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


--
-- TOC entry 1933 (class 1247 OID 17929)
-- Name: occupancy_enum; Type: TYPE; Schema: cf_common; Owner: gedcf
--

CREATE TYPE cf_common.occupancy_enum AS ENUM (
    'Residential',
    'Commercial',
    'Industrial',
    'Infrastructure',
    'Healthcare',
    'Educational',
    'Government',
    'Crop',
    'Livestock',
    'Forestry',
    'Mixed'
);


ALTER TYPE cf_common.occupancy_enum OWNER TO gedcf;

--
-- TOC entry 5718 (class 0 OID 0)
-- Dependencies: 1933
-- Name: TYPE occupancy_enum; Type: COMMENT; Schema: cf_common; Owner: gedcf
--

COMMENT ON TYPE cf_common.occupancy_enum IS 'Types of Occupancy or building/structure use';


--
-- TOC entry 2006 (class 1247 OID 18143)
-- Name: category_enum; Type: TYPE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TYPE ged4all.category_enum AS ENUM (
    'buildings',
    'indicators',
    'infrastructure',
    'crops, livestock and forestry'
);


ALTER TYPE ged4all.category_enum OWNER TO ged4allcontrib;

--
-- TOC entry 1934 (class 1247 OID 17997)
-- Name: calc_method_enum; Type: TYPE; Schema: hazard; Owner: hazardcontrib
--

CREATE TYPE hazard.calc_method_enum AS ENUM (
    'INF',
    'SIM',
    'OBS'
);


ALTER TYPE hazard.calc_method_enum OWNER TO hazardcontrib;

--
-- TOC entry 5719 (class 0 OID 0)
-- Dependencies: 1934
-- Name: TYPE calc_method_enum; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TYPE hazard.calc_method_enum IS 'Hazard Calculation Methods';


--
-- TOC entry 2069 (class 1247 OID 18283)
-- Name: component_enum; Type: TYPE; Schema: loss; Owner: gedcf
--

CREATE TYPE loss.component_enum AS ENUM (
    'Buildings',
    'Direct Damage to other Asset',
    'Contents',
    'Business Interruption'
);


ALTER TYPE loss.component_enum OWNER TO gedcf;

--
-- TOC entry 5720 (class 0 OID 0)
-- Dependencies: 2069
-- Name: TYPE component_enum; Type: COMMENT; Schema: loss; Owner: gedcf
--

COMMENT ON TYPE loss.component_enum IS 'Types of loss component';


--
-- TOC entry 2072 (class 1247 OID 18292)
-- Name: frequency_enum; Type: TYPE; Schema: loss; Owner: gedcf
--

CREATE TYPE loss.frequency_enum AS ENUM (
    'Rate of Exceedence',
    'Probability of Exceedence',
    'Return Period'
);


ALTER TYPE loss.frequency_enum OWNER TO gedcf;

--
-- TOC entry 5721 (class 0 OID 0)
-- Dependencies: 2072
-- Name: TYPE frequency_enum; Type: COMMENT; Schema: loss; Owner: gedcf
--

COMMENT ON TYPE loss.frequency_enum IS 'Types of loss frequency';


--
-- TOC entry 2075 (class 1247 OID 18300)
-- Name: loss_type_enum; Type: TYPE; Schema: loss; Owner: gedcf
--

CREATE TYPE loss.loss_type_enum AS ENUM (
    'Ground Up',
    'Insured'
);


ALTER TYPE loss.loss_type_enum OWNER TO gedcf;

--
-- TOC entry 5722 (class 0 OID 0)
-- Dependencies: 2075
-- Name: TYPE loss_type_enum; Type: COMMENT; Schema: loss; Owner: gedcf
--

COMMENT ON TYPE loss.loss_type_enum IS 'Types of loss';


--
-- TOC entry 2078 (class 1247 OID 18306)
-- Name: metric_enum; Type: TYPE; Schema: loss; Owner: gedcf
--

CREATE TYPE loss.metric_enum AS ENUM (
    'AAL',
    'AALR',
    'PML'
);


ALTER TYPE loss.metric_enum OWNER TO gedcf;

--
-- TOC entry 5723 (class 0 OID 0)
-- Dependencies: 2078
-- Name: TYPE metric_enum; Type: COMMENT; Schema: loss; Owner: gedcf
--

COMMENT ON TYPE loss.metric_enum IS 'Types of loss metric';


--
-- TOC entry 1769 (class 1247 OID 18436)
-- Name: an_analysis_type_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.an_analysis_type_enum AS ENUM (
    'Advanced',
    'Simplified',
    'N/a'
);


ALTER TYPE mover.an_analysis_type_enum OWNER TO gedcf;

--
-- TOC entry 1879 (class 1247 OID 18444)
-- Name: damage_states_all_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.damage_states_all_enum AS ENUM (
    'No damage',
    'Light damage',
    'Moderate damage',
    'Heavy damage',
    'Collapse',
    'Minor damage',
    'Major damage',
    'Complete damage',
    'Collapsed',
    'Washed away',
    'None',
    'Light',
    'Negligible to Slight',
    'Moderate',
    'Substantial to Heavy',
    'Very Heavy',
    'Destruction',
    'None to Slight',
    'Extensive',
    'Complete',
    'Slight',
    'Partial collapse',
    'Heavy',
    'Severe',
    'Operational',
    'Immediate Occupancy',
    'Life safety',
    'Collapse prevention',
    'Fully Operational',
    'Near Collapse',
    'Production loss',
    'Not applicable'
);


ALTER TYPE mover.damage_states_all_enum OWNER TO gedcf;

--
-- TOC entry 1882 (class 1247 OID 18510)
-- Name: dm_scale_ty_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.dm_scale_ty_enum AS ENUM (
    'Existing',
    'Bespoke',
    'Unknown'
);


ALTER TYPE mover.dm_scale_ty_enum OWNER TO gedcf;

--
-- TOC entry 1885 (class 1247 OID 18518)
-- Name: em_analysis_type_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.em_analysis_type_enum AS ENUM (
    'Least squares',
    'GLM',
    'GAM',
    'N/a'
);


ALTER TYPE mover.em_analysis_type_enum OWNER TO gedcf;

--
-- TOC entry 1968 (class 1247 OID 18528)
-- Name: f_math_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.f_math_enum AS ENUM (
    'Parametric',
    'Bespoke',
    'N/a'
);


ALTER TYPE mover.f_math_enum OWNER TO gedcf;

--
-- TOC entry 1972 (class 1247 OID 18536)
-- Name: f_mathtype_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.f_mathtype_enum AS ENUM (
    'Cumulative Lognormal',
    'Cumulative Normal',
    'Exponential',
    'Bespoke',
    'DtL - Beta PDF',
    'DtL - Normal PDF',
    'DtL - Lognormal PDF',
    'DtL - Uniform PDF',
    'DtL - Bespoke PDF',
    'N/a'
);


ALTER TYPE mover.f_mathtype_enum OWNER TO gedcf;

--
-- TOC entry 1975 (class 1247 OID 18558)
-- Name: f_relationship_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.f_relationship_enum AS ENUM (
    'Mathematical',
    'Discrete'
);


ALTER TYPE mover.f_relationship_enum OWNER TO gedcf;

--
-- TOC entry 1978 (class 1247 OID 18564)
-- Name: f_subtype_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.f_subtype_enum AS ENUM (
    'Empirical',
    'Analytical',
    'Judgement',
    'Hybrid - Analytical/Empirical',
    'Hybrid - Analytical/Judgement',
    'Hybrid - Empirical/Judgement',
    'Hybrid - Analytical HF/LF',
    'Code - based'
);


ALTER TYPE mover.f_subtype_enum OWNER TO gedcf;

--
-- TOC entry 1981 (class 1247 OID 18582)
-- Name: fit_ref_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.fit_ref_enum AS ENUM (
    'AIC',
    'BIC',
    'Kolmogorov-Smirnov'
);


ALTER TYPE mover.fit_ref_enum OWNER TO gedcf;

--
-- TOC entry 1984 (class 1247 OID 18590)
-- Name: function_type_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.function_type_enum AS ENUM (
    'Fragility',
    'Vulnerability',
    'Damage-to-Loss'
);


ALTER TYPE mover.function_type_enum OWNER TO gedcf;

--
-- TOC entry 1987 (class 1247 OID 18598)
-- Name: geographic_relevance_score_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.geographic_relevance_score_enum AS ENUM (
    'Excellent',
    'Good',
    'Needs improvement',
    'Unusable'
);


ALTER TYPE mover.geographic_relevance_score_enum OWNER TO gedcf;

--
-- TOC entry 1990 (class 1247 OID 18608)
-- Name: im_method_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.im_method_enum AS ENUM (
    'Recorded',
    'Surveyed',
    'Simulated',
    'Unknown'
);


ALTER TYPE mover.im_method_enum OWNER TO gedcf;

--
-- TOC entry 1993 (class 1247 OID 18618)
-- Name: jd_analysis_type_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.jd_analysis_type_enum AS ENUM (
    'Delphi',
    'Cookes',
    'N/a'
);


ALTER TYPE mover.jd_analysis_type_enum OWNER TO gedcf;

--
-- TOC entry 1996 (class 1247 OID 18626)
-- Name: nonsampling_err_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.nonsampling_err_enum AS ENUM (
    'Yes',
    'No',
    'Unknown'
);


ALTER TYPE mover.nonsampling_err_enum OWNER TO gedcf;

--
-- TOC entry 1999 (class 1247 OID 18634)
-- Name: sample_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.sample_enum AS ENUM (
    'Single-asset class',
    'Multi-assets classes',
    'Single-asset'
);


ALTER TYPE mover.sample_enum OWNER TO gedcf;

--
-- TOC entry 2034 (class 1247 OID 18642)
-- Name: scale_app_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.scale_app_enum AS ENUM (
    'Country (Level 0)',
    'Sub-country (Level 1)',
    'Local (Level 2)',
    'Asset (Level 3)'
);


ALTER TYPE mover.scale_app_enum OWNER TO gedcf;

--
-- TOC entry 2037 (class 1247 OID 18652)
-- Name: sim_method_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.sim_method_enum AS ENUM (
    'Physics-based',
    'IMPE'
);


ALTER TYPE mover.sim_method_enum OWNER TO gedcf;

--
-- TOC entry 2040 (class 1247 OID 18658)
-- Name: type_nonsampling_err_enum; Type: TYPE; Schema: mover; Owner: gedcf
--

CREATE TYPE mover.type_nonsampling_err_enum AS ENUM (
    'Under coverage',
    'Incomplete data',
    'Measurement error',
    'Unknown'
);


ALTER TYPE mover.type_nonsampling_err_enum OWNER TO gedcf;

SET default_tablespace = '';

--
-- TOC entry 217 (class 1259 OID 17951)
-- Name: hazard_type; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.hazard_type (
    code character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE cf_common.hazard_type OWNER TO commoncontrib;

--
-- TOC entry 5724 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE hazard_type; Type: COMMENT; Schema: cf_common; Owner: commoncontrib
--

COMMENT ON TABLE cf_common.hazard_type IS 'Valid Hazard types';


--
-- TOC entry 218 (class 1259 OID 17957)
-- Name: imt; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.imt (
    process_code character varying NOT NULL,
    hazard_code character varying NOT NULL,
    im_code character varying NOT NULL,
    description character varying NOT NULL,
    units character varying NOT NULL
);


ALTER TABLE cf_common.imt OWNER TO commoncontrib;

--
-- TOC entry 219 (class 1259 OID 17963)
-- Name: license; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.license (
    code character varying NOT NULL,
    name character varying NOT NULL,
    notes text,
    url character varying NOT NULL
);


ALTER TABLE cf_common.license OWNER TO commoncontrib;

--
-- TOC entry 5727 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE license; Type: COMMENT; Schema: cf_common; Owner: commoncontrib
--

COMMENT ON TABLE cf_common.license IS 'List of supported licenses';


--
-- TOC entry 220 (class 1259 OID 17969)
-- Name: process_type; Type: TABLE; Schema: cf_common; Owner: commoncontrib
--

CREATE TABLE cf_common.process_type (
    code character varying NOT NULL,
    hazard_code character varying NOT NULL,
    name character varying NOT NULL
);


ALTER TABLE cf_common.process_type OWNER TO commoncontrib;

--
-- TOC entry 233 (class 1259 OID 18151)
-- Name: asset; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.asset (
    id integer NOT NULL,
    exposure_model_id integer NOT NULL,
    asset_ref character varying NOT NULL,
    taxonomy character varying NOT NULL,
    number_of_units double precision,
    area double precision,
    the_geom public.geometry(Point,4326) NOT NULL,
    full_geom public.geometry(Geometry,4326),
    CONSTRAINT area_value CHECK ((area >= (0.0)::double precision)),
    CONSTRAINT units_value CHECK ((number_of_units >= (0.0)::double precision))
);


ALTER TABLE ged4all.asset OWNER TO ged4allcontrib;

--
-- TOC entry 234 (class 1259 OID 18159)
-- Name: cost; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.cost (
    id integer NOT NULL,
    asset_id integer NOT NULL,
    cost_type_id integer NOT NULL,
    value double precision NOT NULL,
    deductible double precision,
    insurance_limit double precision,
    CONSTRAINT converted_cost_value CHECK ((value >= (0.0)::double precision))
);


ALTER TABLE ged4all.cost OWNER TO ged4allcontrib;

--
-- TOC entry 235 (class 1259 OID 18163)
-- Name: model_cost_type; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.model_cost_type (
    id integer NOT NULL,
    exposure_model_id integer NOT NULL,
    cost_type_name character varying NOT NULL,
    aggregation_type character varying NOT NULL,
    unit character varying,
    CONSTRAINT aggregation_type_value CHECK ((((aggregation_type)::text = 'per_asset'::text) OR ((aggregation_type)::text = 'per_area'::text) OR ((aggregation_type)::text = 'aggregated'::text)))
);


ALTER TABLE ged4all.model_cost_type OWNER TO ged4allcontrib;

--
-- TOC entry 236 (class 1259 OID 18170)
-- Name: occupancy; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.occupancy (
    id integer NOT NULL,
    asset_id integer NOT NULL,
    period character varying NOT NULL,
    occupants double precision NOT NULL
);


ALTER TABLE ged4all.occupancy OWNER TO ged4allcontrib;

--
-- TOC entry 237 (class 1259 OID 18176)
-- Name: all_exposure; Type: VIEW; Schema: ged4all; Owner: ged4allcontrib
--

CREATE VIEW ged4all.all_exposure AS
 SELECT a.asset_ref,
    a.taxonomy,
    a.number_of_units,
    a.area,
    a.exposure_model_id,
    occ.period,
    occ.occupants,
    c.value,
    mct.cost_type_name,
    mct.aggregation_type,
    mct.unit,
    public.st_x(a.the_geom) AS lon,
    public.st_y(a.the_geom) AS lat
   FROM (((ged4all.asset a
     LEFT JOIN ged4all.cost c ON ((c.asset_id = a.id)))
     LEFT JOIN ged4all.model_cost_type mct ON ((mct.id = c.cost_type_id)))
     LEFT JOIN ged4all.occupancy occ ON ((occ.asset_id = a.id)));


ALTER TABLE ged4all.all_exposure OWNER TO ged4allcontrib;

--
-- TOC entry 238 (class 1259 OID 18181)
-- Name: asset_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.asset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.asset_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5735 (class 0 OID 0)
-- Dependencies: 238
-- Name: asset_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.asset_id_seq OWNED BY ged4all.asset.id;


--
-- TOC entry 239 (class 1259 OID 18183)
-- Name: contribution; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.contribution (
    id integer NOT NULL,
    exposure_model_id integer NOT NULL,
    model_source character varying NOT NULL,
    model_date date NOT NULL,
    notes text,
    version character varying,
    purpose text,
    project character varying,
    contributed_at timestamp without time zone DEFAULT now() NOT NULL,
    license_code character varying NOT NULL
);


ALTER TABLE ged4all.contribution OWNER TO ged4allcontrib;

--
-- TOC entry 240 (class 1259 OID 18190)
-- Name: contribution_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.contribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.contribution_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5738 (class 0 OID 0)
-- Dependencies: 240
-- Name: contribution_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.contribution_id_seq OWNED BY ged4all.contribution.id;


--
-- TOC entry 241 (class 1259 OID 18192)
-- Name: cost_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.cost_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.cost_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5740 (class 0 OID 0)
-- Dependencies: 241
-- Name: cost_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.cost_id_seq OWNED BY ged4all.cost.id;


--
-- TOC entry 242 (class 1259 OID 18194)
-- Name: exposure_model; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.exposure_model (
    id integer NOT NULL,
    name character varying NOT NULL,
    description character varying,
    taxonomy_source character varying,
    category ged4all.category_enum NOT NULL,
    area_type character varying,
    area_unit character varying,
    tag_names character varying,
    use cf_common.occupancy_enum,
    CONSTRAINT area_type_value CHECK (((area_type IS NULL) OR ((area_type)::text = 'per_asset'::text) OR ((area_type)::text = 'aggregated'::text)))
);


ALTER TABLE ged4all.exposure_model OWNER TO ged4allcontrib;

--
-- TOC entry 243 (class 1259 OID 18201)
-- Name: exposure_model_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.exposure_model_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.exposure_model_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5743 (class 0 OID 0)
-- Dependencies: 243
-- Name: exposure_model_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.exposure_model_id_seq OWNED BY ged4all.exposure_model.id;


--
-- TOC entry 244 (class 1259 OID 18203)
-- Name: model_cost_type_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.model_cost_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.model_cost_type_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5745 (class 0 OID 0)
-- Dependencies: 244
-- Name: model_cost_type_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.model_cost_type_id_seq OWNED BY ged4all.model_cost_type.id;


--
-- TOC entry 245 (class 1259 OID 18205)
-- Name: occupancy_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.occupancy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.occupancy_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5747 (class 0 OID 0)
-- Dependencies: 245
-- Name: occupancy_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.occupancy_id_seq OWNED BY ged4all.occupancy.id;


--
-- TOC entry 246 (class 1259 OID 18207)
-- Name: tags; Type: TABLE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE TABLE ged4all.tags (
    id integer NOT NULL,
    asset_id integer NOT NULL,
    name character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE ged4all.tags OWNER TO ged4allcontrib;

--
-- TOC entry 247 (class 1259 OID 18213)
-- Name: tags_id_seq; Type: SEQUENCE; Schema: ged4all; Owner: ged4allcontrib
--

CREATE SEQUENCE ged4all.tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ged4all.tags_id_seq OWNER TO ged4allcontrib;

--
-- TOC entry 5750 (class 0 OID 0)
-- Dependencies: 247
-- Name: tags_id_seq; Type: SEQUENCE OWNED BY; Schema: ged4all; Owner: ged4allcontrib
--

ALTER SEQUENCE ged4all.tags_id_seq OWNED BY ged4all.tags.id;


--
-- TOC entry 221 (class 1259 OID 18003)
-- Name: contribution; Type: TABLE; Schema: hazard; Owner: hazardcontrib
--

CREATE TABLE hazard.contribution (
    id integer NOT NULL,
    event_set_id integer NOT NULL,
    model_source character varying NOT NULL,
    model_date date NOT NULL,
    notes text,
    version character varying,
    purpose text,
    project character varying,
    contributed_at timestamp without time zone DEFAULT now() NOT NULL,
    license_code character varying NOT NULL
);


ALTER TABLE hazard.contribution OWNER TO hazardcontrib;

--
-- TOC entry 5752 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE contribution; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TABLE hazard.contribution IS 'Meta-data for contributed model, license, source etc.';


--
-- TOC entry 223 (class 1259 OID 18012)
-- Name: event; Type: TABLE; Schema: hazard; Owner: hazardcontrib
--

CREATE TABLE hazard.event (
    id integer NOT NULL,
    event_set_id integer,
    calculation_method hazard.calc_method_enum NOT NULL,
    frequency double precision,
    occurrence_probability double precision,
    occurrence_time_start timestamp without time zone,
    occurrence_time_end timestamp without time zone,
    occurrence_time_span interval,
    trigger_hazard_type character varying,
    trigger_process_type character varying,
    trigger_event_id integer,
    description text
);


ALTER TABLE hazard.event OWNER TO hazardcontrib;

--
-- TOC entry 5754 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE event; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TABLE hazard.event IS 'A single event, member of an event set';


--
-- TOC entry 225 (class 1259 OID 18020)
-- Name: event_set; Type: TABLE; Schema: hazard; Owner: hazardcontrib
--

CREATE TABLE hazard.event_set (
    id integer NOT NULL,
    the_geom public.geometry(Polygon,4326) NOT NULL,
    geographic_area_name character varying NOT NULL,
    creation_date date NOT NULL,
    hazard_type character varying NOT NULL,
    time_start timestamp without time zone,
    time_end timestamp without time zone,
    time_duration interval,
    description text,
    bibliography text,
    is_prob boolean DEFAULT false NOT NULL
);


ALTER TABLE hazard.event_set OWNER TO hazardcontrib;

--
-- TOC entry 5756 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE event_set; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TABLE hazard.event_set IS 'Collection of one or more events';


--
-- TOC entry 276 (class 1259 OID 27262)
-- Name: NumEvents; Type: VIEW; Schema: hazard; Owner: stuartfraser
--

CREATE VIEW hazard."NumEvents" AS
 SELECT co.id,
    co.model_source,
    es.id AS eventset,
    es.description AS eventsetdesc,
    count(e.id) AS numevents
   FROM ((hazard.event e
     JOIN hazard.event_set es ON ((e.event_set_id = es.id)))
     JOIN hazard.contribution co ON ((es.id = co.event_set_id)))
  GROUP BY co.id, co.model_source, es.id, es.description
  ORDER BY co.id;


ALTER TABLE hazard."NumEvents" OWNER TO stuartfraser;

--
-- TOC entry 5758 (class 0 OID 0)
-- Dependencies: 276
-- Name: VIEW "NumEvents"; Type: COMMENT; Schema: hazard; Owner: stuartfraser
--

COMMENT ON VIEW hazard."NumEvents" IS 'Returns the number of events per event set for each contribution';


--
-- TOC entry 222 (class 1259 OID 18010)
-- Name: contribution_id_seq; Type: SEQUENCE; Schema: hazard; Owner: hazardcontrib
--

CREATE SEQUENCE hazard.contribution_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hazard.contribution_id_seq OWNER TO hazardcontrib;

--
-- TOC entry 5759 (class 0 OID 0)
-- Dependencies: 222
-- Name: contribution_id_seq; Type: SEQUENCE OWNED BY; Schema: hazard; Owner: hazardcontrib
--

ALTER SEQUENCE hazard.contribution_id_seq OWNED BY hazard.contribution.id;


--
-- TOC entry 231 (class 1259 OID 18045)
-- Name: footprint_set; Type: TABLE; Schema: hazard; Owner: hazardcontrib
--

CREATE TABLE hazard.footprint_set (
    id integer NOT NULL,
    event_id integer NOT NULL,
    process_type character varying NOT NULL,
    imt character varying NOT NULL,
    data_uncertainty character varying
);


ALTER TABLE hazard.footprint_set OWNER TO hazardcontrib;

--
-- TOC entry 5761 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE footprint_set; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TABLE hazard.footprint_set IS 'A homogeneous set of footprints associated with an event';


--
-- TOC entry 277 (class 1259 OID 27267)
-- Name: count_FootprintSets; Type: VIEW; Schema: hazard; Owner: stuartfraser
--

CREATE VIEW hazard."count_FootprintSets" AS
 SELECT co.id,
    co.model_source,
    es.id AS eventset,
    es.description AS eventsetdesc,
    e.id AS eventid,
    e.description AS eventdesc,
    count(fp.id) AS numfootprintsets
   FROM (((hazard.footprint_set fp
     JOIN hazard.event e ON ((fp.event_id = e.id)))
     JOIN hazard.event_set es ON ((e.event_set_id = es.id)))
     JOIN hazard.contribution co ON ((es.id = co.event_set_id)))
  GROUP BY co.id, co.model_source, es.id, es.description, e.id, e.description
  ORDER BY co.id;


ALTER TABLE hazard."count_FootprintSets" OWNER TO stuartfraser;

--
-- TOC entry 5763 (class 0 OID 0)
-- Dependencies: 277
-- Name: VIEW "count_FootprintSets"; Type: COMMENT; Schema: hazard; Owner: stuartfraser
--

COMMENT ON VIEW hazard."count_FootprintSets" IS 'Returns a count of footprint sets for each event, per contribution';


--
-- TOC entry 227 (class 1259 OID 18029)
-- Name: footprint; Type: TABLE; Schema: hazard; Owner: hazardcontrib
--

CREATE TABLE hazard.footprint (
    id integer NOT NULL,
    footprint_set_id integer NOT NULL,
    uncertainty_2nd_moment double precision[],
    trigger_footprint_id integer
);


ALTER TABLE hazard.footprint OWNER TO hazardcontrib;

--
-- TOC entry 5764 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE footprint; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TABLE hazard.footprint IS 'A single footprint or intensity field, a realization of an event';


--
-- TOC entry 228 (class 1259 OID 18035)
-- Name: footprint_data; Type: TABLE; Schema: hazard; Owner: hazardcontrib
--

CREATE TABLE hazard.footprint_data (
    id integer NOT NULL,
    footprint_id integer NOT NULL,
    the_geom public.geometry(Point,4326) NOT NULL,
    intensity double precision NOT NULL
);


ALTER TABLE hazard.footprint_data OWNER TO hazardcontrib;

--
-- TOC entry 5766 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE footprint_data; Type: COMMENT; Schema: hazard; Owner: hazardcontrib
--

COMMENT ON TABLE hazard.footprint_data IS 'A single point in a footprint: point location and intensity value';


--
-- TOC entry 275 (class 1259 OID 27257)
-- Name: count_Footprint_data; Type: VIEW; Schema: hazard; Owner: stuartfraser
--

CREATE VIEW hazard."count_Footprint_data" AS
 SELECT co.id,
    co.model_source,
    es.description AS event_set_desc,
    count(fd.intensity) AS count
   FROM (((((hazard.footprint_data fd
     JOIN hazard.footprint f ON ((fd.footprint_id = f.id)))
     JOIN hazard.footprint_set ft ON ((f.footprint_set_id = ft.id)))
     JOIN hazard.event e ON ((ft.event_id = e.id)))
     JOIN hazard.event_set es ON ((e.event_set_id = es.id)))
     JOIN hazard.contribution co ON ((es.id = co.event_set_id)))
  WHERE (fd.intensity > (0)::double precision)
  GROUP BY co.id, co.model_source, es.description
  ORDER BY co.id;


ALTER TABLE hazard."count_Footprint_data" OWNER TO stuartfraser;

--
-- TOC entry 5768 (class 0 OID 0)
-- Dependencies: 275
-- Name: VIEW "count_Footprint_data"; Type: COMMENT; Schema: hazard; Owner: stuartfraser
--

COMMENT ON VIEW hazard."count_Footprint_data" IS 'Returns the count of footprint records for each contribution.id';


--
-- TOC entry 224 (class 1259 OID 18018)
-- Name: event_id_seq; Type: SEQUENCE; Schema: hazard; Owner: hazardcontrib
--

CREATE SEQUENCE hazard.event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hazard.event_id_seq OWNER TO hazardcontrib;

--
-- TOC entry 5769 (class 0 OID 0)
-- Dependencies: 224
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: hazard; Owner: hazardcontrib
--

ALTER SEQUENCE hazard.event_id_seq OWNED BY hazard.event.id;


--
-- TOC entry 226 (class 1259 OID 18027)
-- Name: event_set_id_seq; Type: SEQUENCE; Schema: hazard; Owner: hazardcontrib
--

CREATE SEQUENCE hazard.event_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hazard.event_set_id_seq OWNER TO hazardcontrib;

--
-- TOC entry 5771 (class 0 OID 0)
-- Dependencies: 226
-- Name: event_set_id_seq; Type: SEQUENCE OWNED BY; Schema: hazard; Owner: hazardcontrib
--

ALTER SEQUENCE hazard.event_set_id_seq OWNED BY hazard.event_set.id;


--
-- TOC entry 229 (class 1259 OID 18041)
-- Name: footprint_data_id_seq; Type: SEQUENCE; Schema: hazard; Owner: hazardcontrib
--

CREATE SEQUENCE hazard.footprint_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hazard.footprint_data_id_seq OWNER TO hazardcontrib;

--
-- TOC entry 5773 (class 0 OID 0)
-- Dependencies: 229
-- Name: footprint_data_id_seq; Type: SEQUENCE OWNED BY; Schema: hazard; Owner: hazardcontrib
--

ALTER SEQUENCE hazard.footprint_data_id_seq OWNED BY hazard.footprint_data.id;


--
-- TOC entry 230 (class 1259 OID 18043)
-- Name: footprint_id_seq; Type: SEQUENCE; Schema: hazard; Owner: hazardcontrib
--

CREATE SEQUENCE hazard.footprint_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hazard.footprint_id_seq OWNER TO hazardcontrib;

--
-- TOC entry 5775 (class 0 OID 0)
-- Dependencies: 230
-- Name: footprint_id_seq; Type: SEQUENCE OWNED BY; Schema: hazard; Owner: hazardcontrib
--

ALTER SEQUENCE hazard.footprint_id_seq OWNED BY hazard.footprint.id;


--
-- TOC entry 232 (class 1259 OID 18051)
-- Name: footprint_set_id_seq; Type: SEQUENCE; Schema: hazard; Owner: hazardcontrib
--

CREATE SEQUENCE hazard.footprint_set_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE hazard.footprint_set_id_seq OWNER TO hazardcontrib;

--
-- TOC entry 5777 (class 0 OID 0)
-- Dependencies: 232
-- Name: footprint_set_id_seq; Type: SEQUENCE OWNED BY; Schema: hazard; Owner: hazardcontrib
--

ALTER SEQUENCE hazard.footprint_set_id_seq OWNED BY hazard.footprint_set.id;


--
-- TOC entry 248 (class 1259 OID 18313)
-- Name: loss_map; Type: TABLE; Schema: loss; Owner: losscontrib
--

CREATE TABLE loss.loss_map (
    id integer NOT NULL,
    loss_model_id integer NOT NULL,
    occupancy cf_common.occupancy_enum NOT NULL,
    component loss.component_enum NOT NULL,
    loss_type loss.loss_type_enum NOT NULL,
    return_period integer,
    units character varying NOT NULL,
    metric loss.metric_enum NOT NULL,
    CONSTRAINT pml_implies_return_period CHECK ((NOT ((metric = 'PML'::loss.metric_enum) AND (return_period IS NULL))))
);


ALTER TABLE loss.loss_map OWNER TO losscontrib;

--
-- TOC entry 5779 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE loss_map; Type: COMMENT; Schema: loss; Owner: losscontrib
--

COMMENT ON TABLE loss.loss_map IS 'Meta-data for a single loss map for a given loss model';


--
-- TOC entry 249 (class 1259 OID 18320)
-- Name: loss_map_values; Type: TABLE; Schema: loss; Owner: losscontrib
--

CREATE TABLE loss.loss_map_values (
    id bigint NOT NULL,
    loss_map_id integer NOT NULL,
    asset_ref character varying,
    the_geom public.geometry(Geometry,4326) NOT NULL,
    loss double precision NOT NULL
);


ALTER TABLE loss.loss_map_values OWNER TO losscontrib;

--
-- TOC entry 5781 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE loss_map_values; Type: COMMENT; Schema: loss; Owner: losscontrib
--

COMMENT ON TABLE loss.loss_map_values IS 'Loss values for the specified loss map';


--
-- TOC entry 250 (class 1259 OID 18326)
-- Name: loss_model; Type: TABLE; Schema: loss; Owner: losscontrib
--

CREATE TABLE loss.loss_model (
    id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    hazard_type character varying,
    process_type character varying,
    hazard_link integer,
    exposure_link integer,
    vulnerability_link integer
);


ALTER TABLE loss.loss_model OWNER TO losscontrib;

--
-- TOC entry 5783 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE loss_model; Type: COMMENT; Schema: loss; Owner: losscontrib
--

COMMENT ON TABLE loss.loss_model IS 'Loss model meta-data and optional links to hazard, exposure and vulnerability models';


--
-- TOC entry 251 (class 1259 OID 18332)
-- Name: all_loss_map_values; Type: VIEW; Schema: loss; Owner: gedcf
--

CREATE VIEW loss.all_loss_map_values AS
 SELECT lmv.id AS uid,
    lmv.loss_map_id,
    public.st_astext(lmv.the_geom) AS geom,
    lmv.asset_ref,
    lmv.loss,
    lm.occupancy,
    lm.component,
    lm.loss_type,
    lm.return_period,
    lm.units,
    lm.metric,
    mod.name,
    mod.hazard_type,
    mod.process_type
   FROM ((loss.loss_map_values lmv
     JOIN loss.loss_map lm ON ((lm.id = lmv.loss_map_id)))
     JOIN loss.loss_model mod ON ((mod.id = lm.loss_model_id)))
  ORDER BY lmv.id;


ALTER TABLE loss.all_loss_map_values OWNER TO gedcf;

--
-- TOC entry 252 (class 1259 OID 18337)
-- Name: contribution; Type: TABLE; Schema: loss; Owner: losscontrib
--

CREATE TABLE loss.contribution (
    id integer NOT NULL,
    loss_model_id integer NOT NULL,
    model_source character varying NOT NULL,
    model_date date NOT NULL,
    notes text,
    version character varying,
    purpose text,
    project character varying,
    contributed_at timestamp without time zone DEFAULT now() NOT NULL,
    license_code character varying NOT NULL
);


ALTER TABLE loss.contribution OWNER TO losscontrib;

--
-- TOC entry 5786 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE contribution; Type: COMMENT; Schema: loss; Owner: losscontrib
--

COMMENT ON TABLE loss.contribution IS 'Meta-data for contributed model, license, source etc.';


--
-- TOC entry 253 (class 1259 OID 18344)
-- Name: contribution_id_seq; Type: SEQUENCE; Schema: loss; Owner: losscontrib
--

CREATE SEQUENCE loss.contribution_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loss.contribution_id_seq OWNER TO losscontrib;

--
-- TOC entry 5788 (class 0 OID 0)
-- Dependencies: 253
-- Name: contribution_id_seq; Type: SEQUENCE OWNED BY; Schema: loss; Owner: losscontrib
--

ALTER SEQUENCE loss.contribution_id_seq OWNED BY loss.contribution.id;


--
-- TOC entry 254 (class 1259 OID 18346)
-- Name: loss_curve_map; Type: TABLE; Schema: loss; Owner: losscontrib
--

CREATE TABLE loss.loss_curve_map (
    id integer NOT NULL,
    loss_model_id integer NOT NULL,
    occupancy cf_common.occupancy_enum NOT NULL,
    component loss.component_enum NOT NULL,
    loss_type loss.loss_type_enum NOT NULL,
    frequency loss.frequency_enum NOT NULL,
    investigation_time integer,
    units character varying NOT NULL
);


ALTER TABLE loss.loss_curve_map OWNER TO losscontrib;

--
-- TOC entry 5790 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE loss_curve_map; Type: COMMENT; Schema: loss; Owner: losscontrib
--

COMMENT ON TABLE loss.loss_curve_map IS 'Meta-data for a map of (PML) loss curves for a given loss model';


--
-- TOC entry 255 (class 1259 OID 18352)
-- Name: loss_curve_map_id_seq; Type: SEQUENCE; Schema: loss; Owner: losscontrib
--

CREATE SEQUENCE loss.loss_curve_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loss.loss_curve_map_id_seq OWNER TO losscontrib;

--
-- TOC entry 5792 (class 0 OID 0)
-- Dependencies: 255
-- Name: loss_curve_map_id_seq; Type: SEQUENCE OWNED BY; Schema: loss; Owner: losscontrib
--

ALTER SEQUENCE loss.loss_curve_map_id_seq OWNED BY loss.loss_curve_map.id;


--
-- TOC entry 256 (class 1259 OID 18354)
-- Name: loss_curve_map_values; Type: TABLE; Schema: loss; Owner: losscontrib
--

CREATE TABLE loss.loss_curve_map_values (
    id bigint NOT NULL,
    loss_curve_map_id integer NOT NULL,
    asset_ref character varying,
    the_geom public.geometry(Geometry,4326) NOT NULL,
    losses double precision[] NOT NULL,
    rates double precision[] NOT NULL,
    CONSTRAINT loss_curve_array_lengths_equal CHECK ((array_length(losses, 1) = array_length(rates, 1)))
);


ALTER TABLE loss.loss_curve_map_values OWNER TO losscontrib;

--
-- TOC entry 5794 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE loss_curve_map_values; Type: COMMENT; Schema: loss; Owner: losscontrib
--

COMMENT ON TABLE loss.loss_curve_map_values IS 'Loss curve values for the specified loss curve map';


--
-- TOC entry 257 (class 1259 OID 18361)
-- Name: loss_curve_map_values_id_seq; Type: SEQUENCE; Schema: loss; Owner: losscontrib
--

CREATE SEQUENCE loss.loss_curve_map_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loss.loss_curve_map_values_id_seq OWNER TO losscontrib;

--
-- TOC entry 5796 (class 0 OID 0)
-- Dependencies: 257
-- Name: loss_curve_map_values_id_seq; Type: SEQUENCE OWNED BY; Schema: loss; Owner: losscontrib
--

ALTER SEQUENCE loss.loss_curve_map_values_id_seq OWNED BY loss.loss_curve_map_values.id;


--
-- TOC entry 258 (class 1259 OID 18363)
-- Name: loss_map_id_seq; Type: SEQUENCE; Schema: loss; Owner: losscontrib
--

CREATE SEQUENCE loss.loss_map_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loss.loss_map_id_seq OWNER TO losscontrib;

--
-- TOC entry 5798 (class 0 OID 0)
-- Dependencies: 258
-- Name: loss_map_id_seq; Type: SEQUENCE OWNED BY; Schema: loss; Owner: losscontrib
--

ALTER SEQUENCE loss.loss_map_id_seq OWNED BY loss.loss_map.id;


--
-- TOC entry 259 (class 1259 OID 18365)
-- Name: loss_map_values_id_seq; Type: SEQUENCE; Schema: loss; Owner: losscontrib
--

CREATE SEQUENCE loss.loss_map_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loss.loss_map_values_id_seq OWNER TO losscontrib;

--
-- TOC entry 5800 (class 0 OID 0)
-- Dependencies: 259
-- Name: loss_map_values_id_seq; Type: SEQUENCE OWNED BY; Schema: loss; Owner: losscontrib
--

ALTER SEQUENCE loss.loss_map_values_id_seq OWNED BY loss.loss_map_values.id;


--
-- TOC entry 260 (class 1259 OID 18367)
-- Name: loss_model_id_seq; Type: SEQUENCE; Schema: loss; Owner: losscontrib
--

CREATE SEQUENCE loss.loss_model_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE loss.loss_model_id_seq OWNER TO losscontrib;

--
-- TOC entry 5802 (class 0 OID 0)
-- Dependencies: 260
-- Name: loss_model_id_seq; Type: SEQUENCE OWNED BY; Schema: loss; Owner: losscontrib
--

ALTER SEQUENCE loss.loss_model_id_seq OWNED BY loss.loss_model.id;


--
-- TOC entry 261 (class 1259 OID 18667)
-- Name: damage_scale; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.damage_scale (
    dm_scale_reference character varying,
    asset_notes character varying,
    n_dm_states character(1) NOT NULL,
    dm_states_id character varying NOT NULL,
    dm_states_name character varying NOT NULL,
    is_edp_thre boolean NOT NULL,
    is_dm_factor boolean NOT NULL,
    is_casualties boolean NOT NULL,
    is_downtime boolean NOT NULL,
    id integer NOT NULL,
    damage_scale_name character varying,
    damage_scale_code character varying,
    damage_scale_type mover.dm_scale_ty_enum,
    occupancy cf_common.occupancy_enum,
    taxonomy_source character varying,
    taxonomy character varying,
    asset_type character varying,
    hazard_type character varying,
    process_type character varying
);


ALTER TABLE mover.damage_scale OWNER TO movercontrib;

--
-- TOC entry 262 (class 1259 OID 18673)
-- Name: damage_scale_id_seq; Type: SEQUENCE; Schema: mover; Owner: movercontrib
--

CREATE SEQUENCE mover.damage_scale_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mover.damage_scale_id_seq OWNER TO movercontrib;

--
-- TOC entry 5805 (class 0 OID 0)
-- Dependencies: 262
-- Name: damage_scale_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: movercontrib
--

ALTER SEQUENCE mover.damage_scale_id_seq OWNED BY mover.damage_scale.id;


--
-- TOC entry 263 (class 1259 OID 18675)
-- Name: edp_table; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.edp_table (
    description character varying NOT NULL,
    units character varying,
    edp_name character varying,
    edp_code character varying NOT NULL
);


ALTER TABLE mover.edp_table OWNER TO movercontrib;

--
-- TOC entry 264 (class 1259 OID 18681)
-- Name: f_additional; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.f_additional (
    f_additional_id integer NOT NULL,
    nonsampling_err mover.nonsampling_err_enum NOT NULL,
    type_nonsampling_err mover.type_nonsampling_err_enum,
    is_fix_nonsamp_err boolean,
    is_data_aggregated boolean,
    n_data_points_aggr integer,
    is_data_disaggr boolean,
    n_data_points_disaggr integer,
    an_analysis_type mover.an_analysis_type_enum,
    em_analysis_type mover.em_analysis_type_enum,
    jd_analysis_type mover.jd_analysis_type_enum,
    is_fit_good boolean,
    fit_ref mover.fit_ref_enum,
    val_data_source character varying,
    val_study_reference character varying,
    sample mover.sample_enum
);


ALTER TABLE mover.f_additional OWNER TO movercontrib;

--
-- TOC entry 265 (class 1259 OID 18687)
-- Name: f_additional_f_additional_id_seq; Type: SEQUENCE; Schema: mover; Owner: movercontrib
--

CREATE SEQUENCE mover.f_additional_f_additional_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mover.f_additional_f_additional_id_seq OWNER TO movercontrib;

--
-- TOC entry 5809 (class 0 OID 0)
-- Dependencies: 265
-- Name: f_additional_f_additional_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: movercontrib
--

ALTER SEQUENCE mover.f_additional_f_additional_id_seq OWNED BY mover.f_additional.f_additional_id;


--
-- TOC entry 266 (class 1259 OID 18689)
-- Name: f_core; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.f_core (
    id integer NOT NULL,
    hazard_type_primary character varying NOT NULL,
    hazard_type_secondary character varying,
    process_type_primary character varying NOT NULL,
    process_type_secondary character varying,
    occupancy cf_common.occupancy_enum NOT NULL,
    taxonomy_source character varying,
    taxonomy character varying,
    asset_type character varying NOT NULL,
    asset_notes character varying,
    country_iso character varying NOT NULL,
    applicability_notes character varying,
    scale_applicability mover.scale_app_enum NOT NULL,
    function_type mover.function_type_enum NOT NULL,
    approach mover.f_subtype_enum NOT NULL,
    f_relationship mover.f_relationship_enum NOT NULL,
    f_math mover.f_math_enum,
    f_math_model mover.f_mathtype_enum,
    bespoke_model_ref character varying,
    f_reference character varying NOT NULL,
    licence_code character varying NOT NULL,
    licence_reference character varying,
    created_at timestamp with time zone DEFAULT now()
);


ALTER TABLE mover.f_core OWNER TO movercontrib;

--
-- TOC entry 267 (class 1259 OID 18696)
-- Name: f_core_id_seq; Type: SEQUENCE; Schema: mover; Owner: movercontrib
--

CREATE SEQUENCE mover.f_core_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mover.f_core_id_seq OWNER TO movercontrib;

--
-- TOC entry 5812 (class 0 OID 0)
-- Dependencies: 267
-- Name: f_core_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: movercontrib
--

ALTER SEQUENCE mover.f_core_id_seq OWNED BY mover.f_core.id;


--
-- TOC entry 268 (class 1259 OID 18698)
-- Name: f_scoring; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.f_scoring (
    id integer NOT NULL,
    geo_applicability character varying,
    f_core_id integer NOT NULL,
    geographic_relevance_score mover.geographic_relevance_score_enum
);


ALTER TABLE mover.f_scoring OWNER TO movercontrib;

--
-- TOC entry 269 (class 1259 OID 18704)
-- Name: f_scoring_f_core_id_seq; Type: SEQUENCE; Schema: mover; Owner: movercontrib
--

CREATE SEQUENCE mover.f_scoring_f_core_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mover.f_scoring_f_core_id_seq OWNER TO movercontrib;

--
-- TOC entry 5815 (class 0 OID 0)
-- Dependencies: 269
-- Name: f_scoring_f_core_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: movercontrib
--

ALTER SEQUENCE mover.f_scoring_f_core_id_seq OWNED BY mover.f_scoring.f_core_id;


--
-- TOC entry 270 (class 1259 OID 18706)
-- Name: f_scoring_id_seq; Type: SEQUENCE; Schema: mover; Owner: movercontrib
--

CREATE SEQUENCE mover.f_scoring_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mover.f_scoring_id_seq OWNER TO movercontrib;

--
-- TOC entry 5817 (class 0 OID 0)
-- Dependencies: 270
-- Name: f_scoring_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: movercontrib
--

ALTER SEQUENCE mover.f_scoring_id_seq OWNED BY mover.f_scoring.id;


--
-- TOC entry 271 (class 1259 OID 18708)
-- Name: f_specifics; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.f_specifics (
    f_specifics_id integer NOT NULL,
    par_names character varying,
    ub_par_value character varying,
    ub_par_perc character varying,
    med_par_value character varying,
    lb_par_value character varying,
    lb_par_perc character varying,
    damage_scale_code character varying,
    dm_state_name mover.damage_states_all_enum,
    n_dm_states character(1),
    f_disc_im character varying,
    f_disc_ep character varying,
    lp_code character varying,
    lp_loss_value character varying,
    edp_code character varying,
    edp_name character varying,
    edp_dmstate_thre character varying,
    im_code character varying,
    im_name character varying,
    im_range character varying,
    im_units character varying,
    im_method mover.im_method_enum,
    im_sim_type mover.sim_method_enum,
    impe_reference character varying,
    data_countries character varying,
    im_data_source character varying,
    n_events integer,
    n_assets integer
);


ALTER TABLE mover.f_specifics OWNER TO movercontrib;

--
-- TOC entry 272 (class 1259 OID 18714)
-- Name: f_specifics_f_specifics_id_seq; Type: SEQUENCE; Schema: mover; Owner: movercontrib
--

CREATE SEQUENCE mover.f_specifics_f_specifics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE mover.f_specifics_f_specifics_id_seq OWNER TO movercontrib;

--
-- TOC entry 5820 (class 0 OID 0)
-- Dependencies: 272
-- Name: f_specifics_f_specifics_id_seq; Type: SEQUENCE OWNED BY; Schema: mover; Owner: movercontrib
--

ALTER SEQUENCE mover.f_specifics_f_specifics_id_seq OWNED BY mover.f_specifics.f_specifics_id;


--
-- TOC entry 273 (class 1259 OID 18716)
-- Name: lp_table; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.lp_table (
    description character varying NOT NULL,
    units character varying,
    lp_name character varying,
    lp_code character varying NOT NULL
);


ALTER TABLE mover.lp_table OWNER TO movercontrib;

--
-- TOC entry 274 (class 1259 OID 18722)
-- Name: reference_table; Type: TABLE; Schema: mover; Owner: movercontrib
--

CREATE TABLE mover.reference_table (
    author_year character varying NOT NULL,
    title character varying NOT NULL,
    issn character varying,
    doi character varying
);


ALTER TABLE mover.reference_table OWNER TO movercontrib;

--
-- TOC entry 5395 (class 2604 OID 18857)
-- Name: asset id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.asset ALTER COLUMN id SET DEFAULT nextval('ged4all.asset_id_seq'::regclass);


--
-- TOC entry 5404 (class 2604 OID 18858)
-- Name: contribution id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.contribution ALTER COLUMN id SET DEFAULT nextval('ged4all.contribution_id_seq'::regclass);


--
-- TOC entry 5398 (class 2604 OID 18859)
-- Name: cost id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.cost ALTER COLUMN id SET DEFAULT nextval('ged4all.cost_id_seq'::regclass);


--
-- TOC entry 5405 (class 2604 OID 18860)
-- Name: exposure_model id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.exposure_model ALTER COLUMN id SET DEFAULT nextval('ged4all.exposure_model_id_seq'::regclass);


--
-- TOC entry 5400 (class 2604 OID 18861)
-- Name: model_cost_type id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.model_cost_type ALTER COLUMN id SET DEFAULT nextval('ged4all.model_cost_type_id_seq'::regclass);


--
-- TOC entry 5402 (class 2604 OID 18862)
-- Name: occupancy id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.occupancy ALTER COLUMN id SET DEFAULT nextval('ged4all.occupancy_id_seq'::regclass);


--
-- TOC entry 5407 (class 2604 OID 18863)
-- Name: tags id; Type: DEFAULT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.tags ALTER COLUMN id SET DEFAULT nextval('ged4all.tags_id_seq'::regclass);


--
-- TOC entry 5388 (class 2604 OID 18864)
-- Name: contribution id; Type: DEFAULT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.contribution ALTER COLUMN id SET DEFAULT nextval('hazard.contribution_id_seq'::regclass);


--
-- TOC entry 5389 (class 2604 OID 18865)
-- Name: event id; Type: DEFAULT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event ALTER COLUMN id SET DEFAULT nextval('hazard.event_id_seq'::regclass);


--
-- TOC entry 5391 (class 2604 OID 18866)
-- Name: event_set id; Type: DEFAULT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event_set ALTER COLUMN id SET DEFAULT nextval('hazard.event_set_id_seq'::regclass);


--
-- TOC entry 5392 (class 2604 OID 18867)
-- Name: footprint id; Type: DEFAULT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint ALTER COLUMN id SET DEFAULT nextval('hazard.footprint_id_seq'::regclass);


--
-- TOC entry 5393 (class 2604 OID 18868)
-- Name: footprint_data id; Type: DEFAULT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_data ALTER COLUMN id SET DEFAULT nextval('hazard.footprint_data_id_seq'::regclass);


--
-- TOC entry 5394 (class 2604 OID 18869)
-- Name: footprint_set id; Type: DEFAULT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_set ALTER COLUMN id SET DEFAULT nextval('hazard.footprint_set_id_seq'::regclass);


--
-- TOC entry 5413 (class 2604 OID 18870)
-- Name: contribution id; Type: DEFAULT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.contribution ALTER COLUMN id SET DEFAULT nextval('loss.contribution_id_seq'::regclass);


--
-- TOC entry 5414 (class 2604 OID 18871)
-- Name: loss_curve_map id; Type: DEFAULT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_curve_map ALTER COLUMN id SET DEFAULT nextval('loss.loss_curve_map_id_seq'::regclass);


--
-- TOC entry 5415 (class 2604 OID 18872)
-- Name: loss_curve_map_values id; Type: DEFAULT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_curve_map_values ALTER COLUMN id SET DEFAULT nextval('loss.loss_curve_map_values_id_seq'::regclass);


--
-- TOC entry 5408 (class 2604 OID 18873)
-- Name: loss_map id; Type: DEFAULT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_map ALTER COLUMN id SET DEFAULT nextval('loss.loss_map_id_seq'::regclass);


--
-- TOC entry 5410 (class 2604 OID 18874)
-- Name: loss_map_values id; Type: DEFAULT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_map_values ALTER COLUMN id SET DEFAULT nextval('loss.loss_map_values_id_seq'::regclass);


--
-- TOC entry 5411 (class 2604 OID 18875)
-- Name: loss_model id; Type: DEFAULT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_model ALTER COLUMN id SET DEFAULT nextval('loss.loss_model_id_seq'::regclass);


--
-- TOC entry 5417 (class 2604 OID 18876)
-- Name: damage_scale id; Type: DEFAULT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.damage_scale ALTER COLUMN id SET DEFAULT nextval('mover.damage_scale_id_seq'::regclass);


--
-- TOC entry 5418 (class 2604 OID 18877)
-- Name: f_additional f_additional_id; Type: DEFAULT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_additional ALTER COLUMN f_additional_id SET DEFAULT nextval('mover.f_additional_f_additional_id_seq'::regclass);


--
-- TOC entry 5420 (class 2604 OID 18878)
-- Name: f_core id; Type: DEFAULT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core ALTER COLUMN id SET DEFAULT nextval('mover.f_core_id_seq'::regclass);


--
-- TOC entry 5421 (class 2604 OID 18879)
-- Name: f_scoring id; Type: DEFAULT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_scoring ALTER COLUMN id SET DEFAULT nextval('mover.f_scoring_id_seq'::regclass);


--
-- TOC entry 5422 (class 2604 OID 18880)
-- Name: f_scoring f_core_id; Type: DEFAULT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_scoring ALTER COLUMN f_core_id SET DEFAULT nextval('mover.f_scoring_f_core_id_seq'::regclass);


--
-- TOC entry 5423 (class 2604 OID 18881)
-- Name: f_specifics f_specifics_id; Type: DEFAULT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics ALTER COLUMN f_specifics_id SET DEFAULT nextval('mover.f_specifics_f_specifics_id_seq'::regclass);


--
-- TOC entry 5427 (class 2606 OID 17976)
-- Name: hazard_type hazard_type_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.hazard_type
    ADD CONSTRAINT hazard_type_pkey PRIMARY KEY (code);


--
-- TOC entry 5429 (class 2606 OID 17978)
-- Name: imt imt_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.imt
    ADD CONSTRAINT imt_pkey PRIMARY KEY (im_code);


--
-- TOC entry 5431 (class 2606 OID 17980)
-- Name: license license_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.license
    ADD CONSTRAINT license_pkey PRIMARY KEY (code);


--
-- TOC entry 5433 (class 2606 OID 17982)
-- Name: process_type process_type_pkey; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.process_type
    ADD CONSTRAINT process_type_pkey PRIMARY KEY (code);


--
-- TOC entry 5435 (class 2606 OID 17984)
-- Name: process_type unique_code_hazard_code; Type: CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.process_type
    ADD CONSTRAINT unique_code_hazard_code UNIQUE (code, hazard_code);


--
-- TOC entry 5454 (class 2606 OID 18223)
-- Name: asset asset_exposure_model_id_asset_ref_key; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.asset
    ADD CONSTRAINT asset_exposure_model_id_asset_ref_key UNIQUE (exposure_model_id, asset_ref);


--
-- TOC entry 5458 (class 2606 OID 18225)
-- Name: asset asset_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.asset
    ADD CONSTRAINT asset_pkey PRIMARY KEY (id);


--
-- TOC entry 5471 (class 2606 OID 18227)
-- Name: contribution contribution_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.contribution
    ADD CONSTRAINT contribution_pkey PRIMARY KEY (id);


--
-- TOC entry 5461 (class 2606 OID 18229)
-- Name: cost cost_asset_id_cost_type_id_key; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.cost
    ADD CONSTRAINT cost_asset_id_cost_type_id_key UNIQUE (asset_id, cost_type_id);


--
-- TOC entry 5464 (class 2606 OID 18231)
-- Name: cost cost_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.cost
    ADD CONSTRAINT cost_pkey PRIMARY KEY (id);


--
-- TOC entry 5473 (class 2606 OID 18233)
-- Name: exposure_model exposure_model_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.exposure_model
    ADD CONSTRAINT exposure_model_pkey PRIMARY KEY (id);


--
-- TOC entry 5466 (class 2606 OID 18235)
-- Name: model_cost_type model_cost_type_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.model_cost_type
    ADD CONSTRAINT model_cost_type_pkey PRIMARY KEY (id);


--
-- TOC entry 5469 (class 2606 OID 18237)
-- Name: occupancy occupancy_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.occupancy
    ADD CONSTRAINT occupancy_pkey PRIMARY KEY (id);


--
-- TOC entry 5476 (class 2606 OID 18239)
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (id);


--
-- TOC entry 5438 (class 2606 OID 18060)
-- Name: contribution contribution_pkey; Type: CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.contribution
    ADD CONSTRAINT contribution_pkey PRIMARY KEY (id);


--
-- TOC entry 5440 (class 2606 OID 18062)
-- Name: event event_pkey; Type: CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- TOC entry 5442 (class 2606 OID 18064)
-- Name: event_set event_set_pkey; Type: CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event_set
    ADD CONSTRAINT event_set_pkey PRIMARY KEY (id);


--
-- TOC entry 5449 (class 2606 OID 18066)
-- Name: footprint_data footprint_data_pkey; Type: CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_data
    ADD CONSTRAINT footprint_data_pkey PRIMARY KEY (id);


--
-- TOC entry 5446 (class 2606 OID 18068)
-- Name: footprint footprint_pkey; Type: CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint
    ADD CONSTRAINT footprint_pkey PRIMARY KEY (id);


--
-- TOC entry 5452 (class 2606 OID 18070)
-- Name: footprint_set footprint_set_pkey; Type: CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_set
    ADD CONSTRAINT footprint_set_pkey PRIMARY KEY (id);


--
-- TOC entry 5488 (class 2606 OID 18376)
-- Name: contribution contribution_pkey; Type: CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.contribution
    ADD CONSTRAINT contribution_pkey PRIMARY KEY (id);


--
-- TOC entry 5491 (class 2606 OID 18378)
-- Name: loss_curve_map loss_curve_map_pkey; Type: CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_curve_map
    ADD CONSTRAINT loss_curve_map_pkey PRIMARY KEY (id);


--
-- TOC entry 5494 (class 2606 OID 18380)
-- Name: loss_curve_map_values loss_curve_map_values_pkey; Type: CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_curve_map_values
    ADD CONSTRAINT loss_curve_map_values_pkey PRIMARY KEY (id);


--
-- TOC entry 5479 (class 2606 OID 18382)
-- Name: loss_map loss_map_pkey; Type: CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_map
    ADD CONSTRAINT loss_map_pkey PRIMARY KEY (id);


--
-- TOC entry 5482 (class 2606 OID 18384)
-- Name: loss_map_values loss_map_values_pkey; Type: CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_map_values
    ADD CONSTRAINT loss_map_values_pkey PRIMARY KEY (id);


--
-- TOC entry 5485 (class 2606 OID 18386)
-- Name: loss_model loss_model_pkey; Type: CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_model
    ADD CONSTRAINT loss_model_pkey PRIMARY KEY (id);


--
-- TOC entry 5517 (class 2606 OID 18735)
-- Name: reference_table author_year_pk; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.reference_table
    ADD CONSTRAINT author_year_pk PRIMARY KEY (author_year);


--
-- TOC entry 5497 (class 2606 OID 18737)
-- Name: damage_scale damage_scale_damage_scale_code_key; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_damage_scale_code_key UNIQUE (damage_scale_code);


--
-- TOC entry 5499 (class 2606 OID 18739)
-- Name: damage_scale damage_scale_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_pkey PRIMARY KEY (id);


--
-- TOC entry 5501 (class 2606 OID 18741)
-- Name: edp_table edp_table_edp_name_key; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.edp_table
    ADD CONSTRAINT edp_table_edp_name_key UNIQUE (edp_name);


--
-- TOC entry 5503 (class 2606 OID 18743)
-- Name: edp_table edp_table_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.edp_table
    ADD CONSTRAINT edp_table_pkey PRIMARY KEY (edp_code);


--
-- TOC entry 5505 (class 2606 OID 18745)
-- Name: f_additional f_additional_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_additional
    ADD CONSTRAINT f_additional_pkey PRIMARY KEY (f_additional_id);


--
-- TOC entry 5507 (class 2606 OID 18747)
-- Name: f_core f_core_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT f_core_pkey PRIMARY KEY (id);


--
-- TOC entry 5509 (class 2606 OID 18749)
-- Name: f_scoring f_scoring_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_scoring
    ADD CONSTRAINT f_scoring_pkey PRIMARY KEY (id);


--
-- TOC entry 5511 (class 2606 OID 18751)
-- Name: f_specifics f_specifics_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT f_specifics_pkey PRIMARY KEY (f_specifics_id);


--
-- TOC entry 5513 (class 2606 OID 18753)
-- Name: lp_table lp_table_lp_name_key; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.lp_table
    ADD CONSTRAINT lp_table_lp_name_key UNIQUE (lp_name);


--
-- TOC entry 5515 (class 2606 OID 18756)
-- Name: lp_table lp_table_pkey; Type: CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.lp_table
    ADD CONSTRAINT lp_table_pkey PRIMARY KEY (lp_code);


--
-- TOC entry 5455 (class 1259 OID 18240)
-- Name: asset_exposure_model_id_idx; Type: INDEX; Schema: ged4all; Owner: ged4allcontrib
--

CREATE INDEX asset_exposure_model_id_idx ON ged4all.asset USING btree (exposure_model_id);


--
-- TOC entry 5456 (class 1259 OID 18241)
-- Name: asset_full_geom_idx; Type: INDEX; Schema: ged4all; Owner: ged4allcontrib
--

CREATE INDEX asset_full_geom_idx ON ged4all.asset USING gist (full_geom);


--
-- TOC entry 5459 (class 1259 OID 18242)
-- Name: asset_the_geom_gist; Type: INDEX; Schema: ged4all; Owner: ged4allcontrib
--

CREATE INDEX asset_the_geom_gist ON ged4all.asset USING gist (the_geom);


--
-- TOC entry 5462 (class 1259 OID 18243)
-- Name: cost_asset_id_idx; Type: INDEX; Schema: ged4all; Owner: ged4allcontrib
--

CREATE INDEX cost_asset_id_idx ON ged4all.cost USING btree (asset_id);


--
-- TOC entry 5467 (class 1259 OID 18244)
-- Name: occupancy_asset_id_idx; Type: INDEX; Schema: ged4all; Owner: ged4allcontrib
--

CREATE INDEX occupancy_asset_id_idx ON ged4all.occupancy USING btree (asset_id);


--
-- TOC entry 5474 (class 1259 OID 18245)
-- Name: tags_asset_id_idx; Type: INDEX; Schema: ged4all; Owner: ged4allcontrib
--

CREATE INDEX tags_asset_id_idx ON ged4all.tags USING btree (asset_id);


--
-- TOC entry 5436 (class 1259 OID 18071)
-- Name: contribution_event_set_id_idx; Type: INDEX; Schema: hazard; Owner: hazardcontrib
--

CREATE INDEX contribution_event_set_id_idx ON hazard.contribution USING btree (event_set_id);


--
-- TOC entry 5443 (class 1259 OID 18072)
-- Name: event_set_the_geom_idx; Type: INDEX; Schema: hazard; Owner: hazardcontrib
--

CREATE INDEX event_set_the_geom_idx ON hazard.event_set USING gist (the_geom);


--
-- TOC entry 5447 (class 1259 OID 18073)
-- Name: footprint_data_footprint_id_idx; Type: INDEX; Schema: hazard; Owner: hazardcontrib
--

CREATE INDEX footprint_data_footprint_id_idx ON hazard.footprint_data USING btree (footprint_id);


--
-- TOC entry 5450 (class 1259 OID 18074)
-- Name: footprint_data_the_geom_idx; Type: INDEX; Schema: hazard; Owner: hazardcontrib
--

CREATE INDEX footprint_data_the_geom_idx ON hazard.footprint_data USING gist (the_geom);


--
-- TOC entry 5444 (class 1259 OID 18075)
-- Name: footprint_footprint_set_id_idx; Type: INDEX; Schema: hazard; Owner: hazardcontrib
--

CREATE INDEX footprint_footprint_set_id_idx ON hazard.footprint USING btree (footprint_set_id);


--
-- TOC entry 5486 (class 1259 OID 18387)
-- Name: contribution_loss_model_id_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX contribution_loss_model_id_idx ON loss.contribution USING btree (loss_model_id);


--
-- TOC entry 5489 (class 1259 OID 18388)
-- Name: loss_curve_map_loss_model_id_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX loss_curve_map_loss_model_id_idx ON loss.loss_curve_map USING btree (loss_model_id);


--
-- TOC entry 5492 (class 1259 OID 18389)
-- Name: loss_curve_map_values_loss_curve_map_id_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX loss_curve_map_values_loss_curve_map_id_idx ON loss.loss_curve_map_values USING btree (loss_curve_map_id);


--
-- TOC entry 5495 (class 1259 OID 18390)
-- Name: loss_curve_map_values_the_geom_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX loss_curve_map_values_the_geom_idx ON loss.loss_curve_map_values USING gist (the_geom);


--
-- TOC entry 5477 (class 1259 OID 18391)
-- Name: loss_map_loss_model_id_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX loss_map_loss_model_id_idx ON loss.loss_map USING btree (loss_model_id);


--
-- TOC entry 5480 (class 1259 OID 18392)
-- Name: loss_map_values_loss_map_id_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX loss_map_values_loss_map_id_idx ON loss.loss_map_values USING btree (loss_map_id);


--
-- TOC entry 5483 (class 1259 OID 18393)
-- Name: loss_map_values_the_geom_idx; Type: INDEX; Schema: loss; Owner: losscontrib
--

CREATE INDEX loss_map_values_the_geom_idx ON loss.loss_map_values USING gist (the_geom);


--
-- TOC entry 5518 (class 2606 OID 17985)
-- Name: imt imt_process_code_fkey; Type: FK CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.imt
    ADD CONSTRAINT imt_process_code_fkey FOREIGN KEY (process_code, hazard_code) REFERENCES cf_common.process_type(code, hazard_code);


--
-- TOC entry 5519 (class 2606 OID 17990)
-- Name: process_type process_type_hazard_code_fkey; Type: FK CONSTRAINT; Schema: cf_common; Owner: commoncontrib
--

ALTER TABLE ONLY cf_common.process_type
    ADD CONSTRAINT process_type_hazard_code_fkey FOREIGN KEY (hazard_code) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5533 (class 2606 OID 18246)
-- Name: asset asset_exposure_model_id_fk; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.asset
    ADD CONSTRAINT asset_exposure_model_id_fk FOREIGN KEY (exposure_model_id) REFERENCES ged4all.exposure_model(id) ON DELETE CASCADE;


--
-- TOC entry 5538 (class 2606 OID 18251)
-- Name: contribution contribution_exposure_model_id_fkey; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.contribution
    ADD CONSTRAINT contribution_exposure_model_id_fkey FOREIGN KEY (exposure_model_id) REFERENCES ged4all.exposure_model(id) ON DELETE CASCADE;


--
-- TOC entry 5539 (class 2606 OID 21590)
-- Name: contribution contribution_license_code_fkey; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.contribution
    ADD CONSTRAINT contribution_license_code_fkey FOREIGN KEY (license_code) REFERENCES cf_common.license(code);


--
-- TOC entry 5534 (class 2606 OID 18256)
-- Name: cost cost_asset_id_fk; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.cost
    ADD CONSTRAINT cost_asset_id_fk FOREIGN KEY (asset_id) REFERENCES ged4all.asset(id) ON DELETE CASCADE;


--
-- TOC entry 5535 (class 2606 OID 18261)
-- Name: cost cost_cost_type_id_fkey; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.cost
    ADD CONSTRAINT cost_cost_type_id_fkey FOREIGN KEY (cost_type_id) REFERENCES ged4all.model_cost_type(id);


--
-- TOC entry 5536 (class 2606 OID 18266)
-- Name: model_cost_type model_cost_type_exposure_model_id_fk; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.model_cost_type
    ADD CONSTRAINT model_cost_type_exposure_model_id_fk FOREIGN KEY (exposure_model_id) REFERENCES ged4all.exposure_model(id) ON DELETE CASCADE;


--
-- TOC entry 5537 (class 2606 OID 18271)
-- Name: occupancy occupancy_asset_id_fk; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.occupancy
    ADD CONSTRAINT occupancy_asset_id_fk FOREIGN KEY (asset_id) REFERENCES ged4all.asset(id) ON DELETE CASCADE;


--
-- TOC entry 5540 (class 2606 OID 18276)
-- Name: tags tags_asset_id_fkey; Type: FK CONSTRAINT; Schema: ged4all; Owner: ged4allcontrib
--

ALTER TABLE ONLY ged4all.tags
    ADD CONSTRAINT tags_asset_id_fkey FOREIGN KEY (asset_id) REFERENCES ged4all.asset(id) ON DELETE CASCADE;


--
-- TOC entry 5520 (class 2606 OID 18076)
-- Name: contribution contribution_event_set_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.contribution
    ADD CONSTRAINT contribution_event_set_id_fkey FOREIGN KEY (event_set_id) REFERENCES hazard.event_set(id) ON DELETE CASCADE;


--
-- TOC entry 5521 (class 2606 OID 18081)
-- Name: contribution contribution_license_code_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.contribution
    ADD CONSTRAINT contribution_license_code_fkey FOREIGN KEY (license_code) REFERENCES cf_common.license(code);


--
-- TOC entry 5522 (class 2606 OID 18086)
-- Name: event event_event_set_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event
    ADD CONSTRAINT event_event_set_id_fkey FOREIGN KEY (event_set_id) REFERENCES hazard.event_set(id) ON DELETE CASCADE;


--
-- TOC entry 5523 (class 2606 OID 18091)
-- Name: event event_trigger_event_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event
    ADD CONSTRAINT event_trigger_event_id_fkey FOREIGN KEY (trigger_event_id) REFERENCES hazard.event(id);


--
-- TOC entry 5529 (class 2606 OID 18096)
-- Name: footprint_data footprint_data_footprint_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_data
    ADD CONSTRAINT footprint_data_footprint_id_fkey FOREIGN KEY (footprint_id) REFERENCES hazard.footprint(id) ON DELETE CASCADE;


--
-- TOC entry 5527 (class 2606 OID 18101)
-- Name: footprint footprint_footprint_set_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint
    ADD CONSTRAINT footprint_footprint_set_id_fkey FOREIGN KEY (footprint_set_id) REFERENCES hazard.footprint_set(id) ON DELETE CASCADE;


--
-- TOC entry 5530 (class 2606 OID 18106)
-- Name: footprint_set footprint_set_event_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_set
    ADD CONSTRAINT footprint_set_event_id_fkey FOREIGN KEY (event_id) REFERENCES hazard.event(id) ON DELETE CASCADE;


--
-- TOC entry 5528 (class 2606 OID 18111)
-- Name: footprint footprint_trigger_footprint_id_fkey; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint
    ADD CONSTRAINT footprint_trigger_footprint_id_fkey FOREIGN KEY (trigger_footprint_id) REFERENCES hazard.footprint(id);


--
-- TOC entry 5524 (class 2606 OID 18116)
-- Name: event valid_hazard_trigger_type; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event
    ADD CONSTRAINT valid_hazard_trigger_type FOREIGN KEY (trigger_hazard_type) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5526 (class 2606 OID 18121)
-- Name: event_set valid_hazard_type; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event_set
    ADD CONSTRAINT valid_hazard_type FOREIGN KEY (hazard_type) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5531 (class 2606 OID 18126)
-- Name: footprint_set valid_imt; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_set
    ADD CONSTRAINT valid_imt FOREIGN KEY (imt) REFERENCES cf_common.imt(im_code);


--
-- TOC entry 5532 (class 2606 OID 18131)
-- Name: footprint_set valid_process_type; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.footprint_set
    ADD CONSTRAINT valid_process_type FOREIGN KEY (process_type) REFERENCES cf_common.process_type(code);


--
-- TOC entry 5525 (class 2606 OID 18136)
-- Name: event valid_trigger_process_type; Type: FK CONSTRAINT; Schema: hazard; Owner: hazardcontrib
--

ALTER TABLE ONLY hazard.event
    ADD CONSTRAINT valid_trigger_process_type FOREIGN KEY (trigger_process_type) REFERENCES cf_common.process_type(code);


--
-- TOC entry 5545 (class 2606 OID 18394)
-- Name: contribution contribution_license_code_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.contribution
    ADD CONSTRAINT contribution_license_code_fkey FOREIGN KEY (license_code) REFERENCES cf_common.license(code);


--
-- TOC entry 5546 (class 2606 OID 18399)
-- Name: contribution contribution_loss_model_id_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.contribution
    ADD CONSTRAINT contribution_loss_model_id_fkey FOREIGN KEY (loss_model_id) REFERENCES loss.loss_model(id) ON DELETE CASCADE;


--
-- TOC entry 5547 (class 2606 OID 18404)
-- Name: loss_curve_map loss_curve_map_loss_model_id_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_curve_map
    ADD CONSTRAINT loss_curve_map_loss_model_id_fkey FOREIGN KEY (loss_model_id) REFERENCES loss.loss_model(id) ON DELETE CASCADE;


--
-- TOC entry 5548 (class 2606 OID 18409)
-- Name: loss_curve_map_values loss_curve_map_values_loss_curve_map_id_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_curve_map_values
    ADD CONSTRAINT loss_curve_map_values_loss_curve_map_id_fkey FOREIGN KEY (loss_curve_map_id) REFERENCES loss.loss_curve_map(id) ON DELETE CASCADE;


--
-- TOC entry 5541 (class 2606 OID 18414)
-- Name: loss_map loss_map_loss_model_id_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_map
    ADD CONSTRAINT loss_map_loss_model_id_fkey FOREIGN KEY (loss_model_id) REFERENCES loss.loss_model(id) ON DELETE CASCADE;


--
-- TOC entry 5542 (class 2606 OID 18419)
-- Name: loss_map_values loss_map_values_loss_map_id_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_map_values
    ADD CONSTRAINT loss_map_values_loss_map_id_fkey FOREIGN KEY (loss_map_id) REFERENCES loss.loss_map(id) ON DELETE CASCADE;


--
-- TOC entry 5543 (class 2606 OID 18424)
-- Name: loss_model loss_model_hazard_type_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_model
    ADD CONSTRAINT loss_model_hazard_type_fkey FOREIGN KEY (hazard_type) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5544 (class 2606 OID 18429)
-- Name: loss_model loss_model_process_type_fkey; Type: FK CONSTRAINT; Schema: loss; Owner: losscontrib
--

ALTER TABLE ONLY loss.loss_model
    ADD CONSTRAINT loss_model_process_type_fkey FOREIGN KEY (process_type) REFERENCES cf_common.process_type(code);


--
-- TOC entry 5553 (class 2606 OID 18757)
-- Name: f_core bespoke_model_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT bespoke_model_ref FOREIGN KEY (bespoke_model_ref) REFERENCES mover.reference_table(author_year);


--
-- TOC entry 5549 (class 2606 OID 18762)
-- Name: damage_scale damage_scale_hazard_type_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_hazard_type_fkey FOREIGN KEY (hazard_type) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5550 (class 2606 OID 18767)
-- Name: damage_scale damage_scale_process_type_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.damage_scale
    ADD CONSTRAINT damage_scale_process_type_fkey FOREIGN KEY (process_type) REFERENCES cf_common.process_type(code);


--
-- TOC entry 5562 (class 2606 OID 18772)
-- Name: f_specifics dm_scale_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT dm_scale_fkey FOREIGN KEY (damage_scale_code) REFERENCES mover.damage_scale(damage_scale_code) ON DELETE CASCADE;


--
-- TOC entry 5563 (class 2606 OID 18777)
-- Name: f_specifics edp_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT edp_fkey FOREIGN KEY (edp_code) REFERENCES mover.edp_table(edp_code) ON DELETE CASCADE;


--
-- TOC entry 5564 (class 2606 OID 18782)
-- Name: f_specifics f_core_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT f_core_fkey FOREIGN KEY (f_specifics_id) REFERENCES mover.f_core(id);


--
-- TOC entry 5554 (class 2606 OID 18787)
-- Name: f_core f_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT f_ref FOREIGN KEY (f_reference) REFERENCES mover.reference_table(author_year);


--
-- TOC entry 5561 (class 2606 OID 18792)
-- Name: f_scoring f_scoring_f_core_id_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_scoring
    ADD CONSTRAINT f_scoring_f_core_id_fkey FOREIGN KEY (f_core_id) REFERENCES mover.f_core(id);


--
-- TOC entry 5551 (class 2606 OID 18797)
-- Name: f_additional f_specifics_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_additional
    ADD CONSTRAINT f_specifics_ref FOREIGN KEY (f_additional_id) REFERENCES mover.f_specifics(f_specifics_id);


--
-- TOC entry 5555 (class 2606 OID 18802)
-- Name: f_core hazard_typep_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT hazard_typep_ref FOREIGN KEY (hazard_type_primary) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5556 (class 2606 OID 18807)
-- Name: f_core hazard_types_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT hazard_types_ref FOREIGN KEY (hazard_type_secondary) REFERENCES cf_common.hazard_type(code);


--
-- TOC entry 5565 (class 2606 OID 18812)
-- Name: f_specifics im_data_source_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT im_data_source_ref FOREIGN KEY (im_data_source) REFERENCES mover.reference_table(author_year);


--
-- TOC entry 5566 (class 2606 OID 18817)
-- Name: f_specifics im_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT im_fkey FOREIGN KEY (im_code) REFERENCES cf_common.imt(im_code) ON DELETE CASCADE;


--
-- TOC entry 5567 (class 2606 OID 18822)
-- Name: f_specifics impe_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT impe_ref FOREIGN KEY (impe_reference) REFERENCES mover.reference_table(author_year);


--
-- TOC entry 5557 (class 2606 OID 18827)
-- Name: f_core licence_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT licence_fkey FOREIGN KEY (licence_code) REFERENCES cf_common.license(code);


--
-- TOC entry 5558 (class 2606 OID 18832)
-- Name: f_core licence_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT licence_ref FOREIGN KEY (licence_reference) REFERENCES mover.reference_table(author_year);


--
-- TOC entry 5568 (class 2606 OID 18837)
-- Name: f_specifics lp_fkey; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_specifics
    ADD CONSTRAINT lp_fkey FOREIGN KEY (lp_code) REFERENCES mover.lp_table(lp_code);


--
-- TOC entry 5559 (class 2606 OID 18842)
-- Name: f_core process_typep_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT process_typep_ref FOREIGN KEY (process_type_primary) REFERENCES cf_common.process_type(code);


--
-- TOC entry 5560 (class 2606 OID 18847)
-- Name: f_core process_types_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_core
    ADD CONSTRAINT process_types_ref FOREIGN KEY (process_type_secondary) REFERENCES cf_common.process_type(code);


--
-- TOC entry 5552 (class 2606 OID 18852)
-- Name: f_additional valstudy_ref; Type: FK CONSTRAINT; Schema: mover; Owner: movercontrib
--

ALTER TABLE ONLY mover.f_additional
    ADD CONSTRAINT valstudy_ref FOREIGN KEY (val_study_reference) REFERENCES mover.reference_table(author_year);


--
-- TOC entry 5708 (class 0 OID 0)
-- Dependencies: 5707
-- Name: DATABASE rdl-dev; Type: ACL; Schema: -; Owner: rdl-dev
--

REVOKE ALL ON DATABASE rdl-dev FROM rdl-dev;
GRANT ALL ON DATABASE rdl-dev TO rdl-dev WITH GRANT OPTION;


--
-- TOC entry 5710 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA cf_common; Type: ACL; Schema: -; Owner: commoncontrib
--

GRANT USAGE ON SCHEMA cf_common TO commonusers;


--
-- TOC entry 5711 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA ged4all; Type: ACL; Schema: -; Owner: ged4allcontrib
--

GRANT USAGE ON SCHEMA ged4all TO ged4allusers;


--
-- TOC entry 5712 (class 0 OID 0)
-- Dependencies: 10
-- Name: SCHEMA hazard; Type: ACL; Schema: -; Owner: hazardcontrib
--

GRANT USAGE ON SCHEMA hazard TO hazardviewer;
GRANT USAGE ON SCHEMA hazard TO hazardusers;


--
-- TOC entry 5714 (class 0 OID 0)
-- Dependencies: 13
-- Name: SCHEMA loss; Type: ACL; Schema: -; Owner: losscontrib
--

GRANT USAGE ON SCHEMA loss TO lossusers;
GRANT USAGE ON SCHEMA loss TO lossviewer;


--
-- TOC entry 5715 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA mover; Type: ACL; Schema: -; Owner: movercontrib
--

GRANT USAGE ON SCHEMA mover TO moverusers;
GRANT USAGE ON SCHEMA mover TO lossviewer;


--
-- TOC entry 5716 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: rdl-dev
--

REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO rdl-dev;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 5725 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE hazard_type; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.hazard_type TO commonusers;


--
-- TOC entry 5726 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE imt; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.imt TO commonusers;


--
-- TOC entry 5728 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE license; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.license TO commonusers;
GRANT SELECT ON TABLE cf_common.license TO commonviewer;


--
-- TOC entry 5729 (class 0 OID 0)
-- Dependencies: 220
-- Name: TABLE process_type; Type: ACL; Schema: cf_common; Owner: commoncontrib
--

GRANT SELECT ON TABLE cf_common.process_type TO commonusers;


--
-- TOC entry 5730 (class 0 OID 0)
-- Dependencies: 233
-- Name: TABLE asset; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.asset TO ged4allusers;
GRANT ALL ON TABLE ged4all.asset TO gbalbuena;


--
-- TOC entry 5731 (class 0 OID 0)
-- Dependencies: 234
-- Name: TABLE cost; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.cost TO ged4allusers;


--
-- TOC entry 5732 (class 0 OID 0)
-- Dependencies: 235
-- Name: TABLE model_cost_type; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.model_cost_type TO ged4allusers;


--
-- TOC entry 5733 (class 0 OID 0)
-- Dependencies: 236
-- Name: TABLE occupancy; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.occupancy TO ged4allusers;


--
-- TOC entry 5734 (class 0 OID 0)
-- Dependencies: 237
-- Name: TABLE all_exposure; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.all_exposure TO ged4allusers;


--
-- TOC entry 5736 (class 0 OID 0)
-- Dependencies: 238
-- Name: SEQUENCE asset_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.asset_id_seq TO ged4allusers;


--
-- TOC entry 5737 (class 0 OID 0)
-- Dependencies: 239
-- Name: TABLE contribution; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.contribution TO ged4allusers;


--
-- TOC entry 5739 (class 0 OID 0)
-- Dependencies: 240
-- Name: SEQUENCE contribution_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.contribution_id_seq TO ged4allusers;


--
-- TOC entry 5741 (class 0 OID 0)
-- Dependencies: 241
-- Name: SEQUENCE cost_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.cost_id_seq TO ged4allusers;


--
-- TOC entry 5742 (class 0 OID 0)
-- Dependencies: 242
-- Name: TABLE exposure_model; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.exposure_model TO ged4allusers;


--
-- TOC entry 5744 (class 0 OID 0)
-- Dependencies: 243
-- Name: SEQUENCE exposure_model_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.exposure_model_id_seq TO ged4allusers;


--
-- TOC entry 5746 (class 0 OID 0)
-- Dependencies: 244
-- Name: SEQUENCE model_cost_type_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.model_cost_type_id_seq TO ged4allusers;


--
-- TOC entry 5748 (class 0 OID 0)
-- Dependencies: 245
-- Name: SEQUENCE occupancy_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.occupancy_id_seq TO ged4allusers;


--
-- TOC entry 5749 (class 0 OID 0)
-- Dependencies: 246
-- Name: TABLE tags; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT ON TABLE ged4all.tags TO ged4allusers;


--
-- TOC entry 5751 (class 0 OID 0)
-- Dependencies: 247
-- Name: SEQUENCE tags_id_seq; Type: ACL; Schema: ged4all; Owner: ged4allcontrib
--

GRANT SELECT,USAGE ON SEQUENCE ged4all.tags_id_seq TO ged4allusers;


--
-- TOC entry 5753 (class 0 OID 0)
-- Dependencies: 221
-- Name: TABLE contribution; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT SELECT ON TABLE hazard.contribution TO hazardviewer;
GRANT SELECT ON TABLE hazard.contribution TO hazardusers;


--
-- TOC entry 5755 (class 0 OID 0)
-- Dependencies: 223
-- Name: TABLE event; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT SELECT ON TABLE hazard.event TO hazardviewer;
GRANT SELECT ON TABLE hazard.event TO hazardusers;


--
-- TOC entry 5757 (class 0 OID 0)
-- Dependencies: 225
-- Name: TABLE event_set; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT SELECT ON TABLE hazard.event_set TO hazardviewer;
GRANT SELECT ON TABLE hazard.event_set TO hazardusers;


--
-- TOC entry 5760 (class 0 OID 0)
-- Dependencies: 222
-- Name: SEQUENCE contribution_id_seq; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT USAGE ON SEQUENCE hazard.contribution_id_seq TO hazardviewer;
GRANT SELECT,USAGE ON SEQUENCE hazard.contribution_id_seq TO hazardusers;


--
-- TOC entry 5762 (class 0 OID 0)
-- Dependencies: 231
-- Name: TABLE footprint_set; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT SELECT ON TABLE hazard.footprint_set TO hazardviewer;
GRANT SELECT ON TABLE hazard.footprint_set TO hazardusers;


--
-- TOC entry 5765 (class 0 OID 0)
-- Dependencies: 227
-- Name: TABLE footprint; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT SELECT ON TABLE hazard.footprint TO hazardviewer;
GRANT SELECT ON TABLE hazard.footprint TO hazardusers;


--
-- TOC entry 5767 (class 0 OID 0)
-- Dependencies: 228
-- Name: TABLE footprint_data; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT SELECT ON TABLE hazard.footprint_data TO hazardviewer;
GRANT SELECT ON TABLE hazard.footprint_data TO hazardusers;


--
-- TOC entry 5770 (class 0 OID 0)
-- Dependencies: 224
-- Name: SEQUENCE event_id_seq; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT USAGE ON SEQUENCE hazard.event_id_seq TO hazardviewer;
GRANT SELECT,USAGE ON SEQUENCE hazard.event_id_seq TO hazardusers;


--
-- TOC entry 5772 (class 0 OID 0)
-- Dependencies: 226
-- Name: SEQUENCE event_set_id_seq; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT USAGE ON SEQUENCE hazard.event_set_id_seq TO hazardviewer;
GRANT SELECT,USAGE ON SEQUENCE hazard.event_set_id_seq TO hazardusers;


--
-- TOC entry 5774 (class 0 OID 0)
-- Dependencies: 229
-- Name: SEQUENCE footprint_data_id_seq; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT USAGE ON SEQUENCE hazard.footprint_data_id_seq TO hazardviewer;
GRANT SELECT,USAGE ON SEQUENCE hazard.footprint_data_id_seq TO hazardusers;


--
-- TOC entry 5776 (class 0 OID 0)
-- Dependencies: 230
-- Name: SEQUENCE footprint_id_seq; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT USAGE ON SEQUENCE hazard.footprint_id_seq TO hazardviewer;
GRANT SELECT,USAGE ON SEQUENCE hazard.footprint_id_seq TO hazardusers;


--
-- TOC entry 5778 (class 0 OID 0)
-- Dependencies: 232
-- Name: SEQUENCE footprint_set_id_seq; Type: ACL; Schema: hazard; Owner: hazardcontrib
--

GRANT USAGE ON SEQUENCE hazard.footprint_set_id_seq TO hazardviewer;
GRANT SELECT,USAGE ON SEQUENCE hazard.footprint_set_id_seq TO hazardusers;


--
-- TOC entry 5780 (class 0 OID 0)
-- Dependencies: 248
-- Name: TABLE loss_map; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT ON TABLE loss.loss_map TO lossusers;


--
-- TOC entry 5782 (class 0 OID 0)
-- Dependencies: 249
-- Name: TABLE loss_map_values; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT ON TABLE loss.loss_map_values TO lossusers;


--
-- TOC entry 5784 (class 0 OID 0)
-- Dependencies: 250
-- Name: TABLE loss_model; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT ON TABLE loss.loss_model TO lossusers;


--
-- TOC entry 5785 (class 0 OID 0)
-- Dependencies: 251
-- Name: TABLE all_loss_map_values; Type: ACL; Schema: loss; Owner: gedcf
--

GRANT SELECT ON TABLE loss.all_loss_map_values TO lossusers;
GRANT ALL ON TABLE loss.all_loss_map_values TO losscontrib;


--
-- TOC entry 5787 (class 0 OID 0)
-- Dependencies: 252
-- Name: TABLE contribution; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT ON TABLE loss.contribution TO lossusers;


--
-- TOC entry 5789 (class 0 OID 0)
-- Dependencies: 253
-- Name: SEQUENCE contribution_id_seq; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT,USAGE ON SEQUENCE loss.contribution_id_seq TO lossusers;


--
-- TOC entry 5791 (class 0 OID 0)
-- Dependencies: 254
-- Name: TABLE loss_curve_map; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT ON TABLE loss.loss_curve_map TO lossusers;


--
-- TOC entry 5793 (class 0 OID 0)
-- Dependencies: 255
-- Name: SEQUENCE loss_curve_map_id_seq; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT,USAGE ON SEQUENCE loss.loss_curve_map_id_seq TO lossusers;


--
-- TOC entry 5795 (class 0 OID 0)
-- Dependencies: 256
-- Name: TABLE loss_curve_map_values; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT ON TABLE loss.loss_curve_map_values TO lossusers;


--
-- TOC entry 5797 (class 0 OID 0)
-- Dependencies: 257
-- Name: SEQUENCE loss_curve_map_values_id_seq; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT,USAGE ON SEQUENCE loss.loss_curve_map_values_id_seq TO lossusers;


--
-- TOC entry 5799 (class 0 OID 0)
-- Dependencies: 258
-- Name: SEQUENCE loss_map_id_seq; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT,USAGE ON SEQUENCE loss.loss_map_id_seq TO lossusers;


--
-- TOC entry 5801 (class 0 OID 0)
-- Dependencies: 259
-- Name: SEQUENCE loss_map_values_id_seq; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT,USAGE ON SEQUENCE loss.loss_map_values_id_seq TO lossusers;


--
-- TOC entry 5803 (class 0 OID 0)
-- Dependencies: 260
-- Name: SEQUENCE loss_model_id_seq; Type: ACL; Schema: loss; Owner: losscontrib
--

GRANT SELECT,USAGE ON SEQUENCE loss.loss_model_id_seq TO lossusers;


--
-- TOC entry 5804 (class 0 OID 0)
-- Dependencies: 261
-- Name: TABLE damage_scale; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.damage_scale TO moverusers;


--
-- TOC entry 5806 (class 0 OID 0)
-- Dependencies: 262
-- Name: SEQUENCE damage_scale_id_seq; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT,USAGE ON SEQUENCE mover.damage_scale_id_seq TO moverusers;


--
-- TOC entry 5807 (class 0 OID 0)
-- Dependencies: 263
-- Name: TABLE edp_table; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.edp_table TO moverusers;


--
-- TOC entry 5808 (class 0 OID 0)
-- Dependencies: 264
-- Name: TABLE f_additional; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.f_additional TO moverusers;


--
-- TOC entry 5810 (class 0 OID 0)
-- Dependencies: 265
-- Name: SEQUENCE f_additional_f_additional_id_seq; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT,USAGE ON SEQUENCE mover.f_additional_f_additional_id_seq TO moverusers;


--
-- TOC entry 5811 (class 0 OID 0)
-- Dependencies: 266
-- Name: TABLE f_core; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.f_core TO moverusers;


--
-- TOC entry 5813 (class 0 OID 0)
-- Dependencies: 267
-- Name: SEQUENCE f_core_id_seq; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT,USAGE ON SEQUENCE mover.f_core_id_seq TO moverusers;


--
-- TOC entry 5814 (class 0 OID 0)
-- Dependencies: 268
-- Name: TABLE f_scoring; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.f_scoring TO moverusers;


--
-- TOC entry 5816 (class 0 OID 0)
-- Dependencies: 269
-- Name: SEQUENCE f_scoring_f_core_id_seq; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT,USAGE ON SEQUENCE mover.f_scoring_f_core_id_seq TO moverusers;


--
-- TOC entry 5818 (class 0 OID 0)
-- Dependencies: 270
-- Name: SEQUENCE f_scoring_id_seq; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT,USAGE ON SEQUENCE mover.f_scoring_id_seq TO moverusers;


--
-- TOC entry 5819 (class 0 OID 0)
-- Dependencies: 271
-- Name: TABLE f_specifics; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.f_specifics TO moverusers;


--
-- TOC entry 5821 (class 0 OID 0)
-- Dependencies: 272
-- Name: SEQUENCE f_specifics_f_specifics_id_seq; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT,USAGE ON SEQUENCE mover.f_specifics_f_specifics_id_seq TO moverusers;


--
-- TOC entry 5822 (class 0 OID 0)
-- Dependencies: 273
-- Name: TABLE lp_table; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.lp_table TO moverusers;


--
-- TOC entry 5823 (class 0 OID 0)
-- Dependencies: 274
-- Name: TABLE reference_table; Type: ACL; Schema: mover; Owner: movercontrib
--

GRANT SELECT ON TABLE mover.reference_table TO moverusers;


-- Completed on 2020-11-24 22:27:48

--
-- PostgreSQL database dump complete
--

