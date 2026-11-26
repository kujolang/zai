#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"; KUJO_BIN="${KUJO_BIN:-$(command -v kujo)}"; cd "$ROOT"
"$KUJO_BIN" test-run tests/native_tests.kujo
"$KUJO_BIN" test-run tests/driver_tests.kujo
"$KUJO_BIN" run tests/runtime_smoke.kujo
echo "Z.ai offline release gate: PASS (native, driver, and VM fixtures)"
