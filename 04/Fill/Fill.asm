// This file is part of www.nand2tetris.org
// and the book "The Elements of Computing Systems"
// by Nisan and Schocken, MIT Press.
// File name: projects/4/Fill.asm

// Runs an infinite loop that listens to the keyboard input. 
// When a key is pressed (any key), the program blackens the screen,
// i.e. writes "black" in every pixel. When no key is pressed, 
// the screen should be cleared.

(TYPING)
    @i
    M=0
    @KBD
    D=M
    @FILL_WHITE
    D;JEQ
    @FILL_BLACK
    D;JNE
(FILL_WHITE)
    // 512px * 256px / 16bit
    @8192
    D=A
    @i
    D=D-M
    @TYPING
    D;JEQ
    @i
    D=M
    @SCREEN
    A=D+A
    M=0
    @i
    M=M+1
    @FILL_WHITE
    0;JMP
(FILL_BLACK)
    // 512px * 256px / 16bit
    @8192
    D=A
    @i
    D=D-M
    @TYPING
    D;JEQ
    @i
    D=M
    @SCREEN
    A=D+A
    M=-1
    @i
    M=M+1
    @FILL_BLACK
    0;JMP