FROM alpine:latest

ENV GOPATH /go
ENV APPPATH ipmi_exporter

RUN apk add --update -t build-deps go git mercurial libc-dev gcc libgcc make curl

COPY . .
RUN ./build_ipmitool.sh
RUN make build && mv ipmi_exporter /
RUN apk del --purge build-deps && rm -rf $GOPATH

EXPOSE 9289

ENTRYPOINT [ "/ipmi_exporter" ]
