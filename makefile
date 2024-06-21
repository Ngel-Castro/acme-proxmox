bootstrap:
	$(info ************  DEVELOPMENT ************)
	sh platform/scripts/bootstrap.sh dev
	$(info ************  PRODUCTION ************)
	# sh platform/scripts/bootstrap.sh prod


cleanup:
	$(info ************  DEVELOPMENT ************)
	sh platform/scripts/cleanup.sh dev
	$(info ************  PRODUCTION ************)
	# sh platform/scripts/cleanup.sh prod