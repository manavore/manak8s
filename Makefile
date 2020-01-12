fmt:
	@terraform fmt -recursive -diff .

init: fmt
	@source .env; cd terraform; terraform init

validate: init
	@source .env; cd terraform; terraform validate

.PHONY: fmt init validate
