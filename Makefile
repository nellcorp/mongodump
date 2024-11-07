version=0.0.1

version:
	echo ${version}
	
build:
	docker buildx build --rm -t nellcorp/mongodump:${version} --platform linux/amd64,linux/arm64 .

publish:
	docker buildx build --rm -t nellcorp/mongodump:${version} --platform linux/amd64,linux/arm64 --push .