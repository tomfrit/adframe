package GalleryDbManager;
# extends:
use de::adframe::components::gallery::gen::ListADFRAME_USER_FOTOALBUM;
use de::adframe::components::gallery::gen::ListADFRAME_USER_FOTOS;
# use
use de::adframe::components::gallery::gen::ClassADFRAME_USER_FOTOALBUM;
use de::adframe::components::gallery::gen::ClassADFRAME_USER_FOTOS;

use de::adframe::lib::db::DbAdapter;  
@ISA = (DbAdapter);

use de::adframe::lib::io::HttpUploader;
use de::adframe::lib::TextFormat;
use de::adframe::components::forum::ForumDbManager;

$ALBUMQUAL	= $ListADFRAME_USER_FOTOALBUM::QUAL.'|!IMAGE!|!FOTO_COUNT!|!UP_DATE_YEAR!|!UP_DATE_MONTH!|!UP_DATE_DAY!';
$QUAL		= $ListADFRAME_USER_FOTOS::QUAL;

$UPLOADPATH	= "$ENV{ADFRAME_DOC_PATH}".'/cms/user/img';
1;

sub addFoto
{
	my $this		= shift;
	my $channel		= shift;
	my $userId		= shift;
	my $albumId		= shift;
	my $title		= shift;
	my $text		= shift;
	my $image		= shift;
	
	my $credit		= shift;
	my $rider		= shift;
	my $spot		= shift;
	my $city		= shift;
	my $country		= shift;
	my $allow_comments	= shift;
	
	my $addFlag		= shift;
	my $fotos		= new ClassADFRAME_USER_FOTOS();
	my $textFormat		= new TextFormat();	
	
	$textFormat->setText($title);
	$textFormat->convertToHtml();
	$title = $textFormat->getConvertedText();
	$textFormat->setText($text);
	$textFormat->convertToHtml();
	$text = $textFormat->getConvertedText();
	$textFormat->setText($credit);
	$textFormat->convertToHtml();
	$credit = $textFormat->getConvertedText();
	$textFormat->setText($rider);
	$textFormat->convertToHtml();
	$rider = $textFormat->getConvertedText();	
	$textFormat->setText($spot);
	$textFormat->convertToHtml();
	$spot = $textFormat->getConvertedText();
	$textFormat->setText($city);
	$textFormat->convertToHtml();
	$city = $textFormat->getConvertedText();
	$textFormat->setText($country);
	$textFormat->convertToHtml();
	$country = $textFormat->getConvertedText();
	
		
	$fotos->setADFRAME_CHANNEL($channel);
	$fotos->setADFRAME_USER_ID($userId);
	$fotos->setADFRAME_USER_FOTOALBUM_ID($albumId);
	$fotos->setTITLE($title);
	$fotos->setTEXT($text);
	$fotos->setCREDIT($credit);
	$fotos->setRIDER($rider);
	$fotos->setSPOT($spot);
	$fotos->setCITY($city);
	$fotos->setCOUNTRY($country);
	$fotos->setRANK(0);
	$fotos->setALLOW_COMMENTS($allow_comments);
	$fotos->setALLOW_COMMENTS('') if (!$allow_comments);
	$fotos->setITEM_3($addFlag);
	$fotos->setURL('DEFIMG.jpg');
	$fotos->setIS_ACTIVE(1);
			
	my $fotoId = $fotos->save();
	
	$this->query("UPDATE ADFRAME_USER_FOTOALBUM set UP_DATE = now() where ADFRAME_USER_FOTOALBUM_ID = $albumId");
	
	if ($fotoId > 0) 
	{
		if ((-e "$UPLOADPATH") && ($image ne ''))
		{
			my $uploader 		= new HttpUploader();
			my $tmpfilename 	= 'TEMP_USER_'.$userId.'_FOTO_'.$fotoId;
			my $imgfilename 	= 'USER_'.$userId.'_FOTO_'.$fotoId.'.jpg';
			my $dbTempName 		= $uploader->storeImage($UPLOADPATH,$tmpfilename,$image);
			my $dbTempMid		= $uploader->storeImage($UPLOADPATH,'MID_'.$tmpfilename,$image);
			my $dbTempAvatar	= $uploader->storeImage($UPLOADPATH,'THUMB_'.$tmpfilename,$image);
			my $dbTempMini		= $uploader->storeImage($UPLOADPATH,'MINI_'.$tmpfilename,$image);
			my $dbFileName		= $uploader->resize($UPLOADPATH,$dbTempName,$imgfilename,'658x658','yes','no');
			my $mid			= $uploader->resize($UPLOADPATH,$dbTempMid,'MID_'.$dbFileName,'428x428','yes','no');
			my $avatar		= $uploader->resize($UPLOADPATH,$dbTempAvatar,'THUMB_'.$dbFileName,'115x115','yes','no');
			my $mini		= $uploader->resize($UPLOADPATH,$dbTempMini,'MINI_'.$dbFileName,'78x78','yes','no');
			$fotos->setURL($dbFileName);
		}
				
		$fotos->save();
				
				
	}
	return $fotoId;



}


