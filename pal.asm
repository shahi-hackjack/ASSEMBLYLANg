.MODEL SMALL
.DATA
A1 DB 20 DUP(?)
A2 DB 20 DUP(?)
MSG1 DB 'ENTER THE STRING',0DH,0AH,'$'
MSG2 DB 'NOT A PALINDROME',0DH,0AH,'$'
MSG3 DB 'PALINDROME',0DH,0AH,'$'
MSG4 DB 0DH,0AH,'$'
.CODE
MOV AX,@DATA
MOV DS,AX
MOV ES,AX
MOV SI,OFFSET A1
MOV DI,OFFSET A2
MOV DX,OFFSET MSG1
MOV AH,09H
INT 21H
MOV CX,00
NEXT1:MOV AH,01H
INT 21H
CMP AL,0DH
JZ NEXT2
INC CX
MOV BX,CX
MOV[SI],AL
INC SI
JMP NEXT1
NEXT2:DEC SI
NEXT3:MOV AL,[SI]
MOV [DI],AL
INC DI
DEC SI
JNZ NEXT3
MOV SI,OFFSET A1
MOV DI,OFFSET A2
CLD
REPE CMPSB
JE PALIN
MOV DX,OFFSET MSG4
MOV AH,09H
INT 21H
MOV DX,OFFSET MSG2
LOC2:MOV AH,09H
INT 21H
MOV AH,4CH
INT 21H
PALIN:MOV DX,OFFSET MSG4
MOV AH,09H
INT 21H
MOV DX,OFFSET MSG3
JMP LOC2
END