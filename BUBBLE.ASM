;Bubble_Sort
.MODEL SMALL
.DATA
DATA SEGMENT
ARRAY DB 06H,02H,00H,08H,10H,03H,11H,09H;
N DB(N-ARRAY)
DATA ENDS
.CODE
CODE SEGMENT
ASSUME CS:CODE,DS:DATA
START:MOV AX,DATA
MOV DS,AX
MOV CL,01H
LOOPI:CMP CL,N
JGE EXIT
MOV SI,0000H
MOV CH,01H
MOV BH,N
SUB BH,CL
LOOPJ:CMP CH,BH
JA INCRI
MOV AL,ARRAY[SI]
CMP AL,ARRAY[SI+1]
JLE INCRJ
XCHG AL,ARRAY[SI+1]
MOV ARRAY[SI],AL
INCRJ:INC CH
INC SI
JMP LOOPJ
INCRI:INC CL
JMP LOOPI
EXIT:MOV AH,4CH
INT 21H
CODE ENDS
END START


