#!/bin/bash

# Prompt user for password
read -s -p "Enter your password: " szUrl

# Check if sudo access is available
CAN_I_RUN_SUDO=$(echo $szUrl | sudo -S uptime 2>&1 | grep "load" | wc -l)

if [ ${CAN_I_RUN_SUDO} -gt 0 ]; then
    szAMQVersion="6.0.1"  # Use specified ActiveMQ version

    # Create directory for ActiveMQ
    sudo mkdir -p /opt/activemq

    # Download and install ActiveMQ
    cd /tmp
    sudo curl -L -o apache-activemq-${szAMQVersion}-bin.tar.gz https://www.apache.org/dyn/closer.cgi\?filename\=/activemq/${szAMQVersion}/apache-activemq-${szAMQVersion}-bin.tar.gz\&action\=download
    sudo tar zxf apache-activemq-${szAMQVersion}-bin.tar.gz -C /opt/activemq

    echo -e "\nActiveMQ v$szAMQVersion installed successfully."
else
    echo -e "\nAuthentication failed!"
fi

