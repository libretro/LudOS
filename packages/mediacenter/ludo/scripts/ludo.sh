#!/bin/sh

LOGDIR=/storage/logfiles
LOGFILE=${LOGDIR}/ludo.log

[ -d "${LOGDIR}" ] || mkdir -p "${LOGDIR}"
exec >>"${LOGFILE}" 2>&1

echo "===== $(date -u +%Y-%m-%dT%H:%M:%SZ) ludo start ====="

. /etc/profile

echo "HOME=${HOME}"
echo "DISPLAY=${DISPLAY}"
echo "WAYLAND_DISPLAY=${WAYLAND_DISPLAY}"
echo "XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR}"

if [ -n "${WAYLAND_DISPLAY}" ] && [ -n "${XDG_RUNTIME_DIR}" ]; then
  WAYLAND_SOCKET="${XDG_RUNTIME_DIR}/${WAYLAND_DISPLAY}"
  echo "Waiting for Wayland socket: ${WAYLAND_SOCKET}"
  for i in $(seq 1 40); do
    [ -S "${WAYLAND_SOCKET}" ] && break
    usleep 250000
  done
  if [ -S "${WAYLAND_SOCKET}" ]; then
    ls -l "${WAYLAND_SOCKET}"
  else
    echo "Wayland socket not ready"
  fi
fi

exec /usr/bin/ludo "$@"
