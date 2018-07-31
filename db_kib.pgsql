--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
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


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: BooksApp_author; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_author" (
    id integer NOT NULL,
    first_name character varying(100),
    last_name character varying(100),
    email character varying(254) NOT NULL
);


ALTER TABLE public."BooksApp_author" OWNER TO karla;

--
-- Name: BooksApp_author_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_author_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_author_id_seq" OWNER TO karla;

--
-- Name: BooksApp_author_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_author_id_seq" OWNED BY public."BooksApp_author".id;


--
-- Name: BooksApp_book; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_book" (
    id integer NOT NULL,
    book_title character varying(100),
    publication_date date NOT NULL,
    publisher_id integer NOT NULL
);


ALTER TABLE public."BooksApp_book" OWNER TO karla;

--
-- Name: BooksApp_book_authors; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_book_authors" (
    id integer NOT NULL,
    book_id integer NOT NULL,
    author_id integer NOT NULL
);


ALTER TABLE public."BooksApp_book_authors" OWNER TO karla;

--
-- Name: BooksApp_book_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_book_authors_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_book_authors_id_seq" OWNER TO karla;

--
-- Name: BooksApp_book_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_book_authors_id_seq" OWNED BY public."BooksApp_book_authors".id;


--
-- Name: BooksApp_book_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_book_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_book_id_seq" OWNER TO karla;

--
-- Name: BooksApp_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_book_id_seq" OWNED BY public."BooksApp_book".id;


--
-- Name: BooksApp_chapter; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_chapter" (
    id integer NOT NULL,
    chapter_number integer,
    chapter_name character varying(100),
    book_id integer NOT NULL,
    CONSTRAINT "BooksApp_chapter_chapter_number_check" CHECK ((chapter_number >= 0))
);


ALTER TABLE public."BooksApp_chapter" OWNER TO karla;

--
-- Name: BooksApp_chapter_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_chapter_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_chapter_id_seq" OWNER TO karla;

--
-- Name: BooksApp_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_chapter_id_seq" OWNED BY public."BooksApp_chapter".id;


--
-- Name: BooksApp_publisher; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_publisher" (
    id integer NOT NULL,
    publisher_name character varying(100),
    address character varying(100),
    website character varying(200) NOT NULL
);


ALTER TABLE public."BooksApp_publisher" OWNER TO karla;

--
-- Name: BooksApp_publisher_city; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_publisher_city" (
    id integer NOT NULL,
    publisher_id integer NOT NULL,
    city_id character varying(50) NOT NULL
);


ALTER TABLE public."BooksApp_publisher_city" OWNER TO karla;

--
-- Name: BooksApp_publisher_city_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_publisher_city_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_publisher_city_id_seq" OWNER TO karla;

--
-- Name: BooksApp_publisher_city_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_publisher_city_id_seq" OWNED BY public."BooksApp_publisher_city".id;


--
-- Name: BooksApp_publisher_country; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_publisher_country" (
    id integer NOT NULL,
    publisher_id integer NOT NULL,
    country_id character varying(50) NOT NULL
);


ALTER TABLE public."BooksApp_publisher_country" OWNER TO karla;

--
-- Name: BooksApp_publisher_country_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_publisher_country_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_publisher_country_id_seq" OWNER TO karla;

--
-- Name: BooksApp_publisher_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_publisher_country_id_seq" OWNED BY public."BooksApp_publisher_country".id;


--
-- Name: BooksApp_publisher_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_publisher_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_publisher_id_seq" OWNER TO karla;

--
-- Name: BooksApp_publisher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_publisher_id_seq" OWNED BY public."BooksApp_publisher".id;


--
-- Name: BooksApp_publisher_state_province; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."BooksApp_publisher_state_province" (
    id integer NOT NULL,
    publisher_id integer NOT NULL,
    state_id character varying(50) NOT NULL
);


ALTER TABLE public."BooksApp_publisher_state_province" OWNER TO karla;

--
-- Name: BooksApp_publisher_state_province_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."BooksApp_publisher_state_province_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."BooksApp_publisher_state_province_id_seq" OWNER TO karla;

--
-- Name: BooksApp_publisher_state_province_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."BooksApp_publisher_state_province_id_seq" OWNED BY public."BooksApp_publisher_state_province".id;


--
-- Name: LocationApp_city; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."LocationApp_city" (
    city_id character varying(50) NOT NULL,
    city_name character varying(500),
    city_country_id character varying(50) NOT NULL,
    city_state_id character varying(50) NOT NULL
);


ALTER TABLE public."LocationApp_city" OWNER TO karla;

--
-- Name: LocationApp_country; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."LocationApp_country" (
    country_id character varying(50) NOT NULL,
    country_name character varying(500)
);


ALTER TABLE public."LocationApp_country" OWNER TO karla;

--
-- Name: LocationApp_state; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."LocationApp_state" (
    state_id character varying(50) NOT NULL,
    state_name character varying(500),
    state_country_id character varying(50) NOT NULL
);


ALTER TABLE public."LocationApp_state" OWNER TO karla;

--
-- Name: ProblemsApp_problem; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."ProblemsApp_problem" (
    id integer NOT NULL,
    problem_name character varying(500),
    text text NOT NULL,
    template character varying(500),
    number_of_numeral integer,
    topic_id_id character varying(50) NOT NULL,
    CONSTRAINT "ProblemsApp_problem_number_of_numeral_check" CHECK ((number_of_numeral >= 0))
);


ALTER TABLE public."ProblemsApp_problem" OWNER TO karla;

--
-- Name: ProblemsApp_problem_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."ProblemsApp_problem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProblemsApp_problem_id_seq" OWNER TO karla;

--
-- Name: ProblemsApp_problem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."ProblemsApp_problem_id_seq" OWNED BY public."ProblemsApp_problem".id;


--
-- Name: ProblemsApp_problemnumeral; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."ProblemsApp_problemnumeral" (
    id integer NOT NULL,
    numeral_name character varying(500),
    numeral_number integer,
    question text NOT NULL,
    number_of_steps integer,
    problem_id_id integer NOT NULL,
    CONSTRAINT "ProblemsApp_problemnumeral_number_of_steps_check" CHECK ((number_of_steps >= 0)),
    CONSTRAINT "ProblemsApp_problemnumeral_numeral_number_check" CHECK ((numeral_number >= 0))
);


ALTER TABLE public."ProblemsApp_problemnumeral" OWNER TO karla;

--
-- Name: ProblemsApp_problemnumeral_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."ProblemsApp_problemnumeral_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProblemsApp_problemnumeral_id_seq" OWNER TO karla;

--
-- Name: ProblemsApp_problemnumeral_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."ProblemsApp_problemnumeral_id_seq" OWNED BY public."ProblemsApp_problemnumeral".id;


--
-- Name: ProblemsApp_step; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."ProblemsApp_step" (
    id integer NOT NULL,
    step_name character varying(500),
    step_number integer,
    explanation text NOT NULL,
    video character varying(500),
    instruction text NOT NULL,
    number_of_substeps integer,
    problem_num_id_id integer NOT NULL,
    CONSTRAINT "ProblemsApp_step_number_of_substeps_check" CHECK ((number_of_substeps >= 0)),
    CONSTRAINT "ProblemsApp_step_step_number_check" CHECK ((step_number >= 0))
);


ALTER TABLE public."ProblemsApp_step" OWNER TO karla;

--
-- Name: ProblemsApp_step_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."ProblemsApp_step_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProblemsApp_step_id_seq" OWNER TO karla;

--
-- Name: ProblemsApp_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."ProblemsApp_step_id_seq" OWNED BY public."ProblemsApp_step".id;


--
-- Name: ProblemsApp_substep; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."ProblemsApp_substep" (
    id integer NOT NULL,
    substep_name character varying(500),
    substep_number integer,
    answer text,
    hint text,
    step_id_id integer NOT NULL,
    CONSTRAINT "ProblemsApp_substep_substep_number_check" CHECK ((substep_number >= 0))
);


ALTER TABLE public."ProblemsApp_substep" OWNER TO karla;

--
-- Name: ProblemsApp_substep_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."ProblemsApp_substep_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ProblemsApp_substep_id_seq" OWNER TO karla;

--
-- Name: ProblemsApp_substep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."ProblemsApp_substep_id_seq" OWNED BY public."ProblemsApp_substep".id;


--
-- Name: SchoolsApp_college; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SchoolsApp_college" (
    college_id character varying(50) NOT NULL,
    college_name character varying(500),
    college_city_id character varying(50) NOT NULL,
    college_country_id character varying(50) NOT NULL,
    college_state_id character varying(50) NOT NULL
);


ALTER TABLE public."SchoolsApp_college" OWNER TO karla;

--
-- Name: SchoolsApp_school; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SchoolsApp_school" (
    school_id character varying(50) NOT NULL,
    school_name character varying(500),
    school_city_id character varying(50) NOT NULL,
    school_country_id character varying(50) NOT NULL,
    school_state_id character varying(50) NOT NULL
);


ALTER TABLE public."SchoolsApp_school" OWNER TO karla;

--
-- Name: SchoolsApp_university; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SchoolsApp_university" (
    university_id character varying(50) NOT NULL,
    university_name character varying(500),
    university_city_id character varying(50) NOT NULL,
    university_country_id character varying(50) NOT NULL,
    university_state_id character varying(50) NOT NULL
);


ALTER TABLE public."SchoolsApp_university" OWNER TO karla;

--
-- Name: StudentsApp_student; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."StudentsApp_student" (
    id integer NOT NULL,
    student_name character varying(100) NOT NULL,
    number_solved_problems integer NOT NULL,
    country_id character varying(50) NOT NULL
);


ALTER TABLE public."StudentsApp_student" OWNER TO karla;

--
-- Name: StudentsApp_student_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."StudentsApp_student_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentsApp_student_id_seq" OWNER TO karla;

--
-- Name: StudentsApp_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."StudentsApp_student_id_seq" OWNED BY public."StudentsApp_student".id;


