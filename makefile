bootstrap:
	$(info ************  DEVELOPMENT ************)
	sh jenkins/platform/scripts/bootstrap.sh development
	$(info ************  PRODUCTION ************)
	# sh jenkins/platform/scripts/bootstrap.sh production


cleanup:
	sh jenkins/platform/scripts/cleanup.sh development