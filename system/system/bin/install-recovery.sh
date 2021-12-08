#!/system/bin/sh
if ! applypatch --check EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:5cd35d2ac64f79df71b2a80905ff2389d7b1c143; then
  applypatch  \
          --patch /system/recovery-from-boot.p \
          --source EMMC:/dev/block/platform/bootdevice/by-name/boot:33554432:21ce2ecbded58f8b4224c47edb5fe661a591d1cf \
          --target EMMC:/dev/block/platform/bootdevice/by-name/recovery:33554432:5cd35d2ac64f79df71b2a80905ff2389d7b1c143 && \
      log -t recovery "Installing new recovery image: succeeded" || \
      log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
