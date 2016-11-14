class Main inherits IO{
	n: Int;
	a: Int;
	b: Int;
	main(): Object{{
		out_string("Enter radius of circle: ");
		n <- in_int();
		a<- area(n);
		b<-circum(n);
		
		out_string("The area of circle is: ").out_int(a);
		out_string("\n");
		out_string("The circumference of the circle is: ").out_int(b);
		out_string("\n");
			
		}};

		area(num: Int): Int{
			num*num*3
		};

		circum(num: Int): Int{
			2*3*num
		};
};