FROM alpine:latest

#ENV TERRAFORM_VERSION=0.9.11
#ENV TERRAFORM_SHA256SUM=804d31cfa5fee5c2b1bff7816b64f0e26b1d766ac347c67091adccc2626e16f3
ENV TERRAFORM_VERSION=0.11.13
ENV TERRAFORM_SHA256SUM=5925cd4d81e7d8f42a0054df2aafd66e2ab7408dbed2bd748f0022cfe592f8d2

RUN echo Terraform-version ${TERRAFORM_VERSION} && \
    apk --no-cache add --update \
    git \
    openssh \
    curl \
    openssh-client \
    bash \
    wget \
    openssl \
    ca-certificates \
    groff \
    less \
    tar && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_* &&\
    rm -rf /var/cache/apk/*

RUN mkdir -p /data
WORKDIR /data

ENTRYPOINT ["/bin/terraform"]
CMD ["--help"]

