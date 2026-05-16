#!/usr/bin/env bash
# Full device restore — erases and writes all available partitions (65 total)
# Uses fdl2-dl-unbl.bin so splloader is not blocked by the FDL2 blacklist
#
# Prerequisites:
#   - spd_dump, fdl1-dl.bin, fdl2-dl-unbl.bin in the same directory
#   - All .bin files in the same directory (or adjust BINDIR below)
#   - Enter BROM mode before running:
#       Power off → hold Vol-Up → plug USB → release when spd_dump connects
#
# Skipped (not in your file list): cache, blackbox, userdata
# Skipped (not a real GPT partition): vbmeta_pubkey.bin, keys/, extracted/

BINDIR="../FOXXD_A67L_SC9863A_Android14_U01005_251020_stock_dump"   # change if your .bin files are in a subdirectory

./spd_dump \
  --kick --wait 300 \
  exec_addr 0x4ee8 \
  fdl fdl1-dl.bin 0x5000 \
  fdl fdl2-dl-unbl.bin 0x9efffe00 \
  exec \
  w_force splloader        $BINDIR/splloader.bin \
  w_force prodnv           $BINDIR/prodnv.bin \
  w_force miscdata         $BINDIR/miscdata.bin \
  w_force misc             $BINDIR/misc.bin \
  w_force trustos_a        $BINDIR/trustos_a.bin \
  w_force trustos_b        $BINDIR/trustos_b.bin \
  w_force sml_a            $BINDIR/sml_a.bin \
  w_force sml_b            $BINDIR/sml_b.bin \
  w_force uboot_a          $BINDIR/uboot_a.bin \
  w_force uboot_b          $BINDIR/uboot_b.bin \
  w_force uboot_log        $BINDIR/uboot_log.bin \
  w_force logo             $BINDIR/logo.bin \
  w_force fbootlogo        $BINDIR/fbootlogo.bin \
  w_force l_fixnv1_a      $BINDIR/l_fixnv1_a.bin \
  w_force l_fixnv2_a      $BINDIR/l_fixnv2_a.bin \
  w_force l_fixnv1_b      $BINDIR/l_fixnv1_b.bin \
  w_force l_fixnv2_b      $BINDIR/l_fixnv2_b.bin \
  w_force l_runtimenv1    $BINDIR/l_runtimenv1.bin \
  w_force l_runtimenv2    $BINDIR/l_runtimenv2.bin \
  w_force persist          $BINDIR/persist.bin \
  w_force l_modem_a       $BINDIR/l_modem_a.bin \
  w_force l_modem_b       $BINDIR/l_modem_b.bin \
  w_force l_deltanv_a     $BINDIR/l_deltanv_a.bin \
  w_force l_deltanv_b     $BINDIR/l_deltanv_b.bin \
  w_force l_gdsp_a        $BINDIR/l_gdsp_a.bin \
  w_force l_gdsp_b        $BINDIR/l_gdsp_b.bin \
  w_force l_ldsp_a        $BINDIR/l_ldsp_a.bin \
  w_force l_ldsp_b        $BINDIR/l_ldsp_b.bin \
  w_force pm_sys_a         $BINDIR/pm_sys_a.bin \
  w_force pm_sys_b         $BINDIR/pm_sys_b.bin \
  w_force teecfg_a         $BINDIR/teecfg_a.bin \
  w_force teecfg_b         $BINDIR/teecfg_b.bin \
  w_force hypervsior_a     $BINDIR/hypervsior_a.bin \
  w_force hypervsior_b     $BINDIR/hypervsior_b.bin \
  w_force boot_a           $BINDIR/boot_a.bin \
  w_force boot_b           $BINDIR/boot_b.bin \
  w_force vendor_boot_a    $BINDIR/vendor_boot_a.bin \
  w_force vendor_boot_b    $BINDIR/vendor_boot_b.bin \
  w_force init_boot_a      $BINDIR/init_boot_a.bin \
  w_force init_boot_b      $BINDIR/init_boot_b.bin \
  w_force dtb_a            $BINDIR/dtb_a.bin \
  w_force dtb_b            $BINDIR/dtb_b.bin \
  w_force dtbo_a           $BINDIR/dtbo_a.bin \
  w_force dtbo_b           $BINDIR/dtbo_b.bin \
  w_force super            $BINDIR/super.bin \
  w_force vbmeta_a         $BINDIR/vbmeta_a.bin \
  w_force vbmeta_b         $BINDIR/vbmeta_b.bin \
  w_force metadata         $BINDIR/metadata.bin \
  w_force sysdumpdb        $BINDIR/sysdumpdb.bin \
  w_force vbmeta_system_a      $BINDIR/vbmeta_system_a.bin \
  w_force vbmeta_system_b      $BINDIR/vbmeta_system_b.bin \
  w_force vbmeta_vendor_a      $BINDIR/vbmeta_vendor_a.bin \
  w_force vbmeta_vendor_b      $BINDIR/vbmeta_vendor_b.bin \
  w_force vbmeta_system_ext_a  $BINDIR/vbmeta_system_ext_a.bin \
  w_force vbmeta_system_ext_b  $BINDIR/vbmeta_system_ext_b.bin \
  w_force vbmeta_product_a     $BINDIR/vbmeta_product_a.bin \
  w_force vbmeta_product_b     $BINDIR/vbmeta_product_b.bin \
  w_force vbmeta_odm_a         $BINDIR/vbmeta_odm_a.bin \
  w_force vbmeta_odm_b         $BINDIR/vbmeta_odm_b.bin \
  w_force avbmeta_rs_a         $BINDIR/avbmeta_rs_a.bin \
  w_force avbmeta_rs_b         $BINDIR/avbmeta_rs_b.bin \
  w_force common_rs1_a         $BINDIR/common_rs1_a.bin \
  w_force common_rs1_b         $BINDIR/common_rs1_b.bin \
  w_force common_rs2_a         $BINDIR/common_rs2_a.bin \
  w_force common_rs2_b         $BINDIR/common_rs2_b.bin \
  reset
