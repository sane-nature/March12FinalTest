With cte as (Select *, dense_rank() over (partition by departmentId order by salary desc) as salary_rank from Employee),
cte2 as (Select * from cte where salary_rank <= 3)
Select d.name as Department, c.name as Employee, c.salary as Salary from cte2 c
full join Department d on c.departmentId = d.id
order by d.id, c.salary desc, c.name;