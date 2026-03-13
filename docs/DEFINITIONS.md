# Definitions

## Process variable (PV)
Example: temperature.

## Safe band
Range derived from device safety requirements. Keep thresholds fixed across baselines.

## Cutoff intervention
An event where the independent hardware safety cutoff triggers.

## Safe-band excursion
PV leaves the safe band. Record:
- frequency (count per run)
- duration (total time outside band per run)

## Disconnection detection
Heartbeat timeout Th (fixed).

## Failover latency
Time from disconnection detection to degraded-safe entry.

## Reconnection detection
Link restoration detection (fixed criterion; define for your setup).

## Stable recovery
PV stays within safe band AND mode remains normal for W seconds.

## Recovery latency
Time from reconnection detection to stable recovery.
