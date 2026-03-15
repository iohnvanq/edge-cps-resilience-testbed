apply_profile() {
  local IFACE="$1"
  # Example: limit to 1mbit with 50ms latency
  sudo tc qdisc add dev "${IFACE}" root tbf rate 1mbit burst 32kbit latency 50ms
}
