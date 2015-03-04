#!/bin/bash

/usr/bin/chef-client --once --run-lock-timeout 120 --runlist "recipe[x509::munki2_client]"

sleep 5
if [[ -f /etc/ssl/munki2.sacredsf.org.crt ]]; then
	while [ ! -f /Library/Managed\ Installs/certs/clientcert.pem ]
	do
		/usr/bin/chef-client --once --run-lock-timeout 120 --runlist "recipe[munkiSSL::munki]"
	done
	touch /Users/Shared/.com.googlecode.munki.checkandinstallatstartup
fi