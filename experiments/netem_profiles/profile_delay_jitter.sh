apply_profile() {
  local IFACE="$1"
  # Example: 80ms delay with 20ms jitter
  sudo tc qdisc add dev "${IFACE}" root netem delay 80ms 20ms distribution normal
}
