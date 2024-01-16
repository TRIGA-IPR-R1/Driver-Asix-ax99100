# Asix AX99100 Driver

Version 1.9.0 of the source code for the driver for the [Asix AX99100](https://www.asix.com.tw/en/product/Interface/PCIe_Bridge/AX99100) chip for the [GNU operating system](https://www.gnu.org) with the [Linux kernel](https://www.linux.org).

Read the [readme](https://github.com/CDTN-CNEM/Driver-ax99100/blob/Original/readme) file for original instructions.

## Branches

Switch the branch between the [original](https://github.com/CDTN-CNEM/Driver-ax99100/tree/Original) driver version and modified versions for the [ArchLinux](https://github.com/CDTN-CNEM/Driver-ax99100/tree/ArchLinux) or [Debian 12](https://github.com/CDTN-CNEM/Driver-ax99100/tree/Debian-12) distributions with [DKMS](https://en.wikipedia.org/wiki/Dynamic_Kernel_Module_Support).

## Application

This driver is necessary for the [KNUP KP-T89](https://novaknup.com.br/produto/placa-pci-e-serial-2-portas-t89) board installed on the server to perform serial communication via RS-485 interface with the electronic chassis of the [Sniip-Systematom (сниип-Систематом)](http://www.systematom.ru) company installed in the [Triga IPR-R1](https://www.gov.br/cdtn/pt-br/assuntos/noticias/por-dentro-do-reator-triga) nuclear reactor.

## Installation

To compile and install the driver, simply run the following command in the terminal:

```bash
sudo make install
```

## Usage and Verification

To check if it has been correctly installed and is functional:

```bash
ls /dev/ttyF*
```

The output should be:
```
/dev/ttyF0
/dev/ttyF1
```

It is possible to communicate using software such as [minicom](https://salsa.debian.org/minicom-team/minicom), but assuming that the KP-T89 board is connected to the Systematom chassis, it only responds to the [ModBus](https://en.wikipedia.org/wiki/Modbus) protocol.

An alternative is to run the test from the [libModbusSystematomSPU](https://github.com/CDTN-CNEM/libModbusSystematomSPU) library.

## License

This driver was released by the Asix company under the [GPL2+](https://github.com/CDTN-CNEM/Driver-ax99100/blob/Original/LICENSE) license.
