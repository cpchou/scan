FROM maven:3.8-openjdk-8
ADD scan.tar /
ENV PATH /opt/Fortify/Fortify_SCA_and_Apps_20.1.0/bin:$PATH
ENTRYPOINT ["/bin/sh", "/usr/local/bin/mvn-entrypoint.sh"]
