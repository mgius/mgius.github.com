LOCAL_FOLDER=images/
IMAGE_BUCKET=s3://images.markgius.com/
UPLOAD_FLAGS=--acl public-read

AWS_CMD=/home/mgius/virtualenvs/aws-cli/bin/aws

default:
	echo "Suppress default execution"

sync-upload:
	$(AWS_CMD) s3 sync $(UPLOAD_FLAGS) $(LOCAL_FOLDER) $(IMAGE_BUCKET)

sync-download:
	$(AWS_CMD) s3 sync $(IMAGE_BUCKET) $(LOCAL_FOLDER)

sync-upload-delete:
	$(AWS_CMD) s3 sync $(UPLOAD_FLAGS) --delete --dryrun $(LOCAL_FOLDER) $(IMAGE_BUCKET)
	echo "Confirm previous action to execute: [ctrl-c to quit]"
	read confirm
	$(AWS_CMD) s3 sync $(UPLOAD_FLAGS) --delete $(LOCAL_FOLDER) $(IMAGE_BUCKET)
