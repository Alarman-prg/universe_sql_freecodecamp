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
    name character varying NOT NULL,
    has_life boolean NOT NULL,
    age_in_millions_of_years integer,
    in_spherical boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer,
    name character varying NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean,
    how_many_moons integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL,
    age_in_millions_of_years integer
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer,
    name character varying NOT NULL,
    distance_from_earth numeric NOT NULL,
    is_spherical boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', false, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', true, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', true, 4500);
INSERT INTO public.moon VALUES (2, 2, 'Phobos', true, 4500);
INSERT INTO public.moon VALUES (3, 2, 'Deimos', true, 4500);
INSERT INTO public.moon VALUES (4, 4, 'Europa', true, 4500);
INSERT INTO public.moon VALUES (5, 4, 'Ganymede', true, 4500);
INSERT INTO public.moon VALUES (6, 4, 'Callisto', true, 4500);
INSERT INTO public.moon VALUES (7, 4, 'Io', true, 4500);
INSERT INTO public.moon VALUES (8, 9, 'Sirius A I Moon 1', true, 1000);
INSERT INTO public.moon VALUES (9, 10, 'Sirius A II Moon 1', true, 1200);
INSERT INTO public.moon VALUES (10, 10, 'Sirius A II Moon 2', true, 1200);
INSERT INTO public.moon VALUES (11, 6, 'Alpha Centauri Bb Moon', true, 2000);
INSERT INTO public.moon VALUES (12, 8, 'Betelgeuse I Moon 1', true, 3500);
INSERT INTO public.moon VALUES (13, 8, 'Betelgeuse I Moon 2', true, 3500);
INSERT INTO public.moon VALUES (14, 4, 'Europa Moon 2', true, 4500);
INSERT INTO public.moon VALUES (15, 3, 'Venus Moon', false, 4500);
INSERT INTO public.moon VALUES (16, 5, 'Proxima b Moon 1', true, 3000);
INSERT INTO public.moon VALUES (17, 12, 'Vega II Moon 1', true, 4000);
INSERT INTO public.moon VALUES (18, 9, 'Sirius A I Moon 2', true, 1500);
INSERT INTO public.moon VALUES (19, 1, 'Earth Moon 2', false, 4500);
INSERT INTO public.moon VALUES (20, 2, 'Mars Moon 3', true, 3500);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Earth', 0, true, 1);
INSERT INTO public.planet VALUES (2, 1, 'Mars', 0.0000158, true, 2);
INSERT INTO public.planet VALUES (3, 1, 'Venus', 0.0000023, true, 0);
INSERT INTO public.planet VALUES (4, 1, 'Jupiter', 0.000082, true, 79);
INSERT INTO public.planet VALUES (5, 2, 'Proxima b', 4.24, true, 0);
INSERT INTO public.planet VALUES (6, 3, 'Alpha Centauri Bb', 4.37, true, 0);
INSERT INTO public.planet VALUES (7, 3, 'Alpha Centauri Cc', 4.38, true, 0);
INSERT INTO public.planet VALUES (8, 4, 'Betelgeuse I', 642.5, true, 0);
INSERT INTO public.planet VALUES (9, 5, 'Sirius A I', 8.6, true, 1);
INSERT INTO public.planet VALUES (10, 5, 'Sirius A II', 8.7, true, 2);
INSERT INTO public.planet VALUES (11, 6, 'Vega I', 25.05, true, 0);
INSERT INTO public.planet VALUES (12, 6, 'Vega II', 25.06, true, 0);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets with solid surfaces, typically composed of silicate rocks or metals.', 4500);
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets composed mostly of hydrogen and helium, with no solid surface.', 4600);
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Planets with a thick atmosphere rich in volatiles like water, ammonia, and methane.', 4600);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 0, NULL);
INSERT INTO public.star VALUES (2, 2, 'Proxima Centauri', 4.24, NULL);
INSERT INTO public.star VALUES (3, 3, 'Alpha Centauri', 4.37, NULL);
INSERT INTO public.star VALUES (4, 4, 'Betelgeuse', 642.5, NULL);
INSERT INTO public.star VALUES (5, 5, 'Sirius', 8.6, NULL);
INSERT INTO public.star VALUES (6, 1, 'Vega', 25.05, NULL);


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

