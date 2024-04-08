#-----------------------------------------------------------------------------------
# En este codigo el programa te pedira infinitamente que introduzca un numero, hasta 
# que escribas un numero igual al que contienen $t1.
#------------------------------------------------------------------------------------

.data

mensaje: .asciiz "Introduce un numero: "

.text

li $t1,10 #El numero que te sacará del bucle

bucle: 
li $v0, 4
la $a0, mensaje
syscall

li $v0, 5
syscall
move $t0, $v0

beq $t0,$t1, fin_bucle # Si $t0 == $t1 sale del bucle.

j bucle #vuelve a ejecutar el codigo que hay depués de la etiqueta "bucle:".

fin_bucle: # Esta etiqueta equivale a salir del bucle.
li $v0, 10
syscall
