# Z.ai Implementation Report

## Executive Summary

OpenAI-compatible GLM provider with provider-owned reasoning/tool/multimodal
request fields retained natively.

## Official API Evidence

- [Z.ai Chat Completion](https://docs.z.ai/api-reference/llm/chat-completion)
- [Z.ai Stream Tool Call](https://docs.z.ai/guides/tools/stream-tool)

## Evidence Date

2026-11-26.

## Protocol Classification

OPENAI-COMPATIBLE PRIMARY with GLM extensions.

## Native Center / Coverage

GLM chat inference, model selection, bearer authentication, and native request
metadata.

## AI SDK Applicability Matrix

| Operation | Classification |
|---|---|
| Chat | AI SDK CHAT MAPPABLE |
| Reasoning/vision extensions | NATIVE EXTENSIONS |

## Public Exports / Dependencies

`create_client`, `chat`, `zai_provider`, `zai_driver`; current source requires Kujo `>= 1.4.0` for the byte-count limit and compiled runtime fixture. The tagged v0.1.1 release requires Kujo `>= 1.0.2`. The AI SDK dependency remains `github:kujolang/ai-sdk@v1.1.0`.

## Authentication / Security

`ZAI_API_KEY` Bearer auth, HTTPS policy, host validation, and redaction are
covered by deterministic fixtures.

## Tests / Distribution

The offline gate covers native transport, GLM driver normalization, and execution through the compiled VM. The installed smoke exercises both root exports and the driver stream parser.

## Live Validation

SKIPPED — credentials/environment unavailable.

## AI SDK Changes / Kujo Changes / Kennel Changes

None.

## Contract Conformance / Limitations

See `ZAI_PROVIDER_PACKAGE_CONFORMANCE.md`. Additional GLM endpoints and model
catalog APIs are outside this early release.
