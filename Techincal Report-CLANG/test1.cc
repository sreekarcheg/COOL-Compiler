#include <iostream>

using namespace std;

int factorial(int);

int main() {
	int number;
	
	cout << "Please enter a positive integer: ";
	cin >> number;
	if (number < 0)
		cout << "That is not a positive integer.\n";
	else
		cout << number << " factorial is: " << factorial(number) << endl;
	return 0;
}

int factorial(int number) {
	int temp;

	if(number <= 1) return 1;

	temp = number * factorial(number - 1);
	return temp;
}