#include <gtest/gtest.h>

#include "./src/example.cpp"

//-----------------------------------------------------------------------------------------------------------------------------------------------
// Here will be the header files with test functions.

#include "./test/example.hpp"

//-----------------------------------------------------------------------------------------------------------------------------------------------


int main(int argc, char** argv){
    printf("\n");
    printf("+---------------------------------------------------+\n");
    printf("|                                                   |\n");
    printf("|    Welcome to the CI/CD sample with googletest    |\n");
    printf("|                                                   |\n");
    printf("+---------------------------------------------------+\n");
    printf("\n");
    ::testing::InitGoogleTest(&argc, argv);
    
    auto ret = RUN_ALL_TESTS();
    
    printf("\n");
    return ret;
}
