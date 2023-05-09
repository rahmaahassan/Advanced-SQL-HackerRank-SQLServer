/*
Julia asked her students to create some coding challenges. Write a query to print the hacker_id, name, and the total number of challenges created by each student.
Sort your results by the total number of challenges in descending order. 
If more than one student created the same number of challenges, then sort the result by hacker_id. 
If more than one student created the same number of challenges and the count is less than the maximum number of challenges created, then exclude those students from the result.

The following tables contain challenge data:

Hackers: The hacker_id is the id of the hacker, and name is the name of the hacker. 
Challenges: The challenge_id is the id of the challenge, and hacker_id is the id of the student who created the challenge.
*/

GO
CREATE VIEW v_count AS
SELECT h.hacker_id, h.name, count(*) count_ch
FROM hackers h join challenges ch
ON h.hacker_id = ch.hacker_id
GROUP BY h.hacker_id, h.name

GO
CREATE VIEW v_countAll AS
SELECT count_ch, count(*) count_all
FROM v_count
GROUP BY count_ch

GO
SELECT hacker_id, name, v_count.count_ch
FROM v_count join v_countAll 
ON v_count.count_ch = v_countAll.count_ch
WHERE v_countAll.count_all = 1 OR v_count.count_ch = (SELECT MAX(count_ch) 
                                        FROM v_count)
ORDER BY v_count.count_ch desc, hacker_id
