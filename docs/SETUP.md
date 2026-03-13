# Setup (High-level)

## Fog / telemetry
1) cd infrastructure
2) docker compose up -d

## ESP nodes
Flash YAML configs in:
- sensor/
- actuator/

Toolchain:
- ESPHome
## Observability
- Prometheus config: infrastructure/prometheus.yml
- Check targets in Prometheus UI and confirm metrics are scraped.
