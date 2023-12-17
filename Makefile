KDIR:=/lib/modules/$(shell  uname -r)/build/ 
CURRENT=$(shell uname -r)
MAJORVERSION=$(shell uname -r | cut -d '.' -f 1)
MINORVERSION=$(shell uname -r | cut -d '.' -f 2)
SUBLEVEL=$(shell uname -r | cut -d '.' -f 3)
MDIR=kernel/drivers/tty/serial
RM_PATH:= /lib/modules/$(shell uname -r)/$(MDIR)/ax99100.ko
UNAME := $(shell uname -m)
obj-m +=ax99100.o
obj-m +=parport_pc.o
ax99100-objs := ax99100_spi.o ax99100_sp.o

default:
	$(RM) *.mod.c *.o *.ko .*.cmd *.symvers
	make -C $(KDIR) M=$(PWD) modules
	gcc -pthread select_BR.c -o select_BR
	gcc -pthread advanced_BR.c -o advanced_BR
	gcc -pthread gpio_99100.c -o gpio_99100
	gcc -pthread -Wall 9bit_test.c -o 9bit_test
	gcc -I /usr/include spi_test.c -o spi_test
	$(RM) *.mod.c *.o .*.cmd *.symvers
	rm -rf .tmp_version* *~
	rm -rf Module.markers modules.*	

install:
	mkdir -p /usr/src/ax99100-1.9.0
	cp * /usr/src/ax99100-1.9.0
	dkms add ax99100/1.9.0 || true
	dkms build ax99100/1.9.0 --force
	dkms install ax99100/1.9.0 --force

uninstall:
	ifneq ($(shell lsmod | grep electrum),)
		rmmod ax99100
	endif
	rm -rf $(RM_PATH)
	su -c "/sbin/depmod -a"

clean:
	$(RM) *.mod.c *.o *.o.* *.ko .*.cmd *.symvers *.o.ur-safe *.mod *.o.d
	rm -rf .tmp_version* *~
	rm -rf Module.markers modules.* .cache.*
	rm -f select_BR advanced_BR gpio_99100 spi_test 9bit_test
