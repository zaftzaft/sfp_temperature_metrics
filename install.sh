if [ -d /usr/lib/systemd/system/ ]; then
  unit_dir=/usr/lib/systemd/system
else
  unit_dir=/etc/systemd/system
fi


cp sfp_temperature_metrics.sh /opt/

cp sfp_temperature_metrics@.timer ${unit_dir}
cp sfp_temperature_metrics@.service ${unit_dir}


systemctl daemon-reload



echo e.g.
echo systemctl enable sfp_temperature_metrics@eth0.timer
echo systemctl start sfp_temperature_metrics@eth0.timer
