cat /var/log/syslog |
awk '{if (NF<13) print $0}' |
grep -i "cron" |
grep -v "sudo" > /home/[user]/modul1/syslog
