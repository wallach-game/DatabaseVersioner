echo "*******************";
echo "*DATABSE VERSIONER*";
echo "*     v0.0.1      *";
echo "*     LOADER      *"
echo "*******************";

source ./config/cfg.config

#echo $DATABASENAME
#echo $CONTAINERID

echo 
echo

echo "SELECT database commit to load";

databasecommits=()
cd ../commits
for file in *.tar.gz
do 
    databasecommits=(${databasecommits[@]} "$file")
done

echo "*Index* *Commit"
for i in "${!databasecommits[@]}"; do 
  printf "%s\t%s\n" "*[$i]" " ${databasecommits[$i]}"
done

echo "Select commit and press enter"
echo
read -n1
SELECTEDCOMMIT=$REPLY
SELECTEDCOMMIT=$SELECTEDCOMMIT
COMMITSLENGHT=${#databasecommits[@]}



# if 
#     then
#         echo "Selected Index out of array boundary, exiting"
#         exit 1
# fi
echo "Selected Commit: " ${databasecommits[$SELECTEDCOMMIT]}
echo
echo "Do you wanna overwrite container "$CONTAINERID" with "${databasecommits[$SELECTEDCOMMIT]}
echo
echo "press any key to continue or CTRL+C to shutdown script"
read
echo "CLEANING ENVIROMENT"
echo ""
rm ../output/* -drf
echo "EXTRACTING COMMIT"
cd ../commits

echo ${databasecommits[$SELECTEDCOMMIT]}
pwd
echo "tar -xfv "${databasecommits[$SELECTEDCOMMIT]}" -C ../../output"
tar -xfv ${databasecommits[$SELECTEDCOMMIT]} -C ../../output
cd ../bin
