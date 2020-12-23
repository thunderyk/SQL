/*practice05*/

/*문제1.
담당 매니저가 배정되어있으나 커미션비율이 없고, 월급이 3000초과인 직원의 
이름, 매니저아이디, 커미션 비율, 월급 을 출력하세요.
(45건)
*/
select first_name,
       manager_id,
       commission_pct,
       salary
from employees
where commission_pct is null
and manager_id is not null
and salary > 3000;

/*문제2.
각 부서별로 최고의 급여를 받는 사원의 직원번호(employee_id), 
이름(first_name), 급여(salary), 입사일(hire_date), 
전화번호(phone_number), 부서번호(department_id) 를 조회하세요 
-조건절비교 방법으로 작성하세요
-급여의 내림차순으로 정렬하세요
-입사일은 2001-01-13 토요일 형식으로 출력합니다.
-전화번호는 515-123-4567 형식으로 출력합니다.
(11건)
*/
select em.employee_id,
       em.first_name,
       em.salary,
       TO_CHAR(em.hire_date,'YYYY-MM-DD'),
       replace(em.phone_number,'.','-'),
       em.department_id
from employees em, (select department_id, 
                           max(salary) m_salary
                    from employees
                    group by department_id) dem
where em.department_id = dem.department_id
and em.salary = dem.m_salary
order by salary desc;

/*문제3.
매니저별로 평균급여 최소급여 최대급여를 알아보려고 한다.
-통계대상(직원)은 2005년 이후의 입사자 입니다.
-매니저별 평균급여가 5000이상만 출력합니다.
-매니저별 평균급여의 내림차순으로 출력합니다.
-매니저별 평균급여는 소수점 첫째자리에서 반올림 합니다.
-출력내용은 매니저아이디, 매니저이름(first_name), 매니저별평균급여,
매니저별최소급여, 매니저별최대급여 입니다.
(9건)
*/

select man.manager_id,
       first_name,
       man.avg_salary,
       man.max_salary,
       man.min_salary,
       hire_date
from employees em, (select ROUND(avg(salary),0) avg_salary, 
                           max(salary) max_salary, 
                           min(salary) min_salary,
                           manager_id
                    from employees
                    group by manager_id
                    having ROUND(avg(salary),0) >= 5000) man
where em.employee_id = man.manager_id
and em.hire_date >= '05/1/1'
order by man.avg_salary desc;
/* 결과 2가 나오는데 확인 필요...
   매니저별이면 총 19명 중에서 avg가 5000 이상은 11명
   이중에서 2005년 이후에 입사한 사람이면 2005년을 포함하면
   안되니까 2명이 맞는거 같음*/

select ROUND(avg(salary),0) avg_salary, 
                           max(salary) max_salary, 
                           min(salary) min_salary,
                           manager_id
                    from employees
                    group by manager_id
                    having ROUND(avg(salary),0) > 5000;


/*문제4.
각 사원(employee)에 대해서 사번(employee_id), 
이름(first_name), 부서명(department_name), 
매니저(manager)의 이름(first_name)을 조회하세요.
부서가 없는 직원(Kimberely)도 표시합니다.
(106명)
*/
select em.employee_id,
       em.first_name,
       de.department_name,
       man.first_name
from employees em, employees man, departments de
where em.manager_id = man.employee_id and
de.department_id(+) = em.department_id;

/*문제5.
2005년 이후 입사한 직원중에 입사일이 11번째에서 20번째의 직원의 
사번, 이름, 부서명, 급여, 입사일을 입사일 순서로 출력하세요
*/
select rem.rn,
       rem.employee_id,
       rem.first_name,
       rem.department_name,
       rem.salary,
       rem.hire_date
from (select rownum rn,
             employee_id,
             first_name,
             salary,
             hire_date,
             department_name
      from (select employee_id,
                   first_name,
                   salary,
                   hire_date,
                   e.department_id,
                   department_name 
            from employees e, departments d
            where e.department_id = d.department_id
            order by hire_date asc) em)rem
where rem.rn >=11 and rem.rn <=20;

/*문제6.
가장 늦게 입사한 직원의 이름(first_name last_name)과
연봉(salary)과 근무하는 부서 이름(department_name)은?
*/
select first_name||' '||last_name 이름,
       salary 연봉,
       department_name 부서이름,
       hire_date
from employees em, departments de
where em.department_id = de.department_id and
hire_date >= (select max(hire_date) from employees);

/*문제7.
평균연봉(salary)이 가장 높은 부서 직원들의 직원번호(employee_id),
이름(firt_name), 성(last_name)과  업무(job_title), 연봉(salary)을 조회하시오.
*/
select employee_id,
       first_name,
       last_name,
       salary,
       dep.avg_salary,
       jo.job_title
from employees emp, jobs jo, (select de.department_id,
                                    avg(salary) avg_salary
                             from departments de ,employees em 
                             where de.department_id = em.department_id
                             group by de.department_id) dep 
where emp.job_id = jo.job_id
and emp.department_id = dep.department_id
and dep.avg_salary >= (select max(avg_salary)
                       from (select de.department_id,
                                    avg(salary) avg_salary 
                             from departments de ,employees em 
                             where de.department_id = em.department_id
                             group by de.department_id));

/*문제8.
평균 급여(salary)가 가장 높은 부서는?
*/
select department_name
from departments de, (select department_id
                      from (select de.department_id,
                                   avg(salary) avg_salary
                            from departments de ,employees em 
                            where de.department_id = em.department_id
                            group by de.department_id) dep
                       where dep.avg_salary >= (select max(avg_salary)
                                                from (select de.department_id,
                                                             avg(salary) avg_salary 
                                                      from departments de ,employees em 
                                                      where de.department_id = em.department_id
                                                      group by de.department_id))) dep
where de.department_id = dep.department_id;

/*문제9.
평균 급여(salary)가 가장 높은 지역은
*/
select region_name
from (select avg(reg.salary) avg_salary,reg.region_name
      from (select region_name,first_name,salary
            from regions re , countries co, locations lo, departments de, employees em
            where re.region_id = co.region_id
            and lo.country_id = co.country_id
            and de.location_id = lo.location_id
            and de.manager_id = em.manager_id) reg
            group by reg.region_name) regi
      where regi.avg_salary >= (select max(regio.avg_salary)
                                from (select avg(reg.salary) avg_salary,reg.region_name
                                      from (select region_name,first_name,salary
                                            from regions re , countries co, locations lo, departments de, employees em
                                            where re.region_id = co.region_id
                                            and lo.country_id = co.country_id
                                            and de.location_id = lo.location_id
                                            and de.manager_id = em.manager_id) reg
                                            group by reg.region_name) regio);

/*문제10.
평균 급여(salary)가 가장 높은 업무는? 
*/
select job_title
from jobs job3, (select job_id
                 from (select jo.job_id,
                              avg(salary) avg_salary
                       from jobs jo ,employees em 
                       where jo.job_id = em.job_id
                       group by jo.job_id)job1
                 where job1.avg_salary >= (select max(avg_salary)
                                            from (select jo.job_id,
                                                         avg(salary) avg_salary 
                                                  from jobs jo ,employees em 
                                                  where jo.job_id = em.job_id
                                                  group by jo.job_id)))job2
where job2.job_id = job3.job_id;


-- 코드가 너무 더럽고 복잡하게 짜여짐...
-- 중복을 없애는 방법은?ㅠㅠ