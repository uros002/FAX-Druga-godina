#include <iostream>

using namespace std;


void e(int r){r=2;}


int main()
{
    int a=1;
	int b=1;
	int c=1;
	int *pa;
	int *pb;

	pa=&a;
	pb=&b;
	b=a++;
	//c = ++a;
	//cout<<c;
	cout<<*pb;
	cout<<b;
	cout<<++(*pa);

	e(a);
	cout <<a ;

	return 0;

}
