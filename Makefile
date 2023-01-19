# =============================================================================
.SILENT:
.DEFAULT_GOAL:=run
SHELL:=/usr/bin/bash
VENV_DIR:=.venv

.PHONY: setup run lint format test build

setup:
	test -d $(VENV_DIR) || python3 -m venv $(VENV_DIR)
	poetry install

run:
	python raft/$(FILE)

lint:
	flake8 --show-source .
	bandit -q -r -c "pyproject.toml" .

format:
	black .

test:
	pytest

build:
	poetry build -q

clean:
	rm -rf $(VENV_DIR)
	find . -type d -name '__pycache__' -exec rm -rf {} +
# =============================================================================
