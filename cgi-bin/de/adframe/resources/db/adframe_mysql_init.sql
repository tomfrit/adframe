#############################################################################
#																			#
#   ADFRAME-COMPONENTS										   				#
#																			#
#############################################################################
	
#############################################################################
#																			#
# ADFRAME_USER																#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_USER														#
# 	===================														#
#																			#
 	drop table if exists ADFRAME_USER;
	create table ADFRAME_USER 
	(
		ADFRAME_USER_ID				INT NOT NULL PRIMARY KEY auto_increment	,
		ADFRAME_CHANNEL				CHAR(64) not NULL,
		ACCOUNT_NO					CHAR(127),
		GENDER						CHAR(32),
		TITLE	      				CHAR(127),
		FIRSTNAME      				CHAR(127),
	  	NAME           				CHAR(127),
		STREET          			CHAR(127),
   		ZIPCODE         			CHAR(32),
		CITY            			CHAR(127),
		COUNTRY         			CHAR(127),
		EMAIL           			CHAR(127) not NULL,
		FON							CHAR(127),
		FAX							CHAR(127),
		MOBIL						CHAR(127),
		BIRTHDAY					date,
		PROFESSION					CHAR(127),
		COMPANY						CHAR(127),
		ADFRAME_COMPANY_ID			INT,
		POSITION					CHAR(127),
		FON_COMPANY					CHAR(127),
		HOBBY						CHAR(127),
		EXTENSION					CHAR(127),
		EXTENSION_ID				CHAR(127),
		LOGIN						CHAR(32),
		PASSWD						CHAR(32),
		LICENCEKEY					CHAR(127),
		ROLES						VARCHAR(127) not NULL,
	  	CR_DATE        				DATE,
	  	ADMIT						INT
	);
	CREATE INDEX IDX_EMAIL ON ADFRAME_USER (EMAIL(10));
	CREATE INDEX IDX_ROLES ON ADFRAME_USER (ROLES);
#																			#
##############################################################################
#																			#
#   Table: ADFRAME_USERROLE													#
# 	=======================													#
#																			#
	drop table if exists ADFRAME_USERROLE;
	create table ADFRAME_USERROLE # 
	(
		ADFRAME_USERROLE_ID			INT NOT NULL PRIMARY KEY auto_increment,
		ADFRAME_CHANNEL				CHAR(64) not NULL,
		ROLE						CHAR(64),
		DESCR						CHAR(127),
	   	CR_DATE        				DATE,
	  	ADMIT						INT
	);
#																			#
#############################################################################




#############################################################################
#																			#
# ADFRAME_COMPANY															#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_COMPANY													#
# 	======================  												#
#																			#
	drop table if exists ADFRAME_COMPANY ;
	create table ADFRAME_COMPANY 
	( 
		ADFRAME_COMPANY_ID				int not null primary key auto_increment,
		ADFRAME_CHANNEL					char(64) not null,
		AREA							char(127),
		ACCOUNT_NO						CHAR(127),
		COMPANY							char(127),
		BRANCH							char(127),
		STREET          				CHAR(127),
  		ZIPCODE         				CHAR(32),
		CITY            				CHAR(127),
		COUNTRY         				CHAR(127),
		EMAIL           				CHAR(127),
		FON								CHAR(127),
		FAX								CHAR(127),
		BANK_ACCOUNTNAME				CHAR(127),
		BANK_ACCOUNTNUMBER				CHAR(127),
		BANK_INSTITUTE					CHAR(127),
		BANK_CODE						CHAR(127),
		SALES_TAX_ID					CHAR(127),
		COMMENT							text,
		CR_DATE							datetime,
		STATUS							char(127),
		IS_ACTIVE						INT					
	);
#																			#
#############################################################################




#############################################################################
#																			#
# ADFRAME_TEASERCMS															#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_TEASERCMS												#
# 	========================												#
#																			#
	drop table if exists ADFRAME_TEASERCMS;
	create table ADFRAME_TEASERCMS 
	(
		ADFRAME_TEASERCMS_ID		int not null primary key auto_increment,
		ADFRAME_CHANNEL				char(64) not null,
		AREA						char(127),
		ADFRAME_TEASERCMSCATEGORY_ID	int not null,
		ADFRAME_USER_ID				int,
		AUTHOR_NAME					char(127),
		AUTHOR_FIRSTNAME			char(127),
		AUTHOR_EMAIL				char(127),
		HEADLINE					varchar(127),
		TEASERTEXT					text,
		CONTENTTEXT_1				text,
		CONTENTTEXT_2				text,
		CONTENTTEXT_3				text,
		IMAGE_1						varchar(127),
		IMAGE_2						varchar(127),
		IMAGE_3						varchar(127),
		IMAGE_4						varchar(127),
		EXT_1						varchar(127),
		EXT_2						varchar(127),
		EXT_3						varchar(127),
		EXT_4						varchar(127),
		SEL_1						varchar(127),
		SEL_2						varchar(127),
		DIALOG						varchar(127),
		DIALOG_PARAM				varchar(127),
		RANK_NO						int,
		IS_ARCHIVE					int,
		CR_DATE						datetime,
		IS_ACTIVE					int
	);
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_TEASERCMSCATEGORY										#
#   ================================										#
#
	drop table if exists ADFRAME_TEASERCMSCATEGORY;
	create table ADFRAME_TEASERCMSCATEGORY 
	(
		ADFRAME_TEASERCMSCATEGORY_ID	int not null primary key auto_increment,
		ADFRAME_CHANNEL				char(64) not null,
		AREA						char(127),
		CATEGORY					char(127),
		CR_DATE						datetime,
		IS_ACTIVE					int
	);
