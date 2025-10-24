#!/bin/bash
cd /home/container

# Make internal Docker IP address available to processes.
INTERNAL_IP=$(ip route get 1 | awk '{print $(NF-2);exit}')
export INTERNAL_IP

# Print Node.js Version
echo "Node.js Version: $(node -v)"

# Check for end-of-life marker
if [ "${YOLK_EOL_NAG_WARNING+x}" ]; then
	echo "======================================================================"
	echo "DEPRECATION WARNING:"
	echo "This version of the Node.js yolk has been marked as end-of-life."
	echo "Please migrate to a supported version as soon as possible to ensure"
	echo "continued security updates and support."
	echo "This image will be removed/disabled in the near future."
	echo "======================================================================"

	echo "Execution will continue in ${YOLK_EOL_NAG_DELAY:-10} seconds..."
	sleep "${YOLK_EOL_NAG_DELAY:-10}"
fi

# Replace Startup Variables
MODIFIED_STARTUP=$(echo -e ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Run the Server
eval ${MODIFIED_STARTUP}
