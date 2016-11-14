(*Sorts a inputted numbers in quadratic time*)
(* The class List defines the names of standard list operations ala Scheme:
car, cdr, cons, isNil, rev, sort, rcons (add an element to the end of
the list), and print_list.  In the List class most of these functions
are just stubs that abort if ever called.  The classes Nil and Cons
inherit from List and define the same operations, but now as
appropriate to the empty list (for the Nil class) and for cons cells (for
the Cons class).
 
*)

Class List inherits IO { 
        (* Since abort() returns Object, we need something of
	   type Bool at the end of the block to satisfy the typechecker. 
           This code is unreachable, since abort() halts the program. *)
	isNil() : Bool { { abort(); true; } };

	cons(hd : Int) : Cons {
	  (let new_cell : Cons <- new Cons in
		new_cell.init(hd,self)
	  )
	};

	(* 
	   Since abort "returns" type Object, we have to add
	   an expression of type Int here to satisfy the typechecker.
	   This code is, of course, unreachable.
        *)
	car() : Int { { abort(); new Int; } };

	cdr() : List { { abort(); new List; } };

	rev() : List { cdr() };

	sort() : List { cdr() };

	insert(i : Int) : List { cdr() };

	rcons(i : Int) : List { cdr() };
	
	print_list() : Object { abort() };
};

Class Cons inherits List {
	xcar : Int;  -- We keep the car in cdr in attributes.
	xcdr : List; 

	isNil() : Bool { false };

	init(hd : Int, tl : List) : Cons {
	  {
	    xcar <- hd;
	    xcdr <- tl;
	    self;
	  }
	};
	  
	car() : Int { xcar };

	cdr() : List { xcdr };

	rev() : List { (xcdr.rev()).rcons(xcar) };

	sort() : List { (xcdr.sort()).insert(xcar) };

	insert(i : Int) : List {
		if i < xcar then
			(new Cons).init(i,self)
		else
			(new Cons).init(xcar,xcdr.insert(i))
		fi
	};


	rcons(i : Int) : List { (new Cons).init(xcar, xcdr.rcons(i)) };

	print_list() : Object {
		{
		     out_int(xcar);
		     out_string("\n");
		     xcdr.print_list();
		}
	};
};

Class Nil inherits List {
	isNil() : Bool { true };

        rev() : List { self };

	sort() : List { self };

	insert(i : Int) : List { rcons(i) };

	rcons(i : Int) : List { (new Cons).init(i,self) };

	print_list() : Object { true };

};


Class Main inherits IO {

	l : List;
 	x : Int; 

	
	iota(i : Int) : List {
	    {
		l <- new Nil;
		out_string("Enter numbers\n");

		(let j : Int <- 0 in
		   while j < i 
		   loop 
		     {
		     	x <- in_int();
		       l <- (new Cons).init(x,l);
		       j <- j + 1;
		     } 
		   pool
		);
		out_string("\nSorted List:\n");
		l;
	    }
	};		

	main() : Object {
	   {
	     out_string("How many numbers to sort?\n");

	     iota(in_int()).sort().print_list();
	   }
	};
};			    





