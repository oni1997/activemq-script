ActiveMQ Installation Guide

This guide provides step-by-step instructions on how to install and configure Apache ActiveMQ on a Linux system using a convenient installation script.
Prerequisites

Ensure that you have Java 17 or later installed on your system before proceeding with the ActiveMQ installation.

    java --version

## Installation Steps

# Download and Run the Script:
Make the installation script executable and run it. The script will download and install ActiveMQ.

	chmod +x activemq.sh

	./activemq.sh

# Set up Permissions:
Set up necessary permissions for ActiveMQ directories.

	sudo mkdir -p /var/lib/activemq

	sudo chown -R activemq:activemq /var/lib/activemq

	sudo chown -R activemq:activemq /opt/activemq/apache-activemq-6.0.1/data

# Start ActiveMQ Manually:
Start ActiveMQ manually using the provided script.

	sudo /opt/activemq/apache-activemq-6.0.1/bin/activemq start

# Check ActiveMQ Status:
Verify if ActiveMQ is running using systemctl.

	sudo systemctl status activemq.service

# Create systemd Service File:
Create a systemd service file to manage ActiveMQ as a service.

	sudo nano /etc/init.d/activemq

# The file will appear as.
    # Active MQ installation dir
	if [ -z "$ACTIVEMQ_HOME" ] ; then
	  ACTIVEMQ_HOME="`getActiveMQHome`"
	fi

# Edit the file and set the ActiveMQ installation directory.

    # Active MQ installation dir
    if [ -z "$ACTIVEMQ_HOME" ] ; then
    ACTIVEMQ_HOME="/opt/activemq/apache-activemq-6.0.1"
    fi

# Reload systemd and Start the Service:
Reload systemd and start the ActiveMQ service.

	sudo systemctl daemon-reload

	sudo systemctl start activemq.service

# Check Service Status:
Verify the status of the ActiveMQ service.

	sudo systemctl status activemq.service

If all steps are completed successfully, ActiveMQ should be up and running as a service on your system.
Troubleshooting

If you encounter any issues during the installation or while starting the service, review the output of the commands and check the logs for more information. Troubleshoot based on the provided error messages.
