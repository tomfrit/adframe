package cryptmail;
1;


sub cryptemail
{
	my $email = shift;
	
	my $cryptmail;
 	my $i=0;
 	
 	do 
 		{

  			$codechar =  substr($email,$i,1);
  			$code = ord($codechar);
     			if($code eq "0")
         			{
            			print "";

          			}
             		else
                    		{
				$cryptmail = $cryptmail.'&#'.$code; 
				}
   			$i++;

  		} 
  	while ($codechar ne '');

	return $cryptmail;

}