--
-- Name: StudentsApp_student_school; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."StudentsApp_student_school" (
    id integer NOT NULL,
    student_id integer NOT NULL,
    school_id character varying(50) NOT NULL
);


ALTER TABLE public."StudentsApp_student_school" OWNER TO karla;

--
-- Name: StudentsApp_student_school_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."StudentsApp_student_school_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentsApp_student_school_id_seq" OWNER TO karla;

--
-- Name: StudentsApp_student_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."StudentsApp_student_school_id_seq" OWNED BY public."StudentsApp_student_school".id;


--
-- Name: StudentsApp_studentproblem; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."StudentsApp_studentproblem" (
    id integer NOT NULL,
    succesful_attemps integer NOT NULL,
    fail_attemps integer NOT NULL,
    answer_file character varying(100) NOT NULL,
    problem_id_id integer NOT NULL,
    student_id_id integer NOT NULL
);


ALTER TABLE public."StudentsApp_studentproblem" OWNER TO karla;

--
-- Name: StudentsApp_studentproblem_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."StudentsApp_studentproblem_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentsApp_studentproblem_id_seq" OWNER TO karla;

--
-- Name: StudentsApp_studentproblem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."StudentsApp_studentproblem_id_seq" OWNED BY public."StudentsApp_studentproblem".id;


--
-- Name: StudentsApp_studentstep; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."StudentsApp_studentstep" (
    id integer NOT NULL,
    succesful_attemps integer NOT NULL,
    fail_attemps integer NOT NULL,
    number_of_substeps integer NOT NULL,
    numeral_id_id integer NOT NULL,
    problem_student_id_id integer NOT NULL,
    step_id_id integer NOT NULL
);


ALTER TABLE public."StudentsApp_studentstep" OWNER TO karla;

--
-- Name: StudentsApp_studentstep_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."StudentsApp_studentstep_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."StudentsApp_studentstep_id_seq" OWNER TO karla;

--
-- Name: StudentsApp_studentstep_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."StudentsApp_studentstep_id_seq" OWNED BY public."StudentsApp_studentstep".id;


--
-- Name: SubjectsApp_subject; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_subject" (
    subject_id character varying(50) NOT NULL,
    subject_name character varying(500),
    description text NOT NULL,
    level character varying(100) NOT NULL
);


ALTER TABLE public."SubjectsApp_subject" OWNER TO karla;

--
-- Name: SubjectsApp_subject_book; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_subject_book" (
    id integer NOT NULL,
    subject_id character varying(50) NOT NULL,
    book_id integer NOT NULL
);


ALTER TABLE public."SubjectsApp_subject_book" OWNER TO karla;

--
-- Name: SubjectsApp_subject_book_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."SubjectsApp_subject_book_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubjectsApp_subject_book_id_seq" OWNER TO karla;

--
-- Name: SubjectsApp_subject_book_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."SubjectsApp_subject_book_id_seq" OWNED BY public."SubjectsApp_subject_book".id;


--
-- Name: SubjectsApp_subject_chapter; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_subject_chapter" (
    id integer NOT NULL,
    subject_id character varying(50) NOT NULL,
    chapter_id integer NOT NULL
);


ALTER TABLE public."SubjectsApp_subject_chapter" OWNER TO karla;

--
-- Name: SubjectsApp_subject_chapter_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."SubjectsApp_subject_chapter_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubjectsApp_subject_chapter_id_seq" OWNER TO karla;

--
-- Name: SubjectsApp_subject_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."SubjectsApp_subject_chapter_id_seq" OWNED BY public."SubjectsApp_subject_chapter".id;


--
-- Name: SubjectsApp_subject_country; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_subject_country" (
    id integer NOT NULL,
    subject_id character varying(50) NOT NULL,
    country_id character varying(50) NOT NULL
);


ALTER TABLE public."SubjectsApp_subject_country" OWNER TO karla;

--
-- Name: SubjectsApp_subject_country_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."SubjectsApp_subject_country_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubjectsApp_subject_country_id_seq" OWNER TO karla;

--
-- Name: SubjectsApp_subject_country_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."SubjectsApp_subject_country_id_seq" OWNED BY public."SubjectsApp_subject_country".id;


--
-- Name: SubjectsApp_topic; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_topic" (
    topic_id character varying(50) NOT NULL,
    topic_name character varying(500) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public."SubjectsApp_topic" OWNER TO karla;

--
-- Name: SubjectsApp_topic_chapter; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_topic_chapter" (
    id integer NOT NULL,
    topic_id character varying(50) NOT NULL,
    chapter_id integer NOT NULL
);


ALTER TABLE public."SubjectsApp_topic_chapter" OWNER TO karla;

--
-- Name: SubjectsApp_topic_chapter_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."SubjectsApp_topic_chapter_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubjectsApp_topic_chapter_id_seq" OWNER TO karla;

--
-- Name: SubjectsApp_topic_chapter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."SubjectsApp_topic_chapter_id_seq" OWNED BY public."SubjectsApp_topic_chapter".id;


--
-- Name: SubjectsApp_topic_subject; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public."SubjectsApp_topic_subject" (
    id integer NOT NULL,
    topic_id character varying(50) NOT NULL,
    subject_id character varying(50) NOT NULL
);


ALTER TABLE public."SubjectsApp_topic_subject" OWNER TO karla;

--
-- Name: SubjectsApp_topic_subject_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public."SubjectsApp_topic_subject_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubjectsApp_topic_subject_id_seq" OWNER TO karla;

--
-- Name: SubjectsApp_topic_subject_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public."SubjectsApp_topic_subject_id_seq" OWNED BY public."SubjectsApp_topic_subject".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO karla;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO karla;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO karla;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO karla;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO karla;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO karla;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO karla;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO karla;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO karla;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO karla;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO karla;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO karla;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO karla;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO karla;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO karla;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO karla;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO karla;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: karla
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO karla;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: karla
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: karla
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO karla;

--
-- Name: BooksApp_author id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_author" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_author_id_seq"'::regclass);


--
-- Name: BooksApp_book id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_book_id_seq"'::regclass);


--
-- Name: BooksApp_book_authors id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book_authors" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_book_authors_id_seq"'::regclass);


--
-- Name: BooksApp_chapter id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_chapter" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_chapter_id_seq"'::regclass);


--
-- Name: BooksApp_publisher id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_publisher_id_seq"'::regclass);


--
-- Name: BooksApp_publisher_city id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_city" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_publisher_city_id_seq"'::regclass);


--
-- Name: BooksApp_publisher_country id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_country" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_publisher_country_id_seq"'::regclass);


--
-- Name: BooksApp_publisher_state_province id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_state_province" ALTER COLUMN id SET DEFAULT nextval('public."BooksApp_publisher_state_province_id_seq"'::regclass);


--
-- Name: ProblemsApp_problem id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problem" ALTER COLUMN id SET DEFAULT nextval('public."ProblemsApp_problem_id_seq"'::regclass);


--
-- Name: ProblemsApp_problemnumeral id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problemnumeral" ALTER COLUMN id SET DEFAULT nextval('public."ProblemsApp_problemnumeral_id_seq"'::regclass);


--
-- Name: ProblemsApp_step id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_step" ALTER COLUMN id SET DEFAULT nextval('public."ProblemsApp_step_id_seq"'::regclass);


--
-- Name: ProblemsApp_substep id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_substep" ALTER COLUMN id SET DEFAULT nextval('public."ProblemsApp_substep_id_seq"'::regclass);


--
-- Name: StudentsApp_student id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student" ALTER COLUMN id SET DEFAULT nextval('public."StudentsApp_student_id_seq"'::regclass);


--
-- Name: StudentsApp_student_school id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student_school" ALTER COLUMN id SET DEFAULT nextval('public."StudentsApp_student_school_id_seq"'::regclass);


--
-- Name: StudentsApp_studentproblem id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentproblem" ALTER COLUMN id SET DEFAULT nextval('public."StudentsApp_studentproblem_id_seq"'::regclass);


--
-- Name: StudentsApp_studentstep id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentstep" ALTER COLUMN id SET DEFAULT nextval('public."StudentsApp_studentstep_id_seq"'::regclass);


--
-- Name: SubjectsApp_subject_book id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_book" ALTER COLUMN id SET DEFAULT nextval('public."SubjectsApp_subject_book_id_seq"'::regclass);


--
-- Name: SubjectsApp_subject_chapter id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_chapter" ALTER COLUMN id SET DEFAULT nextval('public."SubjectsApp_subject_chapter_id_seq"'::regclass);


--
-- Name: SubjectsApp_subject_country id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_country" ALTER COLUMN id SET DEFAULT nextval('public."SubjectsApp_subject_country_id_seq"'::regclass);


--
-- Name: SubjectsApp_topic_chapter id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_chapter" ALTER COLUMN id SET DEFAULT nextval('public."SubjectsApp_topic_chapter_id_seq"'::regclass);


--
-- Name: SubjectsApp_topic_subject id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_subject" ALTER COLUMN id SET DEFAULT nextval('public."SubjectsApp_topic_subject_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: BooksApp_author; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_author" (id, first_name, last_name, email) FROM stdin;
1	Juan	Fiallo	jf@jf.com
2	Karla	Varela	kv@kv.com
3	Fabian	Suarez	fs@fs.com
\.


--
-- Data for Name: BooksApp_book; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_book" (id, book_title, publication_date, publisher_id) FROM stdin;
1	Math1	2018-07-09	1
2	Physics1	2018-06-11	2
\.


--
-- Data for Name: BooksApp_book_authors; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_book_authors" (id, book_id, author_id) FROM stdin;
1	1	1
2	1	2
3	2	2
4	2	3
\.


--
-- Data for Name: BooksApp_chapter; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_chapter" (id, chapter_number, chapter_name, book_id) FROM stdin;
1	1	Chapter 1	1
2	2	Chapter 2	1
3	3	Chapter 3	1
4	1	Chapter 1	2
5	2	Chapter 2	2
6	3	Chapter 3	2
7	4	Chapter 4	2
\.


