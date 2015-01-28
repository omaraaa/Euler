//Using c++11

#include <iostream>
#include <map>
#include <vector>

using namespace std;

int getSumOfDivisors(int x){
	int result = 0;
	for (int i = 1; i < x; ++i)
	{
		if(x % i == 0)
		{
			result = result+i;
		}
	}
	return result;
}

int main(int argc, char const *argv[])
{
	map<int, int> amicableMap;
	vector<int> result;
	int r=0;
	for (int i = 1; i < 10000; ++i)
	{
		amicableMap[i] = getSumOfDivisors(i);
	}
	for (auto it = amicableMap.begin(); it != amicableMap.end(); it++)
	{	
		if(it->first == it->second)
			continue;
		if(amicableMap[it->second] == it->first){
			cout << "a: " << it->first << endl;
			cout << "b: " << it->second << endl;
			result.push_back(it->first);
			result.push_back(it->second);
			amicableMap[it->second] = 0;
		}
	}
	for (std::vector<int>::iterator i = result.begin(); i != result.end(); ++i)
	{
			r += *i;
	}
	cout << "Sum: " << r << "\ndone!\n";
	return 0;
}