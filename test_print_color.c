#include<stdio.h>
int main(){
	int a[5];
	int *b;
	printf("\033[31mThis text is red \033[0mThis text has default color\n"); 
	printf("%d", 5); 
	printf("\033[31\0This text is red \033[0mThis text has default color\n"); 
	for(int i = 0;i<5;i++){
		a[i] = i;
	}
	b = a;
	printf("%d\n", *b++);
	printf("%d\n", *b);
	return 0;
}
