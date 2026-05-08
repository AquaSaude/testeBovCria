# bovcria

BovCria

## Como a aplicação funciona?

Atualmente (Abril 2026), a aplicação é utilizada exclusivamente em sua versão Web.

Para rodar:

1. **Pré-requisitos:** Ter o Flutter SDK instalado 
2. **Baixar as dependências:**
   ```bash
    flutter pub get
3. **Rode o aplicativo**
    ```bash
    flutter run -d web-server

(Rode esses comandos no terminal!)

## ⚠️ ATENÇÃO! ⚠️

**Não** realize commits diretamente na branch `main`. Todo commit na `main` dispara um workflow de deploy automático para **produção**. Use **sempre** Pull Requests a partir de suas branches de **feature**.

## Hospedagem

A aplicação é hospedada na Vercel. Devido a limitações de permissão de deploy automático em contas gratuitas para múltiplos colaboradores, utilizamos uma solução via GitHub Actions.

#### Fluxo de Deploy
O arquivo `.github/workflow/deploy.yml` utiliza a **Vercel CLI** para realizar o build e o upload da aplicação.

#### Variáveis de Ambiente (Secrets):
Para que o deploy funcione, as seguintes Secrets devem estar configuradas no repositório:

`VERCEL_TOKEN`: Token de acesso à conta AquaSaude.

`VERCEL_PROJECT_ID`: Identificador único do projeto BovCria.

`VERCEL_ORG_ID`: ID da organização na Vercel.

**SEGURANÇA**: Nunca exponha esses tokens em arquivos públicos ou logs de console.