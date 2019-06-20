# Pipelined Mips

Pipeined Mips Microprocessor using VHDL, 34 Instructions including Rtype,
Itype, Branching, Jumping and memory access instructions.

![](images/instructions_number.png)

### Pipelined Mips Design

![](images/mips_design.png)

##### Rtype Instructions
  - ADD
  - ADDU
  - AND
  - NOR
  - OR
  - SLT
  - SLTU
  - SUB
  - SUBU
  - XOR
  - SLL
  - SLLV
  - SRL
  - SRLV
  
##### Itype Instructions
   - ADDI
   - ADDIU
   - ANDI
   - ORI
   - SLTI
   - SLTIU
   - XORI
   - LUI
  
##### Branching Instructions
   - BGTZ
   - BLTZ
   - BEQ
   - BNE
   - BGEZ
   - BLEZ
  
##### Jumping Instructions
   - J
   - JR
  
##### Memory Access Instructions
   - SW
   - LW
   - LH
   - LB

# Instructions Path

##### Rtype Instructions
![](images/rtype_instruction.png)

##### Itype Instructions
![](images/itype_instruction.png)

##### Branching Instructions
![](images/branch_instruction.png)

##### Jumping Instructions
Jump
![](images/jump_instruction.png)
Jr
![](images/jr_instruction.png)

##### Memory Access Instructions
Lw, Lh, Lb
![](images/lw_instruction.png)
Sw
![](images/sw_instruction.png)

# Branching Circuit
![](images/branching_circuit.png)

# Control Circuit

#### Control Signals Circuit
![](images/control_signals.png)

#### Main Decoder Signals
![](images/main_decoder_signals.png)

#### ALU Decoder Signals
![](images/alu_decoder_signals.png)

