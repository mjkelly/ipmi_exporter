FROM alpine:latest

# Basic setup
RUN apk add --update -t build-deps go git mercurial libc-dev gcc libgcc make curl

# Build ipmitool
COPY build_ipmitool.sh /build_ipmitool.sh
RUN /build_ipmitool.sh

# Build ipmi_exporter
COPY . /src
WORKDIR /src
RUN make clean && make build && mv ipmi_exporter /

# Clean up 
WORKDIR /
RUN apk del --purge build-deps && rm -rf /src

EXPOSE 9289
CMD ["/ipmi_exporter"]
