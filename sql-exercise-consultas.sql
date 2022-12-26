-- 2. DATA ANALYSIS

-- LISAR DADOS DO FUNCIONÁRIO: NÚMERO, SOBRENOME, NOME, GÊNERO E SALÁRIO 
SELECT employees.employees.emp_no, employees.employees.last_name, 
employees.employees.first_name, employees.employees.gerder, salaries.salaries.salary
FROM employees.employees, salaries.salaries
WHERE employees.employees.emp_no = salaries.salaries.emp_no

-- LISTAR FUNCIONARIOSFUNCIONÁRIOS CONTRATADOS EM 1986
SELECT employees.employees.emp_no, employees.employees.last_name,
employees.employees.first_name, employees.employees.hire_date
FROM employees.employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31'

-- LISTAR GERENTES COM AS SEGUINTES INFORMAÇÕES: número do departamento, nome do departamento,
-- número do funcionarios do gerente, sobrenome, nome e data de início e término do emprego.

SELECT departments.departments.dept_no, departments.departments.dept_name,
dept_manager.dept_manager.emp_no, employees.employees.last_name,
employees.employees.first_name, dept_emp.dept_emp.from_date, dept_emp.dept_emp.to_date
FROM departments.departments, dept_manager.dept_manager, employees.employees, dept_emp.dept_emp
WHERE departments.departments.dept_no = dept_manager.dept_manager.dept_no
AND dept_manager.dept_manager.emp_no = employees.employees.emp_no
AND dept_manager.dept_manager.emp_no = dept_emp.dept_emp.emp_no

-- LISTAR FUNCIONARIOS E RESPECTIVOS DEPARTAMENTOS COM AS SEGUINTES INFORMAÇÕES:
-- número do funcionário, sobrenome, nome e nome do departamento.

SELECT employees.employees.emp_no, employees.employees.last_name, 
employees.employees.first_name, departments.departments.dept_name
FROM employees.employees, dept_emp.dept_emp, departments.departments
WHERE employees.employees.emp_no = dept_emp.dept_emp.emp_no
AND departments.departments.dept_no = dept_emp.dept_emp.dept_no

-- LISTE TODOS OS FUNCIONARIOS CUJO O PRIMEIRO NOME É "HERCULES" E OS SOBRENOMES COMEÇAM COM "B"

SELECT employees.employees.emp_no, employees.employees.last_name, 
employees.employees.first_name
FROM employees.employees
WHERE employees.employees.first_name = 'Hercules' 
AND employees.last_name LIKE 'B%'

-- LISTAR FUNCIONÁRIOS DO DEPT DE VENDAS: número de funcionário, sobrenome, nome e nome do departamento

SELECT employees.employees.emp_no, employees.employees.last_name, 
employees.employees.first_name, departments.departments.dept_name
FROM employees.employees, departments.departments, dept_emp.dept_emp
WHERE departments.departments.dept_name = 'Sales'
AND employees.employees.emp_no = dept_emp.dept_emp.emp_no
AND departments.departments.dept_no = dept_emp.dept_emp.dept_no

-- LISTAR FUNCIONÁRIOS DOs DEPTS DE VENDAS E DESENVOLVIMENTO: número de funcionário, sobrenome, nome e nome do departamento

SELECT employees.employees.emp_no, employees.employees.last_name, 
employees.employees.first_name, departments.departments.dept_name
FROM employees.employees, departments.departments, dept_emp.dept_emp
WHERE (departments.departments.dept_name = 'Sales' OR departments.departments.dept_name = 'Development')
AND (employees.employees.emp_no = dept_emp.dept_emp.emp_no
AND departments.departments.dept_no = dept_emp.dept_emp.dept_no)

-- EM ORDEM DESCRESCENTE, LISTE A CONTAGEM DE FREQUENCIA DOS SOBRENOMES DOS FUNCIONÁRIOS, OU SEJA,
-- QUANTOS FUNCIONÁRIOS COMPARTILHAM CADA SOBRENOME.

SELECT employees.employees.last_name, COUNT(employees.employees.emp_no)
FROM employees.employees
GROUP BY employees.employees.last_name 
ORDER BY COUNT(employees.employees.emp_no) DESC