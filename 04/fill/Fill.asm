// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/04/Fill.asm

// Runs an infinite loop that listens to the keyboard input.
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel;
// the screen should remain fully black as long as the key is pressed. 
// When no key is pressed, the program clears the screen, i.e. writes
// "white" in every pixel;
// the screen should remain fully clear as long as no key is pressed.

// Put your code here.


(LISTENKBD)
  @8191 // 8192 (total screen register num) - 1; paint from the last screen register
  D = A
  @count
  M = D
  @KBD
  D = M
  @CLEARSCREEN
  D;JEQ	// goto cleaescreen if KBD value is 0
(PAINTSCREEN)
  @count
  D = M
  @SCREEN
  A = A + D
  M = -1
  @count
  MD = M - 1
  @LISTENKBD
  D;JLT
  @PAINTSCREEN
  0;JMP

(CLEARSCREEN)
  @count
  D = M
  @SCREEN
  A = A + D
  M = 0
  @count
  MD = M - 1
  @LISTENKBD
  D;JLT
  @CLEARSCREEN
  0;JMP
