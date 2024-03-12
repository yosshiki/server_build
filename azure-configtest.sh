#####################################################################
# subscription check script
# prerequisite 
# - azure login
# - run in target subscription
#####################################################################
!#/bin/bash
TIME=`date +%Y%m%d%H%M`
CATEGORY=(subscription resource id_role network webapp data compute monitor)
OUTPUT_DIR=${HOME}/azure-configtest/result_$TIME

NUMSEC=0
NUMLINE=0
[ ! -e $OUTPUT_DIR ]; mkdir $OUTPUT_DIR
SUB=`az account show -o tsv --query name`

for i in  ${!CATEGORY[@]}
do
  exec <./${CATEGORY[$i]}.txt
  while read line;
    do
        echo "############### $SUB $NUMSEC-$NUMLINE.[$line] ################" | tee -a  $OUTPUT_DIR/`eval echo ${CATEGORY[$i]}_result.txt`;
        sleep 1
        eval "$line" |tee -a $OUTPUT_DIR/${CATEGORY[$i]}_result.txt
        NUMLINE=$(($NUMLINE + 1))
    done
  NUMLINE=1
  NUMSEC=$(($NUMSEC + 1))
done
