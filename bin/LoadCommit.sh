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

echo "SELECT database commit";

databasecommits=()
counter=0
for file in ../commits/*.tar.gz
do 
    databasecommits=(${databasecommits[@]} "$file")
done

echo ${databasecommits[@]}