!*************************
!author    pjer
!date      2016-5-4
!abstract  case select
!*************************
    program Console3_2

    implicit none

    ! Variables

    ! Body of Console3_2
    integer x
    read*,x
    select case(x)
        case(1,4)
            print*,"News"
        case(2,5)
            print*,"TV play"
        case(3,6)
            print*,"Cartoon"
        case(7)
            print*,"Movie"
        case default
            print*,"error"
    end select

    end program Console3_2

