apply_profile() {
  local IFACE="$1"
  # Example: hard partition by dropping all packets (use with care)
  sudo tc qdisc add dev "${IFACE}" root netem loss 100%
}
