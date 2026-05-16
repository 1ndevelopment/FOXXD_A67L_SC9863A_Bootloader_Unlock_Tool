##############################
## Unlocking the bootloader ##
##############################

Power off your device fully.

Reconnect while hold VOL UP + VOL DOWN

1. Dump stock splloader + uboot and erase
```bash
sudo ./spd_dump --wait 300 exec_addr 0x4ee8 fdl fdl1-dl.bin 0x5000 fdl fdl2-dl.bin 0x9efffe00 exec r splloader r uboot e splloader e splloader_bak reset
```

2. Patch loader
```bash
./gen_spl-unlock splloader.bin
mv splloader.bin u-boot-spl-16k-sign.bin
./chsize uboot.bin
mv ./uboot.bin ./uboot_bak.bin
```

3. Flash the nvram tools

```bash
sudo ./spd_dump --wait 300 exec_addr 0x4ee8 fdl fdl1-dl.bin 0x5000 fdl fdl2-dl.bin 0x9efffe00 exec w uboot fdl2-cboot.bin reset
```

4. Unlock runs here, may need to run this command twice
```bash
sudo ./spd_dump exec_addr 0x4ee8 fdl spl-unlock.bin 0x5000
sudo ./spd_dump exec_addr 0x4ee8 fdl spl-unlock.bin 0x5000
```

5. Check unlock (if you get 64 zeros, locked; if 32 string + 16 hash + 16 hash, unlocked)

```bash
sudo ./spd_dump exec_addr 0x4ee8 fdl fdl1-dl.bin 0x5000 fdl fdl2-dl.bin 0x9efffe00 exec verbose 2 read_part miscdata 8192 64 m.bin reset
hexdump -C m.bin
```

- If you see 64 zeros, it's still locked (and we may need to retry).
- If you see a 32-character string followed by a hash, the unlock was successful!

6. Restore spl and uboot
```bash
sudo ./spd_dump exec_addr 0x4ee8 fdl fdl1-dl.bin 0x5000 fdl fdl2-dl.bin 0x9efffe00 exec r boot w splloader u-boot-spl-16k-sign.bin w uboot uboot_bak.bin w misc misc-wipe.bin reset
```

Profit!

---
