while true
do
    clear;
    echo "

  █████████   ████████       █████████  ████                                                    
 ███░░░░░███ ███░░░░███     ███░░░░░███░░███                                                    
░███    ░░░ ░░░    ░███    ███     ░░░  ░███   ██████   ██████   ████████   █████ ████ ████████ 
░░█████████    ██████░    ░███          ░███  ███░░███ ░░░░░███ ░░███░░███ ░░███ ░███ ░░███░░███
 ░░░░░░░░███  ░░░░░░███   ░███          ░███ ░███████   ███████  ░███ ░███  ░███ ░███  ░███ ░███
 ███    ░███ ███   ░███   ░░███     ███ ░███ ░███░░░   ███░░███  ░███ ░███  ░███ ░███  ░███ ░███
░░█████████ ░░████████     ░░█████████  █████░░██████ ░░████████ ████ █████ ░░████████ ░███████ 
 ░░░░░░░░░   ░░░░░░░░       ░░░░░░░░░  ░░░░░  ░░░░░░   ░░░░░░░░ ░░░░ ░░░░░   ░░░░░░░░  ░███░░░  
                                                                                       ░███     
                                                                                       █████    
                                                                                      ░░░░░     
-----------------------------------------------------------------------------------------------
1. Cleanup Directory

2. Exit

"

    read -p "Choose from the following options: " option

    if [ $option -eq 1 ]; then

        clear

        directories=()

        read -p "Enter directories: " directory

        echo "----------------------------------"

        for single_directory in $directory; do
            directories+=("$single_directory")

        done 

        for each_directory in "${directories[@]}"; do
            echo "Removing: $each_directory"

            /usr/bin/aws s3 rm \
                "s3://$each_directory" \
                --recursive \
                --endpoint-url "https://endpoint.org" \
                --profile example \
                --no-verify-ssl

            read -s -n 1 -p "Press any key to continue . . ."
        done

    elif [ $option -eq 2 ]; then 
        exit

    else
        echo "Invalid Option"

    fi
done
