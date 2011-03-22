package ClassADFRAME_MCMS;
use de::adframe::lib::db::DbAdapter; @ISA=qw(DbAdapter); 

$SQL_COLS = 'ADFRAME_MCMS_ID,ADFRAME_CHANNEL,AREA,CATEGORY,RANK_NO,PAGE_COUNT,P_STATUS,P_DATE,IS_ARCHIVE,A_NAME,A_EMAIL,SEL,SEL_2,HEADLINE,ITEM_1_1,ITEM_1_2,ITEM_1_3,ITEM_1_4,ITEM_2_1,ITEM_2_2,ITEM_2_3,ITEM_2_4,ITEM_3_1,ITEM_3_2,ITEM_3_3,ITEM_3_4,IMG_0_0,IMG_0_1,IMG_0_2,IMG_0_3,IMG_0_4,IMG_1_0,IMG_1_1,IMG_1_2,IMG_1_3,IMG_1_4,IMG_2_1,IMG_2_2,IMG_2_3,IMG_2_4,IMG_3_1,IMG_3_2,IMG_3_3,IMG_3_4,TEXT_0,TEXT_1_1,TEXT_1_2,TEXT_1_3,TEXT_1_4,TEXT_2_1,TEXT_2_2,TEXT_2_3,TEXT_2_4,TEXT_3_1,TEXT_3_2,TEXT_3_3,TEXT_3_4,PARENT_RANK_NO,VIDEO_1_1,PIC_VIDEO_1_1,ITEM_1_5,VIDEO_1_2,PIC_VIDEO_1_2,ITEM_1_6,SAISON,ETIKETT,ITEM_2_5,ITEM_2_6,ITEM_2_7,ITEM_2_8,ITEM_2_9,TEXT_4_0,TEXT_4_1,TEXT_4_2,TEXT_4_3,TEXT_4_4,TEXT_5_0,TEXT_5_1,TEXT_5_2,TEXT_5_3,TEXT_5_4,ITEM_4_0,ITEM_4_1,ITEM_4_2,ITEM_4_3,ITEM_4_4,ITEM_5_0,ITEM_5_1,ITEM_5_2,ITEM_5_3,ITEM_5_4,IMG_4_0,IMG_4_1,IMG_4_2,IMG_4_3,IMG_4_4,IMG_5_0,IMG_5_1,IMG_5_2,IMG_5_3,IMG_5_4,SEL_3,SEL_4,VIEW_COUNT,VIEW_COUNT_2,VIEW_COUNT_3,VIEW_COUNT_4,CR_DATE,IS_ACTIVE';

sub getADFRAME_MCMS_ID
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_MCMS_ID'};
}

sub setADFRAME_CHANNEL
{
	my $this	= shift;
	$this->{col}->{'ADFRAME_CHANNEL'} = shift;
}
sub getADFRAME_CHANNEL
{
	my $this	= shift;
	return $this->{col}->{'ADFRAME_CHANNEL'};
}

sub setAREA
{
	my $this	= shift;
	$this->{col}->{'AREA'} = shift;
}
sub getAREA
{
	my $this	= shift;
	return $this->{col}->{'AREA'};
}

sub setCATEGORY
{
	my $this	= shift;
	$this->{col}->{'CATEGORY'} = shift;
}
sub getCATEGORY
{
	my $this	= shift;
	return $this->{col}->{'CATEGORY'};
}

sub setRANK_NO
{
	my $this	= shift;
	$this->{col}->{'RANK_NO'} = shift;
}
sub getRANK_NO
{
	my $this	= shift;
	return $this->{col}->{'RANK_NO'};
}

sub setPAGE_COUNT
{
	my $this	= shift;
	$this->{col}->{'PAGE_COUNT'} = shift;
}
sub getPAGE_COUNT
{
	my $this	= shift;
	return $this->{col}->{'PAGE_COUNT'};
}

sub setP_STATUS
{
	my $this	= shift;
	$this->{col}->{'P_STATUS'} = shift;
}
sub getP_STATUS
{
	my $this	= shift;
	return $this->{col}->{'P_STATUS'};
}

sub setP_DATE
{
	my $this	= shift;
	$this->{col}->{'P_DATE'} = shift;
}
sub getP_DATE
{
	my $this	= shift;
	return $this->{col}->{'P_DATE'};
}

sub setIS_ARCHIVE
{
	my $this	= shift;
	$this->{col}->{'IS_ARCHIVE'} = shift;
}
sub getIS_ARCHIVE
{
	my $this	= shift;
	return $this->{col}->{'IS_ARCHIVE'};
}

sub setA_NAME
{
	my $this	= shift;
	$this->{col}->{'A_NAME'} = shift;
}
sub getA_NAME
{
	my $this	= shift;
	return $this->{col}->{'A_NAME'};
}

sub setA_EMAIL
{
	my $this	= shift;
	$this->{col}->{'A_EMAIL'} = shift;
}
sub getA_EMAIL
{
	my $this	= shift;
	return $this->{col}->{'A_EMAIL'};
}

sub setSEL
{
	my $this	= shift;
	$this->{col}->{'SEL'} = shift;
}
sub getSEL
{
	my $this	= shift;
	return $this->{col}->{'SEL'};
}

sub setSEL_2
{
	my $this	= shift;
	$this->{col}->{'SEL_2'} = shift;
}
sub getSEL_2
{
	my $this	= shift;
	return $this->{col}->{'SEL_2'};
}

sub setHEADLINE
{
	my $this	= shift;
	$this->{col}->{'HEADLINE'} = shift;
}
sub getHEADLINE
{
	my $this	= shift;
	return $this->{col}->{'HEADLINE'};
}

sub setITEM_1_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_1_1'} = shift;
}
sub getITEM_1_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1_1'};
}

sub setITEM_1_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_1_2'} = shift;
}
sub getITEM_1_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1_2'};
}

sub setITEM_1_3
{
	my $this	= shift;
	$this->{col}->{'ITEM_1_3'} = shift;
}
sub getITEM_1_3
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1_3'};
}

sub setITEM_1_4
{
	my $this	= shift;
	$this->{col}->{'ITEM_1_4'} = shift;
}
sub getITEM_1_4
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1_4'};
}

sub setITEM_2_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_1'} = shift;
}
sub getITEM_2_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_1'};
}

sub setITEM_2_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_2'} = shift;
}
sub getITEM_2_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_2'};
}

sub setITEM_2_3
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_3'} = shift;
}
sub getITEM_2_3
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_3'};
}

sub setITEM_2_4
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_4'} = shift;
}
sub getITEM_2_4
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_4'};
}

sub setITEM_3_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_3_1'} = shift;
}
sub getITEM_3_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_3_1'};
}

sub setITEM_3_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_3_2'} = shift;
}
sub getITEM_3_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_3_2'};
}

sub setITEM_3_3
{
	my $this	= shift;
	$this->{col}->{'ITEM_3_3'} = shift;
}
sub getITEM_3_3
{
	my $this	= shift;
	return $this->{col}->{'ITEM_3_3'};
}

sub setITEM_3_4
{
	my $this	= shift;
	$this->{col}->{'ITEM_3_4'} = shift;
}
sub getITEM_3_4
{
	my $this	= shift;
	return $this->{col}->{'ITEM_3_4'};
}

sub setIMG_0_0
{
	my $this	= shift;
	$this->{col}->{'IMG_0_0'} = shift;
}
sub getIMG_0_0
{
	my $this	= shift;
	return $this->{col}->{'IMG_0_0'};
}

sub setIMG_0_1
{
	my $this	= shift;
	$this->{col}->{'IMG_0_1'} = shift;
}
sub getIMG_0_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_0_1'};
}

sub setIMG_0_2
{
	my $this	= shift;
	$this->{col}->{'IMG_0_2'} = shift;
}
sub getIMG_0_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_0_2'};
}

sub setIMG_0_3
{
	my $this	= shift;
	$this->{col}->{'IMG_0_3'} = shift;
}
sub getIMG_0_3
{
	my $this	= shift;
	return $this->{col}->{'IMG_0_3'};
}

sub setIMG_0_4
{
	my $this	= shift;
	$this->{col}->{'IMG_0_4'} = shift;
}
sub getIMG_0_4
{
	my $this	= shift;
	return $this->{col}->{'IMG_0_4'};
}

sub setIMG_1_0
{
	my $this	= shift;
	$this->{col}->{'IMG_1_0'} = shift;
}
sub getIMG_1_0
{
	my $this	= shift;
	return $this->{col}->{'IMG_1_0'};
}

sub setIMG_1_1
{
	my $this	= shift;
	$this->{col}->{'IMG_1_1'} = shift;
}
sub getIMG_1_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_1_1'};
}

sub setIMG_1_2
{
	my $this	= shift;
	$this->{col}->{'IMG_1_2'} = shift;
}
sub getIMG_1_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_1_2'};
}

sub setIMG_1_3
{
	my $this	= shift;
	$this->{col}->{'IMG_1_3'} = shift;
}
sub getIMG_1_3
{
	my $this	= shift;
	return $this->{col}->{'IMG_1_3'};
}

sub setIMG_1_4
{
	my $this	= shift;
	$this->{col}->{'IMG_1_4'} = shift;
}
sub getIMG_1_4
{
	my $this	= shift;
	return $this->{col}->{'IMG_1_4'};
}

