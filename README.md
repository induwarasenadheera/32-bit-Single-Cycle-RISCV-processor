# 32-bit-Single-Cycle-RISCV-processor
In this project, we have designed a 32-bit CPU that adheres to the RV32I RISC-V ISA specification. The processor is designed to handle R-type, I-type, S-type, and SB-type instructions, providing a wide range of capabilities for executing various tasks.

The CPU consists of several key components, including a controller, program counter, register memory, instruction memory, instruction decoder, data memory, arithmetic and logic unit (ALU), and ALU controller. The controller acts as the central nervous system of the CPU, directing the flow of information and commands to other components. The register memory stores the current state of the CPU, while the instruction memory stores the program code to be executed. The instruction decoder interprets the instructions from the instruction memory. The data memory stores data values for processing, and the ALU performs arithmetic and logical operations based on the instructions provided by the instruction decoder.\
[Instruction Decoding](https://docs.google.com/spreadsheets/d/1uY1UlELfuYjWbLZRT7HuZcHY1sa38amhk1CRLBiB46o/edit?usp=sharingL)

# Data Path and Control Signals
<img title="Data Path" alt="Data Path" src="/Data Path and Control Signals.jpg">
