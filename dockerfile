FROM golang:1.19-bullseye AS build
WORKDIR /usr/src/webapp
COPY ./src ./
RUN go mod download
RUN CGO_ENABLED=0 go build -o main *.go

FROM alpine:latest
WORKDIR /app
RUN apk add --no-cache tzdata
ENV TZ=America/Bahia
COPY --from=build /usr/src/webapp/ /app/
EXPOSE 9080
CMD [ "./main" ]
