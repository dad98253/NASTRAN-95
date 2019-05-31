      FUNCTION MAPFNS (I)
C
C     THIS FUNCTION PROVIDES ENTRIES FOR VARIOUS FUNCTIONS
C     ON THE VAX VERSION OF NASTRAN
C     (THIS ROUTINE WAS PREVIOUSLY CALLED 'VAXFNS')
C
      INTEGER AND, ANDF, COMPLF, ORF, RSHIFT, XORF
      COMMON /MACHIN/ M(3), LQRO
C
      MAPFNS = 0
      RETURN
C
      ENTRY AND (I,J)
C     ==============
      AND = IAND(I,J)
      RETURN
C
      ENTRY ANDF (I,J)
C     ================
      ANDF = IAND(I,J)
      RETURN
C
      ENTRY COMPLF (I)
C     ================
      COMPLF = NOT(I)
      RETURN
C
      ENTRY LSHIFT (I,J)
C     ==================
      LSHIFT = ISHFT(I,J)
      RETURN
C
      ENTRY ORF (I,J)
C     ===============
      ORF = IOR (I,J)
      RETURN
C
      ENTRY RSHIFT (I,J)
C     ==================
      RSHIFT = ISHFT(I,-J)
      RETURN
C
      ENTRY XORF (I,J)
C     ================
      XORF = IEOR (I,J)
      RETURN
C
      END

      integer(kind=8) FUNCTION LOCFX (I)
c      FUNCTION LOCFX (I)
C
C
      COMMON /MACHIN/ M(3), LQRO
C
C
C     ===============
      K = LQRO/1000
      LOCFX = LOC(I)/K
      RETURN
      END

      
