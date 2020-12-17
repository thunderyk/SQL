--셀렉트 문
select * from employees;

select * from departments;

--원하는 컬럼 조회하기
select employee_id,first_name, last_name
from employees;

-- 출력할 때 컬럼에 별명 사용하기

select employee_id as empNo,
       first_name "f_name",
       salary
from employees;

--사원의 이름(first_name)과 전화번호 입사일, 급여 표시
select first_name,
       phone_number,
       hire_date,
       salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여 전화번호 이메일 입사일 표시
select first_name 이름,
       last_name 성,
       salary 연봉,
       phone_number 전화번호,
       email 이메일,
       hire_date 고용일
from employees;

select first_name || ' ' ||last_name name
from employees;

select first_name || ' hire date is ' || hire_date
from employees;

--산술연산자
select first_name,
       salary
from employees;

select first_name,
       salary,
       salary*12
from employees;

select first_name,
       salary,
       salary*12,
       (salary+300)*12,
       (salary+300)*12-(salary*12)
from employees;

--아래는 오류가 나는데 job_id는 숫자가 아니기 때문이다. 문자열은 산술X
select job_id*12
from employees;

--예제
select first_name || '-' || last_name 성명,
       salary 급여,
       salary*12 연봉,
       salary*12+5000 연봉2,
       phone_number 전화번호
from employees;

select first_name
from employees
where department_id = 10;

--연봉이 1500이상인 사원의 이름과 연봉
select first_name,
       salary
from employees
where salary >= 1500;

--07/01/01 이후에 입사한 사원들의 이름
select first_name,
       hire_date
from employees
where hire_date >= '07/01/01';

--이름이 Lex인 직원의 연봉
select salary, first_name
from employees
where first_name = 'Lex';

--조금 더 복잡한 where절
select first_name,
       salary
from employees
where salary >= 14000
and salary <= 17000;

select first_name,
       salary
from employees
where salary >= 14000
or salary <= 17000;

select first_name,
       hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31';

select first_name,
       salary
from employees
where salary between 14000 and 17000;

select first_name, last_name, salary
from employees
where first_name in ('Neena','Lex','John');

select first_name,
       salary
from employees
where salary in  ('2100','3100','4100','5100');

select first_name, last_name, salary
from employees
where first_name like 'L%';

select first_name, last_name, salary
from employees
where first_name like '_L__';

--예제
select first_name, salary
from employees
where first_name like '%am';

select first_name, salary
from employees
where first_name like '_a%';

select first_name
from employees
where first_name like '___a%';

select first_name
from employees
where first_name like '__a_';

--null
--직원테이블에서 급여가 13000에서 15000사이인
--직원의 이름, 급여, 커미션% 급여*커미션 출력하세요

select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where salary between 13000 and 15000;

--is null is not null
select first_name,
       salary,
       commission_pct
from employees
where commission_pct is not null;

select first_name
from employees
where manager_id is null
and commission_pct is null;

select email, employee_id
from employees
where employee_id = 100;

/*select 문
    select 절
    from절
    where절
*/
select *
from employees
order by salary desc; --desc 큰거부터 작은거

select *
from employees
order by first_name desc; --desc 큰거부터 작은거

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름
select department_id,
       salary,
       first_name
from employees
order by department_id asc; --asc 작은거부터 큰거로

--급여가 10000 이상인 직원의 이름 급여 급여가 큰 직원부터
select first_name,
       salary
from employees
where salary >= 1000
order by salary desc;

--부서번호 오름차순 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름
select department_id,
       salary,
       first_name
from employees
order by department_id asc,
         salary desc; --asc 작은거부터 큰거로




