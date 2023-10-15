FROM gcc

COPY . .

RUN gcc -o parallel parallel.c -fopenmp -lm -O2 -Wall -ansi -pedantic

ENTRYPOINT [ "./parallel" ]
