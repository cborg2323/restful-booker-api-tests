# Variáveis de caminhos
COLLECTION = src/postman/Restful-Booker API Suite.postman_collection.json
ENVIRONMENT = src/postman/Restful-Booker Prod.postman_environment.json
REPORT_DIR = reports/htmlextra
REPORT_FILE = $(REPORT_DIR)/report.html
DOCKER_IMAGE = restful-booker-tests

.PHONY: all test test-docker build-docker clean open-report help

# Alvo padrão ao executar apenas 'make'
all: test

# Executa os testes localmente e abre o relatório no navegador
test:
	@echo "🚀 Executando testes localmente..."
	@mkdir -p $(REPORT_DIR)
	newman run "$(COLLECTION)" \
		-e "$(ENVIRONMENT)" \
		-r htmlextra \
		--reporter-htmlextra-export "$(REPORT_FILE)"
	@echo "✅ Relatório gerado em: $(REPORT_FILE)"
	@$(MAKE) open-report

# Constrói a imagem Docker
build-docker:
	@echo "🐳 Construindo imagem Docker..."
	docker build -t $(DOCKER_IMAGE) .

# Executa os testes via Docker (com permissão de usuário local) e abre o relatório
test-docker: build-docker
	@echo "🚀 Executando testes via Docker..."
	@mkdir -p $(REPORT_DIR)
	docker run --rm -u $$(id -u):$$(id -g) -v $$(pwd):/etc/newman $(DOCKER_IMAGE)
	@echo "✅ Relatório gerado em: $(REPORT_FILE)"
	@$(MAKE) open-report

# Abre o relatório HTML diretamente no navegador padrão
open-report:
	@echo "🌐 Abrindo relatório no navegador..."
	@if command -v xdg-open > /dev/null; then xdg-open "$(REPORT_FILE)"; \
	elif command -v open > /dev/null; then open "$(REPORT_FILE)"; \
	elif command -v wslview > /dev/null; then wslview "$(REPORT_FILE)"; \
	else echo "Abra manualmente o arquivo: $(REPORT_FILE)"; fi

# Remove os relatórios HTML gerados
clean:
	@echo "🧹 Limpando relatórios antigos..."
	rm -rf $(REPORT_DIR)/*
	@echo "✨ Pasta de relatórios limpa!"

# Exibe os comandos disponíveis
help:
	@echo "Comandos disponíveis:"
	@echo "  make test          - Executa localmente e abre o relatório"
	@echo "  make test-docker   - Executa via Docker e abre o relatório"
	@echo "  make open-report   - Abre o relatório no navegador"
	@echo "  make clean         - Apaga os relatórios gerados"