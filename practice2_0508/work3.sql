-- TABLE DROP
DROP TABLE PO_ORDER_DETAIL;
DROP TABLE PO_ORDER_HEADER;
DROP TABLE PO_SUPPLIER;
DROP TABLE PO_EMPLOYEER; 
DROP TABLE PO_ITEM;

-- TABLE CREATE
CREATE TABLE PO_ITEM
(
    ITEM_NO CHAR(05) CONSTRAINT PK_ITEM_ITEMNO
        PRIMARY KEY,
    ITEM_NAME CHAR(40) NOT NULL,
    UNIT_PRICE NUMBER(08) NOT NULL,
    ITEM_UNIT CHAR(03) NOT NULL
);

CREATE TABLE PO_EMPLOYEER
(
    EMP_NO NUMBER(05) CONSTRAINT PK_EMP_EMPNO
        PRIMARY KEY,
    EMP_NAME CHAR(12) NOT NULL,
    EMP_DEP CHAR(20) NOT NULL,
    EMP_PHONE CHAR(12) NOT NULL,
    EMP_LEVEL CHAR(10) NOT NULL
);

CREATE TABLE PO_SUPPLIER
(
    SUP_NO CHAR(04) CONSTRAINT PK_SUP_SUPPIERNO
        PRIMARY KEY,
    SUP_NAME CHAR(40) NOT NULL,
    SUP_ADDR CHAR(40) NOT NULL,
    SUP_PHONE CHAR(12) NOT NULL
);

CREATE TABLE PO_ORDER_HEADER
(
    ORD_NO CHAR(08) CONSTRAINT PK_ORDERHD_ORDNO
        PRIMARY KEY,
    ORD_DATE DATE NOT NULL,
    DUE_DATE DATE NOT NULL,
    SUP_NO CHAR(04) CONSTRAINT FK_ORDERHD_SUPNO
        REFERENCES PO_SUPPLIER,
    ORD_EMP NUMBER(5) CONSTRAINT FK_ORDERHD_ORDEMP
        REFERENCES PO_EMPLOYEER,
    DELV_DATE DATE NULL
); 

CREATE TABLE PO_ORDER_DETAIL
(
    ORD_NO CHAR(08) CONSTRAINT FK_ORDERDTL_ORDNO
        REFERENCES PO_ORDER_HEADER,
    LINE_NO NUMBER(02),
    ITEM_NO CHAR(05) CONSTRAINT FK_ORDERDTL_ITEMNO
        REFERENCES PO_ITEM,
    ORD_QTY NUMBER(05),
    CONSTRAINT PK_ORDDTL_ORDNO_LINENO
        PRIMARY KEY(ORD_NO, LINE_NO)
);


--INSERT DATA FOR ITEM
INSERT INTO PO_ITEM VALUES ('IT001','CONTROLLER',115000,'SET');
INSERT INTO PO_ITEM VALUES ('IT002','SWITCH',5000,'EA');
INSERT INTO PO_ITEM VALUES ('IT003','CC TV',210000,'EA');
INSERT INTO PO_ITEM VALUES ('IT004','AIR FILTER',15000,'EA');
INSERT INTO PO_ITEM VALUES ('IT005','DIODE',10000,'BOX');
INSERT INTO PO_ITEM VALUES ('IT006','TRANSISTER',14000,'BOX');
INSERT INTO PO_ITEM VALUES ('IT007','CONDENSOR',5000,'BOX');
INSERT INTO PO_ITEM VALUES ('IT008','WIRE',5500,'ROL');

--INSERT DATA FOR EMPLOYEE
INSERT INTO PO_EMPLOYEER VALUES (11111,'신승훈','구매팀','548-2792','과장');
INSERT INTO PO_EMPLOYEER VALUES (22222,'박찬호','홍보부','548-2792','대리');
INSERT INTO PO_EMPLOYEER VALUES (33333,'강명훈','구매팀','548-2792','사원');
INSERT INTO PO_EMPLOYEER VALUES (44444,'한득구','외자팀','548-2792','대리');
INSERT INTO PO_EMPLOYEER VALUES (55555,'만득이','구매팀','548-2792','과장');
INSERT INTO PO_EMPLOYEER VALUES (66666,'윤희경','구매팀','548-2792','사원');

--INSERT DATA FOR SUPPLIER
INSERT INTO PO_SUPPLIER VALUES ('S001','대명전기','인천시 부평동','432-5344');
INSERT INTO PO_SUPPLIER VALUES ('S002','한진엔지니어링','인천시 부평동','345-6543');
INSERT INTO PO_SUPPLIER VALUES ('S003','우성전업사','인천시 효성동','165-6587');
INSERT INTO PO_SUPPLIER VALUES ('S004','LG전자','경기도 부천시 계수동','984-8376');
INSERT INTO PO_SUPPLIER VALUES ('S005','동서전기','인천시 작전동','345-6543');
INSERT INTO PO_SUPPLIER VALUES ('S006','일신상사','경기도 부천시 내동','234-3746');
           
