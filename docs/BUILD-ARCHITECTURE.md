**English** | [Русский](BUILD-ARCHITECTURE.ru.md)

# Build architecture

> User documentation: [installation](INSTALL.md), [capabilities](CAPABILITIES.md), [API reference](API.md), [security](SECURITY.md).

One connector source tree produces two platform-specific release artifacts:

- **MODX Revolution 2.8.x** — platform key `modx2`, transport package `modx2mcp-<version>-pl.transport.zip`;
- **MODX Revolution 3.x** — platform key `modx3`, transport package `modx3mcp-<version>-pl.transport.zip`.

Both artifacts use the same MCP client, the same public action contract, and the same modular runtime under `core/components/modxmcp/src/`.

Shared payload:

- `core/components/modxmcp/src/`;
- tools, registry, extras, endpoint logic and documentation;
- platform-neutral assets and manager logic where MODX 2 and MODX 3 behave the same.

Platform-specific build/bootstrap files live under `_build/platform/<platform>/`. `_build/prepare-release.py` creates a clean staging tree for the selected platform and applies only the required overlay.

The architecture deliberately avoids scattering `if (MODX_VERSION...)` checks through domain tools. MODX-version differences are isolated at bootstrap/build boundaries and behind `PlatformInterface`.

## Preparing a release tree

MODX 3:

```bash
python3 _build/prepare-release.py --platform modx3 --output /tmp/modxmcp-modx3
```

MODX 2:

```bash
python3 _build/prepare-release.py --platform modx2 --output /tmp/modxmcp-modx2
```

Build each transport package on a MODX installation of the matching major version.

## Current release: 1.2.2 platform build

The two platform-specific transports retain `MODX2MCP` / `MODX3MCP` package identities and a shared `modxmcp` namespace. The MODX 2 staging overlay replaces both manager controllers (`index`, `graph`) and the new `gettoken3` / `savesettings3` processors with `modProcessor`-compatible variants. The responsive dashboards, graph CSS/JS and lexicons are shared. The current **published** v1.2.2 contract has 193 server actions (81 reads / 112 mutations), including 192 public MCP tools and the internal `get_capabilities` action. The two platform-specific v1.2.2 transport archives were built, installed and smoke-tested on authorized MODX 2.8.9-pl and MODX 3.2.4-pl test sites. Previous release 1.2.1 notes below are historical.

## Historical validation: version 1.2.1

At its release, v1.2.1 supported both MODX generations with **192/192** server actions: 81 reads and 111 mutations. These are **historical 1.2.1 results**, not the current 1.2.2 contract. Relative to v1.1.0, the 1.2.0 line added 10 actions and Runtime CAS/stale-state protection.

- v1.2.1 modular action coverage: **192/192**;
- MODX 3.2.4-pl: the complete 14-suite live regression belongs to the historical v1.2.0 validation; v1.2.1 also passed its own transport release-smoke;
- MODX 3 processor compatibility: passed against 3.2.2-pl, 3.2.4-pl and current 3.x (113 referenced processor files);
- MODX 2.8.9-pl: transport release-smoke, 81-action read parity and the core/runtime mutation matrix passed; positive MIGX lifecycle is skipped because MIGX is not installed on that sandbox;
- Runtime CAS/stale-state smoke passed on both supported MODX generations;
- the positive MIGX mutation lifecycle passed 3/3 on MODX 3.
