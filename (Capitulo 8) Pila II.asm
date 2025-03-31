#--------------------------------------------------------------
# En este c�digo, el programa suma cinco n�meros enteros, 
# utilizando registros y la pila para manejar par�metros. 
# Luego, muestra el resultado en pantalla.
#
# Suma: 5 + 3 + 2 + 7 + 1 = 18
#--------------------------------------------------------------

.data

    mensaje: .asciiz "El resultado de la suma es: "
    salto_linea: .asciiz "\n"

.text


    li   $a0, 5      
    li   $a1, 3       
    li   $a2, 2      
    li   $a3, 7      

    # Guardar el quinto par�metro en la pila
    li   $t0, 1        # Quinto par�metro 
    addi $sp, $sp, -4  # Reservar espacio en la pila.              # Tambien puedes ponerlo como --> 'subi $sp, $sp, 4' 
    sw   $t0, 0($sp)   # Guardar el quinto par�metro en la pila


    jal suma            # Llamar a la funci�n suma
    			# La direcci�n de la siguiente instrucci�n se guarda autom�ticamente en '$ra'.


    move $t1, $v0


    li   $v0, 4
    la   $a0, mensaje
    syscall


    li   $v0, 1  
    move $a0, $t1  
    syscall


    li   $v0, 4
    la   $a0, salto_linea
    syscall


    li $v0, 10
    syscall


#--------------------------------------------------------------
# Funci�n suma:
# Recibe 5 par�metros (4 en registros, 1 en la pila).
# Retorna la suma de los 5 valores en $v0.
#--------------------------------------------------------------

suma:

    # Reservar espacio en la pila y guardar registros
    addi $sp, $sp, -12     # Reservar espacio para $ra, $s0 y $s1
    sw   $ra, 0($sp)       # Guardar la direcci�n de retorno
    sw   $s0, 4($sp)       # Guardar $s0
    sw   $s1, 8($sp)       # Guardar $s1



    add  $s0, $a0, $a1     # $s0 = a + b
    add  $s1, $a2, $a3     # $s1 = c + d
    add  $v0, $s0, $s1     # $v0 = (a + b) + (c + d)



    # Recuperar el quinto par�metro desde la pila
    lw   $t0, 12($sp)      # Aqu� estaba el quinto par�metro
    
    # Al reservar 12 de espacio para $ra, $s0 y $s1, el quinto parametro, pas� a estar a 12 bytes de la nueva direcci�n de $sp.
    
    add  $v0, $v0, $t0     # $v0 = (a + b + c + d) + e



    # Restaurar los registros antes de regresar
    lw   $ra, 0($sp)       # Recuperar la direcci�n de retorno
    lw   $s0, 4($sp)       # Recuperar el valor de $s0
    lw   $s1, 8($sp)       # Recuperar el valor de $s1
    addi $sp, $sp, 12      # Liberar espacio en la pila


    jr   $ra               # Regresar a la instrucci�n que sigue despu�s de 'jal suma'





