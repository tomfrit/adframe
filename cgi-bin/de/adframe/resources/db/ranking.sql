CREATE TABLE ADFRAME_MCMS_RATING #generate

(
  id int(11) NOT NULL PRIMARY KEY auto_increment,	,
  login int(11) NOT NULL,
  mcms_id int(11) NOT NULL,
  rating int(11) NOT NULL,
  CR_DATE datetime NOT NULL

) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
