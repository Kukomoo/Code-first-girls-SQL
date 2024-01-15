-- created by: cfg ck23intds10 group 5
-- (Seraphima Sara Gatkina, Nada Khas, Patricia Zayco, Deonisia Brito)


CREATE DATABASE yogastudio;

USE yogastudio;

-- CORE REQUIREMENTS:
-- Create relational DB of your choice with minimum 5 tables
-- Set Primary and Foreign Key constraints to create relations between the tables

-- DEE's "CLASS OFFERS" TABLE 

CREATE TABLE class_offers (
 class_id VARCHAR(10) PRIMARY KEY NOT NULL,
 class_type VARCHAR(50),
 class_time VARCHAR(50),
 class_day VARCHAR(50),
 class_cost INT NOT NULL,
 studio_room_id VARCHAR(10) NOT NULL,
 teacher_id VARCHAR(10) NOT NULL
);

-- DEE's "CLASS OFFERS" TABLE values

INSERT INTO class_offers (class_id, class_type, class_time, class_day, class_cost, studio_room_id, teacher_id)
VALUES
 ('class_001', 'Ashtanga', '07:00 - 09:00', 'Monday', 8, 'room_001', 't_001'),
 ('class_002', 'Vinyasa', '10:00 - 12:00', 'Monday', 12, 'room_001', 't_002'),
 ('class_003', 'Yin', '18:00 - 20:00', 'Monday', 10, 'room_002', 't_003'),
 ('class_004', 'Ashtanga', '07:00 - 09:00', 'Wednesday', 8, 'room_002', 't_004'),
 ('class_005', 'Yin', '10:00 - 12:00', 'Wednesday', 10, 'room_001', 't_005'),
 ('class_006', 'Vinyasa', '18:00 - 20:00', 'Wednesday', 12, 'room_001', 't_002'),
 ('class_007', 'Ashtanga', '07:00 - 09:00', 'Friday', 8, 'room_001', 't_004'),
 ('class_008', 'Vinyasa', '18:00 - 20:00', 'Friday', 12, 'room_001', 't_005');

-- DEE's "CLASS OFFERS" TABLE select from 
SELECT * FROM class_offers;



-- NADA's "Studio Room" TABLE create
CREATE TABLE studio_room (
    studio_room_id VARCHAR(10) PRIMARY KEY NOT NULL,
    studio_room_name VARCHAR(50)
);

-- NADA: Insert values into studio_room
INSERT INTO studio_room (studio_room_id, studio_room_name)
VALUES
    ('room_001', 'Dance Studio 1'),
    ('room_002', 'Music Studio 1');

-- NADA's "Studio Room" TABLE select from

SELECT * FROM studio_room;

-- NADA: Teacher table create

CREATE TABLE teachers (
    teacher_id VARCHAR(10) PRIMARY KEY NOT NULL,
    teacher_first_name VARCHAR(50),
    teacher_last_name VARCHAR(50)
);

-- NADA: Insert info into teachers table

INSERT INTO teachers (teacher_id, teacher_first_name, teacher_last_name)
VALUES
    ('t_001', 'John', 'Doe'),
    ('t_002', 'Jane', 'Smith'),
    ('t_003', 'Bob', 'Johnson'),
    ('t_004', 'Alice', 'Brown'),
    ('t_005', 'Charlie', 'Williams');

-- NADA's "teachers " TABLE select from

SELECT * FROM teachers;    


-- SARA: "students" table create

CREATE TABLE students
(student_id	VARCHAR(30) NOT NULL,
first_name VARCHAR (30) NOT NULL,
last_name varchar (30) NOT NULL,
age VARCHAR(30) NOT NULL,
membership_status VARCHAR(30),
PRIMARY KEY (student_id)
);

-- SARA: "students" insert values

