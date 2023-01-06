#!/bin/sh
#   By uno-zero                                                   
#####################
echo "===================================================================================>";
cat << !
      ,           , 
     /             \ 
    ((__-^^-,-^^-__)) 
     '-_---'  ---_-'
      '--|o' 'o|--' 
         \  '  / 
          ): :( 
          :o_o: 
           "-"   BY: unozero
!
#sleep 2
read -p "                     Domain:  " var1
echo  "                    ";
echo  "                    ";
## Subdomain Enumeration

## Subdomain Enumeration
        echo "     Checking with Assetfinder! ";
        assetfinder -subs-only $var1 >> assetfinder.txt;
        echo "     Checking with Subfinder! ";
        subfinder -d $var1 -recursive -silent -all -t 500 -o subfinder.txt;
        echo "     Checking with Sublist3r! ";
        sublist3r -d $var1 -n -t 500 -o sublist3r.txt;
        echo "     Checking with Amass! ";
        amass enum -passive -norecursive -noalts -d $var1 -o amass.txt;
	echo "                    ";
        echo "               End Recon ";
	echo "                    ";
	echo "                    ";
## Subdomain Concatenation
        cat *.txt > subdomains.txt;
        echo "     End contenatenatios files ";
## Quitar BR
	sed -i 's/<BR>/\n/g' "subdomains.txt";
	sed -i 's/<br>/\n/g' "subdomains.txt";
	echo "     End cleaning files ";
## Subdomain Results
        sort -u subdomains.txt -o subdomains.txt;
        echo "     End cleaning subdomains  ";
	echo "                    ";
	echo "                    ";
 Takeover test
	subzy -targets subdomains.txt;
	echo " ==== End Takeover ======================================== ";
#	rm -r *.txt;
	echo "                         Clean Files         ";
	echo "                    ";
	echo " ========================================================== ";

