-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3-alpha
-- PostgreSQL version: 12.0
-- Project Site: pgmodeler.io
-- Model Author: ---


-- Database creation must be done outside a multicommand file.
-- These commands were put in this file only as a convenience.
-- -- object: "EmployeeSQL" | type: DATABASE --
-- -- DROP DATABASE IF EXISTS "EmployeeSQL";
-- CREATE DATABASE "EmployeeSQL"
-- 	ENCODING = 'UTF8'
-- 	LC_COLLATE = 'English_United States.1252'
-- 	LC_CTYPE = 'English_United States.1252'
-- 	TABLESPACE = pg_default
-- 	OWNER = postgres;
-- -- ddl-end --
-- 

-- object: public.employees | type: TABLE --
-- DROP TABLE IF EXISTS public.employees CASCADE;
CREATE TABLE public.employees (
	emp_no integer NOT NULL,
	birth_date date NOT NULL,
	first_name character varying(255) NOT NULL,
	last_name character varying(255) NOT NULL,
	gender character varying(1) NOT NULL,
	hire_date date NOT NULL,
	CONSTRAINT pk_employees PRIMARY KEY (emp_no)

);
-- ddl-end --
ALTER TABLE public.employees OWNER TO postgres;
-- ddl-end --

-- object: public.dept_emp | type: TABLE --
-- DROP TABLE IF EXISTS public.dept_emp CASCADE;
CREATE TABLE public.dept_emp (
	emp_no integer NOT NULL,
	dept_no character varying(4) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	CONSTRAINT pk_dept_emp PRIMARY KEY (emp_no,dept_no)

);
-- ddl-end --
ALTER TABLE public.dept_emp OWNER TO postgres;
-- ddl-end --

-- object: public.departments | type: TABLE --
-- DROP TABLE IF EXISTS public.departments CASCADE;
CREATE TABLE public.departments (
	dept_no character varying(4) NOT NULL,
	dept_name character varying(255) NOT NULL,
	CONSTRAINT pk_departments PRIMARY KEY (dept_no)

);
-- ddl-end --
ALTER TABLE public.departments OWNER TO postgres;
-- ddl-end --

-- object: public.dept_manager | type: TABLE --
-- DROP TABLE IF EXISTS public.dept_manager CASCADE;
CREATE TABLE public.dept_manager (
	dept_no character varying(4) NOT NULL,
	emp_no integer NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL
);
-- ddl-end --
ALTER TABLE public.dept_manager OWNER TO postgres;
-- ddl-end --

-- object: public.titles | type: TABLE --
-- DROP TABLE IF EXISTS public.titles CASCADE;
CREATE TABLE public.titles (
	emp_no integer NOT NULL,
	title character varying(255) NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL
);
-- ddl-end --
ALTER TABLE public.titles OWNER TO postgres;
-- ddl-end --

-- object: public.salaries | type: TABLE --
-- DROP TABLE IF EXISTS public.salaries CASCADE;
CREATE TABLE public.salaries (
	emp_no integer NOT NULL,
	salary integer NOT NULL,
	from_date date NOT NULL,
	to_date date NOT NULL,
	CONSTRAINT pk_salaries PRIMARY KEY (emp_no)

);
-- ddl-end --
ALTER TABLE public.salaries OWNER TO postgres;
-- ddl-end --

-- object: dept_emp_dept_no_fkey | type: CONSTRAINT --
-- ALTER TABLE public.dept_emp DROP CONSTRAINT IF EXISTS dept_emp_dept_no_fkey CASCADE;
ALTER TABLE public.dept_emp ADD CONSTRAINT dept_emp_dept_no_fkey FOREIGN KEY (dept_no)
REFERENCES public.departments (dept_no) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: dept_emp_emp_no_fkey | type: CONSTRAINT --
-- ALTER TABLE public.dept_emp DROP CONSTRAINT IF EXISTS dept_emp_emp_no_fkey CASCADE;
ALTER TABLE public.dept_emp ADD CONSTRAINT dept_emp_emp_no_fkey FOREIGN KEY (emp_no)
REFERENCES public.employees (emp_no) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: dept_manager_dept_no_fkey | type: CONSTRAINT --
-- ALTER TABLE public.dept_manager DROP CONSTRAINT IF EXISTS dept_manager_dept_no_fkey CASCADE;
ALTER TABLE public.dept_manager ADD CONSTRAINT dept_manager_dept_no_fkey FOREIGN KEY (dept_no)
REFERENCES public.departments (dept_no) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: titles_emp_no_fkey | type: CONSTRAINT --
-- ALTER TABLE public.titles DROP CONSTRAINT IF EXISTS titles_emp_no_fkey CASCADE;
ALTER TABLE public.titles ADD CONSTRAINT titles_emp_no_fkey FOREIGN KEY (emp_no)
REFERENCES public.employees (emp_no) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --

-- object: salaries_emp_no_fkey | type: CONSTRAINT --
-- ALTER TABLE public.salaries DROP CONSTRAINT IF EXISTS salaries_emp_no_fkey CASCADE;
ALTER TABLE public.salaries ADD CONSTRAINT salaries_emp_no_fkey FOREIGN KEY (emp_no)
REFERENCES public.employees (emp_no) MATCH SIMPLE
ON DELETE NO ACTION ON UPDATE NO ACTION;
-- ddl-end --