--
-- Data for Name: BooksApp_publisher; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_publisher" (id, publisher_name, address, website) FROM stdin;
1	Pubmath	dir pub math	
2	Pub physics	pub physics address	
\.


--
-- Data for Name: BooksApp_publisher_city; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_publisher_city" (id, publisher_id, city_id) FROM stdin;
1	1	BOG
2	2	OSL
\.


--
-- Data for Name: BooksApp_publisher_country; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_publisher_country" (id, publisher_id, country_id) FROM stdin;
1	1	COL
2	2	NOR
\.


--
-- Data for Name: BooksApp_publisher_state_province; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."BooksApp_publisher_state_province" (id, publisher_id, state_id) FROM stdin;
1	1	BOG
2	2	OSL
\.


--
-- Data for Name: LocationApp_city; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."LocationApp_city" (city_id, city_name, city_country_id, city_state_id) FROM stdin;
BOG	Bogota	COL	BOG
OSL	Oslo	NOR	OSL
\.


--
-- Data for Name: LocationApp_country; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."LocationApp_country" (country_id, country_name) FROM stdin;
COL	Colombia
NOR	Norway
\.


--
-- Data for Name: LocationApp_state; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."LocationApp_state" (state_id, state_name, state_country_id) FROM stdin;
BOG	Bogota, D.C.	COL
OSL	Oslo	NOR
\.


--
-- Data for Name: ProblemsApp_problem; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."ProblemsApp_problem" (id, problem_name, text, template, number_of_numeral, topic_id_id) FROM stdin;
1	Equation of a line 1	line line line	{var1:[a,b,c],var2:'hola'}	5	EQ_LINE
\.


--
-- Data for Name: ProblemsApp_problemnumeral; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."ProblemsApp_problemnumeral" (id, numeral_name, numeral_number, question, number_of_steps, problem_id_id) FROM stdin;
1	Numeral 1	1	Question 1	1	1
2	Numeral 2	2	Question 2	3	1
3	Numeral 3	3	Question 3	2	1
4	Numeral 4	4	Question 4	1	1
5	Numeral 5	5	Question 5	3	1
\.


--
-- Data for Name: ProblemsApp_step; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."ProblemsApp_step" (id, step_name, step_number, explanation, video, instruction, number_of_substeps, problem_num_id_id) FROM stdin;
1	Step 1	1	Step 1	v	instruction	1	5
2	Step 2	2	Step 2	v	instruction	2	5
3	Step 3	3	Step 3	v	instruction	3	5
4	Step 1	1	Exp	v	ins	1	1
6	Step 1	1	Step 1	v	ins	3	2
7	Step 2	2	Step 2	v	ins	1	2
8	Step 3	3	Step 3	v	ins	0	2
9	Step 1	1	Step 1	v	ins	2	3
11	Step 1	1	exp	v	ins	1	4
10	Step 2	2	Step 2	v	ins	2	3
\.


--
-- Data for Name: ProblemsApp_substep; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."ProblemsApp_substep" (id, substep_name, substep_number, answer, hint, step_id_id) FROM stdin;
1	Substep	1	s	s	11
2	Substep 1	1	s	s	10
3	Substep 2	2	ss	s	10
\.


--
-- Data for Name: SchoolsApp_college; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SchoolsApp_college" (college_id, college_name, college_city_id, college_country_id, college_state_id) FROM stdin;
College1	College 1	OSL	NOR	OSL
\.


--
-- Data for Name: SchoolsApp_school; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SchoolsApp_school" (school_id, school_name, school_city_id, school_country_id, school_state_id) FROM stdin;
School1	School 1	BOG	COL	BOG
\.


--
-- Data for Name: SchoolsApp_university; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SchoolsApp_university" (university_id, university_name, university_city_id, university_country_id, university_state_id) FROM stdin;
Uni1	University 1	OSL	NOR	OSL
\.


--
-- Data for Name: StudentsApp_student; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."StudentsApp_student" (id, student_name, number_solved_problems, country_id) FROM stdin;
1	KV	2	COL
2	FS	2	NOR
\.


--
-- Data for Name: StudentsApp_student_school; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."StudentsApp_student_school" (id, student_id, school_id) FROM stdin;
1	1	School1
2	2	School1
\.


--
-- Data for Name: StudentsApp_studentproblem; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."StudentsApp_studentproblem" (id, succesful_attemps, fail_attemps, answer_file, problem_id_id, student_id_id) FROM stdin;
1	21	0	1	1	1
\.


--
-- Data for Name: StudentsApp_studentstep; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."StudentsApp_studentstep" (id, succesful_attemps, fail_attemps, number_of_substeps, numeral_id_id, problem_student_id_id, step_id_id) FROM stdin;
1	10	0	0	5	1	11
3	0	0	0	1	1	1
\.


--
-- Data for Name: SubjectsApp_subject; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_subject" (subject_id, subject_name, description, level) FROM stdin;
MATH101	Mathematics 101	Math 101	Secondary
PHY101	Physics 101	Physics 101	SH
MATH102	Mathematics 102	Math 102	SH
\.


--
-- Data for Name: SubjectsApp_subject_book; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_subject_book" (id, subject_id, book_id) FROM stdin;
1	MATH101	1
2	PHY101	2
3	MATH102	1
\.


--
-- Data for Name: SubjectsApp_subject_chapter; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_subject_chapter" (id, subject_id, chapter_id) FROM stdin;
1	MATH101	1
2	MATH101	2
3	MATH101	3
4	MATH101	4
5	PHY101	1
6	PHY101	2
7	PHY101	3
8	PHY101	4
9	PHY101	5
10	MATH102	1
11	MATH102	2
12	MATH102	3
13	MATH102	4
14	MATH102	5
15	MATH102	6
16	MATH102	7
\.


--
-- Data for Name: SubjectsApp_subject_country; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_subject_country" (id, subject_id, country_id) FROM stdin;
1	MATH101	COL
2	PHY101	NOR
3	MATH102	NOR
\.


--
-- Data for Name: SubjectsApp_topic; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_topic" (topic_id, topic_name, description) FROM stdin;
EQ_LINE	Equation of a line	Eq line
Integral	Integral 101	Integrals 101
FORCES_101	Forces 101	Forces 101
\.


--
-- Data for Name: SubjectsApp_topic_chapter; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_topic_chapter" (id, topic_id, chapter_id) FROM stdin;
1	EQ_LINE	1
2	Integral	4
3	FORCES_101	3
4	FORCES_101	4
5	FORCES_101	5
\.


