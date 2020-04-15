api-preview-image:
	docker build . -t api-preview

watch:
	docker run --rm -it \
		-p 8000:8000 \
		-v ${PWD}:/api \
		api-preview /watch.sh /api/api.yaml

bundle:
	docker run --rm -it \
		-v ${PWD}:/api \
		api-preview /bundle.sh api.yaml api.all.json

java-server:
	rm -rf spring-server
	docker run --rm \
  		-v ${PWD}:/local openapitools/openapi-generator-cli generate \
  		-i /local/api.yaml \
  		-g spring \
  		-o /local/spring-server \
  		-p apiPackage=com.pchudzik.blog.example.apieditor.api \
  		-p basePackage=com.pchudzik.blog.example.apieditor \
  		-p modelPackage=com.pchudzik.blog.example.apieditor.model \
  		-p artifactId=apieditor \
  		-p java8=true

clean:
	rm -rf api.all.json
	rm -rf spring-server
