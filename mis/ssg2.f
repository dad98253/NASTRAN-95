      SUBROUTINE SSG2
C
C     MULTI  = 0  IMPLIES NO MULTI-POINT CONSTRAINTS PN = PG
C
C     SINGLE = 0  IMPLIES NO SINGLE POINT CONSTRAINTS PF = PN
C
C     OMIT   = 0  IMPLIES NO OMITTED POINTS PA = PF
C
C     REACT  = 0  IMPLIES NO FREE BODY PROBLEM PL = PA
C
C
      EXTERNAL        ANDF
      INTEGER         USET,GM,KFS,GO,PNBAR,PG,PM,PO,PA,SINGLE,OMIT,
     1                PVECT,PS,D,PL,PR,QR,REACT,UM,UN,UG,US,UF,UO,UA,
     2                UL,UR,PF,PABAR,PN,PFBAR,ANDF,YS,IA(7),USET1,SR4
      COMMON /SYSTEM/ DUM54(54),IPREC
      COMMON /PATX  / LC,N,NO,N4,USET1,IBC
      COMMON /BLANK / SINGLE
      COMMON /BITPOS/ UM,UO,UR,USG,USB,UL,UA,UF,US,UN,UG
      COMMON /TWO   / TWO1(32)
      COMMON /ZZZZZZ/ CORE(1)
C
      DATA    USET  , GM    ,KFS   ,GO    ,PNBAR ,PM    ,PO    ,PN    /
     1        101   , 102   ,104   ,105   ,302   ,303   ,202   ,204   /
      DATA    PFBAR , PF    ,PABAR ,PA    ,PS    ,D     ,PL    ,PR    /
     1        302   , 204   ,302   ,204   ,203   ,106   ,204   ,302   /
      DATA    QR    , PVECT ,YS    ,PG    ,SR4   /
     1        201   , 301   ,103   ,107   ,304   /
C
C
      PNBAR = 302
      PN    = 204
      PR    = 302
      PF    = 204
      PA    = 204
      LC    = KORSZ(CORE)
C
C     DECIDE IF MULTI,SINGLE,OMIT,REACT ARE 1 OR ZERO
C
      IA(1) = USET
      USET1 = USET
      CALL RDTRL (IA)
      MULTI = ANDF(IA(5),TWO1(UM))
      SINGLE= ANDF(IA(5),TWO1(US))
      OMIT  = ANDF(IA(5),TWO1(UO))
      REACT = ANDF(IA(5),TWO1(UR))
      IF (REACT .LE. 0) GO TO 10
      IF (.NOT.(MULTI.GT.0 .AND. SINGLE.EQ.0 .AND. OMIT.EQ.0)) GO TO 5
      PNBAR = 204
      PN    = 302
      PR    = 303
      GO TO 20
    5 CONTINUE
      PF    = 201
      PA    = 303
   10 IF (MULTI) 20,30,20
C
   20 CALL CALCV (PVECT,UG,UN,UM,CORE(1))
      CALL SSG2A (PG,PNBAR,PM,PVECT)
      CALL SSG2B (GM,PM,PNBAR,PN,1,IPREC,1,SR4)
      GO TO 40
C
   30 PN = PG
   40 IF (SINGLE) 50,70,50
   50 CALL CALCV (PVECT,UN,UF,US,CORE(1))
      CALL SSG2A (PN,PFBAR,PS,PVECT)
      CALL SSG2B (KFS,YS,PFBAR,PF,0,IPREC,0,SR4)
      GO TO 80
   70 PF = PN
   80 IF (OMIT) 90,100,90
C
   90 CALL CALCV (PVECT,UF,UA,UO,CORE(1))
      CALL SSG2A (PF,PABAR,PO,PVECT)
      CALL SSG2B (GO,PO,PABAR,PA,1,IPREC,1,SR4)
      GO TO 110
  100 PA = PF
  110 IF (REACT) 120,130,120
C
  120 CALL CALCV (PVECT,UA,UL,UR,CORE(1))
      CALL SSG2A (PA,PL,PR,PVECT)
      CALL SSG2B (D,PL,PR,QR,1,IPREC,-1,SR4)
  130 RETURN
      END