--
-- Data for Name: SubjectsApp_topic_subject; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public."SubjectsApp_topic_subject" (id, topic_id, subject_id) FROM stdin;
1	EQ_LINE	MATH101
2	Integral	MATH102
3	FORCES_101	PHY101
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can add permission	2	add_permission
5	Can change permission	2	change_permission
6	Can delete permission	2	delete_permission
7	Can add group	3	add_group
8	Can change group	3	change_group
9	Can delete group	3	delete_group
10	Can add user	4	add_user
11	Can change user	4	change_user
12	Can delete user	4	delete_user
13	Can add content type	5	add_contenttype
14	Can change content type	5	change_contenttype
15	Can delete content type	5	delete_contenttype
16	Can add session	6	add_session
17	Can change session	6	change_session
18	Can delete session	6	delete_session
19	Can add country	7	add_country
20	Can change country	7	change_country
21	Can delete country	7	delete_country
22	Can add city	8	add_city
23	Can change city	8	change_city
24	Can delete city	8	delete_city
25	Can add state	9	add_state
26	Can change state	9	change_state
27	Can delete state	9	delete_state
28	Can add book	10	add_book
29	Can change book	10	change_book
30	Can delete book	10	delete_book
31	Can add author	11	add_author
32	Can change author	11	change_author
33	Can delete author	11	delete_author
34	Can add publisher	12	add_publisher
35	Can change publisher	12	change_publisher
36	Can delete publisher	12	delete_publisher
37	Can add chapter	13	add_chapter
38	Can change chapter	13	change_chapter
39	Can delete chapter	13	delete_chapter
40	Can add topic	14	add_topic
41	Can change topic	14	change_topic
42	Can delete topic	14	delete_topic
43	Can add subject	15	add_subject
44	Can change subject	15	change_subject
45	Can delete subject	15	delete_subject
46	Can add college	16	add_college
47	Can change college	16	change_college
48	Can delete college	16	delete_college
49	Can add university	17	add_university
50	Can change university	17	change_university
51	Can delete university	17	delete_university
52	Can add school	18	add_school
53	Can change school	18	change_school
54	Can delete school	18	delete_school
55	Can add problem	19	add_problem
56	Can change problem	19	change_problem
57	Can delete problem	19	delete_problem
58	Can add problem numeral	20	add_problemnumeral
59	Can change problem numeral	20	change_problemnumeral
60	Can delete problem numeral	20	delete_problemnumeral
61	Can add step	21	add_step
62	Can change step	21	change_step
63	Can delete step	21	delete_step
64	Can add substep	22	add_substep
65	Can change substep	22	change_substep
66	Can delete substep	22	delete_substep
67	Can add student	23	add_student
68	Can change student	23	change_student
69	Can delete student	23	delete_student
70	Can add student problem	24	add_studentproblem
71	Can change student problem	24	change_studentproblem
72	Can delete student problem	24	delete_studentproblem
73	Can add student step	25	add_studentstep
74	Can change student step	25	change_studentstep
75	Can delete student step	25	delete_studentstep
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$100000$xldHHjaEtkwb$GlrfpB77kr+b4Xa0OMkVlGGSLOPvwfaCT0PlySXZxLQ=	2018-07-31 08:12:19.473499-05	t	karla			kitty759@gmail.com	t	t	2018-07-12 20:33:11.671817-05
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2018-07-12 21:03:31.222207-05	COL	Colombia	1	[{"added": {}}]	7	1
2	2018-07-12 21:03:50.012399-05	BOG	Bogota, D.C.	1	[{"added": {}}]	9	1
3	2018-07-12 21:03:51.441058-05	BOG	Bogota	1	[{"added": {}}]	8	1
4	2018-07-12 21:04:08.91002-05	NOR	Norway	1	[{"added": {}}]	7	1
5	2018-07-12 21:04:17.673838-05	OSL	Oslo	1	[{"added": {}}]	9	1
6	2018-07-12 21:04:22.91672-05	OSL	Oslo	1	[{"added": {}}]	8	1
7	2018-07-12 21:18:58.663118-05	1	Juan Fiallo	1	[{"added": {}}]	11	1
8	2018-07-12 21:19:31.533163-05	1	Pubmath	1	[{"added": {}}]	12	1
9	2018-07-12 21:20:06.927743-05	1	Math1	1	[{"added": {}}, {"added": {"name": "chapter", "object": "Chapter object (1)"}}, {"added": {"name": "chapter", "object": "Chapter object (2)"}}, {"added": {"name": "chapter", "object": "Chapter object (3)"}}]	10	1
10	2018-07-12 21:20:10.624819-05	2	Karla Varela	1	[{"added": {}}, {"added": {"name": "book-author relationship", "object": "Book_authors object (2)"}}]	11	1
11	2018-07-12 21:20:55.15471-05	2	Pub physics	1	[{"added": {}}]	12	1
12	2018-07-12 21:21:22.03188-05	2	Physics1	1	[{"added": {}}, {"added": {"name": "chapter", "object": "Chapter object (4)"}}, {"added": {"name": "chapter", "object": "Chapter object (5)"}}, {"added": {"name": "chapter", "object": "Chapter object (6)"}}, {"added": {"name": "chapter", "object": "Chapter object (7)"}}]	10	1
13	2018-07-12 21:21:24.558855-05	3	Fabian Suarez	1	[{"added": {}}, {"added": {"name": "book-author relationship", "object": "Book_authors object (4)"}}]	11	1
14	2018-07-12 21:39:46.387667-05	MATH101	Mathematics 101	1	[{"added": {}}]	15	1
15	2018-07-12 21:40:14.438808-05	PHY101	Physics 101	1	[{"added": {}}]	15	1
16	2018-07-12 21:41:51.828868-05	MATH102	Mathematics 102	1	[{"added": {}}]	15	1
17	2018-07-12 21:42:18.775945-05	EQ_LINE	EQ_LINE: Equation of a line	1	[{"added": {}}]	14	1
18	2018-07-12 21:42:56.635358-05	Integral	Integral: Integral 101	1	[{"added": {}}]	14	1
19	2018-07-12 21:43:16.860821-05	FORCES_101	FORCES_101: Forces 101	1	[{"added": {}}]	14	1
20	2018-07-12 21:50:05.673322-05	College1	College 1	1	[{"added": {}}]	16	1
21	2018-07-12 21:50:22.676358-05	School1	School 1	1	[{"added": {}}]	18	1
22	2018-07-12 21:50:36.909091-05	Uni1	University 1	1	[{"added": {}}]	17	1
23	2018-07-12 22:58:55.584165-05	1	EQ_LINE: Equation of a line Equation of a line 1	1	[{"added": {}}, {"added": {"name": "problem numeral", "object": "ProblemNumeral object (1)"}}, {"added": {"name": "problem numeral", "object": "ProblemNumeral object (2)"}}, {"added": {"name": "problem numeral", "object": "ProblemNumeral object (3)"}}, {"added": {"name": "problem numeral", "object": "ProblemNumeral object (4)"}}, {"added": {"name": "problem numeral", "object": "ProblemNumeral object (5)"}}]	19	1
24	2018-07-12 23:00:07.961897-05	5	ProblemNumeral object (5)	2	[{"added": {"name": "step", "object": "Step object (1)"}}, {"added": {"name": "step", "object": "Step object (2)"}}, {"added": {"name": "step", "object": "Step object (3)"}}]	20	1
25	2018-07-12 23:00:38.237228-05	1	ProblemNumeral object (1)	2	[{"added": {"name": "step", "object": "Step object (4)"}}, {"added": {"name": "step", "object": "Step object (5)"}}]	20	1
26	2018-07-12 23:01:17.107029-05	2	ProblemNumeral object (2)	2	[{"added": {"name": "step", "object": "Step object (6)"}}, {"added": {"name": "step", "object": "Step object (7)"}}, {"added": {"name": "step", "object": "Step object (8)"}}]	20	1
27	2018-07-12 23:01:26.657674-05	1	ProblemNumeral object (1)	2	[{"deleted": {"name": "step", "object": "Step object (None)"}}]	20	1
28	2018-07-12 23:01:32.159276-05	2	ProblemNumeral object (2)	2	[]	20	1
29	2018-07-12 23:01:59.724579-05	3	ProblemNumeral object (3)	2	[{"added": {"name": "step", "object": "Step object (9)"}}, {"added": {"name": "step", "object": "Step object (10)"}}]	20	1
30	2018-07-12 23:02:19.588422-05	4	ProblemNumeral object (4)	2	[{"changed": {"fields": ["number_of_steps"]}}, {"added": {"name": "step", "object": "Step object (11)"}}]	20	1
31	2018-07-12 23:02:28.53861-05	5	ProblemNumeral object (5)	2	[{"changed": {"fields": ["number_of_steps"]}}]	20	1
32	2018-07-12 23:02:58.683344-05	11	Step object (11)	2	[{"changed": {"fields": ["number_of_substeps"]}}, {"added": {"name": "substep", "object": "Step object (11) 1"}}]	21	1
33	2018-07-12 23:03:17.997687-05	10	Step object (10)	2	[{"changed": {"fields": ["number_of_substeps"]}}, {"added": {"name": "substep", "object": "Step object (10) 1"}}, {"added": {"name": "substep", "object": "Step object (10) 2"}}]	21	1
34	2018-07-17 22:17:45.279369-05	1	EQ_LINE: Equation of a line Equation of a line 1	2	[]	19	1
35	2018-07-17 23:16:59.066578-05	1	KV	1	[{"added": {}}]	23	1
36	2018-07-17 23:17:08.059266-05	2	FS	1	[{"added": {}}]	23	1
37	2018-07-18 01:27:54.978258-05	6	Integral: Integral 101 problem test	3		19	1
38	2018-07-18 01:27:55.511082-05	2	EQ_LINE: Equation of a line problem test	3		19	1
39	2018-07-18 08:13:38.946483-05	11	Integral: Integral 101 problem test	3		19	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	LocationApp	country
8	LocationApp	city
9	LocationApp	state
10	BooksApp	book
11	BooksApp	author
12	BooksApp	publisher
13	BooksApp	chapter
14	SubjectsApp	topic
15	SubjectsApp	subject
16	SchoolsApp	college
17	SchoolsApp	university
18	SchoolsApp	school
19	ProblemsApp	problem
20	ProblemsApp	problemnumeral
21	ProblemsApp	step
22	ProblemsApp	substep
23	StudentsApp	student
24	StudentsApp	studentproblem
25	StudentsApp	studentstep
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2018-07-12 20:01:40.438869-05
2	auth	0001_initial	2018-07-12 20:01:40.950451-05
3	admin	0001_initial	2018-07-12 20:01:41.018625-05
4	admin	0002_logentry_remove_auto_add	2018-07-12 20:01:41.030262-05
5	contenttypes	0002_remove_content_type_name	2018-07-12 20:01:41.072239-05
6	auth	0002_alter_permission_name_max_length	2018-07-12 20:01:41.078876-05
7	auth	0003_alter_user_email_max_length	2018-07-12 20:01:41.091593-05
8	auth	0004_alter_user_username_opts	2018-07-12 20:01:41.101197-05
9	auth	0005_alter_user_last_login_null	2018-07-12 20:01:41.118201-05
10	auth	0006_require_contenttypes_0002	2018-07-12 20:01:41.119959-05
11	auth	0007_alter_validators_add_error_messages	2018-07-12 20:01:41.13034-05
12	auth	0008_alter_user_username_max_length	2018-07-12 20:01:41.231064-05
13	auth	0009_alter_user_last_name_max_length	2018-07-12 20:01:41.244334-05
14	sessions	0001_initial	2018-07-12 20:01:41.253899-05
15	LocationApp	0001_initial	2018-07-12 21:00:51.215369-05
16	BooksApp	0001_initial	2018-07-12 21:11:04.040551-05
17	SubjectsApp	0001_initial	2018-07-12 21:36:49.620302-05
18	SchoolsApp	0001_initial	2018-07-12 21:49:03.745488-05
19	ProblemsApp	0001_initial	2018-07-12 22:56:23.189238-05
20	StudentsApp	0001_initial	2018-07-12 22:56:23.437937-05
21	SubjectsApp	0002_auto_20180718_0314	2018-07-17 22:14:42.772298-05
22	ProblemsApp	0002_auto_20180718_0314	2018-07-17 22:16:19.815462-05
23	ProblemsApp	0003_auto_20180718_0316	2018-07-17 22:16:19.817885-05
24	ProblemsApp	0004_remove_problem_date_prob_creation	2018-07-17 22:17:26.910319-05
25	ProblemsApp	0005_problem_date_prob_creation	2018-07-17 22:18:41.888735-05
26	ProblemsApp	0006_auto_20180718_0319	2018-07-17 22:20:04.901989-05
27	ProblemsApp	0007_auto_20180718_0319	2018-07-17 22:20:04.905291-05
28	ProblemsApp	0008_remove_problem_date_prob_creation	2018-07-17 22:20:35.920602-05
29	StudentsApp	0002_auto_20180718_0455	2018-07-17 23:55:41.609391-05
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: karla
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
2v859jh1kvywaav1wmk3c5ihsxzjlyk9	Y2JlNzNlZmZkOGVjYWM1YTA4OGQ2Yzc0YjU5Y2Q2MTQ4MzFlYTFiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDg2YmJmMDI1M2UxMjExY2E0YTRhYmNiYzY1ZjdjNWRjNGZkZDcyIn0=	2018-07-26 20:33:21.327531-05
cimez3yth6odnteayqixaufpauwv0idg	Y2JlNzNlZmZkOGVjYWM1YTA4OGQ2Yzc0YjU5Y2Q2MTQ4MzFlYTFiNjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiIyNDg2YmJmMDI1M2UxMjExY2E0YTRhYmNiYzY1ZjdjNWRjNGZkZDcyIn0=	2018-08-14 08:12:19.711106-05
\.


