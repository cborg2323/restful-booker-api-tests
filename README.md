# 🧪 Restful-Booker API Automated Testing Suite

[![Newman API Tests & HTML Extra Report](https://github.com/cborg2323/restful-booker-api-tests/actions/workflows/newman.yml/badge.svg)](https://github.com/cborg2323/restful-booker-api-tests/actions/workflows/newman.yml)
[![Live Report](https://img.shields.io/badge/Live%20Report-GitHub%20Pages-brightgreen?style=flat&logo=github)](https://cborg2323.github.io/restful-booker-api-tests/)

A professional, production-ready Automated API Testing framework for the [Restful-Booker API](https://restful-booker.herokuapp.com/). Built using **Postman**, **Newman**, **newman-reporter-htmlextra**, **Docker**, **Makefile**, and **GitHub Actions**.

📊 **[View Interactive Live HTML Report](https://cborg2323.github.io/restful-booker-api-tests/)**

---

## 🚀 Key Technical Highlights

- **Full Lifecycle E2E Testing**: Covers authentication, CRUD operations (Create, Read, Update, Delete), and environment state cleanup.
- **Dynamic State Persistence**: Automatically extracts session tokens and entity IDs (`bookingId`) dynamically across execution order (`Post-response` scripts).
- **Contract Testing (JSON Schema)**: Uses AJV JSON Schema validation to enforce API contract integrity.
- **SLA & Resilience Assertion**: Verifies response times (< 1500ms) and standard HTTP protocol header compliance.
- **Containerized Execution**: Non-root Dockerized runner for zero-dependency execution across any environment.
- **CI/CD Integration**: Fully automated execution via GitHub Actions on every `push`/`pull_request` with automated deployment to GitHub Pages.

---

## 🛠 Project Architecture

```text
.
├── .github/
│   └── workflows/
│       └── newman.yml          # GitHub Actions CI/CD Pipeline
├── postman/                     # Postman v12 Local Workspace Files (YAML)
├── src/
│   └── postman/                # Exported Executable JSON Suites for Newman
│       ├── Restful-Booker API Suite.postman_collection.json
│       └── Restful-Booker Prod.postman_environment.json
├── reports/
│   └── htmlextra/              # Generated Interactive HTML Reports
├── Dockerfile                  # Lightweight Alpine-based Newman Runner
├── docker-compose.yml          # One-click Docker Orchestration
├── Makefile                    # Task runner for Local & Dockerized commands
└── README.md
```

---

## ⚡ Quick Start

### Option 1: Using Docker Compose (Recommended - Zero Dependencies)

No Node.js or Newman setup required. Run the entire suite and generate the interactive report with a single command:

```bash
docker compose up
```

Once execution finishes, open `reports/htmlextra/report.html` in your web browser.

---

### Option 2: Using Makefile

If you have `make` installed, you can choose your preferred execution method:

```bash
# Run tests via Docker and automatically open the report in your browser
make test-docker

# Run tests locally (requires Node.js & Newman installed globally)
make test

# Open the latest generated report in your default browser
make open-report

# Clean up previously generated reports
make clean
```

---

## 🔄 CI/CD Pipeline & Reporting

Every commit pushed to `main` triggers a GitHub Actions pipeline that:
1. Runs the Postman collection via Newman inside an isolated environment.
2. Generates an interactive **HTML Extra Report**.
3. Uploads the report as a build artifact.
4. Deploys the static report to **GitHub Pages**.

🔗 **Live Report**: [https://cborg2323.github.io/restful-booker-api-tests/](https://cborg2323.github.io/restful-booker-api-tests/)

---

## 👨‍💻 Author

**QA Test Automation Engineer**
- **GitHub**: [@cborg2323](https://github.com/cborg2323)
- **Services**: End-to-End API Test Automation, Performance SLA Assertions, CI/CD Pipeline Quality Gates.