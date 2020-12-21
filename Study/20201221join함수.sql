/*2020-12-21*/
select *
from employees, departments
where employees.department_id = departments.department_id;

select first_name,
       department_name
from employees e, departments d
where e.department_id = d.department_id;

select first_name,
       department_name,
       job_title
from employees e, departments d, jobs j
where e.department_id = d.department_id and
e.job_id = j.job_id;

select e.department_id, e.first_name, d.department_name
from employees e left outer join departments d
on e.department_id = d.department_id;

select e.department_id, e.first_name, d.department_name
from employees e right outer join departments d
on e.department_id = d.department_id;

--테이블 명 alias 설정하면 계속 사용해야 한다.
--정상
select  em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where em.department_id = de.department_id
order by em.department_id desc;

--오류
select  employees.department_id, --테이블명 alias사용
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where em.department_id = de.department_id
order by em.department_id desc;

--join 실행순서 체크
select  em.department_id,
        em.first_name,
        de.department_name,
        de.department_id
from employees em, departments de
where em.department_id = de.department_id
order by em.department_id desc;    --order by 부분 이상할 수 있으니 생각해 볼것


--join 잘못된 사용예
select *
from employees em, locations lo
where em.salary = lo.location_id ;