--
-- Name: BooksApp_author_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_author_id_seq"', 3, true);


--
-- Name: BooksApp_book_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_book_authors_id_seq"', 4, true);


--
-- Name: BooksApp_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_book_id_seq"', 2, true);


--
-- Name: BooksApp_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_chapter_id_seq"', 7, true);


--
-- Name: BooksApp_publisher_city_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_publisher_city_id_seq"', 2, true);


--
-- Name: BooksApp_publisher_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_publisher_country_id_seq"', 2, true);


--
-- Name: BooksApp_publisher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_publisher_id_seq"', 2, true);


--
-- Name: BooksApp_publisher_state_province_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."BooksApp_publisher_state_province_id_seq"', 2, true);


--
-- Name: ProblemsApp_problem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."ProblemsApp_problem_id_seq"', 12, true);


--
-- Name: ProblemsApp_problemnumeral_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."ProblemsApp_problemnumeral_id_seq"', 5, true);


--
-- Name: ProblemsApp_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."ProblemsApp_step_id_seq"', 11, true);


--
-- Name: ProblemsApp_substep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."ProblemsApp_substep_id_seq"', 3, true);


--
-- Name: StudentsApp_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."StudentsApp_student_id_seq"', 2, true);


--
-- Name: StudentsApp_student_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."StudentsApp_student_school_id_seq"', 2, true);


--
-- Name: StudentsApp_studentproblem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."StudentsApp_studentproblem_id_seq"', 2, true);


--
-- Name: StudentsApp_studentstep_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."StudentsApp_studentstep_id_seq"', 3, true);


--
-- Name: SubjectsApp_subject_book_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."SubjectsApp_subject_book_id_seq"', 3, true);


--
-- Name: SubjectsApp_subject_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."SubjectsApp_subject_chapter_id_seq"', 16, true);


--
-- Name: SubjectsApp_subject_country_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."SubjectsApp_subject_country_id_seq"', 3, true);


--
-- Name: SubjectsApp_topic_chapter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."SubjectsApp_topic_chapter_id_seq"', 5, true);


--
-- Name: SubjectsApp_topic_subject_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public."SubjectsApp_topic_subject_id_seq"', 3, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 75, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 39, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 25, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: karla
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 29, true);


--
-- Name: BooksApp_author BooksApp_author_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_author"
    ADD CONSTRAINT "BooksApp_author_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_book_authors BooksApp_book_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book_authors"
    ADD CONSTRAINT "BooksApp_book_authors_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_book BooksApp_book_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book"
    ADD CONSTRAINT "BooksApp_book_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_chapter BooksApp_chapter_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_chapter"
    ADD CONSTRAINT "BooksApp_chapter_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_publisher_city BooksApp_publisher_city_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_city"
    ADD CONSTRAINT "BooksApp_publisher_city_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_publisher_country BooksApp_publisher_country_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_country"
    ADD CONSTRAINT "BooksApp_publisher_country_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_publisher BooksApp_publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher"
    ADD CONSTRAINT "BooksApp_publisher_pkey" PRIMARY KEY (id);


--
-- Name: BooksApp_publisher_state_province BooksApp_publisher_state_province_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_state_province"
    ADD CONSTRAINT "BooksApp_publisher_state_province_pkey" PRIMARY KEY (id);


--
-- Name: LocationApp_city LocationApp_city_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."LocationApp_city"
    ADD CONSTRAINT "LocationApp_city_pkey" PRIMARY KEY (city_id);


--
-- Name: LocationApp_country LocationApp_country_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."LocationApp_country"
    ADD CONSTRAINT "LocationApp_country_pkey" PRIMARY KEY (country_id);


--
-- Name: LocationApp_state LocationApp_state_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."LocationApp_state"
    ADD CONSTRAINT "LocationApp_state_pkey" PRIMARY KEY (state_id);


--
-- Name: ProblemsApp_problem ProblemsApp_problem_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problem"
    ADD CONSTRAINT "ProblemsApp_problem_pkey" PRIMARY KEY (id);


--
-- Name: ProblemsApp_problemnumeral ProblemsApp_problemnumeral_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problemnumeral"
    ADD CONSTRAINT "ProblemsApp_problemnumeral_pkey" PRIMARY KEY (id);


--
-- Name: ProblemsApp_step ProblemsApp_step_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_step"
    ADD CONSTRAINT "ProblemsApp_step_pkey" PRIMARY KEY (id);


--
-- Name: ProblemsApp_substep ProblemsApp_substep_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_substep"
    ADD CONSTRAINT "ProblemsApp_substep_pkey" PRIMARY KEY (id);


--
-- Name: SchoolsApp_college SchoolsApp_college_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_college"
    ADD CONSTRAINT "SchoolsApp_college_pkey" PRIMARY KEY (college_id);


--
-- Name: SchoolsApp_school SchoolsApp_school_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_school"
    ADD CONSTRAINT "SchoolsApp_school_pkey" PRIMARY KEY (school_id);


--
-- Name: SchoolsApp_university SchoolsApp_university_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_university"
    ADD CONSTRAINT "SchoolsApp_university_pkey" PRIMARY KEY (university_id);


--
-- Name: StudentsApp_student StudentsApp_student_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student"
    ADD CONSTRAINT "StudentsApp_student_pkey" PRIMARY KEY (id);


--
-- Name: StudentsApp_student_school StudentsApp_student_school_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student_school"
    ADD CONSTRAINT "StudentsApp_student_school_pkey" PRIMARY KEY (id);


--
-- Name: StudentsApp_studentproblem StudentsApp_studentproblem_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentproblem"
    ADD CONSTRAINT "StudentsApp_studentproblem_pkey" PRIMARY KEY (id);


--
-- Name: StudentsApp_studentstep StudentsApp_studentstep_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentstep"
    ADD CONSTRAINT "StudentsApp_studentstep_pkey" PRIMARY KEY (id);


--
-- Name: SubjectsApp_subject_book SubjectsApp_subject_book_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_book"
    ADD CONSTRAINT "SubjectsApp_subject_book_pkey" PRIMARY KEY (id);


--
-- Name: SubjectsApp_subject_chapter SubjectsApp_subject_chapter_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_chapter"
    ADD CONSTRAINT "SubjectsApp_subject_chapter_pkey" PRIMARY KEY (id);


--
-- Name: SubjectsApp_subject_country SubjectsApp_subject_country_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_country"
    ADD CONSTRAINT "SubjectsApp_subject_country_pkey" PRIMARY KEY (id);


--
-- Name: SubjectsApp_subject SubjectsApp_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject"
    ADD CONSTRAINT "SubjectsApp_subject_pkey" PRIMARY KEY (subject_id);


--
-- Name: SubjectsApp_topic_chapter SubjectsApp_topic_chapter_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_chapter"
    ADD CONSTRAINT "SubjectsApp_topic_chapter_pkey" PRIMARY KEY (id);


--
-- Name: SubjectsApp_topic SubjectsApp_topic_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic"
    ADD CONSTRAINT "SubjectsApp_topic_pkey" PRIMARY KEY (topic_id);


--
-- Name: SubjectsApp_topic_subject SubjectsApp_topic_subject_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_subject"
    ADD CONSTRAINT "SubjectsApp_topic_subject_pkey" PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: BooksApp_book_authors booksapp_book_authors_book_id_author_id_59e5d88f_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book_authors"
    ADD CONSTRAINT booksapp_book_authors_book_id_author_id_59e5d88f_uniq UNIQUE (book_id, author_id);


--
-- Name: BooksApp_publisher_city booksapp_publisher_city_publisher_id_city_id_c466456b_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_city"
    ADD CONSTRAINT booksapp_publisher_city_publisher_id_city_id_c466456b_uniq UNIQUE (publisher_id, city_id);


--
-- Name: BooksApp_publisher_country booksapp_publisher_count_publisher_id_country_id_87e9b562_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_country"
    ADD CONSTRAINT booksapp_publisher_count_publisher_id_country_id_87e9b562_uniq UNIQUE (publisher_id, country_id);


