class Main inherits IO{
	g: Int;
	l: I nt;   --whitespace not permitted here: 10.5
	a: Int;
	b: Int;
	main(): Object{{
		out_string("Enter first number: ");
		a <- in_int();
		out_string("Enter the second number: ");
		b <-in_int();
		g <- gcd(a,b);
		l <- lcm(a,b);
		out_string("The gcd of the numbers is : ").out_int(g);
		out_string("\n");
		out_string("The lcm of the numbers is: ").out_int(l);
		out_string("\n");
			
		}};

		gcd(x: Int,y: Int): Int{
			if(x-(x/y)*y=0) then y
			else
				if(y-(y/x)*x=0) then x
				else
					if(x<y) then gcd(y-(y/x)*x,x)
					else gcd(x-(x/y)*y,y)
					fi 
				fi
			fi
					

		};

		lcm(x: Int, y: Int): Int{
			(x*y)/gcd(x,y)
		};
};