# Definitions

This document records the operational definitions currently used in this testbed. These definitions are intended to keep comparison conditions consistent across planned impairment experiments.

## Weak-network condition

A network condition with injected delay, jitter, packet loss, bandwidth limits, or temporary partitions, reproduced with `tc/netem`.

## Process variable (PV)

The measured quantity that the local controller is trying to regulate. In the current testbed, one example is temperature.

## Safe band

The acceptable operating range for the process variable during normal and degraded-safe operation. For comparison purposes, the safe band is fixed within each run and is not changed during fallback or recovery.

## Cutoff threshold

A hard safety threshold outside the safe band that triggers hardware-level intervention. This threshold remains fixed within each run.

## Cutoff intervention

An event in which the independent hardware safety cutoff is triggered.

## Safe-band excursion

A period during which the process variable leaves the safe band.

- **Excursion frequency**: the number of distinct excursion events during a run
- **Excursion duration**: the total time spent outside the safe band during a run

## Degraded-safe mode

A local safety-preserving mode entered when remote coordination is no longer timely or trustworthy. In this mode, new remote setpoint changes are blocked while local closed-loop control continues.

## Local closed-loop control

A control path that continues operating at the edge node even when remote coordination is unavailable or restricted.

## Disconnection detection

Disconnection is detected using a fixed heartbeat timeout. The current initial value is `Th = 3 s`.

## Detection-to-failover latency

Detection-to-failover latency is the time elapsed from the heartbeat-timeout event to confirmed entry into degraded-safe mode.

## Reconnection detection

Reconnection is recognised at the edge node only when the MQTT client has re-established its session and the first valid post-reconnection heartbeat or message is successfully received by the edge node. A brief link return without restored message flow is not counted as recovery.

## Stable recovery

Stable recovery is defined by the process variable remaining within the safe band while the system is back in normal mode for a fixed time window. The current initial value is `W = 10 s`.

## Recovery latency

The time from reconnection detection to stable recovery.

## Unsafe outcome

An unsafe outcome includes either a cutoff intervention or a process-variable excursion outside the safe band.
