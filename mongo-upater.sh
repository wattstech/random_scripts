#Ops Manager Update Script

#Functions
function pause(){
 read -s -n 1 -p "Press any key to continue . . ."
 echo ""
}

while True;

do 

   clear

echo "
                                                                                                                     
 _______ _______ _______ _______ _______ _______ _______     _______ _______ _______ _______ _______ _______ _______ 
|\     /|\     /|\     /|\     /|\     /|\     /|\     /|   |\     /|\     /|\     /|\     /|\     /|\     /|\     /|
| +---+ | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
| |   | | |   | | |   | | |   | | |   | | |   | | |   | |   | |   | | |   | | |   | | |   | | |   | | |   | | |   | |
| |M  | | |o  | | |n  | | |g  | | |o  | | |D  | | |B  | |   | |U  | | |p  | | |d  | | |a  | | |t  | | |e  | | |r  | |
| +---+ | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |   | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ | +---+ |
|/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|   |/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|/_____\|
                                                                                                                     
"

echo "
-------------------------------
1. Check Status
2. Stop Services
3. Check Version
4. Install Update (Insert File Path)
5. Exit
-------------------------------
"

   read -p "Select Option 1-5: " option


   if [ $option = 1 ]; then
      clear;
      echo "Checking Appdb";
      echo "---------------------";
      sudo systemctl status appdb;
      echo " "
      echo "Checking Oplogdb";
      echo "---------------------";
      sudo systemctl status oplogdb;
      pause;
      
   elif [ $option = 2 ]; then
     clear;
     echo "Stopping Oplogdb";
     echo "---------------------";
     sudo systemctl stop oplogdb;
     echo " "
     echo "Stopping Appdb";
     echo "---------------------";
     sudo systemctl stop appdb
     pause;

   elif [ $option = 3 ]; then
     clear;
     echo "MongoDB Version"
     echo "---------------------";
     mongod --version;
     pause;

   elif [ $option = 4 ]; then
     clear;
     read -p "Input Update path" Update_Path
     sudo yum localinstall $Update_Path   -y
     pause;

   elif [ $option = 5 ]; then
      exit

   else
      echo "Invalid Option"
   fi

done

