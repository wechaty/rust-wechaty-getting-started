.PHONY: all
all: bot

.PHONY: install
install:
	cargo build --release --example ding-dong-bot

.PHONY: bot
bot:
	cargo run --example ding-dong-bot

.PHONY: clean
clean:
	cargo clean