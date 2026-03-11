# edge-cps-resilience-testbed

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Status: Prototype](https://img.shields.io/badge/Status-Prototype-success)]()
[![Hardware: ESP32 & RPi](https://img.shields.io/badge/Hardware-ESP32%20%7C%20Raspberry%20Pi-blue)]()

> An ESP32-based edge cyber-physical system (CPS) testbed for studying safety-aware fallback and recovery under weak or partitioned networks.

## Overview
This repository contains a small edge CPS testbed with sensing/actuation, local fallback control, and telemetry logging. The goal is to evaluate middleware-level coordination rules (e.g., action gating and recovery coordination) under reproducible network impairments such as delay, jitter, loss, bandwidth constraints, and hard partitions.

**Safety model (high-level):**
- A device-specific **safe band** defines acceptable ranges for the controlled process variable (e.g., temperature).
- An independent **hardware safety cutoff** acts as the last-resort physical bound.
- Software-level degraded-safe behaviour aims to reduce unsafe excursions and reduce the need for cutoff interventions.

## Repository Structure
```text
├── actuator/             # ESP node configs for actuation & local fallback
│   └── tortoise-actuator.yaml
├── sensor/               # ESP node configs for sensor gateway / telemetry
│   └── tortoise-gateway.yaml
├── infrastructure/       # Fog/telemetry services and configs
│   ├── docker-compose.yml
│   ├── go2rtc.yaml
│   └── prometheus.yml
└── README.md
```

## What this testbed is (and is not)

**It is:**

* A prototype platform to run controlled impairment experiments and collect per-run telemetry.
* A baseline implementation to compare coordination strategies (e.g., unguarded vs action-gated control).

**It is not:**

* A claim of “air-gapped” isolation or a full zero-trust system.
* A performance guarantee (latency/uptime) without formal measurement reports.

## Key Components

* **Edge nodes (ESP32):**

  * Sensor gateway: publishes telemetry when available.
  * Actuator node: supports degraded-safe behaviour and local closed-loop fallback.
* **Telemetry/fog layer:**

  * Docker-based services for observability (Prometheus) and optional video relay/offload (go2rtc), depending on deployment.
* **Remote access (optional):**

  * Encrypted overlay access may be used for remote observability, without exposing public endpoints (details are sanitised and documented separately).

## Getting Started (minimal)

1. Bring up the fog/telemetry stack:

```bash
cd infrastructure
docker compose up -d
```

2. Configure/flash the ESP nodes using the YAML configs in `sensor/` and `actuator/`.
   (Exact flashing steps depend on your toolchain; see `docs/SETUP.md` once added.)

## Experimental Direction (summary)

Planned comparisons:

* Remote-dependent control vs gateway-centred control vs distributed local fallback
* Within distributed fallback: unguarded vs action-gated control under identical thresholds

Planned primary metrics:

* Cutoff intervention rate
* Safe-band excursion frequency and duration
* Failover latency (disconnection detection → degraded-safe entry)
* Recovery latency (reconnection detection → stable recovery)

See `docs/EXPERIMENT_PLAN.md` for the full plan and definitions.

## Origin

This testbed started as a small environmental control project and is being repurposed as a research-oriented prototype for studying weak-network resilience in edge CPS.

## License

MIT License (see `LICENSE`).
