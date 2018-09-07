FROM alpine:latest

ENV TERRAFORM_VERSION=0.11.8
ENV TERRAFORM_SHA256SUM=8cecb3854eebd0fd6da3d7a2d45727a6597d6f98ffc916f2dd63b43350d321f9

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

