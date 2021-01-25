FROM minio/minio:latest

# Install libraries
RUN microdnf update --nodocs && \
    microdnf install -y curl fuse3 fuse3-libs gnupg2 python3

# Add key
RUN curl "https://ppa.moosefs.com/RPM-GPG-KEY-MooseFS" > /etc/pki/rpm-gpg/RPM-GPG-KEY-MooseFS
RUN curl "http://ppa.moosefs.com/MooseFS-3-el8.repo" > /etc/yum.repos.d/MooseFS.repo

# Install MooseFS client and cli
RUN microdnf update --nodocs && \
    microdnf install -y moosefs-client moosefs-cli && \
    microdnf clean all

COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
