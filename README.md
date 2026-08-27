# Z.ai / GLM Provider for Kujo

[![Version](https://img.shields.io/badge/version-0.1.0-black)](https://github.com/kujolang/zai/releases/tag/v0.1.0)
[![License](https://img.shields.io/badge/license-MIT-black)](LICENSE)
[![built with Kujo](https://img.shields.io/badge/built%20with-Kujo-black)](https://github.com/kujolang/kujo)

Z.ai GLM chat provider for Kujo with OpenAI-compatible inference and
provider-owned reasoning, tools, and vision request fields.

## Install

```bash
kujo kennel add github:kujolang/zai@v0.1.0
kujo kennel install
```

## 30-second quick start

```kujo
from zai import create_client, chat

client := create_client({
    "api_key": env("ZAI_API_KEY"),
    "model": "glm-4.5",
})

result := chat(client, {
    "messages": [{"role": "user", "content": "Say hello."}],
})
print(result["data"])
```

## Native Provider API

GLM models can expose reasoning, tools, and multimodal content. Those fields
remain visible in the native request and raw response.

```kujo
from zai import create_client, chat

client := create_client({"model": "glm-4.5"})
result := chat(client, {
    "messages": [
        {"role": "user", "content": "Explain GLM reasoning controls."},
    ],
    "thinking": {"type": "enabled"},
})
```

## AI SDK integration

The public Z.ai provider factory uses the compatible chat driver while leaving
GLM-specific reasoning and multimodal fields native.

```kujo
from zai import zai_provider
from ai_sdk import generate_text

provider := zai_provider({"model": "glm-4.5"})
result := generate_text(provider, {"messages": [{"role": "user", "content": "Hello."}]})
print(result["text"])
```

## Authentication and security

Set `ZAI_API_KEY`. Requests use the official Z.ai HTTPS endpoint; credentials
are host-bound, embedded URL credentials are rejected, and errors are redacted.

## Testing and docs

```bash
bash scripts/release_quality_gate.sh
```

See [`docs/`](docs/) for evidence.
