#
#
#
drop table if exists IMPORT_1_completes;
create table IMPORT_1_completes #generate
(
	IMPORT_1_completes_ID		int not null primary key auto_increment,
	ADFRAME_COMPANY_ID						int,
	ADFRAME_BRAND_ID						int,
	BRAND								char(255),
	MODEL								char(255),
	VERTRIEB							char(255),
	HOMEPAGE							char(255),
	PREIS								char(32),
	
	RADGROESSE							char(32),
	BESCHREIBUNG							text,
	ANWENDUNG							char(255),
	GEWICHT								char(255),

	RAHMEN								text,
	GABEL								char(255),
	LENKER								char(255),

	VORBAU								char(255),
	STEUERSATZ							char(255),
	GRIFFE								char(255),

	KURBELN								char(255),
	KURBELLAENGE							char(32),
	BB								char(255),
	INNENLAGER							char(255),
	PEDALE								char(255),
	KETTENBLATT							char(255),
	RITZEL								char(255),
	KETTE								char(255),

	VRNABE								char(255),
	HRNABE								char(255),
	VACHSE								char(255),
	HACHSE								char(255),
	FELGEN								char(255),
	VREIFEN								char(255),
	HREIFEN								char(255),

	SATTEL								char(255),
	SATTELSTUETZE							char(255),
	SATTELKLEMME							char(255),

	BREMSEN								char(255),
	GYRO								char(255),
	BREMSHEBEL							char(255),

	PEGS								char(255),
	EXTRAS								text,
	FARBEN								char(255),
	TTLAENGEN							char(255),
	STEUERROHRWINKEL							char(255),
	KETTENSTREBENLAENGE							char(255),
	TRETLAGERHOEHE							char(255),
	SATTELROHRWINKEL						char(255),

	LENKERHOEHE							char(255),
	LENKERBREITE							char(255),
	BACKSWEEP							char(255),
	UPSWEEP								char(255),

	ITEM_0								char(255),	
	ITEM_1								char(255),
	ITEM_2								char(255),
	ITEM_3								char(255),
	ITEM_4								char(255),
	ITEM_5								char(255),

	PREIS_REAL							real,						
	BILD1								char(255),
	BILD2								char(255),
	BILD3								char(255),
	BILD4								char(255),
	BILD5								char(255),
	CR_DATE								datetime,
	IS_ACTIVE							int
	
);
#
#
