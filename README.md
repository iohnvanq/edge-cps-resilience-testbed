# edge-cps-resilience-testbed

A small ESP32-based cyber-physical system testbed for studying degraded-safe fallback and recovery under weak or partitioned networks.

## Overview

This repository documents a small edge CPS testbed and the experiment notes around it. The focus is on what happens when connectivity becomes unreliable due to delay, jitter, loss, bandwidth limits, or temporary partitions.

The main research interest is how fallback and recovery should be coordinated under these conditions, especially when stale commands, delayed mode switching, and unstable recovery after reconnection can affect safety. The system uses local closed-loop behaviour during degraded operation and keeps an independent hardware cutoff as the last resort.

## Research Focus

This testbed is intended to support practical questions such as:

- when remote coordination becomes unsafe under weak networks
- how degraded-safe behaviour should be entered and maintained
- how local fallback should behave during disconnection
- how recovery should be coordinated after reconnection
- how unsafe outcomes and recovery behaviour appear across repeated runs

## What This Repository Currently Contains

```text
.
├── docs/
│   ├── ARCHITECTURE.md
│   ├── DEFINITIONS.md
│   ├── EXPERIMENT_PLAN.md
│   ├── SECURITY_NOTES.md
│   └── SETUP.md
├── experiments/
│   ├── netem_profiles/
│   │   ├── profile_bandwidth.sh
│   │   ├── profile_delay_jitter.sh
│   │   ├── profile_loss_burst.sh
│   │   └── profile_partition.sh
│   └── run_profile.sh
├── .gitignore
├── LICENSE
└── README.md
```

This public version mainly contains documentation and reproducible impairment helpers. It is intended to show the current testbed setup and experiment direction, rather than serve as a complete deployment package.

## Current Status

- A small ESP32-based testbed has been built with local control, telemetry logging, and an independent hardware safety cutoff.
- Operational definitions for degraded-safe behaviour, failover, recovery, and safety thresholds are being finalised for the planned comparisons.
- Reproducible weak-network profiles are being prepared for controlled experiments.
- Comparative impairment experiments are planned, rather than presented here as completed results.

## Minimal Workflow

A typical run currently follows this workflow:

1. prepare the local CPS nodes and broker
2. confirm normal closed-loop behaviour
3. apply a selected impairment profile with `tc/netem`
4. observe mode switching, excursions, cutoff behaviour, and recovery
5. remove the impairment
6. record the run for later comparison

## Repository Guide

### `docs/`
Project notes and working definitions.

- `ARCHITECTURE.md`  
  High-level structure of the testbed and component roles.

- `DEFINITIONS.md`  
  Operational definitions used in experiments, including degraded-safe mode, failover latency, recovery latency, safe band, and cutoff behaviour.

- `EXPERIMENT_PLAN.md`  
  Planned comparison logic, evaluation conditions, and target metrics.

- `SECURITY_NOTES.md`  
  Scope-limited notes for the public version of this repository.

- `SETUP.md`  
  Minimal setup notes for flashing, local services, and impairment experiments.

### `experiments/`
Helpers for reproducible weak-network testing.

- `netem_profiles/` contains example profiles for:
  - delay and jitter
  - bursty loss
  - bandwidth limitation
  - temporary partition

- `run_profile.sh` is a small wrapper for applying a selected profile to a target interface.

## Scope Note

This repository should be read as a small research-oriented testbed and documentation package. It does not claim a complete production system. The goal is to make the current setup, assumptions, and experiment direction clear enough to show the testbed’s current scope and research direction.

## License

MIT License. See `LICENSE`.