sub editFoto
{
	my $this		= shift;
	my $fotoId		= shift;
	my $albumId		= shift;
	my $title		= shift;
	my $text		= shift;
	my $image		= shift;
	
	my $credit		= shift;
	my $rider		= shift;
	my $spot		= shift;
	my $city		= shift;
	my $country		= shift;
	
	my $allow_comments	= shift;
	
	my $fotos		= new ClassADFRAME_USER_FOTOS();
	my $textFormat		= new TextFormat();	
	
	$textFormat->setText($title);
	$textFormat->convertToHtml();
	$title = $textFormat->getConvertedText();
	$textFormat->setText($text);
	$textFormat->convertToHtml();
	$text = $textFormat->getConvertedText();
	$textFormat->setText($credit);
	$textFormat->convertToHtml();
	$credit = $textFormat->getConvertedText();
	$textFormat->setText($rider);
	$textFormat->convertToHtml();
	$rider = $textFormat->getConvertedText();	
	$textFormat->setText($spot);
	$textFormat->convertToHtml();
	$spot = $textFormat->getConvertedText();
	$textFormat->setText($city);
	$textFormat->convertToHtml();
	$city = $textFormat->getConvertedText();
	$textFormat->setText($country);
	$textFormat->convertToHtml();
	$country = $textFormat->getConvertedText();
	
	$fotos->initById($fotoId);
	
	
	
	$fotos->setADFRAME_USER_FOTOALBUM_ID($albumId);
	$fotos->setTITLE($title);
	$fotos->setTEXT($text);
	$fotos->setCREDIT($credit);
	$fotos->setRIDER($rider);
	$fotos->setSPOT($spot);
	$fotos->setCITY($city);
	$fotos->setCOUNTRY($country);
	$fotos->setRANK(0);
	$fotos->setALLOW_COMMENTS($allow_comments);
	$fotos->setALLOW_COMMENTS('') if (!$allow_comments);
	
	$this->query("UPDATE ADFRAME_USER_FOTOALBUM set UP_DATE = now() where ADFRAME_USER_FOTOALBUM_ID = $albumId");
			
	my $fotoId = $fotos->save();
	
	if ($fotoId > 0) 
	{
		if ((-e "$UPLOADPATH") && ($image ne ''))
		{
			my $uploader 		= new HttpUploader();
			my $tmpfilename 	= 'TEMP_USER_'.$userId.'_FOTO_'.$fotoId;
			my $imgfilename 	= 'USER_'.$userId.'_FOTO_'.$fotoId.'.jpg';
			my $dbTempName 		= $uploader->storeImage($UPLOADPATH,$tmpfilename,$image);
			my $dbTempMid		= $uploader->storeImage($UPLOADPATH,'MID_'.$tmpfilename,$image);
			my $dbTempAvatar	= $uploader->storeImage($UPLOADPATH,'THUMB_'.$tmpfilename,$image);
			my $dbTempMini		= $uploader->storeImage($UPLOADPATH,'MINI_'.$tmpfilename,$image);
			my $dbFileName		= $uploader->resize($UPLOADPATH,$dbTempName,$imgfilename,'600x600','yes','no');
			my $mid			= $uploader->resize($UPLOADPATH,$dbTempMid,'MID_'.$dbFileName,'430x430','yes','no');
			my $avatar		= $uploader->resize($UPLOADPATH,$dbTempAvatar,'THUMB_'.$dbFileName,'115x115','yes','no');
			my $mini		= $uploader->resize($UPLOADPATH,$dbTempMini,'MINI_'.$dbFileName,'78x78','yes','no');
			$fotos->setURL($dbFileName);
		}
				
		$fotos->save();
				
				
	}
	return $fotoId;



}

