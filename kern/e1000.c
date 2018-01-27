#include <kern/e1000.h>
#include <inc/types.h>
// LAB 6: Your driver code here
int pcif_e100(struct pci_func *pcif){
	pci_func_enable(pcif);
	return 0;
}
