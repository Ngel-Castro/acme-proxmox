bootstrap:
	$(info ************  DEVELOPMENT ************)
	# sh jenkins/platform/scripts/bootstrap.sh dev
	$(info ************  PRODUCTION ************)
	sh jenkins/platform/scripts/bootstrap.sh prod


cleanup:
	$(info ************  DEVELOPMENT ************)
	# sh jenkins/platform/scripts/cleanup.sh dev
	$(info ************  PRODUCTION ************)
	sh jenkins/platform/scripts/cleanup.sh prod