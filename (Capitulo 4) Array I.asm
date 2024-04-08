#-----------------------------------------------------------------------------------------------
# En este codigo el sistema lee e imprime los valores del array.
#-----------------------------------------------------------------------------------------------

.data 

array: .word 1,2,3,4,5,6,7 # Cada palabra ocupa 4 bytes. En este caso los numeros son palabras.
coma: .asciiz ","

.text

li $t0, 7 # Tamaño del array
li $t1, 0 # Contador del array
la $t2, array # Contiene la dirección de memoria del elemento actual del array

bucle:

beq $t1, $t0, fin_bucle

   lw $t3, ($t2)       # Cargar el valor de la palabra en $t3
   addi $t2, $t2, 4   # Avanza 4 bytes para ir a la siguiente palabra.
    
# Ejemplo:
#           [1],[2],[3],...
#           Primero $t2 equivale [1]
#           Depués de avanzar 4 byte, $t2 equivale [2]
#           Así sucesivamente.    
    
    li $v0, 1
    move $a0, $t3
    syscall

    li $v0, 4
    la $a0, coma
    syscall

addi $t1, $t1, 1 # Incrementa el contador +1

j bucle

fin_bucle:

li $v0, 10
syscall