!*************************
!author    pjer
!date      2016-5-4
!abstract  goto circle
!*************************
    program Console3_4

    implicit none

    ! Variables

    ! Body of Console3_4
    integer x,s
    x=0
    s=0
100 x=x+1
    s=s+x    
    if(x<100)goto 100
    print*,"s=",s

    end program Console3_4

