# Fiver gig
Postman + Newman + Docker: Maior demanda no Fiverr, excelente para demonstrar relatórios visuais HTML e fácil de rodar no ambiente do cliente sem dependências locais.

## Passo a Passo de Implementação

- **Testes no Postman (Coleção)**
    - Contratos e Schemas: Use a biblioteca nativa tv4 ou Ajv na aba Tests do Postman para validar se a resposta bate com a estrutura JSON esperada.
    - Fluxos de Regressão: Teste o ciclo de vida completo do recurso (ex: POST /pet -> GET /pet/{id} -> PUT /pet -> DELETE /pet/{id}). **OK**
- **Relatório visual (Newman HTML Extra)**: Configure o plugin newman-reporter-htmlextra. Esse  relatório gera gráficos interativos e detalhados sobre as falhas e sucessos, o que chama muita atenção de clientes no Fiverr. **OK**
- **Dockerização**: Crie um Dockerfile leve baseado em postman/newman que instala o reporter HTML e executa os testes gerando o arquivo dentro de um volume montado. **OK**
- **Automação no GitHub Actions**: Crie o workflow para rodar a suíte a cada push e publicar os relatórios HTML como artefato de build da pipeline.
- **Apresentação no README.md (O Ponto Crítico)**:
    - Badges: Adicione status da build do GitHub Actions.
    - Demonstração: Inclua prints ou GIFs do relatório HTML gerado pelo Newman.
    - Quick Start: Instruções claras para o cliente rodar localmente usando apenas docker compose up.
- Criar um Makefile ou script Bash para rodar localmente ou no container gerando um arquivo local com um único comando