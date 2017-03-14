CONFIG_SYS_PL310_BASE="L2_PL310_BASE"
CONFIG_ENV_MMCROOT="/dev/mmcblk2p2"
CONFIG_CMD_SOURCE=y
CONFIG_BOOTM_NETBSD=y
CONFIG_BOOTCOMMAND="mmc dev ${mmcdev};if mmc rescan; then if run loadbootscript; then run bootscript; else if run loadimage; then run mmcboot; else run netboot; fi; fi; else run netboot; fi"
CONFIG_BOARD_EARLY_INIT_F=y
CONFIG_MXC_USB_FLAGS=0
CONFIG_IMX_CONFIG="board/mrd/earthlogger/earthloggerrecovery.cfg"
CONFIG_CMD_ITEST=y
CONFIG_BOOTM_VXWORKS=y
CONFIG_CMD_EDITENV=y
CONFIG_CMD_SETEXPR=y
CONFIG_MX6Q=y
CONFIG_SPI_FLASH_SST=y
CONFIG_ARM_ERRATA_751472=y
CONFIG_CMD_ENV_EXISTS=y
CONFIG_SF_DEFAULT_MODE="SPI_MODE_0"
CONFIG_SYS_LONGHELP=y
CONFIG_PHY_MICREL_KSZ9021=y
CONFIG_SYS_GENERIC_BOARD=y
CONFIG_SYS_LOAD_ADDR=$(CONFIG_LOADADDR)
CONFIG_DISPLAY_BOARDINFO=y
CONFIG_SYS_MEMTEST_SCRATCH=$(CONFIG_LOADADDR)
CONFIG_CMD_XIMG=y
CONFIG_CMD_CACHE=y
CONFIG_STACKSIZE="SZ_128K"
CONFIG_BOOTDELAY=y
CONFIG_SPI_FLASH=y
CONFIG_SYS_HELP_CMD_WIDTH=8
CONFIG_NR_DRAM_BANKS=y
CONFIG_FS_FAT=y
CONFIG_BOOTM_RTEMS=y
CONFIG_SYS_CBSIZE=1024
CONFIG_DDR_SIZE="SZ_2G"
CONFIG_EHCI_HCD_INIT_AFTER_RESET=y
CONFIG_BOOTM_LINUX=y
CONFIG_BOARD_LATE_INIT=y
CONFIG_CMD_CONSOLE=y
CONFIG_ENV_MMC_ENV_DEV="__stringify(0)"
CONFIG_MII=y
CONFIG_CMD_FAT=y
CONFIG_SYS_CACHELINE_SIZE=32
CONFIG_MMC=y
CONFIG_REVISION_TAG=y
CONFIG_SYS_FSL_SEC_ADDR="CAAM_BASE_ADDR"
CONFIG_CMD_MISC=y
CONFIG_ENV_OFFSET="(8 * SZ_64K)"
CONFIG_MXC_OCOTP=y
CONFIG_MX6=y
CONFIG_USB_MAX_CONTROLLER_COUNT=y
CONFIG_ENV_SPI_CS=$(CONFIG_SF_DEFAULT_CS)
CONFIG_ENV_OVERWRITE=y
CONFIG_CMD_NET=y
CONFIG_CMD_NFS=y
CONFIG_ENV_SIZE="(SZ_8K)"
CONFIG_CMD_PING=y
CONFIG_SYS_L2_PL310=y
CONFIG_SYS_MALLOC_LEN="(16 * SZ_1M)"
CONFIG_SYS_I2C_SPEED=100000
CONFIG_TINY_DEFAULT_ARCH_PREFIX=$(CONFIG_MODULE_TYPE_PREFIX)
CONFIG_SYS_BOOTM_LEN=0x1000000
CONFIG_SYS_TEXT_BASE=0x17800000
CONFIG_MODULE_TYPE_POSTFIX="max"
CONFIG_CMD_SAVEENV=y
CONFIG_MXC_GPT_HCLK=y
CONFIG_MXC_UART=y
CONFIG_ENV_SECT_SIZE=$(CONFIG_ENV_SIZE)
CONFIG_SYS_BARGSIZE=$(CONFIG_SYS_CBSIZE)
CONFIG_BOOTM_PLAN9=y
CONFIG_MXC_USB_PORTSC="(PORT_PTS_UTMI | PORT_PTS_PTW)"
CONFIG_ENV_DEFAULT_CLIENT_IP="192.168.0.150"
CONFIG_BOOTSTAGE_USER_COUNT=20
CONFIG_SYS_FSL_JR0_ADDR="(CAAM_BASE_ADDR + 0x1000)"
CONFIG_SF_DEFAULT_BUS=0
CONFIG_CMD_MEMORY=y
CONFIG_SYS_MAXARGS=256
CONFIG_CMD_RUN=y
CONFIG_SYS_PBSIZE="(CONFIG_SYS_CBSIZE + sizeof(CONFIG_SYS_PROMPT) + 16)"
CONFIG_ENV_DEFAULT_FDT_FILE="CONFIG_TINY_DEFAULT_ARCH_PREFIX "-tinyrex" CONFIG_TINY_DEFAULT_ARCH_POSTFIX ".dtb""
CONFIG_FEC_XCV_TYPE="RGMII"
CONFIG_MXC_GPIO=y
CONFIG_ARM_ERRATA_743622=y
CONFIG_BOARDDIR="board/mrd/earthlogger"
CONFIG_ARM_ERRATA_845369=y
CONFIG_TINY_DEFAULT_ARCH_POSTFIX=$(CONFIG_MODULE_TYPE_POSTFIX)
CONFIG_BOUNCE_BUFFER=y
CONFIG_OF_LIBFDT=y
CONFIG_PHYLIB=y
CONFIG_BOARD_POSTCLK_INIT=y
CONFIG_CMDLINE_EDITING=y
CONFIG_CMD_USB=y
CONFIG_ENV_DEFAULT_TFTP_DIR="imx6"
CONFIG_CMD_EXT2=y
CONFIG_CMD_EXT4=y
CONFIG_USB_EHCI=y
CONFIG_CMD_SETGETDCR=y
CONFIG_SYS_EXTRA_OPTIONS="IMX_CONFIG=board/mrd/earthlogger/earthloggerrecovery.cfg,MX6Q,DDR_SIZE=SZ_2G,ENV_IS_IN_SPI_FLASH,MODULE_TYPE_PREFIX="imx6",MODULE_TYPE_POSTFIX="max""
CONFIG_ZLIB=y
CONFIG_LOADADDR=0x10800000
CONFIG_ETHPRIME="FEC"
CONFIG_CMD_BOOTD=y
CONFIG_CMD_BOOTZ=y
CONFIG_AUTO_COMPLETE=y
CONFIG_ENV_DEFAULT_SERVER_IP="192.168.0.1"
CONFIG_MP=y
CONFIG_FSL_USDHC=y
CONFIG_DOS_PARTITION=y
CONFIG_GZIP=y
CONFIG_CMD_SF=y
CONFIG_LDO_BYPASS_CHECK=y
CONFIG_CMD_FPGA=y
CONFIG_SYS_FSL_ESDHC_ADDR="USDHC3_BASE_ADDR"
CONFIG_SYS_INIT_RAM_SIZE="IRAM_SIZE"
CONFIG_FEC_MXC_PHYADDR=3
CONFIG_SYS_BAUDRATE_TABLE="{ 9600, 19200, 38400, 57600, 115200 }"
CONFIG_TINY_PHYS_SDRAM_SIZE=$(CONFIG_DDR_SIZE)
CONFIG_SYS_HUSH_PARSER=y
CONFIG_SYS_SDRAM_BASE="PHYS_SDRAM"
CONFIG_IMAGE_FORMAT_LEGACY=y
CONFIG_SYS_BOOT_RAMDISK_HIGH=y
CONFIG_ENV_CONSOLE_DEV="ttymxc0"
CONFIG_CMD_BDI=y
CONFIG_CMD_DHCP=y
CONFIG_SYS_PROMPT_HUSH_PS2="TinyRex U-Boot > "
CONFIG_SYS_FSL_USDHC_NUM=3
CONFIG_USB_ETHER_ASIX=y
CONFIG_CMD_ECHO=y
CONFIG_GENERIC_MMC=y
CONFIG_SYS_INIT_SP_OFFSET="(CONFIG_SYS_INIT_RAM_SIZE - GENERATED_GBL_DATA_SIZE)"
CONFIG_ENV_SPI_MODE=$(CONFIG_SF_DEFAULT_MODE)
CONFIG_ENV_DEFAULT_UBT_FILE="u-boot-" CONFIG_TINY_DEFAULT_ARCH_PREFIX "-tinyrex" CONFIG_TINY_DEFAULT_ARCH_POSTFIX ".imx"
CONFIG_FAT_WRITE=y
CONFIG_MXC_SPI=y
CONFIG_SYS_I2C=y
CONFIG_SYS_INIT_RAM_ADDR="IRAM_BASE_ADDR"
CONFIG_ENV_SPI_MAX_HZ=$(CONFIG_SF_DEFAULT_SPEED)
CONFIG_EXTRA_ENV_SETTINGS="tftp_dir=" CONFIG_ENV_DEFAULT_TFTP_DIR "0uboot=" CONFIG_ENV_DEFAULT_UBT_FILE "0image=zImage0fdt_file=" CONFIG_ENV_DEFAULT_FDT_FILE "0script=" CONFIG_ENV_DEFAULT_SCR_FILE "0fdt_addr=0x180000000boot_fdt=try0console=" CONFIG_ENV_CONSOLE_DEV "0fdt_high=0xffffffff0initrd_high=0xffffffff0mmcdev=" CONFIG_ENV_MMC_ENV_DEV "0mmcpart=10mmcroot=" CONFIG_ENV_MMCROOT " rootwait rw0spidev=" __stringify(CONFIG_ENV_SPI_BUS) "0spics=" __stringify(CONFIG_ENV_SPI_CS) "0set_ethernet=if test -n ${ethaddr}; then; else setenv ethaddr  " CONFIG_ENV_DEFAULT_ETH_ADDR "; fi; if test -n ${ipaddr}; then; else setenv ipaddr   " CONFIG_ENV_DEFAULT_CLIENT_IP "; fi; if test -n ${serverip}; then; else setenv serverip " CONFIG_ENV_DEFAULT_SERVER_IP "; fi; if test -n ${netmask}; then; else setenv netmask  " CONFIG_ENV_DEFAULT_NETMASK "; fi0update_set_filename=if test -n ${upd_uboot}; then; else setenv upd_uboot " CONFIG_ENV_DEFAULT_UBT_FILE "; fi; if test -n ${upd_kernel}; then; else setenv upd_kernel " CONFIG_ENV_DEFAULT_IMG_FILE "; fi; if test -n ${upd_fdt}; then; else setenv upd_fdt    " CONFIG_ENV_DEFAULT_FDT_FILE "; fi; if test -n ${upd_script}; then; else setenv upd_script " CONFIG_ENV_DEFAULT_SCR_FILE "; fi0update_uboot=run set_ethernet; run update_set_filename; if mmc dev ${mmcdev}; then if tftp ${tftp_dir}/${upd_uboot}; then setexpr fw_sz ${filesize} / 0x200; setexpr fw_sz ${fw_sz} + 1; mmc write ${loadaddr} 0x2 ${fw_sz}; fi; fi0update_kernel=run set_ethernet; run update_set_filename; if mmc dev ${mmcdev}; then if tftp ${tftp_dir}/${upd_kernel}; then fatwrite mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image} ${filesize}; fi; fi0update_fdt=run set_ethernet; run update_set_filename; if mmc dev ${mmcdev}; then if tftp ${tftp_dir}/${upd_fdt}; then fatwrite mmc ${mmcdev}:${mmcpart} ${loadaddr} ${fdt_file} ${filesize}; fi; fi0update_script=run set_ethernet; run update_set_filename; if mmc dev ${mmcdev}; then if tftp ${tftp_dir}/${upd_script}; then fatwrite mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script} ${filesize}; fi; fi0mmcargs=setenv bootargs console=${console},${baudrate} ${extra} ${video} root=${mmcroot}0loadbootscript=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${script};0bootscript=echo Running bootscript from mmc ...; source0loadimage=fatload mmc ${mmcdev}:${mmcpart} ${loadaddr} ${image}0loadfdt=fatload mmc ${mmcdev}:${mmcpart} ${fdt_addr} ${fdt_file}0mmcboot=echo Booting from mmc ...; run mmcargs; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if run loadfdt; then bootz ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootz; else echo WARN: Cannot load the DT; fi; fi; else bootz; fi;0netargs=setenv bootargs console=${console},${baudrate} ${extra} ${video} root=/dev/nfs ip=dhcp nfsroot=${serverip}:${nfsroot},v3,tcp0netboot=echo Booting from net ...; run set_ethernet; run netargs; tftp ${tftp_dir}/${image}; if test ${boot_fdt} = yes || test ${boot_fdt} = try; then if tftp ${fdt_addr} ${tftp_dir}/${fdt_file}; then bootz ${loadaddr} - ${fdt_addr}; else if test ${boot_fdt} = try; then bootz; else echo WARN: Cannot load the DT; fi; fi; else bootz; fi;0"
CONFIG_GPT_TIMER=y
CONFIG_SYS_INIT_SP_ADDR="(CONFIG_SYS_INIT_RAM_ADDR + CONFIG_SYS_INIT_SP_OFFSET)"
CONFIG_FSL_ESDHC=y
CONFIG_ARM_ERRATA_761320=y
CONFIG_IMX_THERMAL=y
CONFIG_BAUDRATE=115200
CONFIG_CMD_BMODE=y
CONFIG_ENV_IS_IN_SPI_FLASH=y
CONFIG_CMDLINE_TAG=y
CONFIG_ENV_DEFAULT_SCR_FILE="boot-" CONFIG_TINY_DEFAULT_ARCH_PREFIX "-tinyrex" CONFIG_TINY_DEFAULT_ARCH_POSTFIX ".scr"
CONFIG_MXC_UART_BASE="UART1_BASE"
CONFIG_INITRD_TAG=y
CONFIG_ARM_ERRATA_794072=y
CONFIG_USB_HOST_ETHER=y
CONFIG_ENV_DEFAULT_NETMASK="255.255.255.0"
CONFIG_PARTITIONS=y
CONFIG_ENV_DEFAULT_ETH_ADDR="00:0D:15:00:D1:75"
CONFIG_SYS_MEMTEST_END="(CONFIG_SYS_MEMTEST_START + SZ_1M)"
CONFIG_CMD_I2C=y
CONFIG_FEC_MXC=y
CONFIG_SYS_NO_FLASH=y
CONFIG_SYS_DEF_EEPROM_ADDR=0
CONFIG_FS_EXT4=y
CONFIG_MACH_TYPE="MACH_TYPE_MX6TINYREX"
CONFIG_SYS_PROMPT="TinyRex U-Boot > "
CONFIG_USB_STORAGE=y
CONFIG_USB_EHCI_MX6=y
CONFIG_DISPLAY_CPUINFO=y
CONFIG_SETUP_MEMORY_TAGS=y
CONFIG_EXT4_WRITE=y
CONFIG_SYS_MEMTEST_START="(MMDC0_ARB_BASE_ADDR)"
CONFIG_CMD_LOADB=y
CONFIG_CMD_LOADS=y
CONFIG_CMD_IMI=y
CONFIG_CMD_EXT4_WRITE=y
CONFIG_SF_DEFAULT_SPEED=20000000
CONFIG_CONS_INDEX=y
CONFIG_LMB=y
CONFIG_ENV_SPI_BUS=$(CONFIG_SF_DEFAULT_BUS)
CONFIG_SYS_I2C_MXC=y
CONFIG_PHY_MICREL=y
CONFIG_SYS_VSNPRINTF=y
CONFIG_CMD_MII=y
CONFIG_CMD_MMC=y
CONFIG_CMD_FUSE=y
CONFIG_MODULE_TYPE_PREFIX="imx6"
CONFIG_ENV_DEFAULT_IMG_FILE=""zImage-" CONFIG_TINY_DEFAULT_ARCH_PREFIX "-tinyrex" CONFIG_TINY_DEFAULT_ARCH_POSTFIX"
CONFIG_SF_DEFAULT_CS=0
