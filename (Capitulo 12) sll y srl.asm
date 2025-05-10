.data

mensaje_original: .asciiz "Valor original: "
mensaje_sll:     .asciiz "Resultado de sll (<< 2): "
mensaje_srl:     .asciiz "Resultado de srl (>> 2): "
salto:         .asciiz "\n"

.text

 li $t1, 15 
 
 
 
    li $v0, 4
    la $a0, mensaje_original
    syscall

    li $v0, 1
    move $a0, $t1
    syscall
 
#---------------------------------------------------------------------------------| 
# sll —> Shift Left Logical (Desplazamiento lógico a la izquierda)
#
# Sintaxis: sll $d, $t, shamt
#
# Desplaza el contenido de "$t" a la izquierda "shamt" bits y guarda el resultado
# en "$d". ( Los bits se multiplican por potencia de 2)
#
#---------------------------------------------------------------------------------| 
    
    
    
    
    sll $t2, $t1, 2 # $t2 = $t1 << 2 ($t1 * 2^2)
    
    
    
    li $v0, 4
    la $a0, salto
    syscall
    
    
    li $v0, 4
    la $a0, mensaje_sll
    syscall

    li $v0, 1
    move $a0, $t2
    syscall
    
#----------------------------------------------------------------------------------------------------|   
# srl —> Shift Right Logical (Desplazamiento lógico a la derecha)
#
# Sintaxis: srl $d, $t, shamt
#
# Desplaza el contenido de "$t" a la derecha "shamt" bits, rellenando con ceros a la izquierda, 
# y guarda el resultado en "$d". ( Divide sin signo por potencias de 2. )
#
#----------------------------------------------------------------------------------------------------|   
    
    
  
    
      srl $t3, $t1, 2  #  $t3 = $t1 >> 2 ( $t1 / 2^2
   
   
   
    li $v0, 4
    la $a0, salto
    syscall
    
    li $v0, 4
    la $a0, mensaje_srl
    syscall

    li $v0, 1
    move $a0, $t3 # No imprime los decimales
    syscall



    li $v0, 10
    syscall