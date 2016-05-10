#!/usr/bin/env bash

set -e

chown -R www-data:www-data ${WWW_ROOT}
mv ${MOODLE_WWW_ROOT}/.git ${MOODLE_WWW_ROOT}/.git-history-backup
cat > ${WWW_ROOT}/html/index.html <<- EOM
<html>
    <head>
        <meta http-equiv="refresh" content="0; url=/pruebas_saber">
    </head>
<body></body>
</html>
EOM


## Start Apache2
service apache2 start

# print logs
tail -f /var/log/apache2/*
