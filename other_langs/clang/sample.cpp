// g++ -std=c++0x powerof2.cpp sample.cpp -o sample

#include <iostream>
#include "powerof2.hpp"

int main() {
    boost::optional<PowerOf2> p = makePowerOf2(3);
    if (p) {
        std::cout << exponentPowerOf2(*p) << std::endl;
    } else {
        std::cout << "3 is not a power of 2" << std::endl;
    }
    return 0;
}
