CREATE TABLE ADFRAME_FOTO_RATING #generate
(
  ADFRAME_FOTO_RATING_ID int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ADFRAME_USER_ID int(11) NOT NULL,
  ADFRAME_USER_FOTO_ID int(11) NOT NULL,
  RATING int(11) NOT NULL,
  CR_DATE datetime NOT NULL
)