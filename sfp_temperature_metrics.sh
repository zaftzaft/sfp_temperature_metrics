if_name=$1

if [ ! -d /tmp/node_exporter/ ]; then
  mkdir /tmp/node_exporter/
fi


temp=`ethtool -m ${if_name} | grep temperature | grep -v alarm | grep -v warning | grep -E [0-9.]* -o | head -n 1`

echo sfp_temerature\{if_name=\"$if_name\"\} ${temp} > /tmp/node_exporter/sfp_temp_${if_name}.prom
