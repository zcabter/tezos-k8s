#!/bin/sh -x

ls -l /etc/tezos/data
echo ------------------------------------------------------------
cat /etc/tezos/data/config.json
echo ------------------------------------------------------------

mkdir -p /var/tezos/client
chmod -R 777 /var/tezos
set -e
python3 /config-generator.py "$@"
set +e

#
# Next we write the current baker account into /etc/tezos/baking-account.
# We do it here because we shall use jq to process some of the environment
# variables and we are not guaranteed to have jq available on an arbitrary
# tezos docker image.

if [ "$MY_POD_TYPE" = "baking" ]; then
    my_baker_account=$(echo $NODES | \
	    jq -r ".${MY_POD_TYPE}.\"${MY_POD_NAME}\".bake_using_account")

    # If no account to bake for was specified in the node's settings,
    # config-generator defaults the account name to the pod's name.
    if [ "$my_baker_account" = null ]; then
	my_baker_account="$MY_POD_NAME"
    fi

    echo "$my_baker_account" > /etc/tezos/baker-account
fi