/*단일행 함수*/

--문자함수 INITCAP
select email,
       initcap(email),
       department_id
from employees
where department_id = 100;

--문자함수 LOWER, UPPER
select first_name, 
       lower(first_name),
       upper(first_name)
from employees
where department_id = 100;

--문자함수 substr
select first_name,
       substr(first_name,2),
       substr(first_name,2,6),
       substr(first_name,-3,2)
from employees
where department_id = 100;

--문자함수 
select first_name, 
       lpad(first_name,10,'*'), 
       rpad(first_name,10,'*')
from employees;

--문자함수 replace
select first_name, 
       replace(first_name, 'a', '*') 
from employees
where department_id =100;

--함수조합
select first_name, 
       replace(first_name, 'a', '*'), 
       replace(first_name, substr(first_name, 2, 3), '***')
from employees
where department_id =100;

--숫자함수 round
select round(123.346, 2) "r2",
       round(123.456, 0) "r0",
       round(123.456, -1) "r-1"
from dual; --가상의 테이블

select salary,
       round(salary,-3)
from employees;

--숫자함수 trunc
select trunc(123.346, 2) "r2",
       trunc(123.456, 0) "r0",
       trunc(123.456, -1) "r-1"
from dual;

--날짜함수
select sysdate
from dual;

select sysdate,
       first_name
from employees;

--months-between
select sysdate,
       hire_date,
       trunc(MONTHS_BETWEEN(SYSDATE,hire_date),0) as "workMonth"
from employees
where department_id = 100;

--last day
select last_day('20/06/06'),
       last_day(sysdate)
from dual;


select to_char(sysdate,'YYYY'),
       to_char(sysdate,'YY'),
       to_char(sysdate,'MM'),
       to_char(sysdate,'Month'),
       to_char(sysdate,'DD'),
       to_char(sysdate,'Day'),
       to_char(sysdate,'HH'),
       to_char(sysdate,'HH24'),
       to_char(sysdate,'MI'), 
       to_char(sysdate,'SS')
from dual;

--연월일 시분초
select sysdate,
       to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')
from dual;

--일반함수>NVL(컬럼명,null일때값)/NVL2(컬럼명,null이아닐때값,null일때값)

select first_name,
       commission_pct,
       NVL(commission_pct, 0)
from employees;

select first_name,
       commission_pct,
       NVL2(commission_pct, 100,0)
from employees;














