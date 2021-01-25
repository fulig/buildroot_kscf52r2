#!/bin/bash

base_changed="/home/misterdulister/Coding/buildroot_kscf52r2/changed_files/linux-3.x"
base_original="/home/misterdulister/Coding/buildroot_kscf52r2/output/build/linux-5.4.45"
base_patch="/home/misterdulister/Coding/buildroot_kscf52r2/board/kscf52r2/patches"



original_files=("$base_original/arch/m68k/coldfire/head.S"\
		"$base_original/arch/m68k/coldfire/Makefile"\
		"$base_original/arch/m68k/coldfire/timers.c"\
		"$base_original/arch/m68k/include/asm/mcfgpio.h"\
		"$base_original/arch/m68k/include/asm/mcftimer.h"\
		"$base_original/arch/m68k/include/asm/mcfsim.h"\
		"$base_original/arch/m68k/Kconfig.cpu"\
		"$base_original/drivers/net/ethernet/freescale/fec.h"\
		"$base_original/drivers/net/ethernet/freescale/fec_main.c"\
		"$base_original/drivers/net/ethernet/freescale/Kconfig")

changed_files=("$base_changed/arch/m68k/coldfire/head.S"\
		"$base_changed/arch/m68k/coldfire/Makefile"\
		"$base_changed/arch/m68k/coldfire/timers.c"\
		"$base_changed/arch/m68k/include/asm/mcfgpio.h"\
		"$base_changed/arch/m68k/include/asm/mcftimer.h"\
		"$base_changed/arch/m68k/include/asm/mcfsim.h"\
		"$base_changed/arch/m68k/Kconfig.cpu"\
		"$base_changed/drivers/net/ethernet/freescale/fec.h"\
		"$base_changed/drivers/net/ethernet/freescale/fec_main.c"\
		"$base_changed/drivers/net/ethernet/freescale/Kconfig")

patch_names=("$base_patch/head.patch"\
		"$base_patch/Makefile.patch"\
		"$base_patch/timers.patch"\
		"$base_patch/mcfgpio.patch"\
		"$base_patch/mcftimer.patch"\
		"$base_patch/mcfsim.patch"\
		"$base_patch/Kconfig.patch"\
		"$base_patch/fec_h.patch"\
		"$base_patch/fec_main.patch"\
		"$base_patch/Kconfig_net.patch")

for index in {0..9} 
do
diff -u ${original_files[index]} ${changed_files[index]} > ${patch_names[index]} 
done
exit 0
