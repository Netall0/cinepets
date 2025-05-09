.PHONY: help clean build test run install

FLUTTER := fvm flutter

help:
	@echo "Flutter Makefile с поддержкой FVM"
	@echo "===================="
	@echo "Доступные команды:"
	@echo "  make help      - показать это сообщение"
	@echo "  make clean     - очистить проект"
	@echo "  make install   - установить зависимости"
	@echo "  make test      - запустить тесты"
	@echo "  make run       - запустить приложение"

clean:
	@echo "clean project..."
	@$(FLUTTER) clean

install:
	@echo "installing depend..."
	@fvm install
	@$(FLUTTER) pub get

test:
	@echo "start test..."
	@$(FLUTTER) test


runDev:
	@echo "Start App in dev mode..."
	@flutter run --debug --flavor dev --dart-define=API_KEY=$(API_KEY)

runProd:
	@echo "Start release app..."
	@flutter run --release --flavor prod --dart-define=API_KEY=$(API_KEY)