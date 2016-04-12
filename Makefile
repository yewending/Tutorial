ROOT_PATH := $(PWD)
DEV_CLIENT := dev_Client
DEV_SKE := dev_ske
DEV_APP := uluapp
ALL := ipc06 nvr06 u3ipc ipc06sr dvr06 u3ipcOld nvr06Old ipc068m
INSTALL_PATH := /home/yewending/nfs

PARA_IPC06 := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS=-D__IPC06 __IPC06=1 \
EXP_LDFLAGS=-lpthread installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/ipc06
ipc06:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_IPC06) $(TARGET);done  

PARA_IPC06_8M := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS="-D__IPC06 -D__FLASH__8M " __IPC06=1 \
EXP_LDFLAGS=-lpthread installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/ipc068m
ipc068m:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_IPC06_8M) $(TARGET);done  
	
PARA_NVR06 := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS=-D__NVR06 __NVR06=1 \
EXP_LDFLAGS="-static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive -lc" installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/nvr06
nvr06:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_NVR06) $(TARGET);done  
	
PARA_NVR06_OLD := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS="-D__NVR06 -D__NVR06__OLD " __NVR06=1 \
EXP_LDFLAGS="-static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive -lc" installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/nvr06OldU2
nvr06Old:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_NVR06_OLD) $(TARGET);done	

PARA_U3IPC := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS="-D__U3IPC -DHI_OS_LINUX " __U3IPC=1\
EXP_LDFLAGS=-lpthread installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/u3ipc
u3ipc:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_U3IPC) $(TARGET);done 
	
PARA_U3IPC_OLD := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS="-D__U3IPC -DHI_OS_LINUX -D__U3IPC__OLD " __U3IPC=1\
EXP_LDFLAGS=-lpthread installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/u3ipcOldU2
u3ipcOld:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_U3IPC_OLD) $(TARGET);done 	

PARA_IPC06SR := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS=-D__IPC06__SR __IPC06__SR=1 \
EXP_LDFLAGS=-lpthread installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/ipc06sr
ipc06sr:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_IPC06SR) $(TARGET);done 

PARA_DVR06 := CROSS=arm-hisiv100nptl-linux- EXP_CPPFLAGS=-D__DVR06 __DVR06=1 \
EXP_LDFLAGS="-static -Wl,--whole-archive -lpthread -Wl,--no-whole-archive -lc" installPath=$(INSTALL_PATH)/bin/`date +%Y%m%d`/dvr06
dvr06:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir $(PARA_DVR06) $(TARGET);done 
	
	
clean:$(DEV_CLIENT) $(DEV_SKE) $(DEV_APP)
	$(QUIET)for dir in $^; do make --directory=$$dir clean;done
uninstall:
	rm -rf ./bin
dist:
	tar cvzf devAlarmWithU3V$(ver).tar.gz dev_Client dev_ske uluapp compile.sh Makefile
export QUIET
ccccccccccccccccc