#																			#
#############################################################################



#############################################################################
#																			#
# ADFRAME_SINGLECMS															#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_SINGLECMS												#
# 	========================												#
#																			#
	drop table if exists ADFRAME_SINGLECMS;
	create table ADFRAME_SINGLECMS 
	(
		ADFRAME_SINGLECMS_AREA		char(64) not null,
		ADFRAME_CHANNEL				char(64) not null,
		HEADLINE					varchar(127),
		TEASERTEXT					text,
		CONTENTTEXT_1				text,
		CONTENTTEXT_2				text,
		CONTENTTEXT_3				text,
		IMAGE_1						varchar(127),
		IMAGE_2						varchar(127),
		IMAGE_3						varchar(127),
		IMAGE_4						varchar(127),
		EXT_1						varchar(127),
		EXT_2						varchar(127),
		EXT_3						varchar(127),
		EXT_4						varchar(127),
		SEL_1						varchar(127),
		SEL_2						varchar(127),
		CR_DATE						datetime,
		IS_ACTIVE					int
	);
#																			#
#############################################################################



#############################################################################
#																			#
# ADFRAME_MCMS																#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_MCMS														#
# 	========================												#
#																			#
	drop table if exists ADFRAME_MCMS;
	create table ADFRAME_MCMS # generate
	(
		ADFRAME_MCMS_ID					int not null primary key auto_increment,
		ADFRAME_CHANNEL					char(64) not null,
		AREA							char(64) not null,
		CATEGORY						char(64),
		RANK_NO							int not null,
		PAGE_COUNT						int,
		P_STATUS						int,
		P_DATE							DATETIME,
		IS_ARCHIVE						int,
		A_NAME							char(127),
		A_EMAIL							char(127),
		SEL								char(127),	
		HEADLINE						char(127),
		ITEM_1_1						char(127),
		ITEM_1_2						char(127),
		ITEM_1_3						char(127),
		ITEM_1_4						char(127),
		ITEM_2_1						char(127),
		ITEM_2_2						char(127),
		ITEM_2_3						char(127),
		ITEM_2_4						char(127),
		ITEM_3_1						char(127),
		ITEM_3_2						char(127),
		ITEM_3_3						char(127),
		ITEM_3_4						char(127),
		IMG_0_0							char(64),
		IMG_0_1							char(64),
		IMG_0_2							char(64),
		IMG_0_3							char(64),
		IMG_0_4							char(64),
		IMG_1_0							char(64),
		IMG_1_1							char(64),
		IMG_1_2							char(64),
		IMG_1_3							char(64),
		IMG_1_4							char(64),
		IMG_2_1							char(64),
		IMG_2_2							char(64),
		IMG_2_3							char(64),
		IMG_2_4							char(64),
		IMG_3_1							char(64),
		IMG_3_2							char(64),
		IMG_3_3							char(64),
		IMG_3_4							char(64),	
		TEXT_0							text,
		TEXT_1_1						text,
		TEXT_1_2						text,
		TEXT_1_3						text,
		TEXT_1_4						text,
		TEXT_2_1						text,
		TEXT_2_2						text,
		TEXT_2_3						text,
		TEXT_2_4						text,
		TEXT_3_1						text,
		TEXT_3_2						text,
		TEXT_3_3						text,
		TEXT_3_4						text,	
		PARENT_RANK_NO					int,	
		VIDEO_1_1						char(64),
		PIC_VIDEO_1_1					char(64),
		ITEM_1_5						char(127),
		VIDEO_1_2						char(64),
		PIC_VIDEO_1_2					char(64),
		ITEM_1_6						char(127),
		SAISON							char(127),
		ETIKETT							char(127),
		ITEM_2_5						char(127),
		ITEM_2_6						char(127),	
		ITEM_2_7						char(127),
		ITEM_2_8						char(127),
		ITEM_2_9						char(127),		
		CR_DATE							datetime,
		IS_ACTIVE						int not null
	);
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_MCMS_EXTENSION											#
# 	=============================											#
#																			#
	drop table if exists ADFRAME_MCMS_EXT;
	create table ADFRAME_MCMS_EXT 
	(
		ADFRAME_MCMS_EXT_ID				int not null primary key auto_increment,
		ADFRAME_MCMS_ID					int not null,
		RANK_NO							int,
		ITEM_EXT_1						char(127),
		ITEM_EXT_2						char(127),
		IMG_EXT_1						char(64),
		IMG_EXT_2						char(64),
		TEXT_EXT						text,	
		CR_DATE							datetime,
		IS_ACTIVE						int not null,
		KEY IDX_ADFRAME_MCMS_ID (ADFRAME_MCMS_ID),
		KEY IDX_IS_ACTIVE (IS_ACTIVE)
	);
