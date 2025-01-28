#! /bin/bash

intro="=========== | Services R | ===========
1) All running services and processes.
2) Kill a specific process (Use PID.).
3) PC Data (CPU, RAM, Storage)
4) Currently running services.
5) Find file.
6) User-Group management.
7) Stop script.
"

intro_choices() {
    case $1 in
        "1") ps -A | awk -F ' ' '{ print $1, $4 }' | sed "s/ /\t/g" ; echo;;
        "2") ./remove_pid.sh;;
        "3") echo; lscpu | grep 'Model name';
#            echo; free -g | grep "total"; free -g | grep "Swap";
        echo; lsmem | grep
        echo; df -h | grep -e 'Filesystem'; df -h | grep -e '/dev/nvme0n1p2' | head -1;
        echo;;
        "7") exit 0;;
        *) echo Input not correct, try again. ;;
    esac
}

user_choice() {
    local chosen_method=$1
    read -p "Input: " chosen_input
    if [ -z $chosen_input ]; then
        echo "Input is empty! Please try again."
        user_choice
    else
        $chosen_method $chosen_input
    fi
}


echo "$intro"
user_choice intro_choices
# user_choice $(dsdsa);
