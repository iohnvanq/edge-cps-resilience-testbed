# Architecture (Short)

This document describes the runtime data/control paths and the safety model.

## Components
- Sensor gateway (ESP32-C3 Supermini): publishes telemetry when connectivity is available.
- Actuator node (ESP32-C3 Supermini): local closed-loop fallback + degraded-safe modes.
- Telemetry/fog node: observability stack (Prometheus); optional video relay/offload (go2rtc).

## Data and control flow (high-level)
1) Telemetry: sensor → fog/telemetry
2) Commands: coordination → actuator (when available)
3) Feedback: actuator state/mode → coordination (when available)

## Safety model
- Safe band: acceptable range for the process variable (e.g., temperature). Source: device safety requirements.
- Hardware cutoff: last-resort physical limit, independent of network/software state.
- Degraded-safe mode: blocks remote setpoint changes; actuator relies on local sensing/logic.

## Notes
Avoid claims like “air-gapped” or “zero trust” unless you implement identity + authorisation at the service level.
