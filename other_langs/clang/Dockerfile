FROM gcc

COPY . .

# chapter 1
RUN gcc -o parallel parallel.c -fopenmp -lm -O2 -Wall -ansi -pedantic

# chapter 4
RUN g++ -o tarai tarai.cpp -lm -O2 -Wall

ENTRYPOINT [ "./parallel" ]