sub setIMG_2_1
{
	my $this	= shift;
	$this->{col}->{'IMG_2_1'} = shift;
}
sub getIMG_2_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_2_1'};
}

sub setIMG_2_2
{
	my $this	= shift;
	$this->{col}->{'IMG_2_2'} = shift;
}
sub getIMG_2_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_2_2'};
}

sub setIMG_2_3
{
	my $this	= shift;
	$this->{col}->{'IMG_2_3'} = shift;
}
sub getIMG_2_3
{
	my $this	= shift;
	return $this->{col}->{'IMG_2_3'};
}

sub setIMG_2_4
{
	my $this	= shift;
	$this->{col}->{'IMG_2_4'} = shift;
}
sub getIMG_2_4
{
	my $this	= shift;
	return $this->{col}->{'IMG_2_4'};
}

sub setIMG_3_1
{
	my $this	= shift;
	$this->{col}->{'IMG_3_1'} = shift;
}
sub getIMG_3_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_3_1'};
}

sub setIMG_3_2
{
	my $this	= shift;
	$this->{col}->{'IMG_3_2'} = shift;
}
sub getIMG_3_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_3_2'};
}

sub setIMG_3_3
{
	my $this	= shift;
	$this->{col}->{'IMG_3_3'} = shift;
}
sub getIMG_3_3
{
	my $this	= shift;
	return $this->{col}->{'IMG_3_3'};
}

sub setIMG_3_4
{
	my $this	= shift;
	$this->{col}->{'IMG_3_4'} = shift;
}
sub getIMG_3_4
{
	my $this	= shift;
	return $this->{col}->{'IMG_3_4'};
}

sub setTEXT_0
{
	my $this	= shift;
	$this->{col}->{'TEXT_0'} = shift;
}
sub getTEXT_0
{
	my $this	= shift;
	return $this->{col}->{'TEXT_0'};
}

sub setTEXT_1_1
{
	my $this	= shift;
	$this->{col}->{'TEXT_1_1'} = shift;
}
sub getTEXT_1_1
{
	my $this	= shift;
	return $this->{col}->{'TEXT_1_1'};
}

sub setTEXT_1_2
{
	my $this	= shift;
	$this->{col}->{'TEXT_1_2'} = shift;
}
sub getTEXT_1_2
{
	my $this	= shift;
	return $this->{col}->{'TEXT_1_2'};
}

sub setTEXT_1_3
{
	my $this	= shift;
	$this->{col}->{'TEXT_1_3'} = shift;
}
sub getTEXT_1_3
{
	my $this	= shift;
	return $this->{col}->{'TEXT_1_3'};
}

sub setTEXT_1_4
{
	my $this	= shift;
	$this->{col}->{'TEXT_1_4'} = shift;
}
sub getTEXT_1_4
{
	my $this	= shift;
	return $this->{col}->{'TEXT_1_4'};
}

sub setTEXT_2_1
{
	my $this	= shift;
	$this->{col}->{'TEXT_2_1'} = shift;
}
sub getTEXT_2_1
{
	my $this	= shift;
	return $this->{col}->{'TEXT_2_1'};
}

sub setTEXT_2_2
{
	my $this	= shift;
	$this->{col}->{'TEXT_2_2'} = shift;
}
sub getTEXT_2_2
{
	my $this	= shift;
	return $this->{col}->{'TEXT_2_2'};
}

sub setTEXT_2_3
{
	my $this	= shift;
	$this->{col}->{'TEXT_2_3'} = shift;
}
sub getTEXT_2_3
{
	my $this	= shift;
	return $this->{col}->{'TEXT_2_3'};
}

sub setTEXT_2_4
{
	my $this	= shift;
	$this->{col}->{'TEXT_2_4'} = shift;
}
sub getTEXT_2_4
{
	my $this	= shift;
	return $this->{col}->{'TEXT_2_4'};
}

sub setTEXT_3_1
{
	my $this	= shift;
	$this->{col}->{'TEXT_3_1'} = shift;
}
sub getTEXT_3_1
{
	my $this	= shift;
	return $this->{col}->{'TEXT_3_1'};
}

sub setTEXT_3_2
{
	my $this	= shift;
	$this->{col}->{'TEXT_3_2'} = shift;
}
sub getTEXT_3_2
{
	my $this	= shift;
	return $this->{col}->{'TEXT_3_2'};
}

sub setTEXT_3_3
{
	my $this	= shift;
	$this->{col}->{'TEXT_3_3'} = shift;
}
sub getTEXT_3_3
{
	my $this	= shift;
	return $this->{col}->{'TEXT_3_3'};
}

sub setTEXT_3_4
{
	my $this	= shift;
	$this->{col}->{'TEXT_3_4'} = shift;
}
sub getTEXT_3_4
{
	my $this	= shift;
	return $this->{col}->{'TEXT_3_4'};
}

sub setPARENT_RANK_NO
{
	my $this	= shift;
	$this->{col}->{'PARENT_RANK_NO'} = shift;
}
sub getPARENT_RANK_NO
{
	my $this	= shift;
	return $this->{col}->{'PARENT_RANK_NO'};
}

sub setVIDEO_1_1
{
	my $this	= shift;
	$this->{col}->{'VIDEO_1_1'} = shift;
}
sub getVIDEO_1_1
{
	my $this	= shift;
	return $this->{col}->{'VIDEO_1_1'};
}

sub setPIC_VIDEO_1_1
{
	my $this	= shift;
	$this->{col}->{'PIC_VIDEO_1_1'} = shift;
}
sub getPIC_VIDEO_1_1
{
	my $this	= shift;
	return $this->{col}->{'PIC_VIDEO_1_1'};
}

sub setITEM_1_5
{
	my $this	= shift;
	$this->{col}->{'ITEM_1_5'} = shift;
}
sub getITEM_1_5
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1_5'};
}

sub setVIDEO_1_2
{
	my $this	= shift;
	$this->{col}->{'VIDEO_1_2'} = shift;
}
sub getVIDEO_1_2
{
	my $this	= shift;
	return $this->{col}->{'VIDEO_1_2'};
}

sub setPIC_VIDEO_1_2
{
	my $this	= shift;
	$this->{col}->{'PIC_VIDEO_1_2'} = shift;
}
sub getPIC_VIDEO_1_2
{
	my $this	= shift;
	return $this->{col}->{'PIC_VIDEO_1_2'};
}

sub setITEM_1_6
{
	my $this	= shift;
	$this->{col}->{'ITEM_1_6'} = shift;
}
sub getITEM_1_6
{
	my $this	= shift;
	return $this->{col}->{'ITEM_1_6'};
}

sub setSAISON
{
	my $this	= shift;
	$this->{col}->{'SAISON'} = shift;
}
sub getSAISON
{
	my $this	= shift;
	return $this->{col}->{'SAISON'};
}

sub setETIKETT
{
	my $this	= shift;
	$this->{col}->{'ETIKETT'} = shift;
}
sub getETIKETT
{
	my $this	= shift;
	return $this->{col}->{'ETIKETT'};
}

sub setITEM_2_5
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_5'} = shift;
}
sub getITEM_2_5
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_5'};
}

sub setITEM_2_6
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_6'} = shift;
}
sub getITEM_2_6
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_6'};
}

sub setITEM_2_7
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_7'} = shift;
}
sub getITEM_2_7
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_7'};
}

sub setITEM_2_8
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_8'} = shift;
}
sub getITEM_2_8
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_8'};
}

sub setITEM_2_9
{
	my $this	= shift;
	$this->{col}->{'ITEM_2_9'} = shift;
}
sub getITEM_2_9
{
	my $this	= shift;
	return $this->{col}->{'ITEM_2_9'};
}

sub setTEXT_4_0
{
	my $this	= shift;
	$this->{col}->{'TEXT_4_0'} = shift;
}
sub getTEXT_4_0
{
	my $this	= shift;
	return $this->{col}->{'TEXT_4_0'};
}

sub setTEXT_4_1
{
	my $this	= shift;
	$this->{col}->{'TEXT_4_1'} = shift;
}
sub getTEXT_4_1
{
	my $this	= shift;
	return $this->{col}->{'TEXT_4_1'};
}

sub setTEXT_4_2
{
	my $this	= shift;
	$this->{col}->{'TEXT_4_2'} = shift;
}
sub getTEXT_4_2
{
	my $this	= shift;
	return $this->{col}->{'TEXT_4_2'};
}

sub setTEXT_4_3
{
	my $this	= shift;
	$this->{col}->{'TEXT_4_3'} = shift;
}
sub getTEXT_4_3
{
	my $this	= shift;
	return $this->{col}->{'TEXT_4_3'};
}

sub setTEXT_4_4
{
	my $this	= shift;
	$this->{col}->{'TEXT_4_4'} = shift;
}
sub getTEXT_4_4
{
	my $this	= shift;
	return $this->{col}->{'TEXT_4_4'};
}

sub setTEXT_5_0
{
	my $this	= shift;
	$this->{col}->{'TEXT_5_0'} = shift;
}
sub getTEXT_5_0
{
	my $this	= shift;
	return $this->{col}->{'TEXT_5_0'};
}

