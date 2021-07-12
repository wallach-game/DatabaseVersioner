echo "*****************";
echo "DATABSE VERSIONER";
echo "     v0.0.1      ";
echo "*****************";

echo "Currently db have to specifed in this file you are running";
echo "if you want to not have to press button every time please comment out these lines"
echo "Press any key to continue";
read ;


#like this
# echo "Currently db have to specifed in this file you are running";
# echo "if you want to not have to press button every time please comment out these lines"
# echo "Press any key to continue";
# read ;

CONTAINERID="02b3c87c4dde";
DATABASENAME="retail";

SHACOMMITSUMLONG=$(echo $DATABASENAME$(date)| openssl sha256);
SHACOMMITSUM=${SHACOMMITSUMLONG: -10};

#TODO move downward echo $SHACOMMITSUM;

ARCHIVENAME=$SHACOMMITSUM"_"$DATABASENAME;
#ARCHIVENAME=$SHACOMMITSUM$DATABASENAME;

#docker cp $CONTAINERID:/var/lib/mysql/$DATABASENAME ../output
echo "DATABASE EXTRACTION FINISTED";
echo "DATABASE PACKAGING STARTED";
tar -czvf ../commits/$ARCHIVENAME.tar.gz ../output
echo "DATABASE PACKAGING FINISHED";
rm ../output/* -rdf
echo "ENVIROMENT CLEARED"
