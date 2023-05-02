/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* * * * * 
* * * * 
* * * 
* * 
*
Write a query to print the pattern P(20).
*/

declare @star varchar(10)
declare @num int = 20
set @star = ' *'
while (@num > 0)
begin
     select replicate(@star, @num)
     set @num = @num - 1
end

/*
P(R) represents a pattern drawn by Julia in R rows. The following pattern represents P(5):
* 
* * 
* * * 
* * * * 
* * * * *
Write a query to print the pattern P(20).
*/

Declare @num int = 1
While (@num <= 20)
begin
   SELECT Replicate('* ', @num)
   Set @num = @num + 1
end
