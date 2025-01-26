# Write your MySQL query statement below

-- Method 1: Using condition.
SELECT 
    tweet_id
FROM
    tweets
WHERE
    LENGTH(content) > 15;


-- Method 2: Using Not:
SELECT 
    tweet_id
FROM
    tweets
WHERE
    NOT LENGTH(content) <= 15;
