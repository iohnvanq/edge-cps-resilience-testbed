#!/usr/bin/env bash
set -euo pipefail

# Usage:
#   ./run_profile.sh <profile_name> <iface>
# Example:
#   ./run_profile.sh delay_jitter eth0
#
# Profiles live in experiments/netem_profiles/
# Make sure you understand which interface affects the target link.

PROFILE="${1:-}"
IFACE="${2:-}"

if [[ -z "$PROFILE" || -z "$IFACE" ]]; then
  echo "Usage: $0 <profile_name> <iface>"
  exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROFILE_PATH="${SCRIPT_DIR}/netem_profiles/profile_${PROFILE}.sh"

if [[ ! -f "$PROFILE_PATH" ]]; then
  echo "Profile not found: $PROFILE_PATH"
  exit 1
fi

echo "[INFO] Clearing existing qdisc on ${IFACE}"
sudo tc qdisc del dev "${IFACE}" root 2>/dev/null || true

echo "[INFO] Applying profile ${PROFILE} on ${IFACE}"
# shellcheck disable=SC1090
source "${PROFILE_PATH}"
apply_profile "${IFACE}"

echo "[INFO] Applied. To clear:"
echo "  sudo tc qdisc del dev ${IFACE} root"
