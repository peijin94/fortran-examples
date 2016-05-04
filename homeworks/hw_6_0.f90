!*************************
!author    pjer
!date      2016-5-4
!abstract  factor
!*************************
    program Console60

    implicit none
    integer a,b,c,num
    read(*,*) a,b
    if(a<b)then
        c=a;a=b;b=c
    end if          !make sure a>b
    print*,num(a,b)
    
    end program Console60
    integer recursive function num(a,b)result(num1)
    implicit none
    integer a,b
    if(mod(a,b)==0)then
        num1=b
    else
        num1=num(b,mod(a,b))
    endif
    end
    
