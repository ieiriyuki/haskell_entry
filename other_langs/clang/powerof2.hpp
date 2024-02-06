#ifdef POWEROF2_HPP
#define POWEROF2_HPP

#include <cstdint>
#include <boost/optioanl.hpp>

class PowerOf2 {
    public:
        PowerOf2(const PowerOf2& n);
        virtual ~PowerOf2();

    private:
        PowerOf2(uint64_t n);
        uint64_t n;
        friend boost::optional<PowerOf2> makePowerOf2(uint64_t n);
        friend uint32_t exponentPowerOf2(const PowerOf2& n);
}

boost::optional<PowerOf2> makePowerOf2(uint64_t n);
uint32_t exponentPowerOf2(const PowerOf2& n);

#endif
