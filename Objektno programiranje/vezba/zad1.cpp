#include<iostream>
using namespace std;

class A
{
	public:
	   int x;
	   int y;
	   A(int xx=1, int yy=2) : x(xx), y(yy){}
	   void print(){cout<<x<<y;}
};

void f(A &a)
{
	a.x++;
	a.y++;
}

int main()
{
	A a1, a2;
	f(a1);
	a2=a1;
	f(a1);
	f(a2);
	a1.print();
	a2.print();
	return 0;
}
