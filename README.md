# **CURRENT CODE NOT UP TO DATE**
# Simple Processor

Based on Professor Andreas Moshovos's lecture on [Implementing a Processor: Multi-cycle Implementation](https://www.eecg.toronto.edu/~moshovos/ECE243-2025/l20-multicycle.html) for the [Computer Organization (ECE243)](https://engineering.calendar.utoronto.ca/course/ece243h1) course at the [University of Toronto](https://www.ece.utoronto.ca/)


## Features
- 8 bit instructions
- 256 memory locations
- 4 general purpose registers
- Default PC value of $80
- Zero and negative bit(s)
- 10 Instructions:

![Instruction encoding]()

## Single-Cycle Implementation

Reads for all storage elements will be done using combinatorial logic (reads happen at any time), but changes (in registers or memory) will only take place at the falling edge of the clock. Cycle is determined based on the delay of the slowest instruction. 

### Register File


### Arithmetic Logic Unit

### Instruction Memory

### Dat Memory

## Multi-Cycle Implementation
