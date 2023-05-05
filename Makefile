##### Project #####

PROJECT			?= app
# The path for generated files
BUILD_DIR		= Build

##### Options #####

# Include NetLib, y:yes, n:no
USE_NET_LIB		?= n


##### Toolchains #######

#GCC_TOOCHAIN	?= /opt/gcc-riscv/xpack-riscv-none-embed-gcc-10.2.0-1.2/bin
#GCC_TOOCHAIN	?= /opt/gcc-riscv/xpack-riscv-none-elf-gcc-12.2.0-3/bin
#GCC_TOOCHAIN	?= /opt/gcc-riscv/riscv-wch-embedded-gcc-v1.60/bin
GCC_TOOCHAIN	?= /opt/gcc-riscv/riscv-wch-embedded-gcc-v1.70/bin

GCC_PREFIX		?= riscv-none-embed-

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

LIBS 	:= 

# Include paths
INCLUDES	:= User \
		Core \
		Debug \
		NetLib \
		Peripheral/inc

ifeq ($(USE_NET_LIB),y)
CDIRS		+= NetLib
INCLUDES	+= NetLib
LIBS		+= NetLib/libwchnet.a
endif


include ./rules.mk
