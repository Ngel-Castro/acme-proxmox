bootstrap:
	echo "creating a development environment"
	sh jenkins/platform/scripts/bootstrap.sh development
	# echo "creating a Production environment"
	# sh jenkins/platform/scripts/bootstrap.sh production


cleanup:
	sh jenkins/platform/scripts/cleanup.sh