sub setTEXT_5_1
{
	my $this	= shift;
	$this->{col}->{'TEXT_5_1'} = shift;
}
sub getTEXT_5_1
{
	my $this	= shift;
	return $this->{col}->{'TEXT_5_1'};
}

sub setTEXT_5_2
{
	my $this	= shift;
	$this->{col}->{'TEXT_5_2'} = shift;
}
sub getTEXT_5_2
{
	my $this	= shift;
	return $this->{col}->{'TEXT_5_2'};
}

sub setTEXT_5_3
{
	my $this	= shift;
	$this->{col}->{'TEXT_5_3'} = shift;
}
sub getTEXT_5_3
{
	my $this	= shift;
	return $this->{col}->{'TEXT_5_3'};
}

sub setTEXT_5_4
{
	my $this	= shift;
	$this->{col}->{'TEXT_5_4'} = shift;
}
sub getTEXT_5_4
{
	my $this	= shift;
	return $this->{col}->{'TEXT_5_4'};
}

sub setITEM_4_0
{
	my $this	= shift;
	$this->{col}->{'ITEM_4_0'} = shift;
}
sub getITEM_4_0
{
	my $this	= shift;
	return $this->{col}->{'ITEM_4_0'};
}

sub setITEM_4_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_4_1'} = shift;
}
sub getITEM_4_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_4_1'};
}

sub setITEM_4_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_4_2'} = shift;
}
sub getITEM_4_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_4_2'};
}

sub setITEM_4_3
{
	my $this	= shift;
	$this->{col}->{'ITEM_4_3'} = shift;
}
sub getITEM_4_3
{
	my $this	= shift;
	return $this->{col}->{'ITEM_4_3'};
}

sub setITEM_4_4
{
	my $this	= shift;
	$this->{col}->{'ITEM_4_4'} = shift;
}
sub getITEM_4_4
{
	my $this	= shift;
	return $this->{col}->{'ITEM_4_4'};
}

sub setITEM_5_0
{
	my $this	= shift;
	$this->{col}->{'ITEM_5_0'} = shift;
}
sub getITEM_5_0
{
	my $this	= shift;
	return $this->{col}->{'ITEM_5_0'};
}

sub setITEM_5_1
{
	my $this	= shift;
	$this->{col}->{'ITEM_5_1'} = shift;
}
sub getITEM_5_1
{
	my $this	= shift;
	return $this->{col}->{'ITEM_5_1'};
}

sub setITEM_5_2
{
	my $this	= shift;
	$this->{col}->{'ITEM_5_2'} = shift;
}
sub getITEM_5_2
{
	my $this	= shift;
	return $this->{col}->{'ITEM_5_2'};
}

sub setITEM_5_3
{
	my $this	= shift;
	$this->{col}->{'ITEM_5_3'} = shift;
}
sub getITEM_5_3
{
	my $this	= shift;
	return $this->{col}->{'ITEM_5_3'};
}

sub setITEM_5_4
{
	my $this	= shift;
	$this->{col}->{'ITEM_5_4'} = shift;
}
sub getITEM_5_4
{
	my $this	= shift;
	return $this->{col}->{'ITEM_5_4'};
}

sub setIMG_4_0
{
	my $this	= shift;
	$this->{col}->{'IMG_4_0'} = shift;
}
sub getIMG_4_0
{
	my $this	= shift;
	return $this->{col}->{'IMG_4_0'};
}

sub setIMG_4_1
{
	my $this	= shift;
	$this->{col}->{'IMG_4_1'} = shift;
}
sub getIMG_4_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_4_1'};
}

sub setIMG_4_2
{
	my $this	= shift;
	$this->{col}->{'IMG_4_2'} = shift;
}
sub getIMG_4_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_4_2'};
}

sub setIMG_4_3
{
	my $this	= shift;
	$this->{col}->{'IMG_4_3'} = shift;
}
sub getIMG_4_3
{
	my $this	= shift;
	return $this->{col}->{'IMG_4_3'};
}

sub setIMG_4_4
{
	my $this	= shift;
	$this->{col}->{'IMG_4_4'} = shift;
}
sub getIMG_4_4
{
	my $this	= shift;
	return $this->{col}->{'IMG_4_4'};
}

sub setIMG_5_0
{
	my $this	= shift;
	$this->{col}->{'IMG_5_0'} = shift;
}
sub getIMG_5_0
{
	my $this	= shift;
	return $this->{col}->{'IMG_5_0'};
}

sub setIMG_5_1
{
	my $this	= shift;
	$this->{col}->{'IMG_5_1'} = shift;
}
sub getIMG_5_1
{
	my $this	= shift;
	return $this->{col}->{'IMG_5_1'};
}

sub setIMG_5_2
{
	my $this	= shift;
	$this->{col}->{'IMG_5_2'} = shift;
}
sub getIMG_5_2
{
	my $this	= shift;
	return $this->{col}->{'IMG_5_2'};
}

sub setIMG_5_3
{
	my $this	= shift;
	$this->{col}->{'IMG_5_3'} = shift;
}
sub getIMG_5_3
{
	my $this	= shift;
	return $this->{col}->{'IMG_5_3'};
}

sub setIMG_5_4
{
	my $this	= shift;
	$this->{col}->{'IMG_5_4'} = shift;
}
sub getIMG_5_4
{
	my $this	= shift;
	return $this->{col}->{'IMG_5_4'};
}

sub setSEL_3
{
	my $this	= shift;
	$this->{col}->{'SEL_3'} = shift;
}
sub getSEL_3
{
	my $this	= shift;
	return $this->{col}->{'SEL_3'};
}

sub setSEL_4
{
	my $this	= shift;
	$this->{col}->{'SEL_4'} = shift;
}
sub getSEL_4
{
	my $this	= shift;
	return $this->{col}->{'SEL_4'};
}

sub setVIEW_COUNT
{
	my $this	= shift;
	$this->{col}->{'VIEW_COUNT'} = shift;
}
sub getVIEW_COUNT
{
	my $this	= shift;
	return $this->{col}->{'VIEW_COUNT'};
}

sub setVIEW_COUNT_2
{
	my $this	= shift;
	$this->{col}->{'VIEW_COUNT_2'} = shift;
}
sub getVIEW_COUNT_2
{
	my $this	= shift;
	return $this->{col}->{'VIEW_COUNT_2'};
}

sub setVIEW_COUNT_3
{
	my $this	= shift;
	$this->{col}->{'VIEW_COUNT_3'} = shift;
}
sub getVIEW_COUNT_3
{
	my $this	= shift;
	return $this->{col}->{'VIEW_COUNT_3'};
}

sub setVIEW_COUNT_4
{
	my $this	= shift;
	$this->{col}->{'VIEW_COUNT_4'} = shift;
}
sub getVIEW_COUNT_4
{
	my $this	= shift;
	return $this->{col}->{'VIEW_COUNT_4'};
}

sub setCR_DATE
{
	my $this	= shift;
	$this->{col}->{'CR_DATE'} = shift;
}
sub getCR_DATE
{
	my $this	= shift;
	return $this->{col}->{'CR_DATE'};
}

sub setIS_ACTIVE
{
	my $this	= shift;
	$this->{col}->{'IS_ACTIVE'} = shift;
}
sub getIS_ACTIVE
{
	my $this	= shift;
	return $this->{col}->{'IS_ACTIVE'};
}



