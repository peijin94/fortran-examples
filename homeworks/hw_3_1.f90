!*************************
!author    pjer
!date      2016-5-4
!abstract  sectioned func
!*************************

    program Console31

    implicit none

    ! Variables

    ! Body of Console31
    real x,y
    read*,x
    if(x<1000)then
        y=0.03*x
    else if(x<5000)then
        y=0.1*(x-1000)+30
    else
        y=0.15*(x-5000)+430
    end if
    print*,y
    

    end program Console31

