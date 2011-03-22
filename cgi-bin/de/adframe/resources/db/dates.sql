#############################################################################
#																			#
# ADFRAME_DATES																#
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_DATES													#
# 	====================													#
#																			#
	drop table  if exists ADFRAME_DATES;
	create table ADFRAME_DATES #generate
	(
		ADFRAME_DATES_ID			int not null primary key auto_increment,
		ADFRAME_CHANNEL				char(64) not null,
		AREA						char(127),
		ADFRAME_DATESCATEGORY_ID	int not null,
		START_DATE					datetime,
		END_DATE					datetime,
		START_TIME					char(127),
		EVENT						char(127),
		LOCATION					char(127),
		CONTACT_PERSON				char(127),
		STREET						char(127),
		ZIPCODE						char(32),
		CITY						char(127),
		COUNTRY						char(127),
		FON							char(127),
		FAX							char(127),
		URL							char(127),
		EMAIL						char(127),
		PRICE						char(127),
		DESCR						text,
		TEASERTEXT					text,
		IMAGE_1						char(127),
		IMAGE_2						char(127),
		CR_DATE						datetime,
		IS_ACTIVE					int
	);
#																			#
#############################################################################
#																			#
#   Table: ADFRAME_DATESCATEGORY											#
#   ============================											#
#
	drop table  if exists ADFRAME_DATESCATEGORY;
	create table ADFRAME_DATESCATEGORY #generate
	(
		ADFRAME_DATESCATEGORY_ID	int not null primary key auto_increment,
		ADFRAME_CHANNEL				char(64) not null,
		AREA						char(127),
		CATEGORY					char(127),
		CR_DATE						datetime,
		IS_ACTIVE					int
	);
#																			#
#############################################################################

