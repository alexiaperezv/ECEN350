/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int test(long long int a, long long int b);
extern long long int lab03b(long long int UIN);
extern void lab03c(long long int initial_value);

int main(void)
{
  long long int a = test(3, 5); // no need to demo questions 1 and 2
  printf("Result of test(3, 5) = %ld\n", a); // no need to demo questions 1 and 2
  long long int uin = 26;
  long long int result = lab03b(uin); // computes result from question 3 code
  printf("The sum of all digits in UIN: 127008512 is = %ld\n", 26); // prints out sum of UIN digits that will actually go into function
  printf("Result from lab03b() = %ld\n", result); // prints out result of question 3 code
  long long int initial_value = 1;
  lab03c(initial_value); // computes the result from question 4 code
  printf("The first digit in UIN: 127008512 is = %ld\n", initial_value); // prints first digit of my UIN for question 4

  return 0;
}
