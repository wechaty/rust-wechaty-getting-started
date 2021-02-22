# rust-wechaty-getting-started

[![Gitpod Ready-to-Code](https://img.shields.io/badge/Gitpod-Ready--to--Code-blue?logo=gitpod)](https://gitpod.io/#https://github.com/wechaty/rust-wechaty-getting-started)
[![Wechaty in Rust](https://img.shields.io/badge/Wechaty-Rust-7de)](https://github.com/wechaty/rust-wechaty)

Rust Wechaty Starter Project Template that Works Out-of-the-Box

## Connecting Chatbots

[![Powered by Wechaty](https://img.shields.io/badge/Powered%20By-Wechaty-brightgreen.svg)](https://github.com/Wechaty/wechaty)

Wechaty is a RPA SDK for Wechat **Individual** Account that can help you create a chatbot quickly.

## A Basic Implementation of a Rust ChatBot

```rust
#![feature(async_closure)]

use wechaty::prelude::*;
use wechaty_puppet_service::PuppetService;

#[actix_rt::main]
async fn main() {
    let mut bot = Wechaty::new(
        PuppetService::new(PuppetOptions {
            endpoint: None,
            timeout: None,
            token: Some(env!("WECHATY_PUPPET_SERVICE_TOKEN").to_owned()),
        })
            .await
            .unwrap(),
    );
    bot.on_scan(async move |payload: ScanPayload, _ctx| {
            if let Some(qrcode) = payload.qrcode {
                println!("Visit https://wechaty.js.org/qrcode/{} to log in", qrcode)
            }
        })
        .on_login(async move |payload: LoginPayload<PuppetService>, _ctx| {
            println!("User {} logged in", payload.contact)
        })
        .on_message(async move |payload: MessagePayload<PuppetService>, _ctx| {
            println!("Message: {}", payload.message)
        })
        .start()
        .await;
}
```

## Requirements

1. Cargo

## Install

```shell
make install
```

## Run

Get a Token for your Bot first. Learn more from our [Wechaty Developers Program](https://github.com/wechaty/wechaty/wiki/Wechaty-Developer-Program)

```sh
export WECHATY_PUPPET_SERVICE_TOKEN=your_token_at_here

make bot
```

## Wechaty Getting Started in Multiple Languages

- [TypeScript Wechaty Getting Started](https://github.com/wechaty/wechaty-getting-started)
- [Python Wechaty Getting Started](https://github.com/wechaty/python-wechaty-getting-started)
- [Java Wechaty Getting Started](https://github.com/wechaty/java-wechaty-getting-started)
- [Go Wechaty Getting Started](https://github.com/wechaty/go-wechaty-getting-started)
- [Rust Wechaty Getting Started](https://github.com/wechaty/rust-wechaty-getting-started)

## Badge

[![Wechaty in Rust](https://img.shields.io/badge/Wechaty-Rust-7de)](https://github.com/wechaty/rust-wechaty)

```md
[![Wechaty in Rust](https://img.shields.io/badge/Wechaty-Rust-7de)](https://github.com/wechaty/rust-wechaty)
```

## Maintainers

[@wechaty/rust](https://github.com/orgs/wechaty/teams/rust/members)

## Copyright & License

- Code & Docs © 2021 - now Wechaty Contributors <https://github.com/wechaty>
- Code released under the Apache-2.0 License
- Docs released under Creative Commons