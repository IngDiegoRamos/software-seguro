BUCKET_NAME=diegoramos-lambda-platzi
BUILD_NAME=handle-github-webhook.zip
build:
	GOOS=linux GOARCH=amd64 CGO_ENABLED=0 go build -o bootstrap
	build-lambda-zip -o $(BUILD_NAME) bootstrap

publish: build
	aws s3 cp $(BUILD_NAME) s3://$(BUCKET_NAME)/$(BUILD_NAME)