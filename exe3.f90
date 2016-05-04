!  exe3.f90 
!
!  FUNCTIONS:
!  exe3 - Entry point of console application.
!

!****************************************************************************
!
!  PROGRAM: exe3
!
!  PURPOSE:  Entry point for the console application.
!
!****************************************************************************

    program exe3

    implicit none

    ! Variables
    integer :: i,j,k,a(10)=0
    ! Body of exe3
    i = 10
    j = 1
    a(10) = 1
    do k=1,100
        i = mod((i+j-1),10)+1
        a(i)=1
        j = j+1
    enddo
    do i=1,10
        if(a(i).eq.0) print*,i
    enddo
    pause
    end program exe3

