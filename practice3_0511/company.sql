---------------
-- WORKSHOP4 --
---------------

-- 1 --
SELECT NAME, HIRE, SAL FROM MEMBER 
WHERE DEPT_ID = (SELECT DEPT_ID FROM MEMBER WHERE NAME = '황기훈');
-- 2 --
SELECT MEMBER_ID, NAME FROM MEMBER
WHERE SAL > (SELECT AVG(SAL) FROM MEMBER);
-- 3 --
SELECT DEPT_ID, AVG(SAL) FROM MEMBER GROUP BY DEPT_ID
HAVING AVG(SAL) = (SELECT MAX(AVG(SAL)) FROM MEMBER GROUP BY DEPT_ID);
-- 4 --
SELECT NAME, SAL FROM MEMBER 
WHERE MGR = (SELECT MEMBER_ID FROM MEMBER WHERE NAME = '배기수');
-- 5 --
SELECT MEMBER_ID, NAME, DEPT_ID, JIKWI FROM MEMBER 
WHERE DEPT_ID = (SELECT DEPT_ID FROM DEPT WHERE DEPT_NAME = '영업부');
-- 6 --
SELECT * FROM MEMBER WHERE MEMBER_ID IN (SELECT MGR FROM MEMBER WHERE MGR IS NOT NULL);

---------------
-- WORKSHOP5 --
---------------
DROP TABLE TEST;
-- 1 --
CREATE TABLE TEST
(
    ID      NUMBER(5),
    NAME    VARCHAR2(20)
);
SELECT * FROM TEST;
-- 2 --
ALTER TABLE TEST
    ADD( JOB VARCHAR2(10));
-- 3 --
ALTER TABLE TEST
    DROP COLUMN JOB;
SELECT * FROM TEST;
-- 4 --
ALTER TABLE TEST
    ADD CONSTRAINT pk PRIMARY KEY(ID);
-- 5 --
DESC TEST;
-- 6 --
ALTER TABLE TEST
    DROP CONSTRAINT pk;