INSERT INTO students
(student_id, first_name, last_name, age, membership_status)
VALUES
('st_001', 'Rachel', '	Douglas', '25',	'Platinum'),
('st_002', 'Tanya', 'Weiss', '34', 'Gold'),
('st_003', 'John', 'Baker', '22', null),
('st_004', 'Anna', 'Chen', '56', 'Silver'),
('st_005', 'Mira', 'Pack', '19', null),
('st_006', 'Ariel', 'Stein', '65', 'Platinum'),
('st_007', 'Layla',	'Beridze', '27', 'Gold'),
('st_008', 'Dara', 'Yu', '36', 'Gold'),
('st_009', 'Nam', 'Pham', '23', 'Silver'),
('st_010', 'Lilian', 'Nakhas', '20', 'Gold'),
('st_011', 'Theo', 'Rothberg', '44', 'Silver'),
('st_012', 'Rohan', 'Singh', '32', 'Silver'),
('st_013', 'Alex', 'Volha', '30', null),
('st_014', 'Robin', 'Sage', '47', 'Platinum'),
('st_015', 'Darcy', 'Gray', '28', 'Gold');

-- take out space in douglas
UPDATE students
SET last_name = 'Douglas'
WHERE student_id = 'st_001';

-- SARA: "students" TABLE select from

SELECT * FROM students;    

-- TRISHA: "class records" table create w/ foreign keys

CREATE TABLE class_actual_records
(
class_record_id	VARCHAR(30) NOT NULL,
class_id VARCHAR(10) NOT NULL,
class_date DATE,
student_id VARCHAR(10),
PRIMARY KEY (class_record_id),
FOREIGN KEY (class_id) REFERENCES class_offers(class_id),
FOREIGN KEY (student_id) REFERENCES students(student_id)
);

-- TRISHA: "class records" insert values

