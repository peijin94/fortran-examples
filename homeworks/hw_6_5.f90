!*************************
!author    pjer
!date      2016-5-4
!abstract  narcissistic num
!*************************

    program Console65

    implicit none
    integer i,f
    do i=100,999
        if(f(i)==i) print*,i
    enddo
    end program Console65
    
    integer function f(n)
    integer a(1:3),n
    a(1)=n/100
    a(2)=(n-a(1)*100)/10
    a(3)=n-a(1)*100-a(2)*10
    f=a(1)**3+a(2)**3+a(3)**3
    end
    

