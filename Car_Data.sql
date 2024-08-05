--Create Actual Table--
CREATE TABLE CarData (
    Car_Name VARCHAR2(50),
    Year NUMBER,
    Selling_Price NUMBER,
    Present_Price NUMBER,
    Kms_Driven NUMBER,
    Fuel_Type VARCHAR2(10),
    Seller_Type VARCHAR2(10),
    Transmission VARCHAR2(10),
    Owner NUMBER
);

--Create External Table--
CREATE TABLE CarData_ext (
    Car_Name VARCHAR2(50),
    Year NUMBER,
    Selling_Price NUMBER,
    Present_Price NUMBER,
    Kms_Driven NUMBER,
    Fuel_Type VARCHAR2(10),
    Seller_Type VARCHAR2(10),
    Transmission VARCHAR2(10),
    Owner NUMBER
)
ORGANIZATION EXTERNAL (
    TYPE ORACLE_LOADER
    DEFAULT DIRECTORY my_dir
    ACCESS PARAMETERS (
        records delimited by newline
        fields terminated by ',' optionally enclosed by '"'
    )
    LOCATION ('cardata.csv')
)
REJECT LIMIT UNLIMITED;

--Create Directory Object--
CREATE OR REPLACE DIRECTORY my_dir AS 'M:\Y3S2\AdvanceDB\Assgm\cardatabase';

--Insert Data into Internal/Actual Table--
INSERT INTO CarData
SELECT * FROM CarData_ext;