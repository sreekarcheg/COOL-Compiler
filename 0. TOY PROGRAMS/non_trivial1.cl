(*Prints all primes less than the number inputted*)
class Main inherits IO {

  main() : Int {	
    
    0
  };

  out : Int <-		-- out is our 'output'.  Its values are the primes.
    {
      out_string("Enter the bound of the primes to be printed:\n");
      
      2;
    };

  testee : Int <- 1;	-- testee is a number to be tested for primeness.   

  divisor : Int;	-- divisor is a number which may factor testee.

  stop : Int <- in_int();	-- stop is an arbitrary value limiting testee. 	

  --out_string("Primes:\n")

  m : Object <-		-- m supplants the main method.
    while true loop 
      {

        testee <- testee + 1;
        divisor <- 2;

        while 
          if testee < divisor * divisor 
            then false 		-- can stop if divisor > sqrt(testee).
	  else if testee - divisor*(testee/divisor) = 0 
            then false 		-- can stop if divisor divides testee. 
            else true
          fi fi     
        loop 
          divisor <- divisor + 1
        pool;        

        if testee < divisor * divisor	-- which reason did we stop for?
        then 	-- testee has no factors less than sqrt(testee).
          {
            out <- testee;	
            out_int(out); 
            out_string(" ");
          }
        else	-- the loop halted on testee/divisor = 0, testee isn't prime.
          0	-- testee isn't prime, do nothing.
	fi;   	

        if stop <= testee then 
          "halt".abort()	
        else 
          "continue"
        fi;       

      } 
    pool;

}; (* end of Main *)

