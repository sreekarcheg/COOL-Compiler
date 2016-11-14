#include "llvm/Pass.h"
#include "llvm/IR/BasicBlock.h"

using namespace llvm;

namespace my_passes {

class basic_block_printer : public BasicBlockPass {
public:
    static char ID;

    basic_block_printer() : BasicBlockPass(ID)
    {}

    virtual bool runOnBasicBlock(BasicBlock &bb);
};
}
