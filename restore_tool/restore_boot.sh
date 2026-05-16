sudo ./spd_dump --wait 300 exec_addr 0x4ee8 \
  fdl fdl1-dl.bin 0x5000 \
  fdl fdl2-dl.bin 0x9efffe00 \
  exec \
  w uboot uboot_a.bin \
  w uboot uboot_b.bin \
  w splloader splloader.bin \
  w vbmeta_a vbmeta_a.bin \
  w vbmeta_b vbmeta_b.bin \
  reset
