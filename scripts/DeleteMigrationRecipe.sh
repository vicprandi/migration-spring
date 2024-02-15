#!/bin/bash

# Caminho para o pom.xml
POM_PATH="$1"

# Marcadores para o início e fim do bloco do plugin
START_MARKER="<plugin>\n            <groupId>org.openrewrite.maven</groupId>"
END_MARKER="</plugin>"

# Usando sed para remover o bloco do plugin
# -i.bak cria um backup antes de modificar o arquivo
# /${START_MARKER}/,/${END_MARKER}/d deleta as linhas entre os marcadores, inclusive
sed -i.bak "/${START_MARKER}/,/${END_MARKER}/d" "$POM_PATH"

echo "O plugin rewrite-maven-plugin foi removido do pom.xml."