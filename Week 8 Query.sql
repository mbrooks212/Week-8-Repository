#1. I want to know how many employees with each title were born after 1965-01-01.
SELECT employees.emp_no , titles.title , employees.birth_date FROM employees 
INNER JOIN titles ON titles.emp_no = employees.emp_no WHERE birth_date > "1965-01-01";

#2. I want to know the average salary per title.
SELECT titles.title as "Title", avg(salaries.salary) as "Average Salary" FROM employees
INNER JOIN titles ON titles.emp_no = employees.emp_no
INNER JOIN salaries ON salaries.emp_no = titles.emp_no 
GROUP BY titles.title;

#3. How much money was spent on salary for the marketing department between the years 1990 and 1992?
SELECT d.dept_name AS "Department", sum(s.salary) AS "Total Salary" FROM departments d
INNER JOIN dept_emp de ON de.dept_no = d.dept_no	
INNER JOIN salaries s ON s.emp_no = de.emp_no
WHERE d.dept_name = 'Marketing' AND s.to_date BETWEEN '1990-01-01' AND '1992-12-31';
