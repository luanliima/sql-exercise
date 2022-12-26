-- SQL-EXERCISE

-- 1. DATA ENGINEERING

-- CRIAR SCHEMA PARA CADA TABELA QUE SERÁ INSERIDA NO BANCO
CREATE SCHEMA departments;
CREATE SCHEMA dept_emp;
CREATE SCHEMA dept_manager;
CREATE SCHEMA employees;
CREATE SCHEMA salaries;
CREATE SCHEMA titles;

-- PARA CONFERENCIA: VERIFICAR QUAIS SCHEMAS EXISTEM NO BANCO --
SELECT 
  *
FROM
	pg_catalog.pg_namespace
ORDER BY
	nspname;
	
-- CRIAR TABELA EMQUE SERÁ COPIADO O CSV: é necessário o nome da tabela e a característica dos dados

-- TABELA DEPARTMENTS

create table departments.departments (
dept_no varchar(50) primary key,
dept_name varchar (50)
);

-- Caso erre a caracterização de uma tabela, corrigir assim:
-- ALTER TABLE [nome do schema . nome da tabela] ALTER COLUMN [nome da coluna] TYPE [caracter correto]

-- conferir se  tabela foi criada
SELECT * FROM departments.departments

-- IMPORTANDO OS DADOS PARA AS TABELAS EM CSV

COPY departments.departments
FROM 'C:\SQL_EXERCISE\departments.csv'
DELIMITER ';'
csv header;

-- TABELA DEPT_EMP

create table dept_emp.dept_emp (
emp_no VARCHAR(50),
dept_no varchar(50),
from_date date,
to_date date
);

-- conferir se  tabela foi criada
SELECT * FROM dept_emp.dept_emp

-- IMPORTANDO OS DADOS PARA AS TABELAS EM CSV

COPY dept_emp.dept_emp
FROM 'C:\SQL_EXERCISE\dept_emp.csv'
DELIMITER ';'
csv header;

-- TABELA DEPT_MANAGER

create table dept_manager.dept_manager(
dept_no varchar(50),
emp_no varchar(50) primary key,
from_date date,
to_date date
);

-- conferir se  tabela foi criada
SELECT * FROM dept_manager.dept_manager

-- IMPORTANDO OS DADOS PARA AS TABELAS EM CSV

COPY dept_manager.dept_manager
FROM 'C:\SQL_EXERCISE\dept_manager.csv'
DELIMITER ';'
csv header;

-- TABELA EMPLOYEES

create table employees.employees(
dep_no varchar (50) primary key,
birth_date date,
first_name varchar(50),
last_name varchar(50),
gerder varchar(50),
hire_date date
);

-- conferir se  tabela foi criada
SELECT * FROM employees.employees

-- IMPORTANDO OS DADOS PARA AS TABELAS EM CSV

COPY employees.employees
FROM 'C:\SQL_EXERCISE\employees.csv'
DELIMITER ';'
csv header;

-- TABELA SALARIES

create table salaries.salaries (
emp_no varchar(50) primary key,
salary money,
from_date date,
to_date date
);

-- conferir se  tabela foi criada
SELECT * FROM salaries.salaries

-- IMPORTANDO OS DADOS PARA AS TABELAS EM CSV

COPY salaries.salaries
FROM 'C:\SQL_EXERCISE\salaries.csv'
DELIMITER ';'
csv header;

-- TABELA TITLES

create table titles.titles (
emp_no varchar(50),
title varchar(50),
from_date date,
to_date date
);

-- conferir se  tabela foi criada
SELECT * FROM titles.titles

-- IMPORTANDO OS DADOS PARA AS TABELAS EM CSV

COPY titles.titles
FROM 'C:\SQL_EXERCISE\titles.csv'
DELIMITER ';'
csv header;