INSERT INTO class_actual_records
(class_record_id, class_id, class_date, student_id)
VALUES
('class_record_501', 'class_001', '2023-09-04', 'st_009'),
('class_record_502', 'class_001', '2023-09-04', 'st_005'),
('class_record_503', 'class_001', '2023-09-04', 'st_006'),
('class_record_504', 'class_001', '2023-09-04', 'st_010'),
('class_record_505', 'class_001', '2023-09-11', 'st_011'),
('class_record_506', 'class_001', '2023-09-11', 'st_012'),
('class_record_507', 'class_001', '2023-09-11', 'st_013'),
('class_record_508', 'class_001', '2023-09-18', 'st_015'),
('class_record_509', 'class_001', '2023-09-18', 'st_009'),
('class_record_510', 'class_001', '2023-09-18', 'st_013'),
('class_record_511', 'class_001', '2023-09-25', 'st_001'),
('class_record_512', 'class_001', '2023-09-25', 'st_009'),
('class_record_513', 'class_001', '2023-09-25', 'st_003'),
('class_record_514', 'class_001', '2023-09-25', 'st_004'),
('class_record_515', 'class_001', '2023-09-25', 'st_006'),
('class_record_516', 'class_001', '2023-09-25', 'st_008'),
('class_record_517', 'class_002', '2023-09-04', 'st_008'),
('class_record_518', 'class_002', '2023-09-04', 'st_006'),
('class_record_519', 'class_002', '2023-09-04', 'st_009'),
('class_record_520', 'class_002', '2023-09-04', 'st_002'),
('class_record_521', 'class_002', '2023-09-11', 'st_002'),
('class_record_522', 'class_002', '2023-09-11', 'st_003'),
('class_record_523', 'class_002', '2023-09-11', 'st_007'),
('class_record_524', 'class_002', '2023-09-18', 'st_007'),
('class_record_525', 'class_002', '2023-09-18', 'st_004'),
('class_record_526', 'class_002', '2023-09-18', 'st_015'),
('class_record_527', 'class_002', '2023-09-18', 'st_001'),
('class_record_528', 'class_002', '2023-09-18', 'st_009'),
('class_record_529', 'class_002', '2023-09-18', 'st_002'),
('class_record_530', 'class_002', '2023-09-18', 'st_003'),
('class_record_531', 'class_002', '2023-09-18', 'st_006'),
('class_record_532', 'class_002', '2023-09-25', 'st_014'),
('class_record_533', 'class_002', '2023-09-25', 'st_002'),
('class_record_534', 'class_002', '2023-09-25', 'st_006'),
('class_record_535', 'class_002', '2023-09-25', 'st_001'),
('class_record_536', 'class_002', '2023-09-25', 'st_015'),
('class_record_537', 'class_003', '2023-09-04', 'st_010'),
('class_record_538', 'class_003', '2023-09-04', 'st_013'),
('class_record_539', 'class_003', '2023-09-04', 'st_003'),
('class_record_540', 'class_003', '2023-09-04', 'st_004'),
('class_record_541', 'class_003', '2023-09-11', 'st_010'),
('class_record_542', 'class_003', '2023-09-11', 'st_011'),
('class_record_543', 'class_003', '2023-09-11', 'st_014'),
('class_record_544', 'class_003', '2023-09-11', 'st_013'),
('class_record_545', 'class_003', '2023-09-11', 'st_006'),
('class_record_546', 'class_003', '2023-09-11', 'st_004'),
('class_record_547', 'class_003', '2023-09-18', 'st_009'),
('class_record_548', 'class_003', '2023-09-18', 'st_004'),
('class_record_549', 'class_003', '2023-09-18', 'st_008'),
('class_record_550', 'class_003', '2023-09-25', 'st_008'),
('class_record_551', 'class_003', '2023-09-25', 'st_004'),
('class_record_552', 'class_003', '2023-09-25', 'st_015'),
('class_record_553', 'class_003', '2023-09-25', 'st_013'),
('class_record_554', 'class_003', '2023-09-25', 'st_011'),
('class_record_555', 'class_003', '2023-09-25', 'st_012'),
('class_record_556', 'class_004', '2023-09-06', 'st_012'),
('class_record_557', 'class_004', '2023-09-06', 'st_006'),
('class_record_558', 'class_004', '2023-09-06', 'st_008'),
('class_record_559', 'class_004', '2023-09-06', 'st_002'),
('class_record_560', 'class_004', '2023-09-20', 'st_014'),
('class_record_561', 'class_004', '2023-09-20', 'st_005'),
('class_record_562', 'class_004', '2023-09-20', 'st_001'),
('class_record_563', 'class_004', '2023-09-20', 'st_010'),
('class_record_564', 'class_004', '2023-09-20', 'st_011'),
('class_record_565', 'class_004', '2023-09-20', 'st_012'),
('class_record_566', 'class_004', '2023-09-20', 'st_006'),
('class_record_567', 'class_004', '2023-09-20', 'st_007'),
('class_record_568', 'class_006', '2023-09-06', 'st_002'),
('class_record_569', 'class_006', '2023-09-06', 'st_003'),
('class_record_570', 'class_006', '2023-09-06', 'st_004'),
('class_record_571', 'class_006', '2023-09-06', 'st_010'),
('class_record_572', 'class_006', '2023-09-06', 'st_011'),
('class_record_573', 'class_006', '2023-09-06', 'st_012'),
('class_record_574', 'class_006', '2023-09-06', 'st_006'),
('class_record_575', 'class_006', '2023-09-06', 'st_007'),
('class_record_576', 'class_006', '2023-09-06', 'st_014'),
('class_record_577', 'class_006', '2023-09-06', 'st_005'),
('class_record_578', 'class_006', '2023-09-06', 'st_001'),
('class_record_579', 'class_006', '2023-09-06', 'st_008'),
('class_record_580', 'class_006', '2023-09-06', 'st_013'),
('class_record_581', 'class_006', '2023-09-13', 'st_012'),
('class_record_582', 'class_006', '2023-09-13', 'st_005'),
('class_record_583', 'class_006', '2023-09-13', 'st_001'),
('class_record_584', 'class_006', '2023-09-13', 'st_009'),
('class_record_585', 'class_006', '2023-09-20', 'st_012'),
('class_record_586', 'class_006', '2023-09-20', 'st_005'),
('class_record_587', 'class_006', '2023-09-20', 'st_001'),
('class_record_588', 'class_006', '2023-09-20', 'st_009'),
('class_record_589', 'class_006', '2023-09-27', 'st_002'),
('class_record_590', 'class_006', '2023-09-27', 'st_004'),
('class_record_591', 'class_006', '2023-09-27', 'st_006'),
('class_record_592', 'class_006', '2023-09-27', 'st_005'),
('class_record_593', 'class_006', '2023-09-27', 'st_007'),
('class_record_594', 'class_006', '2023-09-27', 'st_009'),
('class_record_595', 'class_006', '2023-09-27', 'st_008'),
('class_record_596', 'class_006', '2023-09-27', 'st_011'),
('class_record_597', 'class_007', '2023-09-08', 'st_008'),
('class_record_598', 'class_007', '2023-09-08', 'st_006'),
('class_record_599', 'class_007', '2023-09-08', 'st_009'),
('class_record_600', 'class_007', '2023-09-08', 'st_011'),
('class_record_601', 'class_007', '2023-09-08', 'st_004'),
('class_record_602', 'class_007', '2023-09-08', 'st_007'),
('class_record_603', 'class_007', '2023-09-08', 'st_013'),
('class_record_604', 'class_007', '2023-09-08', 'st_015'),
('class_record_605', 'class_007', '2023-09-15', 'st_015'),
('class_record_606', 'class_007', '2023-09-15', 'st_013'),
('class_record_607', 'class_007', '2023-09-15', 'st_012'),
('class_record_608', 'class_007', '2023-09-15', 'st_011'),
('class_record_609', 'class_007', '2023-09-15', 'st_009'),
('class_record_610', 'class_007', '2023-09-15', 'st_005'),
('class_record_611', 'class_007', '2023-09-22', 'st_005'),
('class_record_612', 'class_007', '2023-09-22', 'st_003'),
('class_record_613', 'class_007', '2023-09-22', 'st_015'),
('class_record_614', 'class_007', '2023-09-22', 'st_013'),
('class_record_615', 'class_007', '2023-09-29', 'st_013'),
('class_record_616', 'class_007', '2023-09-29', 'st_015'),
('class_record_617', 'class_007', '2023-09-29', 'st_011'),
('class_record_618', 'class_007', '2023-09-29', 'st_010'),
('class_record_619', 'class_007', '2023-09-29', 'st_008'),
('class_record_620', 'class_007', '2023-09-29', 'st_002'),
('class_record_621', 'class_007', '2023-09-29', 'st_006'),
('class_record_622', 'class_007', '2023-09-29', 'st_004'),
('class_record_623', 'class_007', '2023-09-29', 'st_003'),
('class_record_624', 'class_008', '2023-09-08', 'st_001'),
('class_record_625', 'class_008', '2023-09-08', 'st_002'),
('class_record_626', 'class_008', '2023-09-08', 'st_003'),
('class_record_627', 'class_008', '2023-09-08', 'st_006'),
('class_record_628', 'class_008', '2023-09-08', 'st_010'),
('class_record_629', 'class_008', '2023-09-08', 'st_015'),
('class_record_630', 'class_008', '2023-09-08', 'st_012'),
('class_record_631', 'class_008', '2023-09-15', 'st_005'),
('class_record_632', 'class_008', '2023-09-15', 'st_015'),
('class_record_633', 'class_008', '2023-09-15', 'st_008'),
('class_record_634', 'class_008', '2023-09-22', 'st_006'),
('class_record_635', 'class_008', '2023-09-22', 'st_008'),
('class_record_636', 'class_008', '2023-09-22', 'st_013'),
('class_record_637', 'class_008', '2023-09-22', 'st_009'),
('class_record_638', 'class_008', '2023-09-22', 'st_004'),
('class_record_639', 'class_008', '2023-09-29', 'st_006'),
('class_record_640', 'class_008', '2023-09-29', 'st_008'),
('class_record_641', 'class_008', '2023-09-29', 'st_013'),
('class_record_642', 'class_008', '2023-09-29', 'st_009'),
('class_record_643', 'class_008', '2023-09-29', 'st_004'),
('class_record_644', 'class_008', '2023-09-29', 'st_015'),
('class_record_645', 'class_008', '2023-09-29', 'st_012'),
('class_record_646', 'class_005', NULL, NULL);

