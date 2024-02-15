#!/bin/bash

# Caminho para o pom.xml principal:
POM_PATH="$1"

# Função para atualizar a versão de uma propriedade se ela existir:
update_property_version() {
    local PROPERTY_NAME="$1"
    local NEW_VERSION="$2"
    local PROPERTY_EXISTS=$(xmllint --xpath "//*[local-name()='properties']/*[local-name()='$PROPERTY_NAME']" $POM_PATH 2> /dev/null)

    if [ ! -z "$PROPERTY_EXISTS" ]; then
        mvn versions:set-property -Dproperty=$PROPERTY_NAME -DnewVersion=$NEW_VERSION -f $POM_PATH
    fi
}

# Lista de propriedades e suas novas versões:
declare -A properties_versions=(
["commons-io.version"]="2.11.0"
["commons-lang3.version"]="3.12.0"
["elasticsearch.version"]="7.17.6"
["flyway.version"]="8.5.13"
["h2.version"]="1.4.200"
["hibernate.version"]="5.6.9.Final"
["jakarta.version"]="3.1.0"
["java.version"]="11"
["junit.version"]="4.12"
["kafka.version"]="3.2.0"
["liquibase.core.version"]="4.25.1"
["log4j.slf4j.version"]="2.22.1"
["lombok.version"]="1.18.30"
["maven.compiler.plugin.version"]="3.12.1"
["maven.release.plugin.version"]="3.0.1"
["maven.source.plugin.version"]="3.3.0"
["modelmapper.version"]="3.0.0"
["mockito.version"]="4.11.0"
["postgres.version"]="42.7.1"
["realwave.context.version"]="7.0.0-SNAPSHOT"
["realwave.tenant.database.version"]="7.0.0-SNAPSHOT"
["slf4j.version"]="2.0.11"
["sonar.jacoco.reportPaths"]="${project.basedir}/../target/jacoco.exec"
["spring-data-jpa.version"]="2.7.3"
["spring-security.version"]="5.7.3"
["thymeleaf.version"]="3.0.15.RELEASE"
)

# Atualizar cada propriedade
for property in "${!properties_versions[@]}"; do
    update_property_version "$property" "${properties_versions[$property]}"
done