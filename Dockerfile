FROM maven:3.8-openjdk-8
ENV TZ Asia/Taipei
ENV PATH /opt/Fortify/Fortify_SCA_and_Apps_20.1.0/bin:$PATH

RUN wget htts://223-200-181-187.hinet-ip.hinet.net/assets/scan.tar
RUN tar xvf scan.tar

ENTRYPOINT ["/bin/sh", "/usr/local/bin/mvn-entrypoint.sh"]
