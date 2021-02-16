#!/bin/bash

patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/Kconfig.cpu < ${BASE_DIR}/../board/kscf52r2/patches/Kconfig.patch
patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/coldfire/head.S < ${BASE_DIR}/../board/kscf52r2/patches/head.patch
patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/coldfire/Makefile < ${BASE_DIR}/../board/kscf52r2/patches/Makefile.patch
patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/coldfire/timers.c < ${BASE_DIR}/../board/kscf52r2/patches/timers.patch

patch ${BUILD_DIR}/linux-5.4.45/drivers/net/ethernet/freescale/fec.h < ${BASE_DIR}/../board/kscf52r2/patches/fec_h.patch
patch ${BUILD_DIR}/linux-5.4.45/drivers/net/ethernet/freescale/fec_main.c < ${BASE_DIR}/../board/kscf52r2/patches/fec_main.patch
patch ${BUILD_DIR}/linux-5.4.45/drivers/net/ethernet/freescale/Kconfig < ${BASE_DIR}/../board/kscf52r2/patches/Kconfig_net.patch

patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/include/asm/mcfgpio.h < ${BASE_DIR}/../board/kscf52r2/patches/mcfgpio.patch
patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/include/asm/mcfsim.h < ${BASE_DIR}/../board/kscf52r2/patches/mcfsim.patch
patch ${BUILD_DIR}/linux-5.4.45/arch/m68k/include/asm/mcftimer.h < ${BASE_DIR}/../board/kscf52r2/patches/mcftimer.patch

cp ${BASE_DIR}/../board/kscf52r2/new_files/kscf52xx.c ${BUILD_DIR}/linux-5.4.45/arch/m68k/coldfire
cp ${BASE_DIR}/../board/kscf52r2/new_files/kscf52xxsim.h ${BUILD_DIR}/linux-5.4.45/arch/m68k/include/asm

gunzip -c ${BUILD_DIR}/linux-5.4.45/vmlinux.gz > ${BINARIES_DIR}/vmlinux.bin
