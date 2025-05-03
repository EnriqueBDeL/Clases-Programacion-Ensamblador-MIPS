.data

mensajeM: .asciiz "\nEl resultado de la suma es: "

mensajeLO: .asciiz "\n\nParte baja (LO): "
mensajeHI: .asciiz "\nParte alta (HI): "

.text


# Multipliacacion:

li $s1, 2 #32 bits
li $s2, 4 #32 bits

mult $s1, $s2 # 2 x 4 = 8



#--------------------------------------------------|
# El resultado son 64 bits.

# El resultado se guarda en dos registros:
#   HI(Parte alta del resultado): contiene los 32 bits más significativos.
#   LO(Parte baja del resultado): contiene los 32 bits menos significativos.
#--------------------------------------------------|



mflo $t0   # Copia el contenido de LO a $t0

mfhi $t1   # Copia el contenido de HI a $t1




li $v0, 4
la $a0, mensajeM
syscall

li $v0, 1       
move $a0, $t0
syscall


#-------------------------------------------------------


#Multiplicacion con numero grandes:

li $s1, 123456
li $s2, 987654


mult $s1, $s2 # 123456 × 987654 = 121931812224


# 121931812224 = 0x1C62E9A580


mflo $t0  # 0x0000001C --> 28
 
mfhi $t1 # 0x62E9A580 --> 1672727936 
    
    
    
    
li $v0, 4
la $a0, mensajeLO
syscall

li $v0, 1
move $a0, $t0
syscall   
    
    
    
    
li $v0, 4
la $a0, mensajeHI
syscall

li $v0, 1
move $a0, $t1
syscall   
    