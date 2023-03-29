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
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_type character varying(30) NOT NULL,
    distance_from_earth_in_light_years integer
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
    planet_id integer NOT NULL,
    is_spherical boolean,
    distance_from_its_planet_in_km integer,
    description text
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
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    has_life boolean,
    description text,
    gravity_force numeric(5,2)
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    types_of_planets_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer NOT NULL,
    age_in_millions_of_years integer,
    star_type character varying(30) NOT NULL,
    distance_from_earth_in_light_years integer
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
-- Name: types_of_planets; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.types_of_planets (
    types_of_planets_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.types_of_planets OWNER TO freecodecamp;

--
-- Name: type_of_planets_type_of_planets_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.type_of_planets_type_of_planets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.type_of_planets_type_of_planets_id_seq OWNER TO freecodecamp;

--
-- Name: type_of_planets_type_of_planets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.type_of_planets_type_of_planets_id_seq OWNED BY public.types_of_planets.types_of_planets_id;


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
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: types_of_planets types_of_planets_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types_of_planets ALTER COLUMN types_of_planets_id SET DEFAULT nextval('public.type_of_planets_type_of_planets_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Via Lactea', 'https://es.wikipedia.org/wiki/Vía_Láctea', 'Espiral barrada', 0);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'https://es.wikipedia.org/wiki/Galaxia_de_Andrómeda', 'Espiral', 2500000);
INSERT INTO public.galaxy VALUES (3, 'Enana del Can Mayor', 'https://es.wikipedia.org/wiki/Enana_del_Can_Mayor', 'Irregular', 25000);
INSERT INTO public.galaxy VALUES (4, 'Enana Eliptica de Sagitario', 'https://es.wikipedia.org/wiki/Enana_Elíptica_de_Sagitario', 'Eliptica E7', 70000);
INSERT INTO public.galaxy VALUES (5, 'Gran Nube de Magallanes', 'https://es.wikipedia.org/wiki/Gran_Nube_de_Magallanes', 'SB (s) m', 163000);
INSERT INTO public.galaxy VALUES (6, 'Enana de la Osa Menor', 'https://es.wikipedia.org/wiki/Enana_de_la_Osa_Menor', 'dE4', 200000);
INSERT INTO public.galaxy VALUES (7, 'Star Wars Galaxy', 'Is fiction :) https://starwars.fandom.com/es/wiki/La_galaxia', 'Espiral', 1000000000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, true, 384400, 'https://es.wikipedia.org/wiki/Luna');
INSERT INTO public.moon VALUES (2, 'Deimos', 4, false, 23460, 'https://es.wikipedia.org/wiki/Deimos_(sat´élite)');
INSERT INTO public.moon VALUES (3, 'Fobos', 4, false, 9377, 'https://es.wikipedia.org/wiki/Fobos_(satélite)');
INSERT INTO public.moon VALUES (34, 'Calisto', 5, true, 1880000, 'https://es.wikipedia.org/wiki/Calisto_(satélite)');
INSERT INTO public.moon VALUES (35, 'Europa', 5, true, 670900, 'https://es.wikipedia.org/wiki/Europa_(satélite)');
INSERT INTO public.moon VALUES (36, 'Ganimedes', 5, true, 1070000, 'https://es.wikipedia.org/wiki/Ganimedes_(satélite)');
INSERT INTO public.moon VALUES (37, 'Io', 5, true, 421600, 'https://es.wikipedia.org/wiki/Ío_(satélite)');
INSERT INTO public.moon VALUES (38, 'Dione', 6, true, 377000, 'https://es.wikipedia.org/wiki/Dione_(satélite)');
INSERT INTO public.moon VALUES (39, 'Encélado', 6, true, 238000, 'https://es.wikipedia.org/wiki/Encélado_(satélite)');
INSERT INTO public.moon VALUES (40, 'Jápeto', 6, true, 3561300, 'https://es.wikipedia.org/wiki/Jápeto_(satélite)');
INSERT INTO public.moon VALUES (41, 'Mimas', 6, true, 185000, 'https://es.wikipedia.org/wiki/Mimas_(satélite)');
INSERT INTO public.moon VALUES (42, 'Rea', 6, true, 527000, 'https://es.wikipedia.org/wiki/Rea_(satélite)');
INSERT INTO public.moon VALUES (43, 'Tetis', 6, true, 294000, 'https://es.wikipedia.org/wiki/Tetis_(satélite)');
INSERT INTO public.moon VALUES (44, 'Titán', 6, true, 1200000, 'https://es.wikipedia.org/wiki/Titán_(satélite)');
INSERT INTO public.moon VALUES (45, 'Ariel', 7, true, 190000, 'https://es.wikipedia.org/wiki/Ariel_(satélite)');
INSERT INTO public.moon VALUES (46, 'Miranda', 7, true, 129900, 'https://es.wikipedia.org/wiki/Miranda_(satélite)');
INSERT INTO public.moon VALUES (47, 'Oberón', 7, true, 583000, 'https://es.wikipedia.org/wiki/Oberón_(satélite)');
INSERT INTO public.moon VALUES (48, 'Titania', 7, true, 436000, 'https://es.wikipedia.org/wiki/Titania_(satélite)');
INSERT INTO public.moon VALUES (49, 'Umbriel', 7, true, 266000, 'https://es.wikipedia.org/wiki/Umbriel_(satélite)');
INSERT INTO public.moon VALUES (50, 'Nereida', 8, false, 5500000, 'https://es.wikipedia.org/wiki/Nereida_(satélite)');
INSERT INTO public.moon VALUES (51, 'Proteo', 8, false, 117000, 'https://es.wikipedia.org/wiki/Proteo_(satélite)');
INSERT INTO public.moon VALUES (52, 'Tritón', 8, true, 354000, 'https://es.wikipedia.org/wiki/Tritón_(satélite)');
INSERT INTO public.moon VALUES (53, 'Ohma-D''um', 11, true, NULL, 'https://starwars.fandom.com/es/wiki/Naboo/Leyendas');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercurio', 1, false, 'https://es.wikipedia.org/wiki/Mercurio_(planeta)', 3.70);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 'https://es.wikipedia.org/wiki/Venus_(planeta)', 8.87);
INSERT INTO public.planet VALUES (3, 'Tierra', 1, true, 'https://es.wikipedia.org/wiki/Tierra', 9.81);
INSERT INTO public.planet VALUES (4, 'Marte', 1, false, 'https://es.wikipedia.org/wiki/Marte_(planeta)', 3.72);
INSERT INTO public.planet VALUES (5, 'Júpiter', 1, false, 'https://es.wikipedia.org/wiki/Júpiter_(planeta)', 24.79);
INSERT INTO public.planet VALUES (6, 'Saturno', 1, false, 'https://es.wikipedia.org/wiki/Saturno_(planeta)', 10.44);
INSERT INTO public.planet VALUES (7, 'Urano', 1, false, 'https://es.wikipedia.org/wiki/Urano_(planeta)', 8.69);
INSERT INTO public.planet VALUES (8, 'Neptuno', 1, false, 'https://es.wikipedia.org/wiki/Neptuno_(planeta)', 11.15);
INSERT INTO public.planet VALUES (9, 'Moth', 8, true, 'https://starwars.fandom.com/es/wiki/Moth_(planeta)', NULL);
INSERT INTO public.planet VALUES (10, 'Erep', 8, true, 'https://starwars.fandom.com/es/wiki/Erep', NULL);
INSERT INTO public.planet VALUES (11, 'Naboo', 8, true, 'https://starwars.fandom.com/es/wiki/Naboo_(planeta)', 9.81);
INSERT INTO public.planet VALUES (12, 'Tatooine', 9, true, 'https://starwars.fandom.com/es/wiki/Tatooine', 9.81);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 4600, 'Enana amarilla', 0);
INSERT INTO public.star VALUES (2, 'Alfa Centauri B', 1, 6000, 'Enana naranja', 4);
INSERT INTO public.star VALUES (3, 'Sirio A', 1, 300, 'Estrella blanca', 9);
INSERT INTO public.star VALUES (4, 'Arturo', 1, 10000, 'Gigante naranja', 37);
INSERT INTO public.star VALUES (5, 'Canopus', 1, NULL, 'Supergigante blanco-amarilla', 309);
INSERT INTO public.star VALUES (6, 'Ácrux', 1, NULL, 'Estrella blanco-azulada', 325);
INSERT INTO public.star VALUES (7, 'Vega', 1, 455, 'Estrella blanca', 25);
INSERT INTO public.star VALUES (8, 'Naboo', 7, 6000, 'Estrella amarilla', 1000000000);
INSERT INTO public.star VALUES (9, 'Sistema Tatoo', 7, 1000, 'Sistema estelar binario', 1000000000);


--
-- Data for Name: types_of_planets; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 53, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: type_of_planets_type_of_planets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.type_of_planets_type_of_planets_id_seq', 1, false);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: types_of_planets type_of_planets_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types_of_planets
    ADD CONSTRAINT type_of_planets_name_key UNIQUE (name);


--
-- Name: types_of_planets types_of_planets_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.types_of_planets
    ADD CONSTRAINT types_of_planets_pkey PRIMARY KEY (types_of_planets_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

