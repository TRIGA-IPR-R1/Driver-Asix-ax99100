# Driver Asix ax99100

Versão 1.9.0 do código fonte do driver para o chip [Asix ax99100](https://www.asix.com.tw/en/product/Interface/PCIe_Bridge/AX99100) para o [sistema operacional GNU](https://www.gnu.org) com kernel [Linux](https://www.linux.org).

Leia arquivo [readme](https://github.com/CDTN-CNEM/Driver-ax99100/blob/Original/readme) para instruções originais.

## Branches

Alterne a branch entre a versão do driver [original](https://github.com/CDTN-CNEM/Driver-ax99100/tree/Original) e versões modificadas para as distribuições [ArchLinux](https://github.com/CDTN-CNEM/Driver-ax99100/tree/ArchLinux) ou [Debian 12](https://github.com/CDTN-CNEM/Driver-ax99100/tree/Debian-12) com [DKMS](https://pt.wikipedia.org/wiki/Dynamic_Kernel_Module_Support).

### Resumo modificações

Todas as modificações podem ser vistas [neste commit](https://github.com/CDTN-CNEM/Driver-Asix-ax99100/commit/b20d02f34283465309f6db3a5a11cccc0861c1f8).

Configurações para Systematom:
- ```#define FUNC_SELECT 0 // 0: Serial Port only```
- ```.uart_mode = AX99100_RS485_HALF_DUPLEX```
- ```#define DEFAULT99100_BAUD 57600```
- 2 portas seriais apenas (deletadas portas 2 e 3).

Voltado para ArchLinux:
- Makefile exclusivo para arquitetura x86-64, kernel linux ```= 6.x.x``` e DKMS.
- ```DEFINE_SEMAPHORE(serial99100_sem, 1);``` (não funciona no Debian-12, Kernel 6.1.x)

Outros:
- Logs ativados.

## Aplicação

Este driver é necessário para a placa [KNUP KP-T89](https://novaknup.com.br/produto/placa-pci-e-serial-2-portas-t89) instalada no servidor realizar a comunicação serial via interface RS-485 com o bastidor eletrônico da empresa [Sniip-Systematom (сниип-Систематом)](http://www.systematom.ru) instalada no reator nuclear [Triga IPR-R1](https://www.gov.br/cdtn/pt-br/assuntos/noticias/por-dentro-do-reator-triga).

## Instalação

Para compilar e instalar o driver basta rodar no terminal:

```Bash
sudo make install
```

## Uso e verificação

Para verificar se foi corretamente instalado e se está funcional:

```Bash
ls /dev/ttyF*
```

A saída deverá ser:
```
/dev/ttyF0
/dev/ttyF1
```

É possível se comunicar através de uso de softwares como [minicom](https://salsa.debian.org/minicom-team/minicom), mas partindo do pressuposto que a placa KP-T89 está conectada no bastidor Systematom, o mesmo só responde ao protocolo [ModBus](https://pt.wikipedia.org/wiki/Modbus). 

Uma alternativa viável então é rodar o test da biblioteca [libModbusSystematomSPU](https://github.com/CDTN-CNEM/libModbusSystematomSPU).

## Licença

Este driver foi lançado pela empresa Asix com licença [GPL2+](https://github.com/CDTN-CNEM/Driver-ax99100/blob/Original/LICENSE).
