##### Project #####

PROJECT			?= app
# The path for generated files
BUILD_DIR		= Build

##### Options #####


##### Toolchains #######

#GCC_TOOCHAIN	?= /opt/gcc-riscv/riscv-wch-embedded-gcc-v1.60/bin
GCC_TOOCHAIN	?= /opt/gcc-riscv/riscv-wch-embedded-gcc-v1.70/bin


OPENOCD_PATH	?= /opt/openocd/wch-openocd-v1.70/bin

##### Paths ############

LDSCRIPT		= Ld/Link.ld
OPENOCD_CFG 	= Misc/wch-riscv.cfg.v1.70
# CH32V203: CH32V20x_D6
# CH32V203RB: CH32V20x_D8
# CH32V208: CH32V20x_D8W
LIB_FLAGS		= CH32V20x_D8W

# C source folders
CDIRS	:= User \
		Core \
		Debug \
		Peripheral/src
# C source files (if there are any single ones)
CFILES := 

# ASM source folders
ADIRS	:= User
# ASM single files
AFILES	:= Startup/startup_ch32v20x_D8W.S

# Include paths
INCLUDES	:= User \
		Core \
		Debug \
		Peripheral/inc


include ./rules.mk
