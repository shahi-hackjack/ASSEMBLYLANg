.MODEL SMALL
.DATA
      N DB 4
      R DB 2
      RES DB ?
.CODE
     NCR PROC NEAR
     CMP BL,0
     JNE L1
     ADD RES,1
     RET

   L1:  CMP BL,AL
        JNE L2
        ADD RES,1
        RET

   L2:  CMP BL,1
        JNE L3
        ADD RES,AL
        RET

   L3:  DEC AL
        CMP BL,AL
        JNE L4
        INC AL
        ADD RES,AL
        RET

   L4:  PUSH AX
        PUSH BX
        CALL NCR
        POP BX
        POP AX
        DEC BX
        PUSH AX
        PUSH BX
        CALL NCR
        POP BX
        POP AX
        RET

     NCR ENDP

  START:  MOV AX,@DATA
          MOV DS,AX
          MOV AL,N
          MOV BL,R
          CALL NCR
          MOV AH,4CH
          INT 21H
   END START
