--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_black_hole numeric,
    distance_black_hole integer,
    describe text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric,
    is_habitable boolean,
    distance_from_its_planet integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: orbit; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.orbit (
    planet_id integer NOT NULL,
    moon_id integer NOT NULL,
    type_orbit character varying(30)
);


ALTER TABLE public.orbit OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_type character varying(30),
    is_habitable boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass numeric,
    age_of_star integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 4100000, 27000, 'The galaxy that contains our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 110000000, 2537000, 'The nearest spiral galaxy to the Milky Way and the largest in the Local Group.');
INSERT INTO public.galaxy VALUES (3, 'Sombrero', 660000000, 29000, 'A galaxy known for its bright nucleus and large central bulge, giving it the appearance of a sombrero.');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 3500000000, 54000000, 'A supergiant elliptical galaxy with a massive black hole at its core, known for its prominent jet of energetic particles.');
INSERT INTO public.galaxy VALUES (5, 'Triangulum', NULL, 3000000, 'The third-largest galaxy in the Local Group, known for its lack of a central bulge.');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 140000000, 23000000, 'A classic spiral galaxy, interacting with its companion galaxy NGC 5195, known for its well-defined spiral structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 0.073, true, 384400, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 0.00001, false, 9377, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 0.000001, false, 23460, 2);
INSERT INTO public.moon VALUES (4, 'Europa', 0.008, false, 670900, 3);
INSERT INTO public.moon VALUES (5, 'Ganymede', 0.015, false, 1070400, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', 0.018, false, 1882700, 3);
INSERT INTO public.moon VALUES (7, 'Io', 0.014, false, 421700, 3);
INSERT INTO public.moon VALUES (8, 'Titan', 0.013, true, 1221870, 4);
INSERT INTO public.moon VALUES (9, 'Rhea', 0.002, false, 527108, 4);
INSERT INTO public.moon VALUES (10, 'Iapetus', 0.002, false, 3560840, 4);
INSERT INTO public.moon VALUES (11, 'Dione', 0.001, false, 377396, 4);
INSERT INTO public.moon VALUES (12, 'Triton', 0.002, false, 354759, 5);
INSERT INTO public.moon VALUES (13, 'Proteus', 0.0005, false, 117646, 5);
INSERT INTO public.moon VALUES (14, 'Nereid', 0.0003, false, 5513819, 5);
INSERT INTO public.moon VALUES (15, 'Charon', 0.0001, false, 19571, 6);
INSERT INTO public.moon VALUES (16, 'Styx', 0.000001, false, 42000, 6);
INSERT INTO public.moon VALUES (17, 'Nix', 0.000001, false, 48708, 6);
INSERT INTO public.moon VALUES (18, 'Kerberos', 0.000001, false, 59000, 6);
INSERT INTO public.moon VALUES (19, 'Hydra', 0.000001, false, 64738, 6);
INSERT INTO public.moon VALUES (20, 'Mimas', 0.0003, false, 185520, 4);


--
-- Data for Name: orbit; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.orbit VALUES (1, 1, 'Elliptical');
INSERT INTO public.orbit VALUES (2, 2, 'Circular');
INSERT INTO public.orbit VALUES (2, 3, 'Elliptical');
INSERT INTO public.orbit VALUES (3, 4, 'Elliptical');
INSERT INTO public.orbit VALUES (3, 5, 'Circular');
INSERT INTO public.orbit VALUES (3, 6, 'Elliptical');
INSERT INTO public.orbit VALUES (3, 7, 'Circular');
INSERT INTO public.orbit VALUES (4, 8, 'Elliptical');
INSERT INTO public.orbit VALUES (4, 9, 'Circular');
INSERT INTO public.orbit VALUES (4, 10, 'Elliptical');
INSERT INTO public.orbit VALUES (4, 11, 'Circular');
INSERT INTO public.orbit VALUES (5, 12, 'Elliptical');
INSERT INTO public.orbit VALUES (5, 13, 'Circular');
INSERT INTO public.orbit VALUES (5, 14, 'Elliptical');
INSERT INTO public.orbit VALUES (6, 15, 'Elliptical');
INSERT INTO public.orbit VALUES (6, 16, 'Elliptical');
INSERT INTO public.orbit VALUES (6, 17, 'Circular');
INSERT INTO public.orbit VALUES (6, 18, 'Elliptical');
INSERT INTO public.orbit VALUES (6, 19, 'Circular');
INSERT INTO public.orbit VALUES (4, 20, 'Elliptical');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', true, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', false, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', false, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Terrestrial', true, 4);
INSERT INTO public.planet VALUES (10, 'Proxima c', 'Gas Giant', false, 4);
INSERT INTO public.planet VALUES (11, 'Sirius b', 'Terrestrial', false, 2);
INSERT INTO public.planet VALUES (12, 'Sirius c', 'Gas Giant', false, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 'Sun', 1.0, 4600, 1);
INSERT INTO public.star VALUES (6, 'Sirius', 2.1, 242, 2);
INSERT INTO public.star VALUES (7, 'Betelgeuse', 20.0, 8700, 3);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 0.12, 4700, 1);
INSERT INTO public.star VALUES (9, 'Rigel', 18.0, 8000, 4);
INSERT INTO public.star VALUES (10, 'Vega', 2.3, 455, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- PostgreSQL database dump complete
--

