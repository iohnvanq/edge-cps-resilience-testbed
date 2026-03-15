apply_profile() {
  local IFACE="$1"
  # Example: 1% loss with 5% burst (simplified)
  sudo tc qdisc add dev "${IFACE}" root netem loss 1% 25%
}
