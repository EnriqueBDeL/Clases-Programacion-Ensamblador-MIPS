#-------------------------------------------------------------------------------------------------------------------------------------
# Este codigo te pide introducir unos numeros y guardarlos en un array vacio.
#-------------------------------------------------------------------------------------------------------------------------------------

.data

array: .word 0,0,0,0,0
mensaje: .asciiz "\nIntroduce un numero: "
coma: .asciiz ","

.text

# Insertar
li $t3,5
li $t4,0


# Imprimir 
li $t0, 5
li $t1, 0 
la $t2,array
li $t6,0

insertar:

beq $t4, $t3, imprimir


	li $v0, 4
	la $a0, mensaje
	syscall


	li $v0, 5
	syscall
	move $t5, $v0


   	sw $t5, ($t2)      
   	addi $t2, $t2, 4 

	addi $t4, $t4, 1

j insertar

imprimir:

    beq $t1, $t0, fin

    lw $a0, array($t6)
    li $v0, 1
    syscall
    
    li $v0, 4
    la $a0, coma
    syscall

    addi $t1, $t1, 1      
    addi $t6, $t6, 4        
     
j imprimir

fin:

	li $v0, 10
	syscall