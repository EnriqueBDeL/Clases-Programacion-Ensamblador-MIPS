.data

msg1: .asciiz "No salto porque el valor es cero.\n"
msg2: .asciiz "Salto porque el valor no es cero.\n"

.text

li $t0, 4     
	
	#------------------------------------------------------------------------------------------------|
	# bnez —> Branch if Not Equal to Zero
	# Pseudoinstrucción que se usa para hacer saltos condicionales si un registro NO contiene cero.
	#------------------------------------------------------------------------------------------------|

	bnez $t0, Salto  # Si $t0 != 0 entonces salta a "Salto", si no, continúa

	li $v0, 4       
	la $a0, msg1
	syscall
	
	j Fin

Salto:

	li $v0, 4
	la $a0, msg2
	syscall
	
Fin:

	li $v0, 10
	syscall
