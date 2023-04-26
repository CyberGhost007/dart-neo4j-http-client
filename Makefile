.PHONY: generate doc test

generate:
	flutter pub run build_runner build --delete-conflicting-outputs

doc:
	dart doc

test:
	dart rub test