#																			#
#############################################################################


#############################################################################
#																			#
# ADFRAME_FORUM																#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_FORUM													#
# 	========================												#
#																			#
	drop table if exists ADFRAME_FORUM;
	create table ADFRAME_FORUM 
	(
		ADFRAME_FORUM_ID				int	not null primary key auto_increment,
		ADFRAME_CHANNEL					char(64) not null,
		AREA							char(127),
		ADFRAME_FORUMCATEGORY_ID		int not null,
		ADFRAME_USER_ID					int not null,
	 	FIRSTNAME   					char(127),
	    NAME        					char(127),
		LOGIN							char(127),
	    EMAIL       					char(127),
	    SUBJECT							char(127),
	    COMMENT							text,
	   	URL								char(127),
		CR_DATE 						datetime,
		IS_ACTIVE						int
	);
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_FORUMCOMMENT												#
#   ================================										#
#																			#
	drop table if exists ADFRAME_FORUMCOMMENT;
	create table ADFRAME_FORUMCOMMENT 
	(
		ADFRAME_FORUMCOMMENT_ID			int	not null primary key auto_increment,
		ADFRAME_CHANNEL					char(64) not null,
		AREA							char(127),
		ADFRAME_FORUM_ID				int not null,
		PARENT_COMMENT_ID				int,
		ADFRAME_USER_ID					int,
	 	FIRSTNAME   					char(127),
		NAME        					char(127),
		LOGIN							char(127),
		EMAIL 							char(127),
		COMMENT							text,
		COMMENTTYPE						char(32),
		CR_DATE							datetime,
		IS_ACTIVE						int
	);
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_FORUMCATEGORY											#
#   ================================										#
#
	drop table if exists ADFRAME_FORUMCATEGORY;
	create table ADFRAME_FORUMCATEGORY 
	(
		ADFRAME_FORUMCATEGORY_ID	int not null primary key auto_increment,
		ADFRAME_CHANNEL				char(64) not null,
		AREA						char(127),
		CATEGORY					char(127),
		TITLE						varchar(255),
		TEXT_0						text,
		TEXT_1						text,
		IMG_0						char(127),
		IMG_1						char(127),
		ITEM_1						varchar(255),
		ITEM_2						varchar(255),
		ITEM_3						varchar(255),
		ITEM_4						varchar(255),
		CR_DATE						datetime,
		IS_ACTIVE					int
	);
#																			#
##############################################################################


#############################################################################
#																			#
# ADFRAME_GUESTBOOK															#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_GUESTBOOK												#
# 	========================												#
#																			#
	drop table if exists ADFRAME_GUESTBOOK;
	create table ADFRAME_GUESTBOOK 
	(
		ADFRAME_GUESTBOOK_ID			int	not null primary key auto_increment,
		ADFRAME_CHANNEL					char(64) not null,
		AREA							char(127),
		ADFRAME_USER_ID					int,
	 	FIRSTNAME   					char(127),
	    NAME        					char(127),
		LOGIN							char(127),
	    EMAIL       					char(127),
	    SUBJECT							char(127),
	    COMMENT							text,
	   	URL								char(127),
		CR_DATE 						datetime,
		IS_ACTIVE						int
	);
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_GUESTBOOKCOMMENT											#
#   ================================										#
#																			#
	drop table if exists ADFRAME_GUESTBOOKCOMMENT;
	create table ADFRAME_GUESTBOOKCOMMENT 
	(
		ADFRAME_GUESTBOOKCOMMENT_ID		int	not null primary key auto_increment,
		ADFRAME_CHANNEL					char(64) not null,
		AREA							char(127),
		ADFRAME_GUESTBOOK_ID			int not null,
		ADFRAME_USER_ID					int,
	 	FIRSTNAME   					char(127),
		NAME        					char(127),
		LOGIN							char(127),
		EMAIL 							char(127),
		COMMENT							text,
		COMMENTTYPE						char(32),
		CR_DATE							datetime,
		IS_ACTIVE						int
	);
#																			#
#############################################################################
