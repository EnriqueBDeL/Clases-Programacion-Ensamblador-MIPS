#-------------------------------------------------------------------------------
# Al igual que en otros lengajes se puede comentar y paara comentar en MIps, se 
# utiliza "#" seguido del mensaje.
#-------------------------------------------------------------------------------

# Este codigo te  muestra como hacer una suma y una resta en MIPS.

.data 


.text

li $t0,5 #Carga el numero 5 en $t0
li $t1,4  #Carga el numero 4 en $t0


#Suma:
add $t3, $t0,$t1 #Sumas los valores de $t0 y $t1 y los guardas en $t3

li $v0, 1                 # Llama al sistema para imprimir un entero
move $a0, $t3             # Cargar el valor de $t3 en $a0
syscall

#Resta:
#Descomenta la resta y comenta la suma para que no haya confusiones en los resultados--

# sub $t3, $t0, $t1 #Resta los valores de $t0 y $t1 y los guardas en $t3

# li $v0, 1                
# move $a0, $t3             
# syscall
#-------------------------------------------------------------------------------------

#Salir de programa
li $v0, 10 
syscall