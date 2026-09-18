--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(40) NOT NULL,
    galaxy_type_id integer NOT NULL,
    size_in_ly integer,
    luminosity_abs_mag real
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy ALTER COLUMN galaxy_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(10),
    description text NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.galaxy_type ALTER COLUMN galaxy_type_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.galaxy_type_galaxy_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(40),
    planet_id integer NOT NULL,
    description text,
    has_known_life boolean,
    avg_orbital_distance_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.moon ALTER COLUMN moon_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(40) NOT NULL,
    star_id integer,
    description text,
    has_known_life boolean,
    earth_masses numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.planet ALTER COLUMN planet_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(40) NOT NULL,
    galaxy_id integer,
    age_in_million_yrs bigint,
    distance_from_earth numeric,
    solar_masses numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

ALTER TABLE public.star ALTER COLUMN star_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (1, 'Milky Way', 1, 125000, -21);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (3, 'Andromeda', 1, 152000, 3.44);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (4, 'Triangulum', 1, 60000, -18.9);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (6, 'Ursa Major III', 2, 33000, 2.2);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (7, 'Draco II', 2, 70000, -0.8);
INSERT INTO public.galaxy OVERRIDING SYSTEM VALUE VALUES (8, 'Turcane III', 2, 74700, -1.3);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (1, 'spiral', 'name says it all - spiral shape');
INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (2, 'elliptical', 'The most common galaxy shape');
INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (3, 'lenticular', 'Almond shape, typically have little star formation');
INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (4, 'irregular', 'chaotic, typically caused by distortion from nearby galaxies or recent galaxtic collisions');
INSERT INTO public.galaxy_type OVERRIDING SYSTEM VALUE VALUES (5, 'unknown', 'typically unknown because distance makes detailed observation impossible');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (1, 'Moon', 1, 'Rocky, dry, likely created by large object colliding with Earth', false, 384400);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (2, 'Phobos', 4, 'heavily cratered, irregularly shaped', false, 9376);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (3, 'Deimos', 4, 'smooth-looking moon with a highly irregular shape, slowly drifting away', false, 23460);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (4, 'Io', 5, 'volcanically active, yellow-orange surface', false, 421700);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (5, 'Europa', 5, 'encased in a smooth, fractured crust of solid ice. Scientists are highly confident it harbors a vast, liquid saltwater ocean beneath its ice sheet, making it a prime target for hunting alien life', false, 670900);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (6, 'Ganymede', 5, 'largest moon it the solar system, generates its own magnetic field', false, 1070400);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (7, 'Callisto', 5, 'heavily cratered', false, 1882700);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (8, 'Enceladus', 6, 'tiny ice moon that violently vents giant plumes of saltwater vapor and organic molecules from its south pole region', false, 238000);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (9, 'Titan', 6, 'dense, thick atmosphere, liquid methane and ethane lakes', false, 1221800);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (10, 'Iapetus', 6, 'two-toned appearance with a massive equatorial ridge', false, 3561300);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (11, 'Miranda', 7, 'small, bizarre moon with a highly chaotic, patchwork geology', false, 129400);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (12, 'Titania', 7, 'rocky, icy surface with massive vally rifts and fault lines', false, 435900);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (13, 'Triton', 8, 'frozen moon that orbits in a retrograde direction, possibly a former dwarf planet from the Kuiper Belt, with active nitrogen geysers', false, 354800);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (14, 'Amalthea', 5, 'faint, bright red, potato-shaped inner moon that radiates more heat than it receives from the Sun, likely due to electrical currents induced by the powerful magnetic field of Jupiter', false, 181400);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (15, 'Himalia', 5, 'orbits at a steep tilt, likely a former asteroid captured by Jupiter', false, 11461000);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (16, 'Mimas', 6, 'resembles the Death Star because of a massive crater that dominates its icy surface', false, 185520);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (17, 'Rhea', 6, 'highly cratered, composed almost entirely of water ice, like a giant, frozen, dirty snowball', false, 527040);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (18, 'Hyperion', 6, 'low-density moon, tumblins unpredictably through its orbit (not tidal-locked)', false, 1481100);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (19, 'Ariel', 7, 'sprawling, deep rift valleys that suggest widespread volcanic activity involving liquid water or ammonia ice in its past', false, 191020);
INSERT INTO public.moon OVERRIDING SYSTEM VALUE VALUES (20, 'Umbriel', 7, 'heavily battered by ancient impacts and notable for a mysterious, bright ring of ice reflecting light from the floor of one of its largest craters', false, 266000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (1, 'Earth', 1, 'Rocky, with 71% covered by water', true, 1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (2, 'Venus', 1, 'Rocky planet, hottest in its solar system, with backward rotation', false, 0.815);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (3, 'Mercury', 1, 'The smallest and closest planet to the Sun, rocky, heavily cratered, extreme temperature swings', false, 0.055);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (4, 'Mars', 1, 'cold, desert-like world known as the "Red Planet" due to iron oxide (rust) covering its surface soil', false, 0.107);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (5, 'Jupiter', 1, 'The largest planet in the solar system, primarily made of hydrogen and helium, and famous for its swirling Great Red Spot storm.', false, 317.8);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (6, 'Saturn', 1, 'A massive gas giant adorned with a spectacular, complex, and highly visible ring system made of ice and rock debris.', false, 95.2);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (7, 'Uranus', 1, 'An ice giant with a unique pale blue-green tint caused by atmospheric methane, uniquely tilted to rotate nearly on its side.', false, 14.5);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (8, 'Neptune', 1, 'The farthest planet from the Sun, known for its deep blue color, supersonic winds, and a dynamic, freezing atmosphere.', false, 17.1);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (9, 'Proxima Centauri b', 3, 'The closest known exoplanet to Earth, in the habitable zone', false, 1.27);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (10, 'Barnard''s Star b', 6, 'blah blah', false, 0.30);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (11, 'Barnard''s Star c', 6, 'blah blah 2', false, 0.34);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (12, 'Barnard''s Star d', 6, 'blah blah 3', false, 0.26);
INSERT INTO public.planet OVERRIDING SYSTEM VALUE VALUES (13, 'Barnard''s Star e', 6, 'blah blah 4', false, 0.19);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (1, 'Sol', 1, 4570, 0, 1.0);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (3, 'Proxima Centauri', 1, 4850, 4.24, 0.12);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (4, 'Alpha Centauri A', 1, 6250, 4.27, 1.10);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (5, 'Alpha Centauri B', 1, 6250, 4.37, 0.91);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (6, 'Barnard''s Star', 1, 9500, 5.96, 0.14);
INSERT INTO public.star OVERRIDING SYSTEM VALUE VALUES (7, 'Wolf 359', 1, 225, 7.78, 0.11);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: galaxy_type unique_galaxy_type_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT unique_galaxy_type_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


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

