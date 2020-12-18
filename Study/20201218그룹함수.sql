/*그룹 함수*/

select avg(salary),
       first_name
from employees;

select avg(salary)
from employees;

select count(*)
from employees;

select count(commission_pct)
from employees;

select count(*)
from employees
where salary > 16000;

select count(*), sum(salary), avg(salary)
from employees;

select count(*), sum(salary), avg(nvl(salary,0))
from employees;

--그룹함수 max, min
select max(salary)
from employees;

select min(salary)
from employees;

select max(salary),
       min(salary),
       count(*)
from employees;

select department_id,
       avg(salary)
from employees
group by department_id;

select department_id,
       count(*),
       job_id
from employees
group by department_id, job_id;

--예제
--연봉의 합계가 20000 이상인 부서의 부서 번호화,
--인원수, 급여 합계
select department_id,
       count(*),
       sum(salary)
from employees
where sum(salary) >= 20000 -->group by에는 where절을 쓸수 업다
group by department_id;

-- 대신 having으로 where과 같은 효과를 낼 수 있다.
select department_id,
       count(*),
       sum(salary)
from employees
group by department_id
having sum(salary) >= 20000;

--case end문
select employee_id,
       salary,
       job_id,
       case when job_id = 'AC_ACCOUNT' then salary*0.1
            when job_id = 'SA_REP' then salary*0.2
            when job_id = 'ST_CLERK' then salary*0.3
            else salary*0
       end bounus
from employees
order by bounus desc;

select employee_id,
       salary,
       job_id,
       decode( job_id, 'AC_ACCOUNT', salary*0.1,
                       'SA_REP', salary*0.2,
                       'ST_CLERK', salary*0.3,
               salary*0
       ) bounus
from employees;

/*직원의 이름, 부서, 팀을 출력하세요
  팀은 코드로 결정하며 부서코드가 10~50 이면 A-team,
  60~100이면 B-team, 110~150이면 C-team 나머지는 팀없음
*/
select first_name,
       department_id,
       case when department_id>=10 and department_id<=50 then 'A-TEAM'
            when department_id>=60 and department_id<=100 then 'B-TEAM'
            when department_id>=110 and department_id<=150 then 'C-TEAM'
            else '팀없음'
       end team
from employees
order by department_id;

















