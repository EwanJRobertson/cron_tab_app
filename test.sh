
function validate (){

    daysList=("Mon" "Tue" "Wed" "Thu" "Fri" "Sat" "Sun")

    notValid=true
    while $notValid
    do     
        read timeInput
        if [[ " ${daysList[*]} " == *" $timeInput "* ]]||(($timeInput-1 >= 0))&&(($timeInput-1 <= 6))
        then
            notValid=false
        else
            echo "Wrong input try again" >&2
        fi
        
    done

    echo $timeInput
}


day=$(validate)
echo $day