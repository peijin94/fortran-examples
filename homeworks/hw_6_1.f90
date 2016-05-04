!*************************
!author    pjer
!date      2016-5-4
!abstract  vec cross
!*************************
    program Console61
    implicit none
    real::a(1:3),b(1:3),c(1:3)
    integer::i
    read(*,*) a
    read(*,*) b
    call cross(a,b,c)
    write(*,*) c
    end program Console61
    
    subroutine cross(a,b,c)
       implicit none
       real::a(1:3),b(1:3),c(1:3)
       c(1)=a(2)*b(3)-a(3)*b(2)
       c(2)=a(3)*b(1)-a(1)*b(3)
       c(3)=a(1)*b(2)-a(2)*b(1)
    end
