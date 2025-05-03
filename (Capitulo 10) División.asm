.data

mensajeC: .asciiz "\n\nCociente: "
mensajeR: .asciiz "\nResto: "

.text 

#División:

li $s1, 10
li $s2, 2

div $s1, $s2 # 10 / 2 --> Cociente: 5 | Resto: 0

mflo $t0 # LO: cociente (resultado de la división entera)
mfhi $t1 # HI: residuo (módulo o resto)




li $v0, 4
la $a0, mensajeC
syscall

li $v0, 1
move $a0, $t0
syscall




li $v0, 4
la $a0, mensajeR
syscall 

li $v0, 1
move $a0, $t1
syscall

#--------------------------------------------------------

li $s1, 17
li $s2, 5

div $s1, $s2 # 17 / 5 --> Cociente: 3 | Resto: 2
 
 
mflo $t0
mfhi $t1



li $v0, 4
la $a0, mensajeC
syscall

li $v0, 1
move $a0, $t0
syscall



li $v0, 4
la $a0, mensajeR
syscall

li $v0, 1
move $a0, $t1
syscall

li $v0, 10
syscall
