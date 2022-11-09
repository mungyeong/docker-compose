shutdown immediate;
startup mount;
ALTER SYSTEM ENABLE RESTRICTED SESSION;
ALTER SYSTEM SET JOB_QUEUE_PROCESSES=0;
ALTER SYSTEM SET AQ_TM_PROCESSES=0;
ALTER DATABASE OPEN;
ALTER DATABASE CHARACTER SET INTERNAL_USE KO16MSWIN949;


select * from props$ where name = 'NLS_CHARACTERSET';


update props$ set value$='KO16MSWIN949' where name='NLS_CHARACTERSET';
update props$ set value$='KO16MSWIN949' where name='NLS_NCHAR_CHARACTERSET';
update props$ set value$='KOREAN_KOREA.KO16MSWIN949' where name='NLS_LANGUAGE';
update props$ set value$='KOREA' where name='NLS_TERRITORY';
update props$ set value$='KOREAN' where name='NLS_LANGUAGE';
update props$ set value$='KOREA' where name='NLS_ISO_CURRENCY';
update props$ set value$='KOREAN' where name='NLS_DATE_LANGUAGE';

SHUTDOWN IMMEDIATE;
STARTUP;
SHUTDOWN IMMEDIATE;
STARTUP;
SELECT * FROM props$ where name like '%CHARACTER%';
SELECT DISTINCT (NLS_CHARSET_NAME (CHARSETID))
    CHARACTERSET,
                DECODE (type#,1, DECODE (CHARSETFORM, 1, 'VARCHAR2', 2, 'NVARCHAR2', 'UNKOWN'),9,
                    DECODE (CHARSETFORM, 1, 'VARCHAR', 2, 'NCHAR VARYING', 'UNKOWN'),96,
                    DECODE (CHARSETFORM, 1, 'CHAR', 2, 'NCHAR', 'UNKOWN'),112,
                    DECODE (CHARSETFORM, 1, 'CLOB', 2, 'NCLOB', 'UNKOWN')) types_used_in
FROM SYS.col$
WHERE CHARSETFORM IN (1, 2)
  AND type# IN (1, 9, 96, 112);
select * from nls_database_parameters;


-- sys 계정 패스워드

ALTER USER sys identified by 123456789;
