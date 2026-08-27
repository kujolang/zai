# Z.ai Implementation Report

## Executive Summary

OpenAI-compatible GLM provider with provider-owned reasoning/tool/multimodal
request fields retained natively.

## Official API Evidence

- https://docs.z.ai/guides/overview
- https://docs.z.ai/api-reference

## Evidence Date

2026-08-27.

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

`create_client`, `chat`, `zai_provider`, `zai_driver`; Kujo `>= 1.0.2` and
immutable AI SDK `github:kujolang/ai-sdk@v1.1.0`.

## Authentication / Security

`ZAI_API_KEY` Bearer auth, HTTPS policy, host validation, and redaction are
covered by deterministic fixtures.

## Tests / Distribution

Three deterministic tests pass. Clean-room install, lockfile reinstall,
installed smoke, and immutable v0.1.1 release are completed by the release loop.

## Live Validation

SKIPPED — credentials/environment unavailable.

## AI SDK Changes / Kujo Changes / Kennel Changes

None.

## Contract Conformance / Limitations

See `ZAI_PROVIDER_PACKAGE_CONFORMANCE.md`. Additional GLM endpoints and model
catalog APIs are outside this early release.
