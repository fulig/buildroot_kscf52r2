#!/bin/bash

patch ${BUILD_DIR}/linux-5.10/arch/m68k/Kconfig.cpu < ${BASE_DIR}/../board/kscf52r2/Patches/Kconfig.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68/coldfire/head.S <${BASE_DIR}/../board/kscf52r2/Patches/head.patch
patch ${BUILD_DIR}/linux-5.10/arch/m68/coldfire/Makefile <${BASE_DIR}/../board/kscf52r2/Patches/Makefile.patch

