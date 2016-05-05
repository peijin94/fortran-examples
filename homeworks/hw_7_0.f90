!*************************
!author    pjer
!date      2016-5-5
!abstract  vert num calc
!*************************

program main

    implicit none
    integer i,j,k
    do i=1,50
        do j=1,i
            do k=j,i
                if (j**2+k**2==i**2) write(*,10)j,k,i
            enddo
        enddo
    enddo
10  format(1x,i2,"^2+",i2,"^2=",i2,"^2")

    end program main