-- TRISHA: "class_actual_records" TABLE select from

SELECT * FROM class_actual_records;    

-- CORE REQUIREMENTS:
-- Create relational DB of your choice with minimum 5 tables
-- Set Primary and Foreign Key constraints to create relations between the tables

-- DEE: ADD FOREIGN KEYS to "class_offers"
-- class offers foreign keys

ALTER TABLE class_offers
ADD FOREIGN KEY (studio_room_id) REFERENCES studio_room(studio_room_id),
ADD FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id);

ALTER TABLE class_offers
ADD FOREIGN KEY (class_id) REFERENCES class_actual_records(class_id);

-- SARA AND NADA: ADD remaining foreign keys

ALTER TABLE studio_room
ADD FOREIGN KEY (studio_room_id) REFERENCES class_offers(studio_room_id);

ALTER TABLE teachers
ADD FOREIGN KEY (teacher_id) REFERENCES class_offers(teacher_id);

ALTER TABLE students
ADD FOREIGN KEY (student_id) REFERENCES class_actual_records(student_id);


-- CORE REQUIREMENT: JOIN (Using any type of the joins create a view that combines multiple tables in a logical way)
-- QUESTION: What are the classes we offer, who’s teaching them, and what studio room will they be taught in?
-- QUERY IDEA P1: joining 3 tables, CLASS OFFERS WITH STUDIO ROOM AND TEACHER;
-- QUERY IDEA P2: SELECT class id, type, studio room, and teacher FROM class_offers JOIN JOIN GROUP BY class_TYPE