sub save
{
	my $this	= shift;
	if ($this->{col}->{'ADFRAME_MCMS_ID'}<1)
	{
		my @values = ();
		my $valueADFRAME_MCMS_ID = "NULL";
		$valueADFRAME_MCMS_ID =~ s/\'/\\\'/g;
		if ($valueADFRAME_MCMS_ID eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueADFRAME_MCMS_ID");
		}

		my $valueADFRAME_CHANNEL = $this->{col}->{ADFRAME_CHANNEL};
		$valueADFRAME_CHANNEL =~ s/\'/\\\'/g;
		if ($valueADFRAME_CHANNEL eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueADFRAME_CHANNEL'");
		}

		my $valueAREA = $this->{col}->{AREA};
		$valueAREA =~ s/\'/\\\'/g;
		if ($valueAREA eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueAREA'");
		}

		my $valueCATEGORY = $this->{col}->{CATEGORY};
		$valueCATEGORY =~ s/\'/\\\'/g;
		if ($valueCATEGORY eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueCATEGORY'");
		}

		my $valueRANK_NO = $this->{col}->{RANK_NO};
		$valueRANK_NO =~ s/\'/\\\'/g;
		if ($valueRANK_NO eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueRANK_NO");
		}

		my $valuePAGE_COUNT = $this->{col}->{PAGE_COUNT};
		$valuePAGE_COUNT =~ s/\'/\\\'/g;
		if ($valuePAGE_COUNT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valuePAGE_COUNT");
		}

		my $valueP_STATUS = $this->{col}->{P_STATUS};
		$valueP_STATUS =~ s/\'/\\\'/g;
		if ($valueP_STATUS eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueP_STATUS");
		}

		my $valueP_DATE = $this->{col}->{P_DATE};
		$valueP_DATE =~ s/\'/\\\'/g;
		if ($valueP_DATE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueP_DATE'");
		}

		my $valueIS_ARCHIVE = $this->{col}->{IS_ARCHIVE};
		$valueIS_ARCHIVE =~ s/\'/\\\'/g;
		if ($valueIS_ARCHIVE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueIS_ARCHIVE");
		}

		my $valueA_NAME = $this->{col}->{A_NAME};
		$valueA_NAME =~ s/\'/\\\'/g;
		if ($valueA_NAME eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueA_NAME'");
		}

		my $valueA_EMAIL = $this->{col}->{A_EMAIL};
		$valueA_EMAIL =~ s/\'/\\\'/g;
		if ($valueA_EMAIL eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueA_EMAIL'");
		}

		my $valueSEL = $this->{col}->{SEL};
		$valueSEL =~ s/\'/\\\'/g;
		if ($valueSEL eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSEL'");
		}

		my $valueSEL_2 = $this->{col}->{SEL_2};
		$valueSEL_2 =~ s/\'/\\\'/g;
		if ($valueSEL_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSEL_2'");
		}

		my $valueHEADLINE = $this->{col}->{HEADLINE};
		$valueHEADLINE =~ s/\'/\\\'/g;
		if ($valueHEADLINE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueHEADLINE'");
		}

		my $valueITEM_1_1 = $this->{col}->{ITEM_1_1};
		$valueITEM_1_1 =~ s/\'/\\\'/g;
		if ($valueITEM_1_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1_1'");
		}

		my $valueITEM_1_2 = $this->{col}->{ITEM_1_2};
		$valueITEM_1_2 =~ s/\'/\\\'/g;
		if ($valueITEM_1_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1_2'");
		}

		my $valueITEM_1_3 = $this->{col}->{ITEM_1_3};
		$valueITEM_1_3 =~ s/\'/\\\'/g;
		if ($valueITEM_1_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1_3'");
		}

		my $valueITEM_1_4 = $this->{col}->{ITEM_1_4};
		$valueITEM_1_4 =~ s/\'/\\\'/g;
		if ($valueITEM_1_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1_4'");
		}

		my $valueITEM_2_1 = $this->{col}->{ITEM_2_1};
		$valueITEM_2_1 =~ s/\'/\\\'/g;
		if ($valueITEM_2_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_1'");
		}

		my $valueITEM_2_2 = $this->{col}->{ITEM_2_2};
		$valueITEM_2_2 =~ s/\'/\\\'/g;
		if ($valueITEM_2_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_2'");
		}

		my $valueITEM_2_3 = $this->{col}->{ITEM_2_3};
		$valueITEM_2_3 =~ s/\'/\\\'/g;
		if ($valueITEM_2_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_3'");
		}

		my $valueITEM_2_4 = $this->{col}->{ITEM_2_4};
		$valueITEM_2_4 =~ s/\'/\\\'/g;
		if ($valueITEM_2_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_4'");
		}

		my $valueITEM_3_1 = $this->{col}->{ITEM_3_1};
		$valueITEM_3_1 =~ s/\'/\\\'/g;
		if ($valueITEM_3_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_3_1'");
		}

		my $valueITEM_3_2 = $this->{col}->{ITEM_3_2};
		$valueITEM_3_2 =~ s/\'/\\\'/g;
		if ($valueITEM_3_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_3_2'");
		}

		my $valueITEM_3_3 = $this->{col}->{ITEM_3_3};
		$valueITEM_3_3 =~ s/\'/\\\'/g;
		if ($valueITEM_3_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_3_3'");
		}

		my $valueITEM_3_4 = $this->{col}->{ITEM_3_4};
		$valueITEM_3_4 =~ s/\'/\\\'/g;
		if ($valueITEM_3_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_3_4'");
		}

		my $valueIMG_0_0 = $this->{col}->{IMG_0_0};
		$valueIMG_0_0 =~ s/\'/\\\'/g;
		if ($valueIMG_0_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_0_0'");
		}

		my $valueIMG_0_1 = $this->{col}->{IMG_0_1};
		$valueIMG_0_1 =~ s/\'/\\\'/g;
		if ($valueIMG_0_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_0_1'");
		}

		my $valueIMG_0_2 = $this->{col}->{IMG_0_2};
		$valueIMG_0_2 =~ s/\'/\\\'/g;
		if ($valueIMG_0_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_0_2'");
		}

		my $valueIMG_0_3 = $this->{col}->{IMG_0_3};
		$valueIMG_0_3 =~ s/\'/\\\'/g;
		if ($valueIMG_0_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_0_3'");
		}

		my $valueIMG_0_4 = $this->{col}->{IMG_0_4};
		$valueIMG_0_4 =~ s/\'/\\\'/g;
		if ($valueIMG_0_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_0_4'");
		}

		my $valueIMG_1_0 = $this->{col}->{IMG_1_0};
		$valueIMG_1_0 =~ s/\'/\\\'/g;
		if ($valueIMG_1_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_1_0'");
		}

		my $valueIMG_1_1 = $this->{col}->{IMG_1_1};
		$valueIMG_1_1 =~ s/\'/\\\'/g;
		if ($valueIMG_1_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_1_1'");
		}

		my $valueIMG_1_2 = $this->{col}->{IMG_1_2};
		$valueIMG_1_2 =~ s/\'/\\\'/g;
		if ($valueIMG_1_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_1_2'");
		}

		my $valueIMG_1_3 = $this->{col}->{IMG_1_3};
		$valueIMG_1_3 =~ s/\'/\\\'/g;
		if ($valueIMG_1_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_1_3'");
		}

		my $valueIMG_1_4 = $this->{col}->{IMG_1_4};
		$valueIMG_1_4 =~ s/\'/\\\'/g;
		if ($valueIMG_1_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_1_4'");
		}

		my $valueIMG_2_1 = $this->{col}->{IMG_2_1};
		$valueIMG_2_1 =~ s/\'/\\\'/g;
		if ($valueIMG_2_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_2_1'");
		}

		my $valueIMG_2_2 = $this->{col}->{IMG_2_2};
		$valueIMG_2_2 =~ s/\'/\\\'/g;
		if ($valueIMG_2_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_2_2'");
		}

		my $valueIMG_2_3 = $this->{col}->{IMG_2_3};
		$valueIMG_2_3 =~ s/\'/\\\'/g;
		if ($valueIMG_2_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_2_3'");
		}

		my $valueIMG_2_4 = $this->{col}->{IMG_2_4};
		$valueIMG_2_4 =~ s/\'/\\\'/g;
		if ($valueIMG_2_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_2_4'");
		}

		my $valueIMG_3_1 = $this->{col}->{IMG_3_1};
		$valueIMG_3_1 =~ s/\'/\\\'/g;
		if ($valueIMG_3_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_3_1'");
		}

		my $valueIMG_3_2 = $this->{col}->{IMG_3_2};
		$valueIMG_3_2 =~ s/\'/\\\'/g;
		if ($valueIMG_3_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_3_2'");
		}

		my $valueIMG_3_3 = $this->{col}->{IMG_3_3};
		$valueIMG_3_3 =~ s/\'/\\\'/g;
		if ($valueIMG_3_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_3_3'");
		}

		my $valueIMG_3_4 = $this->{col}->{IMG_3_4};
		$valueIMG_3_4 =~ s/\'/\\\'/g;
		if ($valueIMG_3_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_3_4'");
		}

		my $valueTEXT_0 = $this->{col}->{TEXT_0};
		$valueTEXT_0 =~ s/\'/\\\'/g;
		if ($valueTEXT_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_0'");
		}

		my $valueTEXT_1_1 = $this->{col}->{TEXT_1_1};
		$valueTEXT_1_1 =~ s/\'/\\\'/g;
		if ($valueTEXT_1_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_1_1'");
		}

		my $valueTEXT_1_2 = $this->{col}->{TEXT_1_2};
		$valueTEXT_1_2 =~ s/\'/\\\'/g;
		if ($valueTEXT_1_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_1_2'");
		}

		my $valueTEXT_1_3 = $this->{col}->{TEXT_1_3};
		$valueTEXT_1_3 =~ s/\'/\\\'/g;
		if ($valueTEXT_1_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_1_3'");
		}

		my $valueTEXT_1_4 = $this->{col}->{TEXT_1_4};
		$valueTEXT_1_4 =~ s/\'/\\\'/g;
		if ($valueTEXT_1_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_1_4'");
		}

		my $valueTEXT_2_1 = $this->{col}->{TEXT_2_1};
		$valueTEXT_2_1 =~ s/\'/\\\'/g;
		if ($valueTEXT_2_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_2_1'");
		}

		my $valueTEXT_2_2 = $this->{col}->{TEXT_2_2};
		$valueTEXT_2_2 =~ s/\'/\\\'/g;
		if ($valueTEXT_2_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_2_2'");
		}

		my $valueTEXT_2_3 = $this->{col}->{TEXT_2_3};
		$valueTEXT_2_3 =~ s/\'/\\\'/g;
		if ($valueTEXT_2_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_2_3'");
		}

		my $valueTEXT_2_4 = $this->{col}->{TEXT_2_4};
		$valueTEXT_2_4 =~ s/\'/\\\'/g;
		if ($valueTEXT_2_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_2_4'");
		}

		my $valueTEXT_3_1 = $this->{col}->{TEXT_3_1};
		$valueTEXT_3_1 =~ s/\'/\\\'/g;
		if ($valueTEXT_3_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_3_1'");
		}

		my $valueTEXT_3_2 = $this->{col}->{TEXT_3_2};
		$valueTEXT_3_2 =~ s/\'/\\\'/g;
		if ($valueTEXT_3_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_3_2'");
		}

		my $valueTEXT_3_3 = $this->{col}->{TEXT_3_3};
		$valueTEXT_3_3 =~ s/\'/\\\'/g;
		if ($valueTEXT_3_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_3_3'");
		}

		my $valueTEXT_3_4 = $this->{col}->{TEXT_3_4};
		$valueTEXT_3_4 =~ s/\'/\\\'/g;
		if ($valueTEXT_3_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_3_4'");
		}

		my $valuePARENT_RANK_NO = $this->{col}->{PARENT_RANK_NO};
		$valuePARENT_RANK_NO =~ s/\'/\\\'/g;
		if ($valuePARENT_RANK_NO eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valuePARENT_RANK_NO");
		}

		my $valueVIDEO_1_1 = $this->{col}->{VIDEO_1_1};
		$valueVIDEO_1_1 =~ s/\'/\\\'/g;
		if ($valueVIDEO_1_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueVIDEO_1_1'");
		}

		my $valuePIC_VIDEO_1_1 = $this->{col}->{PIC_VIDEO_1_1};
		$valuePIC_VIDEO_1_1 =~ s/\'/\\\'/g;
		if ($valuePIC_VIDEO_1_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePIC_VIDEO_1_1'");
		}

		my $valueITEM_1_5 = $this->{col}->{ITEM_1_5};
		$valueITEM_1_5 =~ s/\'/\\\'/g;
		if ($valueITEM_1_5 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1_5'");
		}

		my $valueVIDEO_1_2 = $this->{col}->{VIDEO_1_2};
		$valueVIDEO_1_2 =~ s/\'/\\\'/g;
		if ($valueVIDEO_1_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueVIDEO_1_2'");
		}

		my $valuePIC_VIDEO_1_2 = $this->{col}->{PIC_VIDEO_1_2};
		$valuePIC_VIDEO_1_2 =~ s/\'/\\\'/g;
		if ($valuePIC_VIDEO_1_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valuePIC_VIDEO_1_2'");
		}

		my $valueITEM_1_6 = $this->{col}->{ITEM_1_6};
		$valueITEM_1_6 =~ s/\'/\\\'/g;
		if ($valueITEM_1_6 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_1_6'");
		}

		my $valueSAISON = $this->{col}->{SAISON};
		$valueSAISON =~ s/\'/\\\'/g;
		if ($valueSAISON eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSAISON'");
		}

		my $valueETIKETT = $this->{col}->{ETIKETT};
		$valueETIKETT =~ s/\'/\\\'/g;
		if ($valueETIKETT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueETIKETT'");
		}

		my $valueITEM_2_5 = $this->{col}->{ITEM_2_5};
		$valueITEM_2_5 =~ s/\'/\\\'/g;
		if ($valueITEM_2_5 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_5'");
		}

		my $valueITEM_2_6 = $this->{col}->{ITEM_2_6};
		$valueITEM_2_6 =~ s/\'/\\\'/g;
		if ($valueITEM_2_6 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_6'");
		}

		my $valueITEM_2_7 = $this->{col}->{ITEM_2_7};
		$valueITEM_2_7 =~ s/\'/\\\'/g;
		if ($valueITEM_2_7 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_7'");
		}

		my $valueITEM_2_8 = $this->{col}->{ITEM_2_8};
		$valueITEM_2_8 =~ s/\'/\\\'/g;
		if ($valueITEM_2_8 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_8'");
		}

		my $valueITEM_2_9 = $this->{col}->{ITEM_2_9};
		$valueITEM_2_9 =~ s/\'/\\\'/g;
		if ($valueITEM_2_9 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_2_9'");
		}

		my $valueTEXT_4_0 = $this->{col}->{TEXT_4_0};
		$valueTEXT_4_0 =~ s/\'/\\\'/g;
		if ($valueTEXT_4_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_4_0'");
		}

		my $valueTEXT_4_1 = $this->{col}->{TEXT_4_1};
		$valueTEXT_4_1 =~ s/\'/\\\'/g;
		if ($valueTEXT_4_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_4_1'");
		}

		my $valueTEXT_4_2 = $this->{col}->{TEXT_4_2};
		$valueTEXT_4_2 =~ s/\'/\\\'/g;
		if ($valueTEXT_4_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_4_2'");
		}

		my $valueTEXT_4_3 = $this->{col}->{TEXT_4_3};
		$valueTEXT_4_3 =~ s/\'/\\\'/g;
		if ($valueTEXT_4_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_4_3'");
		}

		my $valueTEXT_4_4 = $this->{col}->{TEXT_4_4};
		$valueTEXT_4_4 =~ s/\'/\\\'/g;
		if ($valueTEXT_4_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_4_4'");
		}

		my $valueTEXT_5_0 = $this->{col}->{TEXT_5_0};
		$valueTEXT_5_0 =~ s/\'/\\\'/g;
		if ($valueTEXT_5_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_5_0'");
		}

		my $valueTEXT_5_1 = $this->{col}->{TEXT_5_1};
		$valueTEXT_5_1 =~ s/\'/\\\'/g;
		if ($valueTEXT_5_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_5_1'");
		}

		my $valueTEXT_5_2 = $this->{col}->{TEXT_5_2};
		$valueTEXT_5_2 =~ s/\'/\\\'/g;
		if ($valueTEXT_5_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_5_2'");
		}

		my $valueTEXT_5_3 = $this->{col}->{TEXT_5_3};
		$valueTEXT_5_3 =~ s/\'/\\\'/g;
		if ($valueTEXT_5_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_5_3'");
		}

		my $valueTEXT_5_4 = $this->{col}->{TEXT_5_4};
		$valueTEXT_5_4 =~ s/\'/\\\'/g;
		if ($valueTEXT_5_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueTEXT_5_4'");
		}

		my $valueITEM_4_0 = $this->{col}->{ITEM_4_0};
		$valueITEM_4_0 =~ s/\'/\\\'/g;
		if ($valueITEM_4_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_4_0'");
		}

		my $valueITEM_4_1 = $this->{col}->{ITEM_4_1};
		$valueITEM_4_1 =~ s/\'/\\\'/g;
		if ($valueITEM_4_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_4_1'");
		}

		my $valueITEM_4_2 = $this->{col}->{ITEM_4_2};
		$valueITEM_4_2 =~ s/\'/\\\'/g;
		if ($valueITEM_4_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_4_2'");
		}

		my $valueITEM_4_3 = $this->{col}->{ITEM_4_3};
		$valueITEM_4_3 =~ s/\'/\\\'/g;
		if ($valueITEM_4_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_4_3'");
		}

		my $valueITEM_4_4 = $this->{col}->{ITEM_4_4};
		$valueITEM_4_4 =~ s/\'/\\\'/g;
		if ($valueITEM_4_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_4_4'");
		}

		my $valueITEM_5_0 = $this->{col}->{ITEM_5_0};
		$valueITEM_5_0 =~ s/\'/\\\'/g;
		if ($valueITEM_5_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_5_0'");
		}

		my $valueITEM_5_1 = $this->{col}->{ITEM_5_1};
		$valueITEM_5_1 =~ s/\'/\\\'/g;
		if ($valueITEM_5_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_5_1'");
		}

		my $valueITEM_5_2 = $this->{col}->{ITEM_5_2};
		$valueITEM_5_2 =~ s/\'/\\\'/g;
		if ($valueITEM_5_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_5_2'");
		}

		my $valueITEM_5_3 = $this->{col}->{ITEM_5_3};
		$valueITEM_5_3 =~ s/\'/\\\'/g;
		if ($valueITEM_5_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_5_3'");
		}

		my $valueITEM_5_4 = $this->{col}->{ITEM_5_4};
		$valueITEM_5_4 =~ s/\'/\\\'/g;
		if ($valueITEM_5_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueITEM_5_4'");
		}

		my $valueIMG_4_0 = $this->{col}->{IMG_4_0};
		$valueIMG_4_0 =~ s/\'/\\\'/g;
		if ($valueIMG_4_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_4_0'");
		}

		my $valueIMG_4_1 = $this->{col}->{IMG_4_1};
		$valueIMG_4_1 =~ s/\'/\\\'/g;
		if ($valueIMG_4_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_4_1'");
		}

		my $valueIMG_4_2 = $this->{col}->{IMG_4_2};
		$valueIMG_4_2 =~ s/\'/\\\'/g;
		if ($valueIMG_4_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_4_2'");
		}

		my $valueIMG_4_3 = $this->{col}->{IMG_4_3};
		$valueIMG_4_3 =~ s/\'/\\\'/g;
		if ($valueIMG_4_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_4_3'");
		}

		my $valueIMG_4_4 = $this->{col}->{IMG_4_4};
		$valueIMG_4_4 =~ s/\'/\\\'/g;
		if ($valueIMG_4_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_4_4'");
		}

		my $valueIMG_5_0 = $this->{col}->{IMG_5_0};
		$valueIMG_5_0 =~ s/\'/\\\'/g;
		if ($valueIMG_5_0 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_5_0'");
		}

		my $valueIMG_5_1 = $this->{col}->{IMG_5_1};
		$valueIMG_5_1 =~ s/\'/\\\'/g;
		if ($valueIMG_5_1 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_5_1'");
		}

		my $valueIMG_5_2 = $this->{col}->{IMG_5_2};
		$valueIMG_5_2 =~ s/\'/\\\'/g;
		if ($valueIMG_5_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_5_2'");
		}

		my $valueIMG_5_3 = $this->{col}->{IMG_5_3};
		$valueIMG_5_3 =~ s/\'/\\\'/g;
		if ($valueIMG_5_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_5_3'");
		}

		my $valueIMG_5_4 = $this->{col}->{IMG_5_4};
		$valueIMG_5_4 =~ s/\'/\\\'/g;
		if ($valueIMG_5_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueIMG_5_4'");
		}

		my $valueSEL_3 = $this->{col}->{SEL_3};
		$valueSEL_3 =~ s/\'/\\\'/g;
		if ($valueSEL_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSEL_3'");
		}

		my $valueSEL_4 = $this->{col}->{SEL_4};
		$valueSEL_4 =~ s/\'/\\\'/g;
		if ($valueSEL_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueSEL_4'");
		}

		my $valueVIEW_COUNT = $this->{col}->{VIEW_COUNT};
		$valueVIEW_COUNT =~ s/\'/\\\'/g;
		if ($valueVIEW_COUNT eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueVIEW_COUNT'");
		}

		my $valueVIEW_COUNT_2 = $this->{col}->{VIEW_COUNT_2};
		$valueVIEW_COUNT_2 =~ s/\'/\\\'/g;
		if ($valueVIEW_COUNT_2 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueVIEW_COUNT_2'");
		}

		my $valueVIEW_COUNT_3 = $this->{col}->{VIEW_COUNT_3};
		$valueVIEW_COUNT_3 =~ s/\'/\\\'/g;
		if ($valueVIEW_COUNT_3 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueVIEW_COUNT_3'");
		}

		my $valueVIEW_COUNT_4 = $this->{col}->{VIEW_COUNT_4};
		$valueVIEW_COUNT_4 =~ s/\'/\\\'/g;
		if ($valueVIEW_COUNT_4 eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"'$valueVIEW_COUNT_4'");
		}

		my $valueCR_DATE = $this->{col}->{CR_DATE};
		$valueCR_DATE =~ s/\'/\\\'/g;
		if ($valueCR_DATE eq "")
		{
			push(@values,"now()");
		}
		else
		{
			push(@values,"'$valueCR_DATE'");
		}

		my $valueIS_ACTIVE = $this->{col}->{IS_ACTIVE};
		$valueIS_ACTIVE =~ s/\'/\\\'/g;
		if ($valueIS_ACTIVE eq "")
		{
			push(@values,"NULL");
		}
		else
		{
			push(@values,"$valueIS_ACTIVE");
		}


		$this->{col}->{'ADFRAME_MCMS_ID'} = $this->insert('ADFRAME_MCMS','ADFRAME_MCMS_ID,ADFRAME_CHANNEL,AREA,CATEGORY,RANK_NO,PAGE_COUNT,P_STATUS,P_DATE,IS_ARCHIVE,A_NAME,A_EMAIL,SEL,SEL_2,HEADLINE,ITEM_1_1,ITEM_1_2,ITEM_1_3,ITEM_1_4,ITEM_2_1,ITEM_2_2,ITEM_2_3,ITEM_2_4,ITEM_3_1,ITEM_3_2,ITEM_3_3,ITEM_3_4,IMG_0_0,IMG_0_1,IMG_0_2,IMG_0_3,IMG_0_4,IMG_1_0,IMG_1_1,IMG_1_2,IMG_1_3,IMG_1_4,IMG_2_1,IMG_2_2,IMG_2_3,IMG_2_4,IMG_3_1,IMG_3_2,IMG_3_3,IMG_3_4,TEXT_0,TEXT_1_1,TEXT_1_2,TEXT_1_3,TEXT_1_4,TEXT_2_1,TEXT_2_2,TEXT_2_3,TEXT_2_4,TEXT_3_1,TEXT_3_2,TEXT_3_3,TEXT_3_4,PARENT_RANK_NO,VIDEO_1_1,PIC_VIDEO_1_1,ITEM_1_5,VIDEO_1_2,PIC_VIDEO_1_2,ITEM_1_6,SAISON,ETIKETT,ITEM_2_5,ITEM_2_6,ITEM_2_7,ITEM_2_8,ITEM_2_9,TEXT_4_0,TEXT_4_1,TEXT_4_2,TEXT_4_3,TEXT_4_4,TEXT_5_0,TEXT_5_1,TEXT_5_2,TEXT_5_3,TEXT_5_4,ITEM_4_0,ITEM_4_1,ITEM_4_2,ITEM_4_3,ITEM_4_4,ITEM_5_0,ITEM_5_1,ITEM_5_2,ITEM_5_3,ITEM_5_4,IMG_4_0,IMG_4_1,IMG_4_2,IMG_4_3,IMG_4_4,IMG_5_0,IMG_5_1,IMG_5_2,IMG_5_3,IMG_5_4,SEL_3,SEL_4,VIEW_COUNT,VIEW_COUNT_2,VIEW_COUNT_3,VIEW_COUNT_4,CR_DATE,IS_ACTIVE',@values);
		return $this->{col}->{'ADFRAME_MCMS_ID'};
	}
	elsif ($this->{col}->{'ADFRAME_MCMS_ID'}>0)
	{
		if (defined $this->{col}->{'ADFRAME_CHANNEL'})
		{
			my $value = $this->{col}->{'ADFRAME_CHANNEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ADFRAME_CHANNEL='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ADFRAME_CHANNEL='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'AREA'})
		{
			my $value = $this->{col}->{'AREA'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"AREA='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update AREA='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'CATEGORY'})
		{
			my $value = $this->{col}->{'CATEGORY'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"CATEGORY='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CATEGORY='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'RANK_NO'})
		{
			my $value = $this->{col}->{'RANK_NO'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"RANK_NO=$value","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update RANK_NO=$value with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'PAGE_COUNT'})
		{
			my $value = $this->{col}->{'PAGE_COUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"PAGE_COUNT=$value","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update PAGE_COUNT=$value with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'P_STATUS'})
		{
			my $value = $this->{col}->{'P_STATUS'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"P_STATUS=$value","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update P_STATUS=$value with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'P_DATE'})
		{
			my $value = $this->{col}->{'P_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"P_DATE='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update P_DATE='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ARCHIVE'})
		{
			my $value = $this->{col}->{'IS_ARCHIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IS_ARCHIVE=$value","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ARCHIVE=$value with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'A_NAME'})
		{
			my $value = $this->{col}->{'A_NAME'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"A_NAME='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update A_NAME='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'A_EMAIL'})
		{
			my $value = $this->{col}->{'A_EMAIL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"A_EMAIL='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update A_EMAIL='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'SEL'})
		{
			my $value = $this->{col}->{'SEL'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"SEL='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SEL='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'SEL_2'})
		{
			my $value = $this->{col}->{'SEL_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"SEL_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SEL_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'HEADLINE'})
		{
			my $value = $this->{col}->{'HEADLINE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"HEADLINE='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update HEADLINE='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1_1'})
		{
			my $value = $this->{col}->{'ITEM_1_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_1_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1_2'})
		{
			my $value = $this->{col}->{'ITEM_1_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_1_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1_3'})
		{
			my $value = $this->{col}->{'ITEM_1_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_1_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1_4'})
		{
			my $value = $this->{col}->{'ITEM_1_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_1_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_1'})
		{
			my $value = $this->{col}->{'ITEM_2_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_2'})
		{
			my $value = $this->{col}->{'ITEM_2_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_3'})
		{
			my $value = $this->{col}->{'ITEM_2_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_4'})
		{
			my $value = $this->{col}->{'ITEM_2_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3_1'})
		{
			my $value = $this->{col}->{'ITEM_3_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_3_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3_2'})
		{
			my $value = $this->{col}->{'ITEM_3_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_3_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3_3'})
		{
			my $value = $this->{col}->{'ITEM_3_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_3_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_3_4'})
		{
			my $value = $this->{col}->{'ITEM_3_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_3_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_3_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_0_0'})
		{
			my $value = $this->{col}->{'IMG_0_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_0_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_0_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_0_1'})
		{
			my $value = $this->{col}->{'IMG_0_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_0_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_0_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_0_2'})
		{
			my $value = $this->{col}->{'IMG_0_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_0_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_0_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_0_3'})
		{
			my $value = $this->{col}->{'IMG_0_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_0_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_0_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_0_4'})
		{
			my $value = $this->{col}->{'IMG_0_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_0_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_0_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_1_0'})
		{
			my $value = $this->{col}->{'IMG_1_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_1_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_1_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_1_1'})
		{
			my $value = $this->{col}->{'IMG_1_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_1_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_1_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_1_2'})
		{
			my $value = $this->{col}->{'IMG_1_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_1_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_1_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_1_3'})
		{
			my $value = $this->{col}->{'IMG_1_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_1_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_1_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_1_4'})
		{
			my $value = $this->{col}->{'IMG_1_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_1_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_1_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_2_1'})
		{
			my $value = $this->{col}->{'IMG_2_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_2_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_2_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_2_2'})
		{
			my $value = $this->{col}->{'IMG_2_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_2_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_2_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_2_3'})
		{
			my $value = $this->{col}->{'IMG_2_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_2_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_2_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_2_4'})
		{
			my $value = $this->{col}->{'IMG_2_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_2_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_2_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_3_1'})
		{
			my $value = $this->{col}->{'IMG_3_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_3_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_3_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_3_2'})
		{
			my $value = $this->{col}->{'IMG_3_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_3_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_3_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_3_3'})
		{
			my $value = $this->{col}->{'IMG_3_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_3_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_3_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_3_4'})
		{
			my $value = $this->{col}->{'IMG_3_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_3_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_3_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_0'})
		{
			my $value = $this->{col}->{'TEXT_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_1_1'})
		{
			my $value = $this->{col}->{'TEXT_1_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_1_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_1_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_1_2'})
		{
			my $value = $this->{col}->{'TEXT_1_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_1_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_1_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_1_3'})
		{
			my $value = $this->{col}->{'TEXT_1_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_1_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_1_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_1_4'})
		{
			my $value = $this->{col}->{'TEXT_1_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_1_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_1_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_2_1'})
		{
			my $value = $this->{col}->{'TEXT_2_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_2_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_2_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_2_2'})
		{
			my $value = $this->{col}->{'TEXT_2_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_2_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_2_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_2_3'})
		{
			my $value = $this->{col}->{'TEXT_2_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_2_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_2_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_2_4'})
		{
			my $value = $this->{col}->{'TEXT_2_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_2_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_2_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_3_1'})
		{
			my $value = $this->{col}->{'TEXT_3_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_3_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_3_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_3_2'})
		{
			my $value = $this->{col}->{'TEXT_3_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_3_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_3_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_3_3'})
		{
			my $value = $this->{col}->{'TEXT_3_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_3_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_3_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_3_4'})
		{
			my $value = $this->{col}->{'TEXT_3_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_3_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_3_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'PARENT_RANK_NO'})
		{
			my $value = $this->{col}->{'PARENT_RANK_NO'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"PARENT_RANK_NO=$value","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update PARENT_RANK_NO=$value with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'VIDEO_1_1'})
		{
			my $value = $this->{col}->{'VIDEO_1_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"VIDEO_1_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIDEO_1_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'PIC_VIDEO_1_1'})
		{
			my $value = $this->{col}->{'PIC_VIDEO_1_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"PIC_VIDEO_1_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update PIC_VIDEO_1_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1_5'})
		{
			my $value = $this->{col}->{'ITEM_1_5'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_1_5='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1_5='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'VIDEO_1_2'})
		{
			my $value = $this->{col}->{'VIDEO_1_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"VIDEO_1_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIDEO_1_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'PIC_VIDEO_1_2'})
		{
			my $value = $this->{col}->{'PIC_VIDEO_1_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"PIC_VIDEO_1_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update PIC_VIDEO_1_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_1_6'})
		{
			my $value = $this->{col}->{'ITEM_1_6'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_1_6='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_1_6='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'SAISON'})
		{
			my $value = $this->{col}->{'SAISON'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"SAISON='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SAISON='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ETIKETT'})
		{
			my $value = $this->{col}->{'ETIKETT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ETIKETT='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ETIKETT='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_5'})
		{
			my $value = $this->{col}->{'ITEM_2_5'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_5='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_5='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_6'})
		{
			my $value = $this->{col}->{'ITEM_2_6'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_6='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_6='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_7'})
		{
			my $value = $this->{col}->{'ITEM_2_7'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_7='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_7='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_8'})
		{
			my $value = $this->{col}->{'ITEM_2_8'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_8='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_8='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_2_9'})
		{
			my $value = $this->{col}->{'ITEM_2_9'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_2_9='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_2_9='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_4_0'})
		{
			my $value = $this->{col}->{'TEXT_4_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_4_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_4_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_4_1'})
		{
			my $value = $this->{col}->{'TEXT_4_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_4_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_4_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_4_2'})
		{
			my $value = $this->{col}->{'TEXT_4_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_4_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_4_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_4_3'})
		{
			my $value = $this->{col}->{'TEXT_4_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_4_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_4_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_4_4'})
		{
			my $value = $this->{col}->{'TEXT_4_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_4_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_4_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_5_0'})
		{
			my $value = $this->{col}->{'TEXT_5_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_5_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_5_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_5_1'})
		{
			my $value = $this->{col}->{'TEXT_5_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_5_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_5_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_5_2'})
		{
			my $value = $this->{col}->{'TEXT_5_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_5_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_5_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_5_3'})
		{
			my $value = $this->{col}->{'TEXT_5_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_5_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_5_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'TEXT_5_4'})
		{
			my $value = $this->{col}->{'TEXT_5_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"TEXT_5_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update TEXT_5_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4_0'})
		{
			my $value = $this->{col}->{'ITEM_4_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_4_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4_1'})
		{
			my $value = $this->{col}->{'ITEM_4_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_4_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4_2'})
		{
			my $value = $this->{col}->{'ITEM_4_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_4_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4_3'})
		{
			my $value = $this->{col}->{'ITEM_4_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_4_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_4_4'})
		{
			my $value = $this->{col}->{'ITEM_4_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_4_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_4_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5_0'})
		{
			my $value = $this->{col}->{'ITEM_5_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_5_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5_1'})
		{
			my $value = $this->{col}->{'ITEM_5_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_5_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5_2'})
		{
			my $value = $this->{col}->{'ITEM_5_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_5_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5_3'})
		{
			my $value = $this->{col}->{'ITEM_5_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_5_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'ITEM_5_4'})
		{
			my $value = $this->{col}->{'ITEM_5_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"ITEM_5_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update ITEM_5_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_4_0'})
		{
			my $value = $this->{col}->{'IMG_4_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_4_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_4_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_4_1'})
		{
			my $value = $this->{col}->{'IMG_4_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_4_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_4_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_4_2'})
		{
			my $value = $this->{col}->{'IMG_4_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_4_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_4_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_4_3'})
		{
			my $value = $this->{col}->{'IMG_4_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_4_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_4_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_4_4'})
		{
			my $value = $this->{col}->{'IMG_4_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_4_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_4_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_5_0'})
		{
			my $value = $this->{col}->{'IMG_5_0'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_5_0='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_5_0='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_5_1'})
		{
			my $value = $this->{col}->{'IMG_5_1'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_5_1='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_5_1='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_5_2'})
		{
			my $value = $this->{col}->{'IMG_5_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_5_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_5_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_5_3'})
		{
			my $value = $this->{col}->{'IMG_5_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_5_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_5_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IMG_5_4'})
		{
			my $value = $this->{col}->{'IMG_5_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IMG_5_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IMG_5_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'SEL_3'})
		{
			my $value = $this->{col}->{'SEL_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"SEL_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SEL_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'SEL_4'})
		{
			my $value = $this->{col}->{'SEL_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"SEL_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update SEL_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEW_COUNT'})
		{
			my $value = $this->{col}->{'VIEW_COUNT'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"VIEW_COUNT='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEW_COUNT='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEW_COUNT_2'})
		{
			my $value = $this->{col}->{'VIEW_COUNT_2'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"VIEW_COUNT_2='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEW_COUNT_2='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEW_COUNT_3'})
		{
			my $value = $this->{col}->{'VIEW_COUNT_3'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"VIEW_COUNT_3='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEW_COUNT_3='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'VIEW_COUNT_4'})
		{
			my $value = $this->{col}->{'VIEW_COUNT_4'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"VIEW_COUNT_4='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update VIEW_COUNT_4='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'CR_DATE'})
		{
			my $value = $this->{col}->{'CR_DATE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"CR_DATE='$value'","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update CR_DATE='$value' with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}

		if (defined $this->{col}->{'IS_ACTIVE'})
		{
			my $value = $this->{col}->{'IS_ACTIVE'};
			$value =~ s/\'/\\\'/g;
			if ($this->update('ADFRAME_MCMS',"IS_ACTIVE=$value","ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}")<1)
			{
				$this->addErrorMessage("Cannot update IS_ACTIVE=$value with ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
			}
		}


		
		return $this->{col}->{'ADFRAME_MCMS_ID'};
	}
	return 0;
}

sub initById
{
	my $this	= shift;
	my $id		= shift;
	if (($id>0) && ($id !~/\D/))
	{
		my @data = split(/\|/, $this->get('ADFRAME_MCMS',"$SQL_COLS","ADFRAME_MCMS_ID=$id"));
		if ($data[0] ne '')
		{
			my @colKeys = split(/,/, $SQL_COLS);
			for (my $i=0;$i<=$#colKeys;$i++)
			{
				$this->{col}->{"$colKeys[$i]"} = $data[$i];
				#eval($this.'->set'.$colKeys[$i].'('..');');
			}
			return 1;
		}
		else
		{
			$this->addErrorMessage('Cannot create Object, data empty!');
		}
	}
	else
	{
		$this->addErrorMessage('Cannot create Object at initById() - ADFRAME_MCMS_ID < 1 !');
	}
	return 0;
}

sub initByCondition
{
	my $this		= shift;
	my $condition	= shift;
	my @ids = $this->get('ADFRAME_MCMS','ADFRAME_MCMS_ID',"$condition");
	if ($ids[1]>0)
	{
		$this->addErrorMessage("Multiple datasets found with Condition $condition at initByCondition()");
	}
	else
	{
		if ($this->initById($ids[0]))
		{
			return $ids[0];
		}
	}
	return 0;
}

sub getDataHash
{
	my $this		= shift;
	return %{ $this->{col} };
}
sub getDataHashRef
{
	my $this		= shift;
	return $this->{col};
}

sub setValue
{
	my $this		= shift;
	my $key			= shift;
	my $value		= shift;
	$this->{col}->{"$key"} = $value;
}
sub getValue
{
	my $this		= shift;
	my $key			= shift;
	return $this->{col}->{"$key"};
}

sub deleteFromDB
{
	my $this		= shift;
	if ($this->{col}->{'ADFRAME_MCMS_ID'}>0)
	{
		$this->delete('ADFRAME_MCMS',"ADFRAME_MCMS_ID=$this->{col}->{'ADFRAME_MCMS_ID'}");
		return 1;
	}
	else
	{
		$this->addErrorMessage('PK-Value not set, cannot delete Dataset!');
	}
	return 0;
}

sub getErrorMessage
{
	my $this	= shift;
	return $this->{errormessage};
}

# private:
sub addErrorMessage
{
	my $this	= shift;
	my $mess	= shift;
	$this->{errormessage}.='ClassADFRAME_MCMS: '.$mess.'\n';   
}
sub setADFRAME_MCMS_ID
{
	my $this	= shift;
	my $ADFRAME_MCMS_ID = shift;
	if ($this->{col}->{'ADFRAME_MCMS_ID'} < 1)
	{
		$this->{col}->{'ADFRAME_MCMS_ID'} = $ADFRAME_MCMS_ID;
	}
}

1;
__END__

=head1 NAME ClassADFRAME_MCMS

=head2 extends DbAdapter

=head1 METHODS

 getADFRAME_MCMS_ID

 setADFRAME_CHANNEL(String: value)
 getADFRAME_CHANNEL()

 setAREA(String: value)
 getAREA()

 setCATEGORY(String: value)
 getCATEGORY()

 setRANK_NO(String: value)
 getRANK_NO()

 setPAGE_COUNT(String: value)
 getPAGE_COUNT()

 setP_STATUS(String: value)
 getP_STATUS()

 setP_DATE(String: value)
 getP_DATE()

 setIS_ARCHIVE(String: value)
 getIS_ARCHIVE()

 setA_NAME(String: value)
 getA_NAME()

 setA_EMAIL(String: value)
 getA_EMAIL()

 setSEL(String: value)
 getSEL()

 setSEL_2(String: value)
 getSEL_2()

 setHEADLINE(String: value)
 getHEADLINE()

 setITEM_1_1(String: value)
 getITEM_1_1()

 setITEM_1_2(String: value)
 getITEM_1_2()

 setITEM_1_3(String: value)
 getITEM_1_3()

 setITEM_1_4(String: value)
 getITEM_1_4()

 setITEM_2_1(String: value)
 getITEM_2_1()

 setITEM_2_2(String: value)
 getITEM_2_2()

 setITEM_2_3(String: value)
 getITEM_2_3()

 setITEM_2_4(String: value)
 getITEM_2_4()

 setITEM_3_1(String: value)
 getITEM_3_1()

 setITEM_3_2(String: value)
 getITEM_3_2()

 setITEM_3_3(String: value)
 getITEM_3_3()

 setITEM_3_4(String: value)
 getITEM_3_4()

 setIMG_0_0(String: value)
 getIMG_0_0()

 setIMG_0_1(String: value)
 getIMG_0_1()

 setIMG_0_2(String: value)
 getIMG_0_2()

 setIMG_0_3(String: value)
 getIMG_0_3()

 setIMG_0_4(String: value)
 getIMG_0_4()

 setIMG_1_0(String: value)
 getIMG_1_0()

 setIMG_1_1(String: value)
 getIMG_1_1()

 setIMG_1_2(String: value)
 getIMG_1_2()

 setIMG_1_3(String: value)
 getIMG_1_3()

 setIMG_1_4(String: value)
 getIMG_1_4()

 setIMG_2_1(String: value)
 getIMG_2_1()

 setIMG_2_2(String: value)
 getIMG_2_2()

 setIMG_2_3(String: value)
 getIMG_2_3()

 setIMG_2_4(String: value)
 getIMG_2_4()

 setIMG_3_1(String: value)
 getIMG_3_1()

 setIMG_3_2(String: value)
 getIMG_3_2()

 setIMG_3_3(String: value)
 getIMG_3_3()

 setIMG_3_4(String: value)
 getIMG_3_4()

 setTEXT_0(String: value)
 getTEXT_0()

 setTEXT_1_1(String: value)
 getTEXT_1_1()

 setTEXT_1_2(String: value)
 getTEXT_1_2()

 setTEXT_1_3(String: value)
 getTEXT_1_3()

 setTEXT_1_4(String: value)
 getTEXT_1_4()

 setTEXT_2_1(String: value)
 getTEXT_2_1()

 setTEXT_2_2(String: value)
 getTEXT_2_2()

 setTEXT_2_3(String: value)
 getTEXT_2_3()

 setTEXT_2_4(String: value)
 getTEXT_2_4()

 setTEXT_3_1(String: value)
 getTEXT_3_1()

 setTEXT_3_2(String: value)
 getTEXT_3_2()

 setTEXT_3_3(String: value)
 getTEXT_3_3()

 setTEXT_3_4(String: value)
 getTEXT_3_4()

 setPARENT_RANK_NO(String: value)
 getPARENT_RANK_NO()

 setVIDEO_1_1(String: value)
 getVIDEO_1_1()

 setPIC_VIDEO_1_1(String: value)
 getPIC_VIDEO_1_1()

 setITEM_1_5(String: value)
 getITEM_1_5()

 setVIDEO_1_2(String: value)
 getVIDEO_1_2()

 setPIC_VIDEO_1_2(String: value)
 getPIC_VIDEO_1_2()

 setITEM_1_6(String: value)
 getITEM_1_6()

 setSAISON(String: value)
 getSAISON()

 setETIKETT(String: value)
 getETIKETT()

 setITEM_2_5(String: value)
 getITEM_2_5()

 setITEM_2_6(String: value)
 getITEM_2_6()

 setITEM_2_7(String: value)
 getITEM_2_7()

 setITEM_2_8(String: value)
 getITEM_2_8()

 setITEM_2_9(String: value)
 getITEM_2_9()

 setTEXT_4_0(String: value)
 getTEXT_4_0()

 setTEXT_4_1(String: value)
 getTEXT_4_1()

 setTEXT_4_2(String: value)
 getTEXT_4_2()

 setTEXT_4_3(String: value)
 getTEXT_4_3()

 setTEXT_4_4(String: value)
 getTEXT_4_4()

 setTEXT_5_0(String: value)
 getTEXT_5_0()

 setTEXT_5_1(String: value)
 getTEXT_5_1()

 setTEXT_5_2(String: value)
 getTEXT_5_2()

 setTEXT_5_3(String: value)
 getTEXT_5_3()

 setTEXT_5_4(String: value)
 getTEXT_5_4()

 setITEM_4_0(String: value)
 getITEM_4_0()

 setITEM_4_1(String: value)
 getITEM_4_1()

 setITEM_4_2(String: value)
 getITEM_4_2()

 setITEM_4_3(String: value)
 getITEM_4_3()

 setITEM_4_4(String: value)
 getITEM_4_4()

 setITEM_5_0(String: value)
 getITEM_5_0()

 setITEM_5_1(String: value)
 getITEM_5_1()

 setITEM_5_2(String: value)
 getITEM_5_2()

 setITEM_5_3(String: value)
 getITEM_5_3()

 setITEM_5_4(String: value)
 getITEM_5_4()

 setIMG_4_0(String: value)
 getIMG_4_0()

 setIMG_4_1(String: value)
 getIMG_4_1()

 setIMG_4_2(String: value)
 getIMG_4_2()

 setIMG_4_3(String: value)
 getIMG_4_3()

 setIMG_4_4(String: value)
 getIMG_4_4()

 setIMG_5_0(String: value)
 getIMG_5_0()

 setIMG_5_1(String: value)
 getIMG_5_1()

 setIMG_5_2(String: value)
 getIMG_5_2()

 setIMG_5_3(String: value)
 getIMG_5_3()

 setIMG_5_4(String: value)
 getIMG_5_4()

 setSEL_3(String: value)
 getSEL_3()

 setSEL_4(String: value)
 getSEL_4()

 setVIEW_COUNT(String: value)
 getVIEW_COUNT()

 setVIEW_COUNT_2(String: value)
 getVIEW_COUNT_2()

 setVIEW_COUNT_3(String: value)
 getVIEW_COUNT_3()

 setVIEW_COUNT_4(String: value)
 getVIEW_COUNT_4()

 setCR_DATE(String: value)
 getCR_DATE()

 setIS_ACTIVE(String: value)
 getIS_ACTIVE()



 initById(PK)
 
 initByCondition(CONDITION)
 
 getDataHash()
 
 deleteFromDB()
 
 getErrorMessage()
 