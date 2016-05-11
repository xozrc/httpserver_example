FROM golang:1.5.3-alpine

WORKDIR /go/src/github.com/xozrc/httpserever_example
COPY . ./

ENV GOPATH /go/src/github.com/xozrc/httpserever_example/Godeps/_workspace:$GOPATH

RUN set -ex \
	&& apk add --no-cache --virtual .build-deps \
	git \
	&& CGO_ENABLED=0 go install -v -a -tags netgo -installsuffix netgo\
	&& apk del .build-deps


VOLUME $HOME/.httpserever_example

EXPOSE 80

ENTRYPOINT ["httpserever_example"]
CMD ["--help"]