/*
You are given three tables: Students, Friends and Packages. 
Students contains two columns: ID and Name. 
Friends contains two columns: ID and Friend_ID (ID of the ONLY best friend). 
Packages contains two columns: ID and Salary (offered salary in $ thousands per month).

Write a query to output the names of those students whose best friends got offered a higher salary than them. 
Names must be ordered by the salary amount offered to the best friends. It is guaranteed that no two students got same salary offer.
*/

Select name 
from (
      select s.name, f.friend_id, p.salary ,p2.salary salary_friend
      from students s join friends f
      on s.id = f.id
      join packages p
      on s.id = p.id
      join students s2
      on s2.id = f.friend_id
      join packages p2
      on p2.id = f.friend_id
) sub
where sub.salary_friend > sub.salary
order by sub.salary_friend
