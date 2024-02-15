#!/bin/bash

# Certifique-se de que o script é executado no diretório correto
# Você pode adicionar uma verificação de diretório aqui, se necessário

echo "Organizando o pom.xml..."
./OrganizeYourPom.sh

echo "Centralizando versões..."
./CentralizeVersions.sh

echo "Adicionando receita de migração..."
./AddMigrationRecipe.sh

echo "Executando mvn:rewrite run..."
mvn rewrite:run

echo "Deletando receita de migração..."
./DeleteMigrationRecipe.sh

echo "Migração concluída com sucesso!"