/*
Write a query to print all prime numbers less than or equal to 1000. 
Print your result on a single line, and use the ampersand (&) character as your separator (instead of a space).

For example, the output for all prime numbers  <= 10 would be:

2&3&5&7
*/

BEGIN
    DECLARE @result AS varchar(700);
    DECLARE @i AS int;
    DECLARE @j AS int;
    DECLARE @flag AS bit;
    SET @i = 3;
    SET @j = 3;
    SET @result = '2';
    
    WHILE(@i <= 1000)
        BEGIN
            SET @flag = 0;
            SET @j = 3;
            WHILE(@j < @i)
            BEGIN
                IF(@i % @j = 0)
                BEGIN
                    SET @flag = 1;
                    BREAK;
                END
                SET @j = @j + 2;
            END
            IF(@flag = 0)
            BEGIN
                SET @result += CONCAT('&', @i);
            END
            SET @i = @i + 2;
        END
    SELECT @result;
END
