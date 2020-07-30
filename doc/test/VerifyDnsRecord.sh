DOMAINS=(amg108.com amg138.com amg158.com amg16.com amg18.com amg282.com amg283.com amg289.com amg88.com amg88888.com amg888888.com amg8888888.com amg88888888.com AMG300.com AMG800.com AMG700.com AMG900.com AMG80.com AMG66.com)
#DOMAINS=(amg18.com)
for DOMAIN in $DOMAINS
do
    echo "$DOMAIN"

    echo "$DOMAIN" >> a.log
    dig DOMAIN +short @8.8.8.8 >> a.log

    C=$(dig www.$DOMAIN +short CNAME @8.8.8.8)
    echo "www.$DOMAIN => $C" >> a.log

    C=$(dig m.$DOMAIN +short CNAME @8.8.8.8)
    echo "m.$DOMAIN => $C" >> a.log

    echo "" >> a.log
done
