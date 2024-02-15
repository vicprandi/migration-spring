# Plugin de Migração Maven para Stackspot

Este plugin foi especialmente desenvolvido para facilitar a migração de projetos Maven da versão 1.x para a versão 2.x dentro do ecossistema Stackspot. Com o objetivo de simplificar e automatizar o processo de atualização, este plugin modifica o arquivo `pom.xml` e ajusta outras configurações necessárias, assegurando a compatibilidade do projeto com a nova versão do Maven.

## 🚀 Funcionalidades

- **Atualização Automática**: Modifica as dependências e plugins do Maven para as versões mais recentes que são compatíveis com o Maven 2.x.
- **Configuração Otimizada**: Adiciona e remove configurações específicas necessárias para o Maven 2.x, incluindo alterações na estrutura do projeto.
- **Verificação de Compatibilidade**: Assegura que o projeto esteja alinhado com as práticas recomendadas e as atualizações mais recentes do Maven 2.x.

## ⚠️ Lembretes Importantes

- **Atualização para Java 11**: O projeto será atualizado para utilizar o Java 11. Certifique-se de que tanto o `java` quanto o `javac` estejam configurados corretamente em seu ambiente.
- **Estrutura do Projeto**: Fique atento às mudanças na estrutura do projeto que podem ser necessárias após a migração.

## 📖 Passo a Passo para Utilização

1. **Instalação do stk**: O primeiro passo é instalar o StackSpot CLI, conhecido como `stk`. A instalação pode variar dependendo do seu sistema operacional. Geralmente, você pode instalar usando gerenciadores de pacotes como npm, pip, ou diretamente de um binário pré-compilado disponível no site oficial do StackSpot.

   Por exemplo, usando npm:

   ```bash
   npm install -g @stackspot/cli

Verificar a instalação: Após a instalação, você pode verificar se o stk foi instalado corretamente executando:

    stk --version

2. **Preparação do Ambiente**: Certifique-se de que seu ambiente esteja preparado para o Java 11 e que o Maven esteja instalado.
3. **Backup do Projeto**: Recomendamos fazer um backup do seu projeto antes de aplicar a migração.
4. **Aplicação do Plugin**: Utilize o comando abaixo para aplicar o plugin de migração ao seu projeto Maven:

    ```bash
       stk apply plugin migration-spring
   
5.  Teste o projeto com o comando:
    ```bash
    docker-compose up
    mvn clean install 
    mvn clean test

## 📚 Recursos Adicionais

- [Documentação do Maven](https://maven.apache.org/guides/index.html) - Encontre guias e referências para trabalhar com o Maven.
- [Guia de Migração do Maven 1.x para 2.x](https://maven.apache.org/maven-1.x/migration/index.html) - Um guia detalhado para ajudar na migração de projetos Maven da versão 1.x para a versão 2.x.
- [Configuração do Java 11](https://www.oracle.com/java/technologies/javase-jdk11-downloads.html) - Baixe e configure o Java 11 em seu ambiente de desenvolvimento.