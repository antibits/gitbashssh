curdir=$(cd $(dirname $0);pwd)
host=$(echo $0 |awk -F'\\' '{print $NF}'| awk -F'.sh$' '{print $1}')

#echo $host
#echo $curdir
if [ ! -e $curdir/.$host ];then
    echo "create tag file"
    touch $curdir/.$host
	bash $curdir/.lib.hidefile.sh .$host
	
	host=$(echo $host|sed 's/\#/\:/g')
    ssh-copy-id -i ~/.ssh/ssh -f $host
else
	host=$(echo $host|sed 's/\#/\:/g')
fi

ssh $host -i ~/.ssh/ssh
