-- SCHEMA MYDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS MYDB ;

-- -----------------------------------------------------
-- SCHEMA MYDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS MYDB DEFAULT CHARACTER SET UTF8 COLLATE UTF8_GENERAL_CI ;
USE MYDB ;

CREATE TABLE IF NOT EXISTS MYDB. AUTHOR 
  (
    ID_AUTHOR   INT NOT NULL AUTO_INCREMENT ,
    NAME        VARCHAR (200) ,
    LAST_NAME   VARCHAR (200) ,
    EMAIL       VARCHAR (100) ,
    PHONE       VARCHAR (11) ,
    NATIONALITY VARCHAR (100) ,
    DATA_BIRTH  DATE ,
    GENDER      VARCHAR (100) ,
    ADDRESS     VARCHAR (200) ,
    SPOUSE      VARCHAR (200) ,
	PRIMARY KEY ( ID_AUTHOR )
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. BOOK 
  (
    ID_BOOK INT NOT NULL AUTO_INCREMENT ,
    TITLE VARCHAR(100) ,
    PRICE FLOAT ,
    ISBN                INT ,
    NUMBER_PAGES        INT ,
    DESCRIPTION         VARCHAR (300) ,
    IMAGE_DIRETORY      VARCHAR (500) ,
    LIKEBOOK             	INT ,
    ID_AUTHOR           INT NOT NULL ,
    ID_PUBLISHING_HOUSE INT NOT NULL ,
    ID_CATEGORY         INT NOT NULL ,
	PRIMARY KEY(ID_BOOK)
  ) ;
/*CREATE UNIQUE INDEX BOOK__IDX ON MYDB. BOOK 
  (
    ID_AUTHOR ASC
  )
  ;

CREATE UNIQUE INDEX BOOK__IDXV2 ON MYDB. BOOK 
  (
    ID_PUBLISHING_HOUSE ASC
  )
  ;  */

CREATE TABLE IF NOT EXISTS MYDB. CATEGORY 
  (
    ID_CATEGORY INT NOT NULL AUTO_INCREMENT ,
    DESCRIPTION VARCHAR (200),
	PRIMARY KEY ( ID_CATEGORY )
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. COMENTARY 
  (
    ID_COMENTARY INT NOT NULL AUTO_INCREMENT ,
    DESCRIPTION  VARCHAR (450) ,
    DATECOMENTARY       DATE ,
    CUSTOMER_ID  INT NOT NULL ,
    ID_BOOK      INT NOT NULL ,
	PRIMARY KEY ( ID_COMENTARY )
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. CUSTOMER 
  (
    ID       INT NOT NULL AUTO_INCREMENT ,
	IS_ADMIN INT NOT NULL,
    LOGIN    VARCHAR (40) ,
    PASSWORD VARCHAR (10) ,
    NAME     VARCHAR (100) ,
    EMAIL    VARCHAR (150) ,
    GENDER   VARCHAR (9) ,
    PHONE   VARCHAR (9) ,
    ADDRESS  VARCHAR (200),	
	PRIMARY KEY ( ID )
  ) ;


CREATE TABLE IF NOT EXISTS MYDB. PROMOTION
  (
    ID_PROMOTION        INT NOT NULL AUTO_INCREMENT ,
    INIT_DATE           DATE ,
    END_DATE            DATE ,
    TYPEDISCOUNNT       VARCHAR (100) ,
    DISCOUNTVALUE       DOUBLE ,
    ID_AUTHOR           INT NOT NULL ,
    ID_BOOK             INT NOT NULL ,
    ID_PUBLISHING_HOUSE INT NOT NULL ,
    ID_CATEGORY         INT NOT NULL ,
	PRIMARY KEY ( ID_PROMOTION, ID_BOOK )
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. PUBLISHING_HOUSE 
  (
    ID_PUBLISHING_HOUSE INT NOT NULL AUTO_INCREMENT ,
    NAME                VARCHAR (200) ,
    COMPANY_NAME        VARCHAR (200) ,
    EMAIL               VARCHAR (200) ,
    CNPJ                VARCHAR (100) ,
    IE                  VARCHAR (45) ,
    SITE                VARCHAR (100) ,
    PHONE               VARCHAR (11) ,
    ADDRESS             VARCHAR (500),
	PRIMARY KEY (ID_PUBLISHING_HOUSE )
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. PURCHASE 
  (
    PURCHASE_ID  INT NOT NULL AUTO_INCREMENT ,
    PURCHASE_DATE       DATE ,
    TOTAL        	DOUBLE,
    ID_PROMOTION INT NOT NULL ,
    ID_BOOK      INT NOT NULL ,
    CUSTOMER_ID  INT,
	PRIMARY KEY ( PURCHASE_ID )
  ) ;
CREATE UNIQUE INDEX PURCHASE__IDX ON MYDB. PURCHASE
  (
    ID_PROMOTION ASC , ID_BOOK ASC
  )
  ;

CREATE TABLE IF NOT EXISTS MYDB. PURCHASE_HISTORY
  (
    DATE_HISTORY         DATE ,
    DATE_PURCHASE        DATE ,
    TOTAL                DOUBLE ,
    PURCHASE_PURCHASE_ID INT NOT NULL
  ) ;
CREATE UNIQUE INDEX PURCHASE_HISTORY__IDX ON MYDB. PURCHASE_HISTORY
  (
    PURCHASE_PURCHASE_ID ASC
  )
  ;

CREATE TABLE IF NOT EXISTS MYDB. RECLAMATION_COMPLANCE
  (
    ID_RECLAMATION_COMPLANCE INT NOT NULL AUTO_INCREMENT ,
    DESCRIPTION              VARCHAR (200) ,
    DATE_RECLAMATION_COMPLANCE DATE ,
    CUSTOMER_ID              INT NOT NULL ,
    ID_TYPE                  INT NOT NULL,
	PRIMARY KEY ( ID_RECLAMATION_COMPLANCE, CUSTOMER_ID )
  ) ;

CREATE UNIQUE INDEX RECLAMATION_COMPLANCE__IDX ON MYDB. RECLAMATION_COMPLANCE
  (
    ID_TYPE ASC
  );  


CREATE TABLE IF NOT EXISTS MYDB. SHOPPING_CART
  (
    DATE_SHOPPING_CART      DATE ,
    QUANTIDADE  INT ,
    ID_BOOK     INT NOT NULL ,
    CUSTOMER_ID INT NOT NULL
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. STORE
  (
    ID           INT NOT NULL AUTO_INCREMENT ,
    NAME         VARCHAR (200) ,
    COMPANY_NAME VARCHAR (200) ,
    PHONE        VARCHAR (11) ,
    EMAIL        VARCHAR (100),
	PRIMARY KEY ( ID )
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. TYPE_RECLAMATION_COMPLANCE
  (
    ID_TYPE     INT NOT NULL AUTO_INCREMENT ,
    DESCRIPTION VARCHAR (10) ,
	PRIMARY KEY ( ID_TYPE ) 
  ) ;

CREATE TABLE IF NOT EXISTS MYDB. WISH_LIST
  (
    ID_LIST     INT NOT NULL AUTO_INCREMENT ,
    DATE_WISH_LIST   DATE NOT NULL ,
    CUSTOMER_ID INT NOT NULL ,
    ID_BOOK     INT NOT NULL ,
	PRIMARY KEY ( ID_LIST )
  ) ;

ALTER TABLE MYDB. BOOK ADD CONSTRAINT BOOK_AUTHOR_FK FOREIGN KEY ( ID_AUTHOR )
REFERENCES MYDB. AUTHOR ( ID_AUTHOR ) ;


ALTER TABLE MYDB. BOOK ADD CONSTRAINT BOOK_CATEGORY_FK FOREIGN KEY ( ID_CATEGORY )
REFERENCES MYDB. CATEGORY ( ID_CATEGORY ) ;

ALTER TABLE MYDB. BOOK ADD CONSTRAINT BOOK_PUBLISHING_HOUSE_FK FOREIGN KEY (
ID_PUBLISHING_HOUSE ) REFERENCES MYDB. PUBLISHING_HOUSE ( ID_PUBLISHING_HOUSE ) ;