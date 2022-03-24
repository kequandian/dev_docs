### multi-arch-build-and-images-the-simple-way
https://www.docker.com/blog/multi-arch-build-and-images-the-simple-way/

```
docker buildx build \
--push \
--platform linux/arm/v7,linux/arm64/v8,linux/amd64 \ --tag your-username/multiarch-example:buildx-latest .
```

## sample
> 必须加 `--push` 参数
```
## create docker driver for buildx
docker buildx create --use 

## start buildx
docker buildx build \
--push \
--platform linux/arm/v7,linux/amd64 \
--tag zelejs/allin-web:git .

## use back default driver
docker buildx use default
```
