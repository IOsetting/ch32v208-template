##### Project #####

PROJECT			?= app
# The path for generated files
BUILD_DIR		= Build

##### Options #####

# Include NetLib, y:yes, n:no
USE_NET_LIB		?= n
# Build with FreeRTOS, y:yes, n:no
USE_FREERTOS	?= n


##### Toolchains #######

#GCC_TOOCHAIN	?= /opt/gcc-riscv/xpack-riscv-none-embed-gcc-10.2.0-1.2/bin
#GCC_TOOCHAIN	?= /opt/gcc-riscv/xpack-riscv-none-elf-gcc-12.2.0-3/bin
#GCC_TOOCHAIN	?= /opt/gcc-riscv/riscv-wch-embedded-gcc-v1.60/bin
GCC_TOOCHAIN	?= /opt/gcc-riscv/riscv-wch-embedded-gcc-v1.70/bin

# riscv-none-embed- or riscv-none-elf-
GCC_PREFIX		?= riscv-none-embed-

OPENOCD_PATH	?= /opt/openocd/wch-openocd-v1.70/bin

##### Paths ############

LDSCRIPT		= Libraries/Ld/Link.ld
OPENOCD_CFG 	= Misc/wch-riscv.cfg.v1.70
# CH32V203: CH32V20x_D6
# CH32V203RB: CH32V20x_D8
# CH32V208: CH32V20x_D8W
LIB_FLAGS		= CH32V20x_D8W

# C source folders
CDIRS	:= User \
		Libraries/Core \
		Libraries/Debug \
		Libraries/Peripheral/src
# C source files (if there are any single ones)
CFILES := 

# ASM source folders
ADIRS	:= User
# ASM single files
AFILES	:= Libraries/Startup/startup_ch32v20x_D8W.S

LIBS 	:= 

# Include paths
INCLUDES	:= User \
		Libraries/Core \
		Libraries/Debug \
		Libraries/NetLib \
		Libraries/Peripheral/inc

##### Optional Libraries ############

ifeq ($(USE_NET_LIB),y)
CDIRS		+= Libraries/NetLib
INCLUDES	+= Libraries/NetLib
LIBS		+= Libraries/NetLib/libwchnet.a
endif

ifeq ($(USE_FREERTOS),y)
ADIRS		+= Libraries/FreeRTOS/portable/GCC/RISC-V

CDIRS		+= Libraries/FreeRTOS \
			Libraries/FreeRTOS/portable/GCC/RISC-V

CFILES		+= Libraries/FreeRTOS/portable/MemMang/heap_4.c

INCLUDES	+= Libraries/FreeRTOS/include \
			Libraries/FreeRTOS/portable/GCC/RISC-V \
			Libraries/FreeRTOS/portable/GCC/RISC-V/chip_specific_extensions/RV32I_PFIC_no_extensions
endif


include ./rules.mk
