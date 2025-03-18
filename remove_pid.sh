#! /bin/bash

check_PID() {
    process_name=$(ps -p $1 -o comm=)



#     if pgrep -x $process_name 2> /dev/null; then
#         echo "Exists - $process_name"
#     else
#         echo "Doesn't exist."
#     fi

    echo "Are you sure you want to kill process $1 ($process_name)?"
    read -p "Y/N: " user_choice

    if [[ $user_choice == [yY] ]]; then
        kill $1
        echo "Process $1 / $process_name has been killed."
    else
        echo "Process is not being killed."
    fi
    echo
}

checking=true
while [[ $checking == true ]]; do
    read -p $'Enter PID you want to kill, or Q/q to return to the menu.\nInput: ' chosen_PID;
    if [[ -z $chosen_PID ]]; then
        echo "Input is empty! Please choose one."
        echo
    elif [[ $chosen_PID == [qQ] ]]; then
        checking=false
    else
        check_PID $chosen_PID
    fi
done
