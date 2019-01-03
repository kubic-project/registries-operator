#############################################################
# End To End Tests k8s operator
#############################################################

e2e-tests:
	# install prereq
	tests/install-pkgs-on-circleci.sh
	# setup cluster
	tests/run-e2e-tests.sh
	# run e2e tests
