FROM alpine:latest
RUN apk update \
    && apk upgrade \
    && apk --no-cache add curl git wget bash ca-certificates openssl \
    && wget https://storage.googleapis.com/kubernetes-release/release/$(wget https://storage.googleapis.com/kubernetes-release/release/stable.txt -q -O -)/bin/linux/amd64/kubectl -q -O /usr/local/bin/kubectl \
    && chmod a+x /usr/local/bin/kubectl \
    && mkdir /.kube \
    && touch /.kube/config
ENV KUBECONFIG=/.kube/config
EXPOSE 8001
CMD bash