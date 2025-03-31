#----------------------------------------------------------------------------------------------------------
# La pila en MIPS es una estructura de datos en memoria que sigue el principio LIFO (Last In, First Out). 
# Se usa para almacenar temporalmente datos, como variables locales o direcciones de retorno, 
# y se gestiona mediante el registro '$sp' (stack pointer).
#----------------------------------------------------------------------------------------------------------

#-----------------------------------------------------------------------------------------------------------------------
# En este código, el sistema solicita un número al usuario, lo guarda en la pila y finaliza la ejecución sin mostrarlo.
#-----------------------------------------------------------------------------------------------------------------------

.data
	
	mensaje_pedir:  .asciiz "Ingrese un número: "
	mensaje_mostrar: .asciiz "El número ingresado es: "
	nuevo_linea:   .asciiz "\n"

.text


    li   $v0, 4              
    la   $a0, mensaje_pedir  
    syscall


    li   $v0, 5               
    syscall
    move $t0, $v0           

    # Guardar el número en la pila (PUSH)
    addi $sp, $sp, -4         # Reservamos espacio en la pila
    sw   $t0, 0($sp)          # Guardamos el número en la pila


    li   $v0, 4
    la   $a0, mensaje_mostrar
    syscall

    # Recuperar el número de la pila (POP)
    lw   $t1, 0($sp)          # Cargar el valor de la pila en $t1
    addi $sp, $sp, 4          # Liberar espacio en la pila


    li   $v0, 1
    move $a0, $t1
    syscall


    li   $v0, 4
    la   $a0, nuevo_linea
    syscall


    li $v0, 10
    syscall
