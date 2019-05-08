#!/bin/bash
#
# Set up mSMTP by setting the following ENV variables:
#
# MSMTP_SERVER - This is your SMTP server. Defaults to smtp.gmail.com.
# MSMTP_PORT - This is the SMTP server port. Defaults to 587.
# MSMTP_USER - This is your username for the SMTP server.
# MSMTP_PASS - This is your password for the SMTP server. Use an app password if using Gmail.
# MSMTP_TLS - Use TLS for the connection. Defaults to YES.
# MSMTP_HOSTNAME - The hostname mail will come from. Defaults to localhost.
#

if [[ $MSMTP_USER ]] && [[ $MSMTP_PASS ]]; then

# set reasonable defaults

MSMTP_TLS=${MSMTP_TLS:-on}
MSMTP_SERVER=${MSMTP_SERVER:-smtp.gmail.com}
MSMTP_PORT=${MSMTP_PORT:-587}
MSMTP_HOSTNAME=${MSMTP_HOSTNAME:-localhost}
MSMTP_FROM=${MSMTP_FROM:-USERNAME@HOSTNAME}

# root=$SSMTP_TO
cat << EOF > /etc/msmtprc
defaults
tls $MSMTP_TLS
tls_certcheck off
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt
logfile ~/.msmtp.log

account default
host $MSMTP_SERVER
port $MSMTP_PORT
from $MSMTP_USER
password $MSMTP_PASS
EOF

fi
