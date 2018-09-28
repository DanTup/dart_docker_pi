FROM multiarch/debian-debootstrap:armhf-stretch-slim

RUN su - && apt-get update && apt-get install -y \
  curl \
  unzip

RUN mkdir /tmp/dart && \
  cd /tmp/dart && \
  curl https://storage.googleapis.com/dart-archive/channels/stable/release/latest/sdk/dartsdk-linux-arm-release.zip > dart-sdk.zip && \
  unzip dart-sdk.zip



FROM multiarch/debian-debootstrap:armhf-stretch-slim

COPY --from=0 /tmp/dart/dart-sdk /dart/dart-sdk/
ENV PATH="/dart/dart-sdk/bin:${PATH}"
