FROM martenseemann/quic-network-simulator-endpoint:latest

RUN apt-get update && apt-get install -y wget tar git vim python

RUN wget https://dl.google.com/go/go1.12.7.linux-amd64.tar.gz && \
  tar xfz go1.12.7.linux-amd64.tar.gz && \
  rm go1.12.7.linux-amd64.tar.gz

ENV PATH="/go/bin:${PATH}"
ENV GO111MODULE=on
RUN git clone https://github.com/lucas-clemente/quic-go
WORKDIR /quic-go
RUN go get ./...

COPY run_endpoint.sh .
RUN chmod +x run_endpoint.sh

ENTRYPOINT [ "./run_endpoint.sh" ]
