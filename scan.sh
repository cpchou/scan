mkdir -p $CI_PROJECT_DIR/.m2/repository; cd /root/.m2/; tar cf $CI_PROJECT_DIR/rep.tar ./repository; tar xf $CI_PROJECT_DIR/rep.tar -C $CI_PROJECT_DIR/.m2; cd $CI_PROJECT_DIR
mvn $MAVEN_CLI_OPTS package com.fortify.sca.plugins.maven:sca-maven-plugin:20.1.0:clean
mvn $MAVEN_CLI_OPTS package package com.fortify.sca.plugins.maven:sca-maven-plugin:20.1.0:translate
mvn $MAVEN_CLI_OPTS package com.fortify.sca.plugins.maven:sca-maven-plugin:20.1.0:scan
fname="$(basename ./target/*.jar .jar)"
ReportGenerator -format pdf \
-f ./target/fortify/$CI_PROJECT_NAME.pdf \
-source ./target/fortify/$fname.fpr \
-template /opt/Fortify/Fortify_SCA_and_Apps_20.1.0/Core/config/reports/DeveloperWorkbook.xml \
-showSuppressed \
-showHidden 
