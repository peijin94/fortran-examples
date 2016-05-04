!*************************
!author    pjer
!date      2016-5-4
!abstract  taylor sum
!*************************

    program Console63

    implicit none
    integer i
    real e,t,factorial
    i=0;e=1;t=1
    do while(t<1d8)
        i=i+1
        t=factorial(i)
        e=e+1/t
    enddo
    write(*,*) e
    end program Console63
    real function factorial(n)
    implicit none
    integer n,i
    factorial=1
    do i=1,n
        factorial=factorial*i
    enddo
    end
