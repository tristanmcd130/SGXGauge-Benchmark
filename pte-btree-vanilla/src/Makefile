program = BTree
source = btree1.c
ir = $(source:.c=.ll)
iromp = $(source:.c=.ll-omp)

# Standard Flags
CFLAGS := -Wall -S -emit-llvm

# compiler
CC = clang


# $(program): $(ir) Makefile
# 	$(CC) $(CFLAGS) $(ir) -o $@ $(LDFLAGS)

libbtree.a: $(ir) Makefile
	ar rcs $@ $(ir)

libbtreeomp.a: $(iromp) Makefile
	ar rcs $@ $(iromp)

%.ll: %.c Makefile
	$(CC) $(CFLAGS) -c $< -o $@

%.ll-omp: %.c Makefile
	$(CC) $(CFLAGS) -fopenmp -c $< -o $@

clean:
	rm -rf $(program) $(ir)
	rm -f *.a
	rm -f *.ll-omp
