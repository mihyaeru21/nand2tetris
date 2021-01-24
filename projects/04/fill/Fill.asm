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

(MAIN)
    // dicide color
    @color
    M=0 // white
    @KBD
    D=M
    @KBD_ON
    D;JNE
    @KBD_END
    0;JMP
    (KBD_ON)
        @color
        M=-1 // black
    (KBD_END)

    // fill screen by color
    @8191 // 256 * 32 - 1
    D=A
    @i
    M=D
    (LOOP)
        // fill
        @i
        D=M
        @SCREEN
        D=D+A
        @addr
        M=D
        @color
        D=M
        @addr
        A=M
        M=D
        // loop
        @i
        MD=M-1
        @LOOP
        D;JGE

@MAIN
0;JMP

