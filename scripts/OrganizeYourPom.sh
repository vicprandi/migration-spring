#!/bin/bash

# Caminho para o pom.xml principal:
POM_PATH="$1"

# Função para adicionar comentário acima da propriedade se ela existir:
add_comment_to_property() {
    local PROPERTY_NAME="$1"
    local COMMENT="$2"
    local PROPERTY_EXISTS=$(xmllint --xpath "//*[local-name()='properties']/*[local-name()='$PROPERTY_NAME']" $POM_PATH 2> /dev/null)

    if [ ! -z "$PROPERTY_EXISTS" ]; then
        # Usando sed para adicionar o comentário. Atenção ao uso de delimitadores no sed, aqui usamos | para evitar conflito com / no caminho
        sed -i "/<$PROPERTY_NAME>/i \ \ \ \ <!-- $COMMENT -->" $POM_PATH
    fi
}

# Lista de propriedades e seus comentários:
declare -A properties_comments=(
["commons-io.version"]="Commons IO"
["commons-lang3.version"]="Commons Lang3"
["elasticsearch.version"]="Elasticsearch"
["flyway.version"]="Flyway"
["h2.version"]="H2 Database"
["hibernate.version"]="Hibernate"
["jakarta.version"]="Jakarta EE"
["java.version"]="Java SDK"
["junit.version"]="JUnit"
["kafka.version"]="Apache Kafka"
["liquibase.core.version"]="Liquibase"
["log4j.slf4j.version"]="Log4j SLF4J Binding"
["lombok.version"]="Project Lombok"
["maven.compiler.plugin.version"]="Maven Compiler Plugin"
["maven.release.plugin.version"]="Maven Release Plugin"
["maven.source.plugin.version"]="Maven Source Plugin"
["modelmapper.version"]="ModelMapper"
["mockito.version"]="Mockito"
["postgres.version"]="PostgreSQL JDBC Driver"
["realwave.context.version"]="Realwave Context"
["realwave.tenant.database.version"]="Realwave Tenant Database"
["slf4j.version"]="SLF4J"
["sonar.jacoco.reportPaths"]="Sonar Jacoco Report Paths"
["spring-data-jpa.version"]="Spring Data JPA"
["spring-security.version"]="Spring Security"
["thymeleaf.version"]="Thymeleaf"
)

# Adicionar comentário para cada propriedade
for property in "${!properties_comments[@]}"; do
    add_comment_to_property "$property" "${properties_comments[$property]}"
done