
extern unsigned int ___ctors, ___ctors_end;
extern char __end__;
static char *start_brk = &__end__;

extern void loop(void);
extern void setup(void);

void ___do_global_ctors()
{
	unsigned int *ptr = &___ctors;
	while (ptr!=&___ctors_end) {
		((void(*)(void))(*ptr))();
		ptr++;
	}
}

void __cxa_pure_virtual()
{
	// Abort here.
}

void exit(){
}

#ifndef NOMAIN
int main(int argc, char **argv)
{
	setup();
	while (1) {
		loop();
	}
}
#endif

void __attribute__((noreturn)) _premain(void)
{
	___do_global_ctors();
	main(0,0);
	while(1);
}

void *sbrk(int inc)
{
	start_brk+=inc;
	return start_brk;
}
