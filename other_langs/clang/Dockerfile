FROM gcc

COPY . .

# chapter 1
RUN gcc -o parallel parallel.c -fopenmp -lm -O2 -Wall -ansi -pedantic

# chapter 4
RUN g++ -o tarai tarai.cpp -lm -O2 -Wall

# chapter 5
RUN g++ -o toint toint.cpp -lm -O2 -Wall

# chapter 6
# RUN g++ -std=c++0x powerof2.cpp sample.cpp -o sample
# fail

ENTRYPOINT [ "./parallel" ]
