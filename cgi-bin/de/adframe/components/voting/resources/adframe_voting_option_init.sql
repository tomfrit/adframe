CREATE TABLE ADFRAME_VOTING_OPTION #generate

 (
  ADFRAME_VOTING_OPTION_ID int(11) NOT NULL AUTO_INCREMENT  PRIMARY KEY,
  ADFRAME_VOTING_CATEGORY_ID int(11) NOT NULL,
  TITLE varchar(255) NOT NULL,
  ITEM_0 varchar(20) NOT NULL,
  VOTES int(11) NOT NULL,
  CR_DATE datetime NOT NULL,
  IS_ACTIVE int(11) NOT NULL
);