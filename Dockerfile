FROM quay.io/pypa/manylinux2010_x86_64:2021-03-15-2ae1698

ARG GRAALVM_VERSION=21.0.0.2
ARG MAVEN_VERSION=3.6.3

RUN yum install -y zlib-devel git
RUN cd /tmp && \
    curl -LO https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-${GRAALVM_VERSION}/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz && \
    tar xzf graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz -C /opt/ && \
    rm /tmp/graalvm-ce-java11-linux-amd64-${GRAALVM_VERSION}.tar.gz
ENV PATH="/opt/graalvm-ce-java11-${GRAALVM_VERSION}/bin:${PATH}"
RUN gu install native-image 
RUN cd /tmp && \
    curl -LO https://downloads.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz && \
    tar xzf apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /opt/ && \
    rm /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz
ENV PATH="/opt/apache-maven-${MAVEN_VERSION}/bin:$PATH"

