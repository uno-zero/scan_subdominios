#!/bin/sh
#   By uno-zero                                                   
#########################################################################
echo "\e[1;36m ===================================================================================>";
cat << !
      ,           , 
     /             \ 
    ((__-^^-,-^^-__)) 
     '-_---'  ---_-'
      '--|o' 'o|--' 
         \  '  / 
          ): :( 
          :o_o: 
           "-"   BY: uno-zero
!
#sleep 2
read -p "                     Domain:  " var1
echo  "\e[32m                    \e[0m";
echo  "\e[32m                    \e[0m";
## Subdomain Enumeration

## Subdomain Enumeration
        echo "\e[1;31m     Checking with Assetfinder! \e[0m";
        assetfinder -subs-only $var1 >> assetfinder.txt;
        echo "\e[1;32m     Checking with Subfinder! \e[0m";
        subfinder -d $var1 -recursive -silent -all -t 500 -o subfinder.txt;
        echo "\e[1;35m     Checking with Sublist3r! \e[0m";
        sublist3r -d $var1 -n -t 500 -o sublist3r.txt;
        echo "\e[1;36m     Checking with Amass! \e[0m";
        amass enum -passive -norecursive -noalts -d $var1 -o amass.txt;
	echo "\e[32m                    \e[0m";
        echo "\e[1;33m               End Recon \e[0m";
	echo "\e[32m                    \e[0m";
	echo "\e[32m                    \e[0m";
## Subdomain Concatenation
        cat *.txt > subdomains.txt;
        echo "\e[1;36m     End contenatenatios files \e[0m";
## Quitar BR
	sed -i 's/<BR>/\n/g' "subdomains.txt";
	sed -i 's/<br>/\n/g' "subdomains.txt";
	echo "\e[1;36m     End cleaning files \e[0m";
## Subdomain Results
        sort -u subdomains.txt -o subdomains.txt;
        echo "\e[1;31m     End cleaning subdomains  \e[0m";
	echo "\e[32m                    \e[0m";
	echo "\e[32m                    \e[0m";
## Takeover test
	subzy -targets subdomains.txt;
	echo "\e[1;32m ==== End Takeover ======================================== \e[0m";
	rm -r *.txt;
	echo "\e[1;32m                         Clean Files         \e[0m";
	echo "\e[32m                    \e[0m";
	echo "\e[1;32m ========================================================== \e[0m";