--INSERT DATA FOR ORDER_HEADER
INSERT INTO PO_ORDER_HEADER VALUES ('19971201',TO_DATE('19971201','YYYYMMDD'),TO_DATE('19971215','YYYYMMDD'),'S001',11111,TO_DATE('19971215','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971202',TO_DATE('19971201','YYYYMMDD'),TO_DATE('19971215','YYYYMMDD'),'S002',11111,TO_DATE('19971216','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971203',TO_DATE('19971202','YYYYMMDD'),TO_DATE('19971220','YYYYMMDD'),'S003',33333,TO_DATE('19971220','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971204',TO_DATE('19971202','YYYYMMDD'),TO_DATE('19971225','YYYYMMDD'),'S004',33333,TO_DATE('19971228','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971205',TO_DATE('19971203','YYYYMMDD'),TO_DATE('19971225','YYYYMMDD'),'S005',66666,TO_DATE('19971228','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971206',TO_DATE('19971204','YYYYMMDD'),TO_DATE('19971230','YYYYMMDD'),'S006',66666,TO_DATE('19971229','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971207',TO_DATE('19971205','YYYYMMDD'),TO_DATE('19971230','YYYYMMDD'),'S001',11111,TO_DATE('19971230','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971208',TO_DATE('19971205','YYYYMMDD'),TO_DATE('19971230','YYYYMMDD'),'S002',33333,TO_DATE('19971230','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971209',TO_DATE('19971208','YYYYMMDD'),TO_DATE('19971226','YYYYMMDD'),'S003',11111,TO_DATE('19971228','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971210',TO_DATE('19971209','YYYYMMDD'),TO_DATE('19971225','YYYYMMDD'),'S004',11111,TO_DATE('19971225','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971211',TO_DATE('19971212','YYYYMMDD'),TO_DATE('19980105','YYYYMMDD'),'S005',66666,TO_DATE('19980107','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971212',TO_DATE('19971214','YYYYMMDD'),TO_DATE('19980108','YYYYMMDD'),'S006',22222,TO_DATE('19980201','YYYYMMDD'));
INSERT INTO PO_ORDER_HEADER VALUES ('19971213',TO_DATE('19971216','YYYYMMDD'),TO_DATE('19980109','YYYYMMDD'),'S001',66666,NULL);
INSERT INTO PO_ORDER_HEADER VALUES ('19971214',TO_DATE('19971217','YYYYMMDD'),TO_DATE('19980220','YYYYMMDD'),'S002',11111,NULL);
INSERT INTO PO_ORDER_HEADER VALUES ('19971215',TO_DATE('19971218','YYYYMMDD'),TO_DATE('19980301','YYYYMMDD'),'S003',11111,NULL);
INSERT INTO PO_ORDER_HEADER VALUES ('19971216',TO_DATE('19971219','YYYYMMDD'),TO_DATE('19980109','YYYYMMDD'),'S004',44444,NULL);

--INSERT DATA FOR ORDER_DETAIL
INSERT INTO PO_ORDER_DETAIL VALUES ('19971201', 1,'IT001',100);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971201', 2,'IT002',1100);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971201', 3,'IT003',150);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971202', 1,'IT004',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971202', 2,'IT005',1);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971203', 1,'IT006',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971203', 2,'IT007',50);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971203', 3,'IT008',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971203', 4,'IT001',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971204', 1,'IT002',1);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971205', 1,'IT003',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971205', 2,'IT004',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971205', 3,'IT005',140);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971206', 1,'IT006',120);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971206', 2,'IT008',1);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971207', 1,'IT001',12);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971208', 1,'IT002',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971209', 1,'IT003',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971210', 1,'IT004',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971210', 2,'IT005',12);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971210', 3,'IT006',16);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971210', 4,'IT007',18);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971211', 1,'IT008',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971211', 2,'IT001',1);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971211', 3,'IT002',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971212', 1,'IT004',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971212', 2,'IT007',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971212', 3,'IT001',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971212', 4,'IT003',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971213', 1,'IT008',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971213', 2,'IT001',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971213', 3,'IT005',130);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971213', 4,'IT007',120);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971214', 1,'IT002',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971214', 2,'IT005',110);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971214', 3,'IT007',100);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971215', 1,'IT001',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971215', 2,'IT001',170);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971216', 1,'IT002',10);
INSERT INTO PO_ORDER_DETAIL VALUES ('19971216', 2,'IT005',190);
COMMIT;