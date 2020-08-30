# Examples sql 


these are examples of sql commands for me, if I forget

## SELECT

```sql
SELECT column1, column2, ...
FROM table_name;
```

## SELECT DISTINCT

```sql
SELECT DISTINCT column1, column2, ...
FROM table_name;
```
## SELECT WHERE
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition;
```

## AND, OR, NOT

### and:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition1 AND condition2 AND condition3 ...;
```

### or:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE condition1 OR condition2 OR condition3 ...;
```

### not:
```sql
SELECT column1, column2, ...
FROM table_name
WHERE NOT condition;
```

## ORDER BY
```sql
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
```


## INSERT INTO
```sql
INSERT INTO table_name (column1, column2, column3, ...)
VALUES (value1, value2, value3, ...);
```

## NULL VALUES
```sql
SELECT CustomerName, ContactName, Address
FROM Customers
WHERE Address IS NOT NULL;
```

## UPDATE
```sql
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
```
## DELETE
```sql
DELETE FROM table_name WHERE condition;
```
## SELECT TOP

### SQL Server / MS Access Syntax:
```sql
SELECT TOP number|percent column_name(s)
FROM table_name
WHERE condition;;
```

### MySQL Syntax:
```sql
SELECT column_name(s)
FROM table_name
WHERE condition
LIMIT number;
```

### Oracle Syntax:
```sql
SELECT column_name(s)
FROM table_name
WHERE ROWNUM <= number;
```

## MIN, MAX

### MIN
```sql
SELECT MIN(column_name)
FROM table_name
WHERE condition;
```

### MAX
```sql
SELECT MAX(column_name)
FROM table_name
WHERE condition;
```

## COUNT(), AVG() and SUM()

### count()
```sql
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
```

### avg()
```sql
SELECT AVG(column_name)
FROM table_name
WHERE condition;
```

### sum()
```sql
SELECT SUM(column_name)
FROM table_name
WHERE condition;
```

## INNER JOIN
```sql
SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
```
![](https://www.w3schools.com/sql/img_innerjoin.gif)


## LEFT JOIN
```sql
SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;
```
![](https://www.w3schools.com/sql/img_leftjoin.gif)


## RIGHT JOIN
```sql
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
```
![](https://www.w3schools.com/sql/img_rightjoin.gif)


## FULL JOIN
```sql
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;
```
![](https://www.w3schools.com/sql/img_fulljoin.gif)


## FULL JOIN
```sql
SELECT column_name(s)
FROM table1
FULL OUTER JOIN table2
ON table1.column_name = table2.column_name
WHERE condition;
```
![](https://www.w3schools.com/sql/img_fulljoin.gif)



## ALTER TABLE
```sql
ALTER TABLE table_name
ADD column_name datatype;
```

ex: 

```sql
ALTER TABLE Customers
ADD Email varchar(255);
```












