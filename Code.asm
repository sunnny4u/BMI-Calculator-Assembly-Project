  .MODEL SMALL
  .STACK 100H
  .DATA 
  MSA DB ' ==================== WELCOME TO OUR PROJECT ====================$' 
  MSB DB ' ******************** BMI CALCULATOR ********************$'
  MSC DB ' """Info - 1feet= 30cm"""$'
  MSD DB ' Input your height in cm:$'
  MSE DB ' Input your weight in kg:$'
  MSF DB ' "Your weight is:over weight"$'
  MSG DB ' "Your weight is:perfect"$'
  MSH DB ' "Your weight is:under weight"$'
  MSI DB ' "Press 1 to see the instruction for gain the perfect weight if you are under-weight "$'
  MSJ DB ' "Press 2 to see the instruction for gain the perfect weight if you are over-weight " $'
  
  MSK1 DB ' " 1.Eat more and sleep 8 hours a day."$'
  MSK2 DB ' " 2.Absorb high calorie food (potato, brown rice, chicken breast, check peas, almond, sweet potato etc.)"$'
  MSK3 DB ' " 3.Drink at least 3L water per day."$'
  MSK4 DB ' " 4.Eat vegetables and 1 glass of milk and 1 whole egg each day."$'
  
  MSL1 DB ' " 1.Try to follow a low calorie healthy diet."$'
  MSL2 DB ' " 2.Eat high protein, vegetables and avoid fast food."$'
  MSL3 DB ' " 3.Do some workout for weight lose (walking, running, crunching, ropping )."$' 
  
  MSN DB ' Congratulation..! Keep it up.$'
  
  MSM1 DB ' " Press 1 to Recalculate."$'
  MSM2 DB ' " Press 2 to EXIT."$' 
  MSM3 DB '          ********THANK YOU********$'
  MSM4 DB ' " Press any key to continue...."$'
  
  SUM DW ? 
  .CODE
   MAIN PROC
    
    
    MOV AX,@DATA
    MOV DS,AX
    
    LEA DX,MSA
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSB
    MOV AH,9
    INT 21H 
    
    CALL NL
    CALL NL
    
    LEA DX,MSC
    MOV AH,9
    INT 21H 
    
    START:
    
    CALL NL
    CALL NL
    
    LEA DX,MSD
    MOV AH,9
    INT 21H 
           
    MOV AX,0
    MOV BX,0
    MOV CX,0
    MOV DX,0
    MOV SUM,0
    
 
         
 INPUT:
 
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE PRINT
    
   
    JMP INPUT
    
    
    PRINT: 
    
    CALL NL
    
    LEA DX,MSE
    MOV AH,9
    INT 21H
    
    MOV SUM,BX
    MOV BX,0
    MOV AX,0
     
    INPUT2:
     
    AND AX,000FH
    PUSH AX
    MOV AX,10
    MUL BX
    MOV BX,AX
    POP AX
    ADD BX,AX
    
    MOV AH,1
    INT 21H
     
    CMP AL,0DH
    JE CONVERT
    
    JMP INPUT2
     
    CONVERT:
    
    MOV AX,SUM
    MOV DX,0
    
    DIV BX
     
    
    CMP AX,1
    JE OVER
    
    CMP AX,2
    JE OVER
    
    CMP AX,3
    JE PERFECT
    
    CMP AX,4
    JE UNDER
    
    CMP AX,5
    JE UNDER
    
    OVER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSF
    MOV AH,9
    INT 21H 
    
    JMP PRESS
    
    PERFECT:
     
    CALL NL
    CALL NL
    
    LEA DX,MSG
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSN
    MOV AH,9
    INT 21H 
     
    JMP EXIT
     
    UNDER:
    
    CALL NL
    CALL NL
    
    LEA DX,MSH
    MOV AH,9
    INT 21H 
    
    JMP PRESS
              
    PRESS:
    
    MOV AX,0 
    
    CALL NL
    CALL NL
    
    LEA DX,MSI
    MOV AH,9
    INT 21H
    
    CALL NL
    CALL NL
    
    LEA DX,MSJ
    MOV AH,9
    INT 21H
    
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE P1
    
    CMP AL,'2'
    JE P2
    
    P1:
    
    CALL NL
    CALL NL
    
    LEA DX,MSK1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSK2
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSK3
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSK4
    MOV AH,9
    INT 21H
    
    JMP EXIT
    
    P2:
    
    CALL NL
    CALL NL
    
    LEA DX,MSL1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSL2
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSL3
    MOV AH,9
    INT 21H
    
    EXIT:
    MOV AX,0
    CALL NL
    CALL NL
    
    LEA DX,MSM4
    MOV AH,9
    INT 21H   
    
    MOV AH,1
    INT 21H
       
    CALL NL
     
    LEA DX,MSM1
    MOV AH,9
    INT 21H
    
    CALL NL
    
    LEA DX,MSM2
    MOV AH,9
    INT 21H 
    
    MOV AH,1
    INT 21H
    
    CMP AL,'1'
    JE START
    
    JMP EXIT2
    
    NL:
    MOV AH,2
    MOV DL,0DH
    INT 21H
    MOV DL,0AH
    INT 21H
    RET
    
      
    EXIT2:  
    CALL NL
    CALL NL
    
    LEA DX,MSM3
    MOV AH,9
    INT 21H
     
    MOV AH,4CH
    INT 21H
             
    MAIN ENDP 
    END MAIN











