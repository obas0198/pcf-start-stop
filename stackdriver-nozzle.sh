#!/bin/sh
alias bosh='BUNDLE_GEMFILE=/home/tempest-web/tempest/web/vendor/bosh/Gemfile bundle exec bosh'

if [ -d /var/tempest/workspaces/default/deployments ];then
    bosh deployment `ls -t /var/tempest/workspaces/default/deployments/stackdriver-nozzle* | head -1`
fi

case $1 in
    start)
	echo "==== Start StackDiver Nozzle ===="
	bosh -n start --force
	;;
    stop)
	echo "==== Stop StackDiver Nozzle ===="
	bosh -n stop --force --hard
	;;

    *)
	echo "Usage: $0 {start|stop}" ;;
esac