--
-- Name: BooksApp_publisher_state_province booksapp_publisher_state_publisher_id_state_id_cb2acc0b_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_state_province"
    ADD CONSTRAINT booksapp_publisher_state_publisher_id_state_id_cb2acc0b_uniq UNIQUE (publisher_id, state_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ProblemsApp_problem problemsapp_problem_topic_id_id_problem_name_79864780_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problem"
    ADD CONSTRAINT problemsapp_problem_topic_id_id_problem_name_79864780_uniq UNIQUE (topic_id_id, problem_name);


--
-- Name: ProblemsApp_problemnumeral problemsapp_problemnumer_problem_id_id_numeral_nu_59a3105c_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problemnumeral"
    ADD CONSTRAINT problemsapp_problemnumer_problem_id_id_numeral_nu_59a3105c_uniq UNIQUE (problem_id_id, numeral_number);


--
-- Name: ProblemsApp_step problemsapp_step_problem_num_id_id_step_number_f1e838c4_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_step"
    ADD CONSTRAINT problemsapp_step_problem_num_id_id_step_number_f1e838c4_uniq UNIQUE (problem_num_id_id, step_number);


--
-- Name: ProblemsApp_substep problemsapp_substep_step_id_id_substep_number_5ba9d035_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_substep"
    ADD CONSTRAINT problemsapp_substep_step_id_id_substep_number_5ba9d035_uniq UNIQUE (step_id_id, substep_number);


--
-- Name: StudentsApp_student_school studentsapp_student_school_student_id_school_id_70d0506d_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student_school"
    ADD CONSTRAINT studentsapp_student_school_student_id_school_id_70d0506d_uniq UNIQUE (student_id, school_id);


--
-- Name: StudentsApp_studentproblem studentsapp_studentprobl_student_id_id_problem_id_8a076dcf_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentproblem"
    ADD CONSTRAINT studentsapp_studentprobl_student_id_id_problem_id_8a076dcf_uniq UNIQUE (student_id_id, problem_id_id);


--
-- Name: StudentsApp_studentstep studentsapp_studentstep_problem_student_id_id_nu_8be07a89_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentstep"
    ADD CONSTRAINT studentsapp_studentstep_problem_student_id_id_nu_8be07a89_uniq UNIQUE (problem_student_id_id, numeral_id_id, step_id_id);


--
-- Name: SubjectsApp_subject_book subjectsapp_subject_book_subject_id_book_id_ec6a4960_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_book"
    ADD CONSTRAINT subjectsapp_subject_book_subject_id_book_id_ec6a4960_uniq UNIQUE (subject_id, book_id);


--
-- Name: SubjectsApp_subject_chapter subjectsapp_subject_chapter_subject_id_chapter_id_4f97b405_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_chapter"
    ADD CONSTRAINT subjectsapp_subject_chapter_subject_id_chapter_id_4f97b405_uniq UNIQUE (subject_id, chapter_id);


--
-- Name: SubjectsApp_subject_country subjectsapp_subject_country_subject_id_country_id_f8ce6951_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_country"
    ADD CONSTRAINT subjectsapp_subject_country_subject_id_country_id_f8ce6951_uniq UNIQUE (subject_id, country_id);


--
-- Name: SubjectsApp_topic_chapter subjectsapp_topic_chapter_topic_id_chapter_id_d70d52f8_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_chapter"
    ADD CONSTRAINT subjectsapp_topic_chapter_topic_id_chapter_id_d70d52f8_uniq UNIQUE (topic_id, chapter_id);


--
-- Name: SubjectsApp_topic_subject subjectsapp_topic_subject_topic_id_subject_id_f1f799e1_uniq; Type: CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_subject"
    ADD CONSTRAINT subjectsapp_topic_subject_topic_id_subject_id_f1f799e1_uniq UNIQUE (topic_id, subject_id);


--
-- Name: BooksApp_book_authors_author_id_11b77220; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_book_authors_author_id_11b77220" ON public."BooksApp_book_authors" USING btree (author_id);


--
-- Name: BooksApp_book_authors_book_id_eab932f0; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_book_authors_book_id_eab932f0" ON public."BooksApp_book_authors" USING btree (book_id);


--
-- Name: BooksApp_book_publisher_id_9356053b; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_book_publisher_id_9356053b" ON public."BooksApp_book" USING btree (publisher_id);


--
-- Name: BooksApp_chapter_book_id_60ac8a02; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_chapter_book_id_60ac8a02" ON public."BooksApp_chapter" USING btree (book_id);


--
-- Name: BooksApp_publisher_city_city_id_4bfdcfb2; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_city_city_id_4bfdcfb2" ON public."BooksApp_publisher_city" USING btree (city_id);


--
-- Name: BooksApp_publisher_city_city_id_4bfdcfb2_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_city_city_id_4bfdcfb2_like" ON public."BooksApp_publisher_city" USING btree (city_id varchar_pattern_ops);


--
-- Name: BooksApp_publisher_city_publisher_id_3fdf8e06; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_city_publisher_id_3fdf8e06" ON public."BooksApp_publisher_city" USING btree (publisher_id);


--
-- Name: BooksApp_publisher_country_country_id_c1ecbc7f; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_country_country_id_c1ecbc7f" ON public."BooksApp_publisher_country" USING btree (country_id);


--
-- Name: BooksApp_publisher_country_country_id_c1ecbc7f_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_country_country_id_c1ecbc7f_like" ON public."BooksApp_publisher_country" USING btree (country_id varchar_pattern_ops);


--
-- Name: BooksApp_publisher_country_publisher_id_c293cc6b; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_country_publisher_id_c293cc6b" ON public."BooksApp_publisher_country" USING btree (publisher_id);


--
-- Name: BooksApp_publisher_state_province_publisher_id_c887ddbf; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_state_province_publisher_id_c887ddbf" ON public."BooksApp_publisher_state_province" USING btree (publisher_id);


--
-- Name: BooksApp_publisher_state_province_state_id_c57fc53e; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_state_province_state_id_c57fc53e" ON public."BooksApp_publisher_state_province" USING btree (state_id);


--
-- Name: BooksApp_publisher_state_province_state_id_c57fc53e_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "BooksApp_publisher_state_province_state_id_c57fc53e_like" ON public."BooksApp_publisher_state_province" USING btree (state_id varchar_pattern_ops);


--
-- Name: LocationApp_city_city_country_id_c50dff4f; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_city_city_country_id_c50dff4f" ON public."LocationApp_city" USING btree (city_country_id);


--
-- Name: LocationApp_city_city_country_id_c50dff4f_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_city_city_country_id_c50dff4f_like" ON public."LocationApp_city" USING btree (city_country_id varchar_pattern_ops);


--
-- Name: LocationApp_city_city_id_f5184f22_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_city_city_id_f5184f22_like" ON public."LocationApp_city" USING btree (city_id varchar_pattern_ops);


--
-- Name: LocationApp_city_city_state_id_89e34406; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_city_city_state_id_89e34406" ON public."LocationApp_city" USING btree (city_state_id);


--
-- Name: LocationApp_city_city_state_id_89e34406_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_city_city_state_id_89e34406_like" ON public."LocationApp_city" USING btree (city_state_id varchar_pattern_ops);


--
-- Name: LocationApp_country_country_id_445cadb4_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_country_country_id_445cadb4_like" ON public."LocationApp_country" USING btree (country_id varchar_pattern_ops);


--
-- Name: LocationApp_state_state_country_id_af9fde8b; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_state_state_country_id_af9fde8b" ON public."LocationApp_state" USING btree (state_country_id);


--
-- Name: LocationApp_state_state_country_id_af9fde8b_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_state_state_country_id_af9fde8b_like" ON public."LocationApp_state" USING btree (state_country_id varchar_pattern_ops);


--
-- Name: LocationApp_state_state_id_e979201f_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "LocationApp_state_state_id_e979201f_like" ON public."LocationApp_state" USING btree (state_id varchar_pattern_ops);


--
-- Name: ProblemsApp_problem_topic_id_id_01248468; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "ProblemsApp_problem_topic_id_id_01248468" ON public."ProblemsApp_problem" USING btree (topic_id_id);


--
-- Name: ProblemsApp_problem_topic_id_id_01248468_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "ProblemsApp_problem_topic_id_id_01248468_like" ON public."ProblemsApp_problem" USING btree (topic_id_id varchar_pattern_ops);


--
-- Name: ProblemsApp_problemnumeral_problem_id_id_3c4195f4; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "ProblemsApp_problemnumeral_problem_id_id_3c4195f4" ON public."ProblemsApp_problemnumeral" USING btree (problem_id_id);


--
-- Name: ProblemsApp_step_problem_num_id_id_eb29dc2f; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "ProblemsApp_step_problem_num_id_id_eb29dc2f" ON public."ProblemsApp_step" USING btree (problem_num_id_id);


--
-- Name: ProblemsApp_substep_step_id_id_a1d157e1; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "ProblemsApp_substep_step_id_id_a1d157e1" ON public."ProblemsApp_substep" USING btree (step_id_id);


--
-- Name: SchoolsApp_college_college_city_id_76646b4e; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_city_id_76646b4e" ON public."SchoolsApp_college" USING btree (college_city_id);


--
-- Name: SchoolsApp_college_college_city_id_76646b4e_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_city_id_76646b4e_like" ON public."SchoolsApp_college" USING btree (college_city_id varchar_pattern_ops);


--
-- Name: SchoolsApp_college_college_country_id_1fb82605; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_country_id_1fb82605" ON public."SchoolsApp_college" USING btree (college_country_id);


--
-- Name: SchoolsApp_college_college_country_id_1fb82605_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_country_id_1fb82605_like" ON public."SchoolsApp_college" USING btree (college_country_id varchar_pattern_ops);


--
-- Name: SchoolsApp_college_college_id_2ce02e65_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_id_2ce02e65_like" ON public."SchoolsApp_college" USING btree (college_id varchar_pattern_ops);


--
-- Name: SchoolsApp_college_college_state_id_c39defba; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_state_id_c39defba" ON public."SchoolsApp_college" USING btree (college_state_id);


--
-- Name: SchoolsApp_college_college_state_id_c39defba_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_college_college_state_id_c39defba_like" ON public."SchoolsApp_college" USING btree (college_state_id varchar_pattern_ops);


--
-- Name: SchoolsApp_school_school_city_id_c2266ef4; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_city_id_c2266ef4" ON public."SchoolsApp_school" USING btree (school_city_id);


--
-- Name: SchoolsApp_school_school_city_id_c2266ef4_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_city_id_c2266ef4_like" ON public."SchoolsApp_school" USING btree (school_city_id varchar_pattern_ops);


--
-- Name: SchoolsApp_school_school_country_id_5f602234; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_country_id_5f602234" ON public."SchoolsApp_school" USING btree (school_country_id);


--
-- Name: SchoolsApp_school_school_country_id_5f602234_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_country_id_5f602234_like" ON public."SchoolsApp_school" USING btree (school_country_id varchar_pattern_ops);


--
-- Name: SchoolsApp_school_school_id_a8d3e4d8_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_id_a8d3e4d8_like" ON public."SchoolsApp_school" USING btree (school_id varchar_pattern_ops);


--
-- Name: SchoolsApp_school_school_state_id_fdb3f621; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_state_id_fdb3f621" ON public."SchoolsApp_school" USING btree (school_state_id);


--
-- Name: SchoolsApp_school_school_state_id_fdb3f621_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_school_school_state_id_fdb3f621_like" ON public."SchoolsApp_school" USING btree (school_state_id varchar_pattern_ops);


--
-- Name: SchoolsApp_university_university_city_id_0454db49; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_city_id_0454db49" ON public."SchoolsApp_university" USING btree (university_city_id);


--
-- Name: SchoolsApp_university_university_city_id_0454db49_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_city_id_0454db49_like" ON public."SchoolsApp_university" USING btree (university_city_id varchar_pattern_ops);


--
-- Name: SchoolsApp_university_university_country_id_85cde823; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_country_id_85cde823" ON public."SchoolsApp_university" USING btree (university_country_id);


--
-- Name: SchoolsApp_university_university_country_id_85cde823_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_country_id_85cde823_like" ON public."SchoolsApp_university" USING btree (university_country_id varchar_pattern_ops);


--
-- Name: SchoolsApp_university_university_id_15fc0e11_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_id_15fc0e11_like" ON public."SchoolsApp_university" USING btree (university_id varchar_pattern_ops);


--
-- Name: SchoolsApp_university_university_state_id_4530b282; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_state_id_4530b282" ON public."SchoolsApp_university" USING btree (university_state_id);


--
-- Name: SchoolsApp_university_university_state_id_4530b282_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SchoolsApp_university_university_state_id_4530b282_like" ON public."SchoolsApp_university" USING btree (university_state_id varchar_pattern_ops);


--
-- Name: StudentsApp_student_country_id_91caf937; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_student_country_id_91caf937" ON public."StudentsApp_student" USING btree (country_id);


--
-- Name: StudentsApp_student_country_id_91caf937_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_student_country_id_91caf937_like" ON public."StudentsApp_student" USING btree (country_id varchar_pattern_ops);


--
-- Name: StudentsApp_student_school_school_id_0ae04d37; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_student_school_school_id_0ae04d37" ON public."StudentsApp_student_school" USING btree (school_id);


--
-- Name: StudentsApp_student_school_school_id_0ae04d37_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_student_school_school_id_0ae04d37_like" ON public."StudentsApp_student_school" USING btree (school_id varchar_pattern_ops);


--
-- Name: StudentsApp_student_school_student_id_28441115; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_student_school_student_id_28441115" ON public."StudentsApp_student_school" USING btree (student_id);


--
-- Name: StudentsApp_studentproblem_problem_id_id_6a88c71d; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_studentproblem_problem_id_id_6a88c71d" ON public."StudentsApp_studentproblem" USING btree (problem_id_id);


--
-- Name: StudentsApp_studentproblem_student_id_id_e0215942; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_studentproblem_student_id_id_e0215942" ON public."StudentsApp_studentproblem" USING btree (student_id_id);


--
-- Name: StudentsApp_studentstep_numeral_id_id_0f66af41; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_studentstep_numeral_id_id_0f66af41" ON public."StudentsApp_studentstep" USING btree (numeral_id_id);


--
-- Name: StudentsApp_studentstep_problem_student_id_id_f06567a0; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_studentstep_problem_student_id_id_f06567a0" ON public."StudentsApp_studentstep" USING btree (problem_student_id_id);


--
-- Name: StudentsApp_studentstep_step_id_id_8ae13bfb; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "StudentsApp_studentstep_step_id_id_8ae13bfb" ON public."StudentsApp_studentstep" USING btree (step_id_id);


--
-- Name: SubjectsApp_subject_book_book_id_dbe16e51; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_book_book_id_dbe16e51" ON public."SubjectsApp_subject_book" USING btree (book_id);


--
-- Name: SubjectsApp_subject_book_subject_id_09125134; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_book_subject_id_09125134" ON public."SubjectsApp_subject_book" USING btree (subject_id);


--
-- Name: SubjectsApp_subject_book_subject_id_09125134_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_book_subject_id_09125134_like" ON public."SubjectsApp_subject_book" USING btree (subject_id varchar_pattern_ops);


--
-- Name: SubjectsApp_subject_chapter_chapter_id_044882fc; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_chapter_chapter_id_044882fc" ON public."SubjectsApp_subject_chapter" USING btree (chapter_id);


--
-- Name: SubjectsApp_subject_chapter_subject_id_48d4f583; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_chapter_subject_id_48d4f583" ON public."SubjectsApp_subject_chapter" USING btree (subject_id);


--
-- Name: SubjectsApp_subject_chapter_subject_id_48d4f583_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_chapter_subject_id_48d4f583_like" ON public."SubjectsApp_subject_chapter" USING btree (subject_id varchar_pattern_ops);


--
-- Name: SubjectsApp_subject_country_country_id_abc19369; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_country_country_id_abc19369" ON public."SubjectsApp_subject_country" USING btree (country_id);


--
-- Name: SubjectsApp_subject_country_country_id_abc19369_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_country_country_id_abc19369_like" ON public."SubjectsApp_subject_country" USING btree (country_id varchar_pattern_ops);


--
-- Name: SubjectsApp_subject_country_subject_id_526c1f7e; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_country_subject_id_526c1f7e" ON public."SubjectsApp_subject_country" USING btree (subject_id);


--
-- Name: SubjectsApp_subject_country_subject_id_526c1f7e_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_country_subject_id_526c1f7e_like" ON public."SubjectsApp_subject_country" USING btree (subject_id varchar_pattern_ops);


--
-- Name: SubjectsApp_subject_subject_id_ec88c09a_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_subject_subject_id_ec88c09a_like" ON public."SubjectsApp_subject" USING btree (subject_id varchar_pattern_ops);


--
-- Name: SubjectsApp_topic_chapter_chapter_id_598dd0a3; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_chapter_chapter_id_598dd0a3" ON public."SubjectsApp_topic_chapter" USING btree (chapter_id);


--
-- Name: SubjectsApp_topic_chapter_topic_id_f9c72f70; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_chapter_topic_id_f9c72f70" ON public."SubjectsApp_topic_chapter" USING btree (topic_id);


--
-- Name: SubjectsApp_topic_chapter_topic_id_f9c72f70_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_chapter_topic_id_f9c72f70_like" ON public."SubjectsApp_topic_chapter" USING btree (topic_id varchar_pattern_ops);


--
-- Name: SubjectsApp_topic_subject_subject_id_7570eb11; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_subject_subject_id_7570eb11" ON public."SubjectsApp_topic_subject" USING btree (subject_id);


--
-- Name: SubjectsApp_topic_subject_subject_id_7570eb11_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_subject_subject_id_7570eb11_like" ON public."SubjectsApp_topic_subject" USING btree (subject_id varchar_pattern_ops);


--
-- Name: SubjectsApp_topic_subject_topic_id_05f0e59c; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_subject_topic_id_05f0e59c" ON public."SubjectsApp_topic_subject" USING btree (topic_id);


--
-- Name: SubjectsApp_topic_subject_topic_id_05f0e59c_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_subject_topic_id_05f0e59c_like" ON public."SubjectsApp_topic_subject" USING btree (topic_id varchar_pattern_ops);


--
-- Name: SubjectsApp_topic_topic_id_e1acf6d3_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX "SubjectsApp_topic_topic_id_e1acf6d3_like" ON public."SubjectsApp_topic" USING btree (topic_id varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: karla
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: BooksApp_book_authors BooksApp_book_authors_author_id_11b77220_fk_BooksApp_author_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book_authors"
    ADD CONSTRAINT "BooksApp_book_authors_author_id_11b77220_fk_BooksApp_author_id" FOREIGN KEY (author_id) REFERENCES public."BooksApp_author"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_book_authors BooksApp_book_authors_book_id_eab932f0_fk_BooksApp_book_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book_authors"
    ADD CONSTRAINT "BooksApp_book_authors_book_id_eab932f0_fk_BooksApp_book_id" FOREIGN KEY (book_id) REFERENCES public."BooksApp_book"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_book BooksApp_book_publisher_id_9356053b_fk_BooksApp_publisher_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_book"
    ADD CONSTRAINT "BooksApp_book_publisher_id_9356053b_fk_BooksApp_publisher_id" FOREIGN KEY (publisher_id) REFERENCES public."BooksApp_publisher"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_chapter BooksApp_chapter_book_id_60ac8a02_fk_BooksApp_book_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_chapter"
    ADD CONSTRAINT "BooksApp_chapter_book_id_60ac8a02_fk_BooksApp_book_id" FOREIGN KEY (book_id) REFERENCES public."BooksApp_book"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_publisher_city BooksApp_publisher_c_city_id_4bfdcfb2_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_city"
    ADD CONSTRAINT "BooksApp_publisher_c_city_id_4bfdcfb2_fk_LocationA" FOREIGN KEY (city_id) REFERENCES public."LocationApp_city"(city_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_publisher_country BooksApp_publisher_c_country_id_c1ecbc7f_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_country"
    ADD CONSTRAINT "BooksApp_publisher_c_country_id_c1ecbc7f_fk_LocationA" FOREIGN KEY (country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_publisher_city BooksApp_publisher_c_publisher_id_3fdf8e06_fk_BooksApp_; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_city"
    ADD CONSTRAINT "BooksApp_publisher_c_publisher_id_3fdf8e06_fk_BooksApp_" FOREIGN KEY (publisher_id) REFERENCES public."BooksApp_publisher"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_publisher_country BooksApp_publisher_c_publisher_id_c293cc6b_fk_BooksApp_; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_country"
    ADD CONSTRAINT "BooksApp_publisher_c_publisher_id_c293cc6b_fk_BooksApp_" FOREIGN KEY (publisher_id) REFERENCES public."BooksApp_publisher"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_publisher_state_province BooksApp_publisher_s_publisher_id_c887ddbf_fk_BooksApp_; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_state_province"
    ADD CONSTRAINT "BooksApp_publisher_s_publisher_id_c887ddbf_fk_BooksApp_" FOREIGN KEY (publisher_id) REFERENCES public."BooksApp_publisher"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: BooksApp_publisher_state_province BooksApp_publisher_s_state_id_c57fc53e_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."BooksApp_publisher_state_province"
    ADD CONSTRAINT "BooksApp_publisher_s_state_id_c57fc53e_fk_LocationA" FOREIGN KEY (state_id) REFERENCES public."LocationApp_state"(state_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: LocationApp_city LocationApp_city_city_country_id_c50dff4f_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."LocationApp_city"
    ADD CONSTRAINT "LocationApp_city_city_country_id_c50dff4f_fk_LocationA" FOREIGN KEY (city_country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: LocationApp_city LocationApp_city_city_state_id_89e34406_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."LocationApp_city"
    ADD CONSTRAINT "LocationApp_city_city_state_id_89e34406_fk_LocationA" FOREIGN KEY (city_state_id) REFERENCES public."LocationApp_state"(state_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: LocationApp_state LocationApp_state_state_country_id_af9fde8b_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."LocationApp_state"
    ADD CONSTRAINT "LocationApp_state_state_country_id_af9fde8b_fk_LocationA" FOREIGN KEY (state_country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ProblemsApp_problem ProblemsApp_problem_topic_id_id_01248468_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problem"
    ADD CONSTRAINT "ProblemsApp_problem_topic_id_id_01248468_fk_SubjectsA" FOREIGN KEY (topic_id_id) REFERENCES public."SubjectsApp_topic"(topic_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ProblemsApp_problemnumeral ProblemsApp_problemn_problem_id_id_3c4195f4_fk_ProblemsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_problemnumeral"
    ADD CONSTRAINT "ProblemsApp_problemn_problem_id_id_3c4195f4_fk_ProblemsA" FOREIGN KEY (problem_id_id) REFERENCES public."ProblemsApp_problem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ProblemsApp_step ProblemsApp_step_problem_num_id_id_eb29dc2f_fk_ProblemsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_step"
    ADD CONSTRAINT "ProblemsApp_step_problem_num_id_id_eb29dc2f_fk_ProblemsA" FOREIGN KEY (problem_num_id_id) REFERENCES public."ProblemsApp_problemnumeral"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ProblemsApp_substep ProblemsApp_substep_step_id_id_a1d157e1_fk_ProblemsApp_step_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."ProblemsApp_substep"
    ADD CONSTRAINT "ProblemsApp_substep_step_id_id_a1d157e1_fk_ProblemsApp_step_id" FOREIGN KEY (step_id_id) REFERENCES public."ProblemsApp_step"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_college SchoolsApp_college_college_city_id_76646b4e_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_college"
    ADD CONSTRAINT "SchoolsApp_college_college_city_id_76646b4e_fk_LocationA" FOREIGN KEY (college_city_id) REFERENCES public."LocationApp_city"(city_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_college SchoolsApp_college_college_country_id_1fb82605_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_college"
    ADD CONSTRAINT "SchoolsApp_college_college_country_id_1fb82605_fk_LocationA" FOREIGN KEY (college_country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_college SchoolsApp_college_college_state_id_c39defba_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_college"
    ADD CONSTRAINT "SchoolsApp_college_college_state_id_c39defba_fk_LocationA" FOREIGN KEY (college_state_id) REFERENCES public."LocationApp_state"(state_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_school SchoolsApp_school_school_city_id_c2266ef4_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_school"
    ADD CONSTRAINT "SchoolsApp_school_school_city_id_c2266ef4_fk_LocationA" FOREIGN KEY (school_city_id) REFERENCES public."LocationApp_city"(city_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_school SchoolsApp_school_school_country_id_5f602234_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_school"
    ADD CONSTRAINT "SchoolsApp_school_school_country_id_5f602234_fk_LocationA" FOREIGN KEY (school_country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_school SchoolsApp_school_school_state_id_fdb3f621_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_school"
    ADD CONSTRAINT "SchoolsApp_school_school_state_id_fdb3f621_fk_LocationA" FOREIGN KEY (school_state_id) REFERENCES public."LocationApp_state"(state_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_university SchoolsApp_universit_university_city_id_0454db49_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_university"
    ADD CONSTRAINT "SchoolsApp_universit_university_city_id_0454db49_fk_LocationA" FOREIGN KEY (university_city_id) REFERENCES public."LocationApp_city"(city_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_university SchoolsApp_universit_university_country_i_85cde823_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_university"
    ADD CONSTRAINT "SchoolsApp_universit_university_country_i_85cde823_fk_LocationA" FOREIGN KEY (university_country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SchoolsApp_university SchoolsApp_universit_university_state_id_4530b282_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SchoolsApp_university"
    ADD CONSTRAINT "SchoolsApp_universit_university_state_id_4530b282_fk_LocationA" FOREIGN KEY (university_state_id) REFERENCES public."LocationApp_state"(state_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_student_school StudentsApp_student__school_id_0ae04d37_fk_SchoolsAp; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student_school"
    ADD CONSTRAINT "StudentsApp_student__school_id_0ae04d37_fk_SchoolsAp" FOREIGN KEY (school_id) REFERENCES public."SchoolsApp_school"(school_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_student_school StudentsApp_student__student_id_28441115_fk_StudentsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student_school"
    ADD CONSTRAINT "StudentsApp_student__student_id_28441115_fk_StudentsA" FOREIGN KEY (student_id) REFERENCES public."StudentsApp_student"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_student StudentsApp_student_country_id_91caf937_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_student"
    ADD CONSTRAINT "StudentsApp_student_country_id_91caf937_fk_LocationA" FOREIGN KEY (country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_studentproblem StudentsApp_studentp_problem_id_id_6a88c71d_fk_ProblemsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentproblem"
    ADD CONSTRAINT "StudentsApp_studentp_problem_id_id_6a88c71d_fk_ProblemsA" FOREIGN KEY (problem_id_id) REFERENCES public."ProblemsApp_problem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_studentproblem StudentsApp_studentp_student_id_id_e0215942_fk_StudentsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentproblem"
    ADD CONSTRAINT "StudentsApp_studentp_student_id_id_e0215942_fk_StudentsA" FOREIGN KEY (student_id_id) REFERENCES public."StudentsApp_student"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_studentstep StudentsApp_students_numeral_id_id_0f66af41_fk_ProblemsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentstep"
    ADD CONSTRAINT "StudentsApp_students_numeral_id_id_0f66af41_fk_ProblemsA" FOREIGN KEY (numeral_id_id) REFERENCES public."ProblemsApp_problemnumeral"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_studentstep StudentsApp_students_problem_student_id_i_f06567a0_fk_StudentsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentstep"
    ADD CONSTRAINT "StudentsApp_students_problem_student_id_i_f06567a0_fk_StudentsA" FOREIGN KEY (problem_student_id_id) REFERENCES public."StudentsApp_studentproblem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: StudentsApp_studentstep StudentsApp_students_step_id_id_8ae13bfb_fk_ProblemsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."StudentsApp_studentstep"
    ADD CONSTRAINT "StudentsApp_students_step_id_id_8ae13bfb_fk_ProblemsA" FOREIGN KEY (step_id_id) REFERENCES public."ProblemsApp_step"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_subject_chapter SubjectsApp_subject__chapter_id_044882fc_fk_BooksApp_; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_chapter"
    ADD CONSTRAINT "SubjectsApp_subject__chapter_id_044882fc_fk_BooksApp_" FOREIGN KEY (chapter_id) REFERENCES public."BooksApp_chapter"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_subject_country SubjectsApp_subject__country_id_abc19369_fk_LocationA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_country"
    ADD CONSTRAINT "SubjectsApp_subject__country_id_abc19369_fk_LocationA" FOREIGN KEY (country_id) REFERENCES public."LocationApp_country"(country_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_subject_book SubjectsApp_subject__subject_id_09125134_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_book"
    ADD CONSTRAINT "SubjectsApp_subject__subject_id_09125134_fk_SubjectsA" FOREIGN KEY (subject_id) REFERENCES public."SubjectsApp_subject"(subject_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_subject_chapter SubjectsApp_subject__subject_id_48d4f583_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_chapter"
    ADD CONSTRAINT "SubjectsApp_subject__subject_id_48d4f583_fk_SubjectsA" FOREIGN KEY (subject_id) REFERENCES public."SubjectsApp_subject"(subject_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_subject_country SubjectsApp_subject__subject_id_526c1f7e_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_country"
    ADD CONSTRAINT "SubjectsApp_subject__subject_id_526c1f7e_fk_SubjectsA" FOREIGN KEY (subject_id) REFERENCES public."SubjectsApp_subject"(subject_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_subject_book SubjectsApp_subject_book_book_id_dbe16e51_fk_BooksApp_book_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_subject_book"
    ADD CONSTRAINT "SubjectsApp_subject_book_book_id_dbe16e51_fk_BooksApp_book_id" FOREIGN KEY (book_id) REFERENCES public."BooksApp_book"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_topic_chapter SubjectsApp_topic_ch_chapter_id_598dd0a3_fk_BooksApp_; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_chapter"
    ADD CONSTRAINT "SubjectsApp_topic_ch_chapter_id_598dd0a3_fk_BooksApp_" FOREIGN KEY (chapter_id) REFERENCES public."BooksApp_chapter"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_topic_chapter SubjectsApp_topic_ch_topic_id_f9c72f70_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_chapter"
    ADD CONSTRAINT "SubjectsApp_topic_ch_topic_id_f9c72f70_fk_SubjectsA" FOREIGN KEY (topic_id) REFERENCES public."SubjectsApp_topic"(topic_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_topic_subject SubjectsApp_topic_su_subject_id_7570eb11_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_subject"
    ADD CONSTRAINT "SubjectsApp_topic_su_subject_id_7570eb11_fk_SubjectsA" FOREIGN KEY (subject_id) REFERENCES public."SubjectsApp_subject"(subject_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: SubjectsApp_topic_subject SubjectsApp_topic_su_topic_id_05f0e59c_fk_SubjectsA; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public."SubjectsApp_topic_subject"
    ADD CONSTRAINT "SubjectsApp_topic_su_topic_id_05f0e59c_fk_SubjectsA" FOREIGN KEY (topic_id) REFERENCES public."SubjectsApp_topic"(topic_id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: karla
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

