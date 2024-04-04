#-----------------------------------------------
# Este codigo imprime una cadena de caracteres.
#-----------------------------------------------

.data

mensaje: .asciiz "Hola Mundo."  #Puedes llamar a la variablecomo quieras.

.text

#Imprimir mensaje
li $v0,4        #El valor 4 se utiliza para imprimir una cadena
la $a0,mensaje
syscall

#Salir del sistema
li $v0, 10
syscall
