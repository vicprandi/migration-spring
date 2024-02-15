#!/bin/bash

# Caminho para o pom.xml
POM_PATH="$1"

# Verifica se o build e plugins tags existem, se não, adiciona-os
BUILD_EXISTS=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='build']" $POM_PATH 2> /dev/null)
if [ -z "$BUILD_EXISTS" ]; then
    # Adiciona a tag <build> antes da tag </project>
    sed -i '/<\/project>/i <build>\n</build>' $POM_PATH
fi

PLUGINS_EXISTS=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='build']/*[local-name()='plugins']" $POM_PATH 2> /dev/null)
if [ -z "$PLUGINS_EXISTS" ]; then
    # Adiciona a tag <plugins> dentro de <build>
    sed -i '/<build>/a \    <plugins>\n    </plugins>' $POM_PATH
fi

# Verifica se o plugin já existe
PLUGIN_EXISTS=$(xmllint --xpath "//*[local-name()='project']/*[local-name()='build']/*[local-name()='plugins']/*[local-name()='plugin'][*[local-name()='artifactId']='rewrite-maven-plugin']" $POM_PATH 2> /dev/null)
if [ -z "$PLUGIN_EXISTS" ]; then
    # Adiciona o plugin open rewrite dentro de <plugins>
    sed -i '/<plugins>/a \        <plugin>\n            <groupId>org.openrewrite.maven</groupId>\n            <artifactId>rewrite-maven-plugin</artifactId>\n            <version>5.16.1</version>\n            <configuration>\n                <activeRecipes>\n                    <recipe>org.openrewrite.java.migrate.Java8toJava11</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.SpringBootProperties_2_7</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.UpgradeSpringBoot_2_7</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.MigrateDatabaseCredentials</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.RemoveObsoleteSpringRunners</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.MigrateToWebServerFactoryCustomizer</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.MigrateHibernateConstraintsToJavax</recipe>\n                    <recipe>org.openrewrite.java.spring.boot2.SpringBoot2JUnit4to5Migration</recipe>\n                    <recipe>org.openrewrite.java.migrate.lombok.UpdateLombokToJava11</recipe>\n                </activeRecipes>\n            </configuration>\n            <dependencies>\n                <dependency>\n                    <groupId>org.openrewrite.recipe</groupId>\n                    <artifactId>rewrite-spring</artifactId>\n                    <version>5.1.6</version>\n                </dependency>\n            </dependencies>\n        </plugin>' $POM_PATH
else
    echo "O plugin open rewrite já existe no pom.xml."
fi