SELECT
  co.class_id, co.class_type, sr.studio_room_name, t.teacher_first_name, t.teacher_last_name
FROM 
  class_offers AS co
JOIN 
  studio_room AS sr 
    ON sr.studio_room_id = co.studio_room_id
JOIN
  teachers AS t
    ON t.teacher_id = co.teacher_id
ORDER BY
  co.class_id ASC;


-- CORE REQUIREMENT: STORED FUNCTION (In your database, create a stored function that can be applied to
-- a query in your DB)
-- QUESTION: What are our most profitable classes?
-- QUERY IDEA: Create a stored function to calculate the total revenue per class type

DELIMITER // 
-- this is to alter the function terminator from semicolon ; to //

CREATE FUNCTION TotalRevenuePerClass(classtype VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
    DECLARE TotalRevenue INT;

    SELECT
        COUNT(car.class_record_id) * co.class_cost INTO TotalRevenue
    FROM
    class_offers AS co
  JOIN
    class_actual_records AS car ON co.class_id=car.class_id
    WHERE co.class_type = classtype
    GROUP BY co.class_cost;

    RETURN TotalRevenue;
END //

DELIMITER ;


-- using the function we created to run a query for our marketing team to be able to see the top profitable classes

SELECT
    co.class_type,
    TotalRevenuePerClass(co.class_type) AS total_class_revenue
FROM
    class_offers AS co
GROUP BY
    co.class_type  
ORDER BY
    total_class_revenue DESC;

-- CODE to drop function when needed 
-- DROP FUNCTION TotalRevenuePerClass;


-- CORE REQUIREMENT: SUBQUERY (Prepare an example query with a subquery to demonstrate how
-- to extract data from your DB for analysis)
-- QUESTION: What is the average student attendance for each class offering?
-- QUERY IDEA: retrieve detailed information about each yoga class (class type, day, time, room, and teacher)
-- along with the average attendance for each class type

-- subquery
WITH ClassDateAvgAttendance AS (
  SELECT
      co.class_id,
      COUNT(DISTINCT car.student_id) AS total_attendance
  FROM
      class_offers AS co
  JOIN
      class_actual_records AS car ON co.class_id = car.class_id
  GROUP BY
      co.class_id
)


-- Main Query
SELECT
  co.class_id,
  co.class_type,
  co.class_day,
  co.class_time,
  sr.studio_room_name,
  t.teacher_first_name,
  t.teacher_last_name,
  AVG(cda.total_attendance) AS average_attendance
FROM
  class_offers AS co
JOIN
  studio_room AS sr ON co.studio_room_id = sr.studio_room_id
JOIN
  teachers AS t ON co.teacher_id = t.teacher_id
LEFT JOIN
  ClassDateAvgAttendance AS cda ON co.class_id = cda.class_id
GROUP BY
  co.class_id, co.class_type, co.class_day, co.class_time, sr.studio_room_name,
  t.teacher_first_name, t.teacher_last_name
ORDER BY
  average_attendance DESC;



-- ADVANCE REQUIREMENT: STORED PROCEDURE (In your database, create a stored procedure and demonstrate how it runs)
-- QUESTION: Who are the top 10 spending students?
-- QUERY IDEA: create procedure to get top 10 spending yogis

-- USE yogastudio;

DELIMITER //

CREATE PROCEDURE top_spending_yogis(IN top_yogis_number INT)
BEGIN
    -- temporary table for top 10
    CREATE TEMPORARY TABLE result_yogis_top10spenders (
        student_id VARCHAR(10),
        student_first_name VARCHAR(50),
        student_last_name VARCHAR(50),
        classes_taken_qty INT,
        classes_spent_total INT
    );

    -- TEMPORARY TABLE logic for top 10
    INSERT INTO result_yogis_top10spenders
    SELECT
        s.student_id,
        s.first_name AS student_first_name,
        s.last_name AS student_last_name,
        COUNT(car.class_record_id) AS classes_taken_qty,
        SUM(co.class_cost) AS classes_spent_total
    FROM
        students s
    JOIN
        class_actual_records car ON s.student_id = car.student_id
    JOIN
        class_offers co ON co.class_id = car.class_id
    GROUP BY
        s.student_id, s.first_name, s.last_name
    ORDER BY
        classes_spent_total DESC
    LIMIT top_yogis_number;

    -- select what table will be called
    SELECT
        student_id,
        student_first_name,
        student_last_name,
        classes_taken_qty,
        classes_spent_total
    FROM
        result_yogis_top10spenders;

END //

DELIMITER ;

-- CALL the procedure
-- number can be changed if qty for the top spending students will be changed (e.g. change to top 5 or 15)
CALL top_spending_yogis(10);

-- Drop procedure after every CALL
-- DROP PROCEDURE IF EXISTS top_spending_yogis;

-- Drop table created after every CALL and want to repeat procedure again
-- DROP TEMPORARY TABLE IF EXISTS result_yogis_top10spenders;


-- ADVANCE REQUIREMENT: combination of VIEW (Create a view that uses at least 3-4 base tables; prepare and demonstrate a query that uses the view to
-- produce a logically arranged result set for analysis.) & GROUP BY (Prepare an example query with 
-- group by and having to demonstrate how to extract data from your DB for analysis)
-- QUERY IDEA: create a VIEW where a specific teacher will only see student class details and student attendance

CREATE VIEW schedule_teacher_alice
AS
    SELECT 
        t.teacher_id, 
        co.class_id, 
        co.class_type,
        co.class_day,
        car.class_date,
        COUNT(s.student_id) AS attendance
    FROM 
        teachers AS t

    JOIN 
        class_offers AS co
            ON co.teacher_id = t.teacher_id
    JOIN
        class_actual_records AS car
            ON car.class_id = co.class_id
    JOIN
        students AS s
            ON s.student_id = car.student_id
    WHERE t.teacher_id = 't_004'
    GROUP BY t.teacher_id, co.class_id, co.class_type, co.class_day, car.class_date;

-- teacher alice's table view
SELECT * FROM schedule_teacher_alice;

-- drop alice's table view  when needed
DROP VIEW schedule_teacher_alice;


-- end :)
