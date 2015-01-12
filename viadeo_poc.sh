#!/bin/bash

REPLY=$(#hidden for a while)
PARSE=$(sed 's/title/\n/g' <<< "$REPLY")
#echo "$PARSE"

gawk -F'"' 'BEGIN{
	i=0
	}
	{
        if(i==0){i++; next}
	    else{
            sub(".\\.{3}","",$3) ; sub("\\.{3}","",$7) ; match($15, /memberId=([^#&]+)/,ID)
            printf("%s : %s \nProfil => http://www.viadeo.com/profile/%s\n\n", $3, $7, ID[1])
        }
}' <<< "$PARSE" 
