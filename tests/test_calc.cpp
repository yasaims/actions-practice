#include <gtest/gtest.h>
#include "calc.h"

TEST(CalcTest, Add) {
    EXPECT_EQ(add(2, 3), 5);
}

TEST(CalcTest, Mul) {
    EXPECT_EQ(mul(2, 3), 6);
}