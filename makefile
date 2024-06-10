bootstrap:
	$(info ************  DEVELOPMENT ************)
	sh jenkins/platform/scripts/bootstrap.sh dev
	$(info ************  PRODUCTION ************)
	#sh jenkins/platform/scripts/bootstrap.sh prod


cleanup:
	sh jenkins/platform/scripts/cleanup.sh development