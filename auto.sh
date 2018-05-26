#!/bin/sh
echo running......
while true;
do
        i=0
	while [ $i -lt 10 ]
	do
	        isWrite=false
	        isPull=false
		isPush=false
		rand=$(((RANDOM % 5) + 10))
		
		#git pull section
		git pull                    
		if [ $? -eq 0 ]; then
		    echo pull OK
		    isPull=true
		fi
		
		sleep 1s

		#file wrtie section
		if [ -e text.txt ]; then
		    echo hello >> text.txt
		else
		    echo > text.txt
    	        fi
		
		if [ $? -eq 0 ]; then
		    echo wrtie OK
		    isWrite=true
                fi
		
		#git add section
    	        git add .
		git commit -m "commit"
		git push
		if [ $? -eq 0 ]; then
		    echo push OK
		    isPush=true
                fi
		
		#increase conuter if only if pull, write and push works
		if ( [ "$isPush" = "true" ] && [ "$isWrite" = "true" ] && [ "$isPush" = "true" ] ); then
		    i=$(($i+1))
		fi

		echo $i  #line to check i
		
		sleep $(($rand))s       #need to change time unit to min
        done
        sleep 24s  #need to change time unit to hour
done
