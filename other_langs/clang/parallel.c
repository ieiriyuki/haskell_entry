/*
  Chapter 1: p78
  gcc -o parallel parallel.c -fopenmp -lm -O2 -Wall -ansi -pedantic
*/

#include <stdio.h>
#include <math.h>
#include <omp.h>

int is_prime(int n) {
    const int m = floor(sqrt(n));
    int i = 0;
    for (i = 2; i <= m; i++) {
        if (n % i == 0) {
            return 0;
        }
    }
    return 1;
}

int main() {
    int arr[1000001];
    {
        unsigned int i = 0;
        for (i = 0; i < sizeof(arr) / sizeof(int); i++) {
            arr[i] = i;
        }
    }

#ifdef _OPENMP
    printf("PROC: %d\n", omp_get_num_procs());
#endif

    {
        unsigned int i = 0;
#ifdef _OPENMP
#pragma omp parallel for
#endif
        for (i = 2; i < sizeof(arr) / sizeof(int); i++) {
            arr[i] = is_prime(arr[i]);
        }
    }

    {
        int primes = 0;
        unsigned int i = 0;
        for (i = 2; i < sizeof(arr) / sizeof(int); i++) {
            primes += arr[i];
        }
        printf("primes: %d\n", primes);
    }

    return 0;
}
