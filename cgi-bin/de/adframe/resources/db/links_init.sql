CREATE TABLE ADFRAME_LINKS #generate
	(
  ADFRAME_LINKS_ID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  TITLE varchar(255) NOT NULL,
  URL varchar(200) NOT NULL,
  DESCR text NOT NULL,
  ITEM_0 varchar(200) NOT NULL,
  ITEM_1 varchar(200) NOT NULL,
 IS_ACTIVE int(11) NOT NULL
);