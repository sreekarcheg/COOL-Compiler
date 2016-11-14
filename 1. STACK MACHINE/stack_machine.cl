class StackCommand inherits IO{     --class Stackcommand provides the functionality of stack
 top()  : String { { "$"; } };
 body()  : StackCommand { {self; } };

 push(i : String) : StackCommand {
    (new Push).add(i, self)
 };

 pop() : StackCommand {
    (new Pop).remove(self.top(), self.body())
 };

  print(s: StackCommand) : Object {   --recusrsive function to print the stack
   if s.top() = "$" then out_string("")
     else {
         out_string(s.top());
         out_string("\n");
         print(s.body());
     }
   fi
 };


};

class Push inherits StackCommand {   --To provide push functionality
 top_elem : String;
 rem_body: StackCommand;
 top()  : String { top_elem };
 body()  : StackCommand { rem_body };

 add(i : String, rest : StackCommand) : StackCommand {
    {
         top_elem <- i;
         rem_body <- rest;
         self;
    }
 };
};


class Pop inherits StackCommand {  --To provide pop functionality
 top_elem : String;
 rem_body : StackCommand;
 top()  : String { top_elem };
 body()  : StackCommand { rem_body };

 remove(i : String, rest : StackCommand) : StackCommand {
    {
         top_elem <- rest.top();
         rem_body <- rest.body();
         self;
    }
 };
};



class Main inherits IO {

 stack_machine : StackCommand;
 input : String;
 second : String;
 a : String;
 b : String;
 aInt : Int;
 bInt : Int;
 cInt : Int;
 cString : String;




main() : Object
{
  {
      stack_machine <- new StackCommand.push("$");

      while(not(input = "x")) loop   --while loop to take input and process
      {
          out_string(">");
          input <- in_string();
         if(input = "d") then   --print stack 
         {
              stack_machine.print(stack_machine);
         }
         else
         {
              if(input = "e") then
              {
                  second <- stack_machine.top();
                  if(second = "+") then  --store the top two elements, pop them, push the sum
                  {
                      stack_machine <- stack_machine.pop();
                      a <-stack_machine.top();
                      aInt <- (new A2I).a2i(a);
                      stack_machine <- stack_machine.pop();
                      b <- stack_machine.top();
                      bInt <- (new A2I).a2i(b);
                      stack_machine <- stack_machine.pop();
                      cInt <- aInt+bInt;
                      cString <- (new A2I).i2a(cInt);
                      stack_machine <- stack_machine.push(cString);
                  }
                  else
                  {
                      if(second = "s") then  --swap the top two elements of the stack
                      {
                          stack_machine <- stack_machine.pop();
                          a <- stack_machine.top();
                          stack_machine <- stack_machine.pop();
                          b <- stack_machine.top();
                          stack_machine <- stack_machine.pop();
                          stack_machine <-stack_machine.push(a);
                          stack_machine <-stack_machine.push(b);
                      }
                      else
                      {
                         aInt <- aInt+1;
                      }
                      fi;
                   }
                  fi;
              }
              else   --for int,+,s directly push to the top of the stack
              {
                  stack_machine <- stack_machine.push(input);
              }
              fi;

          } 
          fi;
      }pool;

      out_string("COOL program successfully executed\n");   --exit on input 'x'



       }
   };
};
