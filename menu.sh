
#!/bin/bash

while :
do
    clear
    cat<<EOF
    ==============================
    Menusystem experiment
    ------------------------------
    Please enter your choice:

    Option (1)
    Option (2)
    Option (3)
           (Q)uit
    ------------------------------
EOF
    read -n1 -s
    case "$REPLY" in
	
    "1")  echo "you chose choice 1" ;;
   
    "2")  echo "you chose choice 2" ;;
   
    "3")  echo "you chose choice 3" ;;
   
    "Q")  exit                      ;;
   
    "q"|"Q")  echo "case sensitive!!"   ;; 

    * )  echo "invalid option"     ;;

    esac
    sleep 1
done
