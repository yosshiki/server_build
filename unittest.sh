#####################################################################
# server check script
# prerequisite 
# - hardware.txt
# - os-parameter.txt
# - additional.txt
# - login as root
# - run in target host
#####################################################################
!#/bin/bash
TIME=`date +%Y%m%d%H%M`
TEST_1=hardware
TEST_2=os-parameter
TEST_3=additional
OUTPUT_DIR=/root/result_$TIME
OUTPUT_1=${TEST_1}_result_$TIME.txt
OUTPUT_2=${TEST_2}_result_$TIME.txt
OUTPUT_3=${TEST_3}_result_$TIME.txt
NUMSEC=1
NUMLINE=1
[ ! -e $OUTPUT_DIR ]; mkdir $OUTPUT_DIR

for i in ${TEST_1} ${TEST_2} ${TEST_3}
do
  exec <./$i.txt
  while read line;
    do
        echo "############### `hostname -s` $NUMSEC-$NUMLINE.[$line] ################" | tee -a  $OUTPUT_DIR/`eval echo '$output_'${NUMSEC}`;
        sleep 1
        eval "$line" |tee -a $OUTPUT_DIR/$OUTPUT_1
        NUMLINE=$(($NUMLINE + 1))
    done
  NUMLINE=1
  NUMSEC=$(($NUMSEC + 1))
done
