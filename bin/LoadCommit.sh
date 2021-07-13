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
read -n1
echo "CLEANING ENVIROMENT"
echo ""
rm ../workdir/* -drf
echo "EXTRACTING COMMIT"

echo ${databasecommits[$SELECTEDCOMMIT]}
pwd
echo tar -xvf ../commits/${databasecommits[$SELECTEDCOMMIT]} -C ../workdir
tar -xvf ../commits/${databasecommits[$SELECTEDCOMMIT]} -C ../workdir
mv ../workdir/output/$DATABASENAME ../workdir/$DATABASENAME


#!!
#TODO delete container folder
echo "CLEANING CONTAINER"
docker exec -it 02b3c87c4dde bash -c "cd /var/lib/mysql/$DATABASENAME; rm * -drf ; exit"
echo "DONE"
echo
#cd /var/lib/mysql/$DATABASENAME
#rm * -drf
#exit
cd ../workdir/
echo "COPTING DATA TO CONTAINER"
docker cp ./$DATABASENAME $CONTAINERID:/var/lib/mysql/
echo "DONE"
echo
#docker cp ../workdir/$DATABASENAME/* $CONTAINERID:/var/lib/mysql/$DATABASENAME
echo "RESTARTING CONTAINTER"
docker stop $CONTAINERID
docker start $CONTAINERID
echo "DONE"
echo
echo "CLEANING ENVIROMENT"
rm ../workdir/* -drf
echo
echo "DONE"


