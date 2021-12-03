#pragma once

TEST(example, plus_a_b){
    ASSERT_EQ(plus_a_b(1, 2), 3);
}
TEST(example, minus_a_b){
    ASSERT_EQ(minus_a_b(2, 1), 1);
}
