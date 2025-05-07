#!/usr/bin/env bash
if [[ "$(id -u)" != "0" ]]; then
    echo "This program must be run as root."
    exit 1
fi

cp eurakmon /usr/local/bin/eurakmon
chmod +x /usr/local/bin/eurakmon

cat > /etc/cron.d/eurakmon <<EOF
# EurakMon
2-59/5 *  *  *  *	root	/usr/local/bin/eurakmon
EOF
