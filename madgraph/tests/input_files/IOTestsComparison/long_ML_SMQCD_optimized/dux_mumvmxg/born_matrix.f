      SUBROUTINE ML5_0_SMATRIXHEL(P,HEL,ANS)
      IMPLICIT NONE
C     
C     CONSTANT
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=5)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=32)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
      INTEGER HEL
C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/ML5_0_HELUSERCHOICE/USERHEL
C     ----------
C     BEGIN CODE
C     ----------
      USERHEL=HEL
      CALL ML5_0_SMATRIX(P,ANS)
      USERHEL=-1

      END

      SUBROUTINE ML5_0_SMATRIX(P,ANS)
C     
C     Generated by MadGraph5_aMC@NLO v. %(version)s, %(date)s
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     MadGraph5_aMC@NLO StandAlone Version
C     
C     Returns amplitude squared summed/avg over colors
C     and helicities
C     for the point in phase space P(0:3,NEXTERNAL)
C     
C     Process: d u~ > m- vm~ g QED=2 QCD=1 [ virt = QCD ]
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=5)
      INTEGER                 NCOMB
      PARAMETER (             NCOMB=32)
      INTEGER HELAVGFACTOR
      PARAMETER (HELAVGFACTOR=4)
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL),ANS
C     
C     LOCAL VARIABLES 
C     
      INTEGER NHEL(NEXTERNAL,NCOMB),NTRY
      REAL*8 T
      REAL*8 MATRIX
      INTEGER IHEL,IDEN, I
      INTEGER JC(NEXTERNAL)
      LOGICAL GOODHEL(NCOMB)
      DATA NTRY/0/
      DATA GOODHEL/NCOMB*.FALSE./

C     
C     GLOBAL VARIABLES
C     
      INTEGER USERHEL
      COMMON/ML5_0_HELUSERCHOICE/USERHEL
      DATA USERHEL/-1/

      DATA (NHEL(I,   1),I=1,5) /-1,-1,-1,-1,-1/
      DATA (NHEL(I,   2),I=1,5) /-1,-1,-1,-1, 1/
      DATA (NHEL(I,   3),I=1,5) /-1,-1,-1, 1,-1/
      DATA (NHEL(I,   4),I=1,5) /-1,-1,-1, 1, 1/
      DATA (NHEL(I,   5),I=1,5) /-1,-1, 1,-1,-1/
      DATA (NHEL(I,   6),I=1,5) /-1,-1, 1,-1, 1/
      DATA (NHEL(I,   7),I=1,5) /-1,-1, 1, 1,-1/
      DATA (NHEL(I,   8),I=1,5) /-1,-1, 1, 1, 1/
      DATA (NHEL(I,   9),I=1,5) /-1, 1,-1,-1,-1/
      DATA (NHEL(I,  10),I=1,5) /-1, 1,-1,-1, 1/
      DATA (NHEL(I,  11),I=1,5) /-1, 1,-1, 1,-1/
      DATA (NHEL(I,  12),I=1,5) /-1, 1,-1, 1, 1/
      DATA (NHEL(I,  13),I=1,5) /-1, 1, 1,-1,-1/
      DATA (NHEL(I,  14),I=1,5) /-1, 1, 1,-1, 1/
      DATA (NHEL(I,  15),I=1,5) /-1, 1, 1, 1,-1/
      DATA (NHEL(I,  16),I=1,5) /-1, 1, 1, 1, 1/
      DATA (NHEL(I,  17),I=1,5) / 1,-1,-1,-1,-1/
      DATA (NHEL(I,  18),I=1,5) / 1,-1,-1,-1, 1/
      DATA (NHEL(I,  19),I=1,5) / 1,-1,-1, 1,-1/
      DATA (NHEL(I,  20),I=1,5) / 1,-1,-1, 1, 1/
      DATA (NHEL(I,  21),I=1,5) / 1,-1, 1,-1,-1/
      DATA (NHEL(I,  22),I=1,5) / 1,-1, 1,-1, 1/
      DATA (NHEL(I,  23),I=1,5) / 1,-1, 1, 1,-1/
      DATA (NHEL(I,  24),I=1,5) / 1,-1, 1, 1, 1/
      DATA (NHEL(I,  25),I=1,5) / 1, 1,-1,-1,-1/
      DATA (NHEL(I,  26),I=1,5) / 1, 1,-1,-1, 1/
      DATA (NHEL(I,  27),I=1,5) / 1, 1,-1, 1,-1/
      DATA (NHEL(I,  28),I=1,5) / 1, 1,-1, 1, 1/
      DATA (NHEL(I,  29),I=1,5) / 1, 1, 1,-1,-1/
      DATA (NHEL(I,  30),I=1,5) / 1, 1, 1,-1, 1/
      DATA (NHEL(I,  31),I=1,5) / 1, 1, 1, 1,-1/
      DATA (NHEL(I,  32),I=1,5) / 1, 1, 1, 1, 1/
      DATA IDEN/36/
