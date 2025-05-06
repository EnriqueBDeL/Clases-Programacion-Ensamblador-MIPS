.data

salto: .asciiz "\n"
mensaje1:   .asciiz "Valor con lui/ori: "
mensaje2:   .asciiz "Valor con li: "

.text

# Usando lui y ori para cargar 0xABCDEF01 en $s0
   
    lui $at, 0xABCD        # Parte alta -> $at = 0xABCD0000
    ori $s0, $at, 0xEF01   # Parte baja -> $s0 = 0xABCDEF01
    
    
    li $v0, 4              
    la $a0, mensaje1
    syscall

    li $v0, 1              
    move $a0, $s0
    syscall
    
# Usando li para cargar directamente en $s1

    li $s1, 0xABCDEF01     # $s1 = 0xABCDEF01
    
    
    li $v0, 4
    la $a0, salto
    syscall
    
    
    li $v0, 4
    la $a0, mensaje2
    syscall

    li $v0, 1
    move $a0, $s1
    syscall
    
    
    li $v0, 10
    syscall