sub getAlbum
{
	$this			= shift;
	my $albumId		= shift;
	my $album		= new ClassADFRAME_USER_FOTOALBUM();
	
	$album->initById($albumId);
	$albumInfo{TEXT}	= $album->getTEXT();
	$albumInfo{TITLE}	= $album->getTITLE();
	return %albumInfo;


}

sub getAlbumList
{
	my $this	= shift;
	my $channel	= shift;
	my $userId	= shift;
	#$rank		= shift;
	my $list 	= new ListADFRAME_USER_FOTOALBUM();
	my $db 		= new DbAdapter();
	
	#my $addCond	= "RANK = '".$rank."'" if ($rank);
	my $albums 	= $list->getADFRAME_USER_FOTOALBUM("ADFRAME_CHANNEL = '$channel' AND IS_ACTIVE=1 AND ADFRAME_USER_ID=$userId $addCond",'UP_DATE desc');
	my @albArr	= @{$albums};
	my @albRet	= ();
	for (my $i=0;$i<=$#albArr;$i++)
	{
		
		my @h = split(/\|/,$albArr[$i]);
			
		if($h[7] < 1) 
		{
			
			$image	= $db->get('ADFRAME_USER_FOTOS','URL',"ADFRAME_USER_FOTOALBUM_ID=$h[0] AND IS_ACTIVE=1 order by CR_DATE desc LIMIT 1");
			$image	= "ALBUM_DEFIMG.jpg" if (!$image);
			
				
		}
		else
		{
			
			$image = $db->get('ADFRAME_USER_FOTOS','URL',"ADFRAME_USER_FOTO_ID = $h[7]");
			$image = "ALBUM_DEFIMG.jpg" if (!$image);
			
		}
		
		my $date 	= $this->get('ADFRAME_USER_FOTOALBUM','year(UP_DATE),month(UP_DATE),dayofmonth(UP_DATE)',"ADFRAME_USER_FOTOALBUM_ID=$h[0]");
		my $count 	= $this->get('ADFRAME_USER_FOTOS','count(ADFRAME_USER_FOTO_ID)',"ADFRAME_USER_FOTOALBUM_ID=$h[0] AND IS_ACTIVE=1");
		
		
		push(@albRet,$albArr[$i].'|'.$image.'|'.$count.'|'.$date);
			
			
	}
	return @albRet;
}


sub getFotosByAlbumId
{
	$this		= shift;
	$albumId	= shift;
	my $list	= new ListADFRAME_USER_FOTOS();
	my $albumList	= new ListADFRAME_USER_FOTOALBUM();
	my $albums 	= $list->getADFRAME_USER_FOTOS("IS_ACTIVE=1 AND ADFRAME_USER_FOTOALBUM_ID=$albumId",'RANK,CR_DATE desc');
	my @fotoArr	= @{$albums};
	my @fotoRet	= ();
	for (my $i=0;$i<=$#fotoArr;$i++)
	{
		push(@fotoRet,$fotoArr[$i].'|'.($i+1));
	}

	return @fotoRet;
}

sub addAlbum
{
	my $this	= shift;
	my $channel	= shift;
	my $userId	= shift;
	my $title	= shift;
	my $text	= shift;
	
	my $textFormat	= new TextFormat();
	my $album	= new ClassADFRAME_USER_FOTOALBUM();
	
	$textFormat->setText($title);
	$textFormat->convertToHtml();
	$title = $textFormat->getConvertedText();
	$textFormat->setText($text);
	$textFormat->convertToHtml();
	$ttext = $textFormat->getConvertedText();
	
	$album->setADFRAME_CHANNEL($channel);
	$album->setADFRAME_USER_ID($userId);
	$album->setTITLE($title);
	$album->setTEXT($text);
	
	$album->setIS_ACTIVE(1);
			
	my $albumId = $album->save();
	
	return $albumId;
}

sub editAlbum
{
	my $this	= shift;
	my $userId	= shift;
	my $albumId	= shift;
	my $title	= shift;
	my $text	= shift;
	
	my $textFormat	= new TextFormat();
	my $album	= new ClassADFRAME_USER_FOTOALBUM();
	
	$textFormat->setText($title);
	$textFormat->convertToHtml();
	$title = $textFormat->getConvertedText();
	$textFormat->setText($text);
	$textFormat->convertToHtml();
	$text = $textFormat->getConvertedText();
	
	
	$album->initById($albumId);
	#$album->setADFRAME_CHANNEL($ENV{ADFRAME_CHANNEL});
	$album->setADFRAME_USER_ID($userId);
	$album->setTITLE($title);
	$album->setTEXT($text);
	$album->setIS_ACTIVE(1);
			
	my $albumId = $album->save();
	
	return $albumId;
}



sub getFotoWithCondition
{
	
	my $this	= shift;
	my $channel	= shift;
	my $fotoId	= shift;
	my $albumId	= shift;
	my $userId	= shift;
	my $condition	= shift;
	my $order	= shift;
	my $list	= new ListADFRAME_USER_FOTOS();
	my $fotoClass	= new ClassADFRAME_USER_FOTOS();
	my $album	= new ClassADFRAME_USER_FOTOALBUM();
	my $forum	= new ForumDbManager();
	
	my $addCond	= "AND $condition" if($condition ne '');
	
	
	$fotoId = $this->get('ADFRAME_USER_FOTOS','ADFRAME_USER_FOTO_ID',"ADFRAME_CHANNEL='$channel' AND IS_ACTIVE=1 $addCond order by $order limit 1") if($fotoId<1);
	
	
#	main::debug($fotoId);
	
	
	if ($fotoClass->initById($fotoId))
	{
		$fotoClass->setVIEWCOUNT($fotoClass->getVIEWCOUNT()+1);
		$fotoClass->save();
	
	
		$count	= $list->getCountADFRAME_USER_FOTOS("ADFRAME_CHANNEL='$channel' AND IS_ACTIVE=1 $addCond");
		my @fotos	= $this->get('ADFRAME_USER_FOTOS','ADFRAME_USER_FOTO_ID',"ADFRAME_CHANNEL='$channel' AND IS_ACTIVE=1 $addCond order by $order");
		for(my $i=0;$i<=$#fotos;$i++)
		{
			$page = ($i+1) if($fotos[$i] eq $fotoId);
		}
	
		if(($page+1) <= $count) { $nextId = $fotos[$page]; }
		else { $nextId = $fotos[0]; }
	
		if(($page-1) >= 0) { $prevId = $fotos[($page-2)]; }
		else { $prevId = $fotos[$count-1];}
	
	
	
		my $foto 	= $list->getADFRAME_USER_FOTOS("ADFRAME_USER_FOTO_ID=$fotoId");
		my @fotoArr	= @{$foto};
	
		my @fotoRet	= split(/\|/,$fotoArr[0]);
		$ListADFRAME_USER_FOTOS::QUAL	=~ s/!//g; 
		my @qualArr	= split(/\|/,$ListADFRAME_USER_FOTOS::QUAL);
	
		my $i = 0;
		foreach (@qualArr)
		{
			$fotoHash{$_} = $fotoRet[$i];
			$i++;
	
		}
		$album->initById($fotoHash{ADFRAME_USER_FOTOALBUM_ID});
		$user		= $forum->getUserById($fotoHash{ADFRAME_USER_ID},'FBMX_FORUM_USER');
		$fotoHash{POSTER_ID}	= $fotoHash{ADFRAME_USER_ID};
	}

	elsif($albumId>0)
	{
		$album->initById($albumId);
		$user		= $forum->getUserById($album->getADFRAME_USER_ID(),'FBMX_FORUM_USER');
		$count 		= 0;
		$page		= 0;
		$fotoHash{POSTER_ID}	= $album->getADFRAME_USER_ID();

	}
	
	elsif($userId>0)
	{
		
		$user		= $forum->getUserById($userId,'FBMX_FORUM_USER');
		$count 		= 0;
		$page		= 0;
		#$fotoHash{POSTER_ID}	= $userId;

	}
	
	
	my @userArr		= split(/\|/,$user);
	
	
	
	
	$fotoHash{CR_DATE_MINUTE}	= sprintf("%02d",$fotoHash{CR_DATE_MINUTE});
	$fotoHash{POSTER_NAME}		= $userArr[0];
	$fotoHash{POSTER_IMAGE}		= $userArr[1];
	$fotoHash{ALBUM_NAME}		= $album->getTITLE();
	$fotoHash{FOTO_COUNT}		= $count;
	$fotoHash{NEXT_ID}		= $nextId;
	$fotoHash{PREV_ID}		= $prevId;
	$fotoHash{LFD}			= $page;
	return %fotoHash;
}


sub deleteFoto
{
	$this	= shift;
	$fotoId	= shift;
	$this->query("delete from ADFRAME_USER_FOTOS where ADFRAME_USER_FOTO_ID=$fotoId");
	$this->query("update ADFRAME_FORUMCOMMENT set IS_ACTIVE=0 where AREA = 'fotoforum' and ADFRAME_FORUM_ID=$fotoId");
	return 1;
}

sub setFotoAsTitle
{
	$this		= shift;
	$fotoId		= shift;
	$albumId	= shift;
	my $album	= new ClassADFRAME_USER_FOTOALBUM();
	$album->initById($albumId);
	$album->setTITLE_IMG($fotoId);
	$album->save();
	return 1;
}

sub getTitleId
{
	$this		= shift;
	$albumId	= shift;
	my $album	= new ClassADFRAME_USER_FOTOALBUM();
	$album->initById($albumId);
	my $titleId	= $album->getTITLE_IMG($fotoId);
	
	return $titleId;
}



sub deleteAlbum
{
	$this		= shift;
	$albumId	= shift;
	#main::debug($albumId);
	$this->query("update ADFRAME_USER_FOTOALBUM set IS_ACTIVE=0 where ADFRAME_USER_FOTOALBUM_ID=$albumId");
	$this->query("update ADFRAME_USER_FOTOS set IS_ACTIVE=0 where ADFRAME_USER_FOTOALBUM_ID=$albumId");
	$this->query("update ADFRAME_FORUMCOMMENT inner join ADFRAME_USER_FOTOS on (ADFRAME_FORUMCOMMENT.ADFRAME_FORUM_ID=ADFRAME_USER_FOTOS.ADFRAME_USER_FOTO_ID and ADFRAME_USER_FOTOS.ADFRAME_USER_FOTOALBUM_ID=$albumId AND ADFRAME_FORUMCOMMENT.AREA='fotoforum') set ADFRAME_FORUMCOMMENT.IS_ACTIVE=0");
	return 1;
}

sub getAlbumName
{
	$this		= shift;
	$albumId	= shift;
	$name		= $this->get('ADFRAME_USER_FOTOALBUM','TITLE',"ADFRAME_USER_FOTOALBUM_ID=$albumId");
	return $name;

}

sub getAlbumOwner
{
	$this		= shift;
	$albumId	= shift;
	$id		= $this->get('ADFRAME_USER_FOTOALBUM','ADFRAME_USER_ID',"ADFRAME_USER_FOTOALBUM_ID=$albumId");
	return $id;

}

sub setNoShow
{

	$this		= shift;
	$fotoId		= shift;
	$status		= $this->get('ADFRAME_USER_FOTOS','ITEM_0',"ADFRAME_USER_FOTO_ID=$fotoId");
	if ($status eq 'no')
		{$status ="";}
	else {$status='no';}
	#main::debug($fotoId,$status);
	$this->update('ADFRAME_USER_FOTOS',"ITEM_0 ='".$status."'","ADFRAME_USER_FOTO_ID=$fotoId");
	return 1;


}


sub getMore
{
	my $this		= shift;
	my $channel		= shift;
	my $condition		= shift;
	my $fotoId		= shift;
	my $limit		= shift;
	my $start		= shift;
	$start = "0" if ($start eq '');
	my $list	= new ListADFRAME_USER_FOTOS();
	my $addCond 	= "AND $condition" if($condition ne '');
	my $fotos 	= $list->getADFRAME_USER_FOTOS("ADFRAME_CHANNEL='$channel' AND IS_ACTIVE=1 $addCond","CR_DATE desc",$start,$limit);
	

	return $fotos;
}

sub getCount
{
	my $this		= shift;
	my $channel		= shift;
	my $condition		= shift;
	my $addCond 		= "AND $condition" if($condition ne '');
	my $list		= new ListADFRAME_USER_FOTOS();
	
	my $count 		= $list->getCountADFRAME_USER_FOTOS("ADFRAME_CHANNEL='$channel' AND IS_ACTIVE=1 $addCond");
	

	return $count;
}

sub setInactive
{

	$this		= shift;
	$fotoId		= shift;
	
	$this->update('ADFRAME_USER_FOTOS',"IS_ACTIVE =0","ADFRAME_USER_FOTO_ID=$fotoId");
	return 1;


}

sub getUser
{
	$this		= shift;
	$fotoId		= shift;
	my %user	= ();
	$userId		= $this->get('ADFRAME_USER_FOTOS','ADFRAME_USER_ID',"ADFRAME_USER_FOTO_ID=$fotoId");
	
	$details	= $this->get('ADFRAME_USER','LOGIN,EMAIL',"ADFRAME_USER_ID=$userId");
	@userDetails	= split(/\|/,$details);
	$user{ID}	= $userId;
	$user{LOGIN}	= $userDetails[0];
	$user{EMAIL}	= $userDetails[1];
	return %user;
}

sub allowRate
{
	$this	= shift;
	$fotoId	= shift;
	$allow	= $this->get('ADFRAME_USER_FOTOS','ALLOW_RATE',"ADFRAME_USER_FOTO_ID=$fotoId");
	return $allow;
}

sub getImageCount
{
	my $this	= shift;
	my $channel		= shift;
	my $userId	= shift;
	my $count	= $this->get('ADFRAME_USER_FOTOS','COUNT(ADFRAME_USER_FOTO_ID)',"ADFRAME_CHANNEL='$channel' AND ADFRAME_USER_ID=$userId AND IS_ACTIVE=1");
	return $count;
}

sub getName
{
	my $this	= shift;
	my $id		= shift;
	
	my $forum 	= new ForumDbManager();
	my $user	= $forum->getUserById($id,'FBMX_FORUM_USER');
	my @userArr	= split(/\|/,$user);

	
	return $userArr[0];
	



}