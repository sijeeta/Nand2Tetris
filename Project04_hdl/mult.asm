// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Mult.asm

// Multiplies R0 and R1 and stores the result in R2.
// (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
//
// This program only needs to handle arguments that satisfy
// R0 >= 0, R1 >= 0, and R0*R1 < 32768.

// Psuedocode:
Get values of R0 and R1
sum=0
i=0
While i < R0:
  sum=sum+R1
  i +=1
R2 = sum

// Put your code here.
// initializing (i=0, sum=0)
   @sum 
   M=0 // sum=0
   @i
   M=0 // i=0

(LOOP)
   @R0
   D=M //assign D=R0 value
   @i
   D=D-M // assign D = (R0 value - RAM[i] value)
   @STOP
   D;JEQ // jumpto STOP if D = 0
   @R1
   D=M // assign D= R1 value
   @sum
   M=M+D // sum = sum + R1
   @i
   M=M+1 //i= i + 1
   @LOOP
   0;JMP // jump to loop

(STOP) // Loop ends and comes here when R0-i = 0 i.e i=R0
   @sum 
   D=M // assign final value of sum to D 
   @R2
   M=D // store sum vale to R2 i.e R2 = sum

(END)
   @END 
   0;JMP// Keep iterating over infinite loop to avoid unwanted program run