C     ----------
C     BEGIN CODE
C     ----------
      NTRY=NTRY+1
      DO IHEL=1,NEXTERNAL
        JC(IHEL) = +1
      ENDDO
      ANS = 0D0
      DO IHEL=1,NCOMB
        IF (USERHEL.EQ.-1.OR.USERHEL.EQ.IHEL) THEN
          IF (GOODHEL(IHEL) .OR. NTRY .LT. 20) THEN
            T=MATRIX(P ,NHEL(1,IHEL),JC(1))
            ANS=ANS+T
            IF (T .NE. 0D0 .AND. .NOT.    GOODHEL(IHEL)) THEN
              GOODHEL(IHEL)=.TRUE.
            ENDIF
          ENDIF
        ENDIF
      ENDDO
      ANS=ANS/DBLE(IDEN)
      IF(USERHEL.NE.-1) THEN
        ANS=ANS*HELAVGFACTOR
      ENDIF
      END


      REAL*8 FUNCTION MATRIX(P,NHEL,IC)
C     
C     Generated by MadGraph5_aMC@NLO v. %(version)s, %(date)s
C     By the MadGraph5_aMC@NLO Development Team
C     Visit launchpad.net/madgraph5 and amcatnlo.web.cern.ch
C     
C     Returns amplitude squared summed/avg over colors
C     for the point with external lines W(0:6,NEXTERNAL)
C     
C     Process: d u~ > m- vm~ g QED=2 QCD=1 [ virt = QCD ]
C     
      IMPLICIT NONE
C     
C     CONSTANTS
C     
      INTEGER    NGRAPHS
      PARAMETER (NGRAPHS=2)
      INTEGER    NEXTERNAL
      PARAMETER (NEXTERNAL=5)
      INTEGER    NWAVEFUNCS, NCOLOR
      PARAMETER (NWAVEFUNCS=7, NCOLOR=1)
      REAL*8     ZERO
      PARAMETER (ZERO=0D0)
      COMPLEX*16 IMAG1
      PARAMETER (IMAG1=(0D0,1D0))
C     
C     ARGUMENTS 
C     
      REAL*8 P(0:3,NEXTERNAL)
      INTEGER NHEL(NEXTERNAL), IC(NEXTERNAL)
C     
C     LOCAL VARIABLES 
C     
      INTEGER I,J
      COMPLEX*16 ZTEMP
      REAL*8 DENOM(NCOLOR), CF(NCOLOR,NCOLOR)
      COMPLEX*16 AMP(NGRAPHS), JAMP(NCOLOR)
      COMPLEX*16 W(18,NWAVEFUNCS)
      COMPLEX*16 DUM0,DUM1
      DATA DUM0, DUM1/(0D0, 0D0), (1D0, 0D0)/
C     
C     GLOBAL VARIABLES
C     
      INCLUDE 'coupl.inc'

C     
C     COLOR DATA
C     
      DATA DENOM(1)/1/
      DATA (CF(I,  1),I=  1,  1) /    4/
C     1 T(5,2,1)
C     ----------
C     BEGIN CODE
C     ----------
      CALL IXXXXX(P(0,1),ZERO,NHEL(1),+1*IC(1),W(1,1))
      CALL OXXXXX(P(0,2),ZERO,NHEL(2),-1*IC(2),W(1,2))
      CALL OXXXXX(P(0,3),ZERO,NHEL(3),+1*IC(3),W(1,3))
      CALL IXXXXX(P(0,4),ZERO,NHEL(4),-1*IC(4),W(1,4))
      CALL VXXXXX(P(0,5),ZERO,NHEL(5),+1*IC(5),W(1,5))
      CALL FFV1_2(W(1,1),W(1,5),GC_5,ZERO,ZERO,W(1,6))
      CALL FFV2_3(W(1,4),W(1,3),GC_47,MDL_MW,MDL_WW,W(1,7))
C     Amplitude(s) for diagram number 1
      CALL FFV2_0(W(1,6),W(1,2),W(1,7),GC_47,AMP(1))
      CALL FFV1_1(W(1,2),W(1,5),GC_5,ZERO,ZERO,W(1,6))
C     Amplitude(s) for diagram number 2
      CALL FFV2_0(W(1,1),W(1,6),W(1,7),GC_47,AMP(2))
      JAMP(1)=-AMP(1)-AMP(2)

      MATRIX = 0.D0
      DO I = 1, NCOLOR
        ZTEMP = (0.D0,0.D0)
        DO J = 1, NCOLOR
          ZTEMP = ZTEMP + CF(J,I)*JAMP(J)
        ENDDO
        MATRIX = MATRIX+ZTEMP*DCONJG(JAMP(I))/DENOM(I)
      ENDDO

      END

