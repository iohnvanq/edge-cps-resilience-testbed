# Experiment Plan

## Goal
Evaluate coordination rules for safety-aware fallback and recovery under weak/partitioned networks.

## Baselines
A) Remote-dependent: no local degraded-safe semantics; safety depends on end-to-end connectivity.  
B) Gateway-centred: hold-last setpoint; gateway-authoritative overwrite on recovery; no edge-to-edge coordination.  
C) Distributed local fallback: local coordination during disconnection; reconciliation on recovery.  
Within C: compare unguarded vs action-gated control with identical thresholds.

## Hypotheses
H1: Action-gated control reduces cutoff activations and safe-band excursion frequency/duration vs unguarded fallback.  
H2: Distributed local fallback reduces recovery latency and post-reconnection cutoff activations vs gateway-centred overwrite.

## Impairments (reproducible)
- delay
- jitter
- loss (including burst)
- bandwidth constraints
- hard partition

## Metrics (definitions in DEFINITIONS.md)
- cutoff rate
- excursion frequency and duration
- failover latency (disconnection detection → degraded-safe entry)
- recovery latency (reconnection detection → stable recovery)

## Reporting
- distribution-based reporting with confidence intervals
- keep thresholds fixed across baselines
