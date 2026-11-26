# Z.ai / GLM Provider for Kujo

[![Version](https://img.shields.io/badge/version-0.1.1-black)](https://github.com/kujolang/zai/releases/tag/v0.1.1)
[![License](https://img.shields.io/badge/license-MIT-black)](LICENSE)
[![built with Kujo](https://img.shields.io/badge/built%20with-Kujo-black)](https://github.com/kujolang/kujo)

Z.ai GLM chat provider for Kujo with OpenAI-compatible inference and
provider-owned reasoning, tools, and vision request fields.

## Install

The current source requires Kujo 1.4.0 or later. The tagged v0.1.1 release supports Kujo 1.0.2.

```bash
kujo run /path/to/kennel/kennel.kujo -- add github:kujolang/zai@v0.1.1 --alias zai
kujo run /path/to/kennel/kennel.kujo -- install
```

## 30-second quick start

```kujo
from zai import create_client, chat

client := create_client({
    "api_key": env("ZAI_API_KEY"),
    "model": "glm-4.6",
})

result := chat(client, {
    "messages": [{"role": "user", "content": "Say hello."}],
})
if !result["ok"] {
    print(result["message"])
    exit(1)
}
print(result["data"]["choices"][0]["message"]["content"])
```

## Native Provider API

GLM models can expose reasoning, tools, and multimodal content. Those fields
remain visible in the native request and raw response.

```kujo
from zai import create_client, chat

client := create_client({"model": "glm-4.6"})
result := chat(client, {
    "messages": [
        {"role": "user", "content": "Explain GLM reasoning controls."},
    ],
    "thinking": {"type": "enabled"},
})
```

## AI SDK integration

The Z.ai driver preserves GLM thinking controls, full tool-turn messages, and multimodal content. Native callers can set `stream: true` to receive completed SSE events. The driver normalizes finish reason, usage, and streamed tool calls while retaining the raw events.

```kujo
from zai import zai_provider
from src.ai_sdk import create_client, chat_completion

provider := zai_provider({"model": "glm-4.6"})
client := create_client(provider, null)
result := chat_completion(client, [{"role": "user", "content": "Hello."}], {})
if result["ok"] { print(result["output_text"]) }
```

## Authentication and security

Set `ZAI_API_KEY`. The native client validates the configured HTTPS URL and bearer value, disables redirects, caps responses at 8 MiB, and redacts the key from returned diagnostics. The AI SDK factory uses the official Z.ai HTTPS endpoint.

## Testing and docs

```bash
bash scripts/release_quality_gate.sh
```

See [`docs/`](docs/) for evidence.
