program = BTree
source = btree1.c main.c
ir = $(source:.c=.ll)
iromp = $(source:.c=.ll-omp)

# Standard Flags
CFLAGS := -Wall -target x86_64-unknown-linux-gnu -S -emit-llvm -O0 -fno-inline -fno-discard-value-names

# compiler
CC = clang

$(program): $(ir) Makefile
	$(CC) $(ir) -o $@ $(LDFLAGS)

# libbtree.a: $(ir) Makefile
# 	ar rcs $@ $(ir)

# libbtreeomp.a: $(iromp) Makefile
# 	ar rcs $@ $(iromp)

%.ll: %.c Makefile
	$(CC) $(CFLAGS) -c $< -o $@

%.ll-omp: %.c Makefile
	$(CC) $(CFLAGS) -fopenmp -c $< -o $@

clean:
	rm -rf $(program) $(ir)
	rm -f *.a
	rm -f *.ll-omp
