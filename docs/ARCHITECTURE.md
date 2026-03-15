# Architecture (Runtime)

This document summarises the runtime data/control paths and the safety model for the edge CPS testbed.

## Components
- Sensor gateway (ESP32-C3 Supermini): publishes sensor telemetry to the broker via MQTT (periodic updates at Ts). When telemetry is unavailable, the actuator relies on local sensing.
- Actuator node (ESP32-C3 Supermini): subscribes to control/setpoint topics when connected. If broker/telemetry is missing for Th seconds, it enters degraded-safe mode and uses local closed-loop fallback control.
- Telemetry/fog node: observability stack (Prometheus); optional video relay/offload (go2rtc), depending on deployment.

## Data and control flow (high-level)
1) Telemetry: sensor → fog/telemetry (MQTT telemetry topics)
2) Commands: coordination → actuator (MQTT control/setpoint topics)
3) Feedback: actuator state/mode → broker/fog (MQTT state topics)

Topics (example): telemetry/* (sensor readings), control/* (setpoints/commands), state/* (actuator mode/relay state).

## Safety model
- Safe band: acceptable range for the process variable, temperature. Source: device safety requirements.
- Hardware cutoff: last-resort physical limit, bimetal switch, independent of network/software state.
- Degraded-safe mode: Topics (example): telemetry/* (sensor readings), control/* (setpoints/commands), state/* (actuator mode/relay state).

## Scope note
This repository focuses on runtime fault-tolerance behaviour (fallback and recovery). It does not claim “air-gapped” isolation or full “zero trust” unless explicitly implemented and documented.
