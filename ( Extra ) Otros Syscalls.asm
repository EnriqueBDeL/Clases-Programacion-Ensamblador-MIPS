#----------------------------------------------------------------------
# En este codigo aprende a utiliar algunos de los syscalls que existen.
#----------------------------------------------------------------------

.data

Menu: .asciiz "\n\nMENU:"
Op1: .asciiz "\n1. Entero."
Op2: .asciiz "\n2. Float."
Op3: .asciiz "\n3. Doble."
Op4: .asciiz "\n4. Caracter."
Op5: .asciiz "\n5. Cadena."
Op6: .asciiz "\n6. Random entero."
Op7: .asciiz "\n7. Random float."
Op8: .asciiz "\n8. Random double."
Op9: .asciiz "\n9. MIDI out."
Op10: .asciiz "\n10. Binario."
Op0: .asciiz "\n0. Salir."
Intr:  .asciiz "\n\nIntroduce una opción: "

#---------------------------------------------
mensajee: .asciiz "\nIntroduce un entero: "
#---------------------------------------------
mensajef: .asciiz "\nIntroduce un float: "
#---------------------------------------------
mensajed: .asciiz "\nIntroduce un doble: "
#---------------------------------------------
mensajec: .asciiz "\nIntroduce un caracter: "
#---------------------------------------------
mensajeca: .asciiz "\nIntroduce una cadena: "
#---------------------------------------------
muestra: .asciiz "\nIntrodugiste: "
#---------------------------------------------

#---------------------------------------------
cadena: .space 100
#---------------------------------------------

#---------------------------------------------
muestra2: .asciiz "\nNumero aleatorio: "
#---------------------------------------------

#---------------------------------------------
pitch: .byte 64
duration: .byte 100
instrument: .byte 24
volume: .byte 100
#---------------------------------------------

.text

bucle_menu:

li $v0,4
la $a0, Menu
syscall
#----------------
li $v0,4
la $a0, Op1
syscall
#----------------
li $v0,4
la $a0, Op2
syscall
#----------------
li $v0,4
la $a0, Op3
syscall
#----------------
li $v0,4
la $a0, Op4
syscall
#----------------
li $v0,4
la $a0, Op5
syscall
#----------------
li $v0,4
la $a0, Op6
syscall
#----------------
li $v0,4
la $a0, Op7
syscall
#----------------
li $v0,4
la $a0, Op8
syscall
#----------------
li $v0,4
la $a0, Op9
syscall
#----------------
li $v0,4
la $a0, Op10
syscall
#----------------
li $v0,4
la $a0, Op0
syscall
#----------------
#----------------
li $v0,4
la $a0, Intr
syscall

li $v0, 5
syscall
move $t0, $v0
 
beq $t0,1,op1
beq $t0,2,op2
beq $t0,3,op3
beq $t0,4,op4
beq $t0,5,op5
beq $t0,6,op6
beq $t0,7,op7
beq $t0,8,op8
beq $t0,9,op9
beq $t0,10,op10
beq $t0,0,cerrar

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op1:

li $v0,4
la $a0, mensajee
syscall

li $v0,5
syscall
move $t1, $v0

li $v0,4
la $a0, muestra
syscall

li $v0,1
move $a0, $t1
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op2:


li $v0,4
la $a0, mensajef
syscall

li $v0,6
syscall

mov.s $f12, $f0

li $v0,4
la $a0, muestra
syscall

li $v0,2
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op3:

li $v0,4
la $a0, mensajed
syscall

li $v0,7
syscall
mov.d $f12, $f0 
  
li $v0,4
la $a0, muestra
syscall

li $v0, 3
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op4:

li $v0,4
la $a0, mensajec
syscall

li $v0,12
syscall

move $t1,$v0

li $v0,4
la $a0, muestra
syscall

li $v0, 11
move $a0, $t1
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op5:

li $v0,4
la $a0, mensajeca
syscall

li $v0,8
la $a0,cadena
li $a1,100
syscall

li $v0,4
la $a0, muestra
syscall

li $v0, 4
la $a0, cadena
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op6:

li $v0,4
la $a0, muestra2
syscall

li $a1, 10  
li $v0, 42  
syscall

li $v0, 1  
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op7:

li $v0,4
la $a0, muestra2
syscall
 
li $a1, 100
li $v0, 43  
syscall

mov.s $f12, $f0

li $v0, 2  
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op8:

li $v0,4
la $a0, muestra2
syscall
 
li $a1, 100
li $v0, 44  
syscall

mov.d $f12, $f0 

li $v0, 2  
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op9:

li $v0, 31 
la $t0, pitch
la $t1, duration 
la $t2, instrument
la $t3, volume 

move $a0, $t0 
move $a1, $t1 
move $a2, $t2
move $a3, $t3 

syscall 


j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
op10:

li $v0,4
la $a0, mensajee
syscall

li $v0,5
syscall
move $a0, $v0

li $v0, 35
syscall

j bucle_menu
#---------------------------------
#|||||||||||||||||||||||||||||||||
#---------------------------------
cerrar:
li $v0, 10
syscall
