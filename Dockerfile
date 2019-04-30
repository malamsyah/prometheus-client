FROM golang:alpine AS build-env

WORKDIR /app

ENV SRC_DIR=/go/src/github.com/malamsyah/prometheus-client-sample

ADD . $SRC_DIR

RUN cd $SRC_DIR; go build -o app.out; cp app.out /app/

FROM alpine

WORKDIR /app

COPY --from=build-env /app/app.out /app/

ENTRYPOINT ["./app.out"]

CMD ["./app.out"]