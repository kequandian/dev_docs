### multi-arch-build-and-images-the-simple-way
https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/

```
docker buildx build \
--push \
--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \ --tag your-username/multiarch-example:buildx-latest .
```
