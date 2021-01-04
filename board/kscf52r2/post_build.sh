#!/bin/bash

patch ${BUILD_DIR}/linux-5.10/arch/m68k/Kconfig.cpu < ${BASE_DIR}/../board/kscf52r2/Patches/Kconfig.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68k/coldfire/head.S < ${BASE_DIR}/../board/kscf52r2/Patches/head.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68k/coldfire/Makefile < ${BASE_DIR}/../board/kscf52r2/Patches/Makefile.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68k/coldfire/timers.c < ${BASE_DIR}/../board/kscf52r2/Patches/timer.patch

patch ${BUILD_DIR}/linux-5.10/drivers/net/ethernet/freescale/fec.h < ${BASE_DIR}/../board/kscf52r2/Patches/fec_h.patch
patch ${BUILD_DIR}/linux-5.10/drivers/net/ethernet/freescale/fec_main.c < ${BASE_DIR}/../board/kscf52r2/Patches/fec_main.patch
patch ${BUILD_DIR}/linux-5.10/drivers/net/ethernet/freescale/Kconfig < ${BASE_DIR}/../board/kscf52r2/Patches/Kconfig_net.patch

patch ${BUILD_DIR}/linux-5.10/arch/m68k/include/asm/mcfgpio.h < ${BASE_DIR}/../board/kscf52r2/Patches/mcfgpio.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68k/include/asm/mcfsim.h < ${BASE_DIR}/../board/kscf52r2/Patches/mcfsim.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68k/include/asm/mcftimer.h < ${BASE_DIR}/../board/kscf52r2/Patches/mcftimer.patch

cp ${BASE_DIR}/../board/kscf52r2/New_files/kscf52xx.c ${BUILD_DIR}/linux-5.10/arch/m68k/coldfire
cp ${BASE_DIR}/../board/kscf52r2/New_files/kscf52xxsim.h ${BUILD_DIR}/linux-5.10/arch/m68k/include/asm 


