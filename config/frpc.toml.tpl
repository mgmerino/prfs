serverAddr = "${PRFS_HOST}"
serverPort = ${PRFS_BIND_PORT}
auth.token = "${PRFS_AUTH_TOKEN}"

[[proxies]]
name = "${PRFC_SERVICE_NAME}"
type = "${PRFC_SERVICE_TYPE}"
localIP = "${PRFC_LOCAL_IP}"
localPort = ${PRFC_LOCAL_PORT}
remotePort = ${PRFC_REMOTE_PORT}
