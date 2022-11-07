--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(40) NOT NULL,
    has_life boolean NOT NULL,
    closest_planent numeric(12,0),
    closest_star numeric(11,0),
    size integer,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_name_seq OWNER TO freecodecamp;

--
-- Name: galaxy_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_name_seq OWNED BY public.galaxy.name;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying NOT NULL,
    moon_id integer NOT NULL,
    description text,
    has_life boolean DEFAULT false,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_name_seq OWNER TO freecodecamp;

--
-- Name: moon_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_name_seq OWNED BY public.moon.name;


--
-- Name: other_moons; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.other_moons (
    other_moons_id integer NOT NULL,
    name character varying(50),
    description text,
    has_life boolean DEFAULT false,
    planet_id integer NOT NULL
);


ALTER TABLE public.other_moons OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    planet_id integer NOT NULL,
    description text,
    star_id integer NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_name_seq OWNER TO freecodecamp;

--
-- Name: planet_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_name_seq OWNED BY public.planet.name;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying NOT NULL,
    star_id integer NOT NULL,
    description text,
    temp integer NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_name_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_name_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_name_seq OWNER TO freecodecamp;

--
-- Name: star_name_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_name_seq OWNED BY public.star.name;


--
-- Name: galaxy name; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN name SET DEFAULT nextval('public.galaxy_name_seq'::regclass);


--
-- Name: moon name; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN name SET DEFAULT nextval('public.moon_name_seq'::regclass);


--
-- Name: planet name; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN name SET DEFAULT nextval('public.planet_name_seq'::regclass);


--
-- Name: star name; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN name SET DEFAULT nextval('public.star_name_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('Milky Way', true, 100000000, 400000000, 30, 1);
INSERT INTO public.galaxy VALUES ('Delta', false, 40000000000, 80000000000, NULL, 2);
INSERT INTO public.galaxy VALUES ('Andromeda', false, 80000000000, 65000000000, 752, 3);
INSERT INTO public.galaxy VALUES ('Omega', false, 4544450000, 32154621315, 42, 4);
INSERT INTO public.galaxy VALUES ('Gamma', false, 5000000000, 5000010000, NULL, 5);
INSERT INTO public.galaxy VALUES ('Bootleg', true, 9000000000, 690010000, 69, 6);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('Moon', 1, 'Earths moon', false, 3);
INSERT INTO public.moon VALUES ('Phobos', 2, 'One of Mars moons', false, 4);
INSERT INTO public.moon VALUES ('Deimos', 3, 'Another of Mars moons', false, 4);
INSERT INTO public.moon VALUES ('Proteus', 4, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Despina', 5, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Triton', 6, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Larissa', 7, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Naiad', 8, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Nereid', 9, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Sao', 10, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Thalassa', 11, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Neso', 12, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Hippocamp', 13, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Laomedeia', 14, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Psamathe', 15, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Galatea', 16, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Halimede', 17, 'Neptune has a lot of moons', false, 8);
INSERT INTO public.moon VALUES ('Mimas', 18, 'Saturns moons looking good', false, 6);
INSERT INTO public.moon VALUES ('Titan', 19, 'Saturns moons looking good', false, 6);
INSERT INTO public.moon VALUES ('Charon', 20, 'Baby plutos moons are small', false, 9);


--
-- Data for Name: other_moons; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.other_moons VALUES (1, 'Hydra', 'Baby plutos moons are small', false, 9);
INSERT INTO public.other_moons VALUES (2, 'Lix', 'Baby plutos moons are small', false, 9);
INSERT INTO public.other_moons VALUES (3, 'Styx', 'Baby plutos moons are small', false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Mercury', 1, 'First Planet', 1, false);
INSERT INTO public.planet VALUES ('Venus', 2, 'Second Planet', 1, false);
INSERT INTO public.planet VALUES ('Earth', 3, 'Our Planet', 1, true);
INSERT INTO public.planet VALUES ('Mars', 4, 'Fourth Planet', 1, true);
INSERT INTO public.planet VALUES ('Jupiter', 5, 'Fifth Planet', 1, false);
INSERT INTO public.planet VALUES ('Saturn', 6, 'Sixth Planet', 1, false);
INSERT INTO public.planet VALUES ('Uranus', 7, 'Seventh Planet', 1, false);
INSERT INTO public.planet VALUES ('Neptune', 8, 'Eighth Planet', 1, false);
INSERT INTO public.planet VALUES ('Pluto', 9, 'Ninthish Planet', 1, false);
INSERT INTO public.planet VALUES ('ChunkChunk', 10, 'First Planet in Andromeda', 5, false);
INSERT INTO public.planet VALUES ('FiberFi', 11, 'Second Planet in Andromeda', 5, true);
INSERT INTO public.planet VALUES ('SpringinSprung', 12, 'Third Planet in Andromeda', 5, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('Sun', 1, 'Our sun', 100000, 1);
INSERT INTO public.star VALUES ('Monster', 2, 'Sun in Andromeda', 150000, 3);
INSERT INTO public.star VALUES ('Big Star', 3, 'Sun in Andromeda', 7000000, 3);
INSERT INTO public.star VALUES ('Bigger Star', 4, 'Sun in Andromeda', 9000000, 3);
INSERT INTO public.star VALUES ('Biggest Star', 5, 'Sun in Andromeda', 100000000, 3);
INSERT INTO public.star VALUES ('Hillary', 6, 'Sun in Gamma', 100000000, 5);


--
-- Name: galaxy_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_name_seq', 1, false);


--
-- Name: moon_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_name_seq', 1, false);


--
-- Name: planet_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_name_seq', 1, false);


--
-- Name: star_name_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_name_seq', 1, false);


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
-- Name: other_moons other_moons_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_moons
    ADD CONSTRAINT other_moons_name_key UNIQUE (name);


--
-- Name: other_moons other_moons_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_moons
    ADD CONSTRAINT other_moons_pkey PRIMARY KEY (other_moons_id);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: other_moons other_moons_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.other_moons
    ADD CONSTRAINT other_moons_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

