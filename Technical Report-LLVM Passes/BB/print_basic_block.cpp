#include <iostream>
#include "llvm/Support/raw_ostream.h"
#include "print_basic_block.h"

using namespace llvm;

namespace my_passes {

    bool basic_block_printer::runOnBasicBlock(BasicBlock &bb)
    {
        errs() << bb.getName() << ":\n";
        for (Instruction &inst_it : bb) {
            errs() << inst_it << '\n';
        }

        return false;
    }
}


char my_passes::basic_block_printer::ID = 0;
static RegisterPass<my_passes::basic_block_printer> X("print-basic-blocks", "Prints the basic blocks.", false, false);

