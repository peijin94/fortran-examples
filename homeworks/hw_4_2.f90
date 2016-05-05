!*************************
!author    pjer
!date      2016-5-4
!abstract  numerial sin
!*************************

	program main
	use typedef
    implicit none
    integer::i
    real(sp):: x,sinx,t,y
    write(*,*) '************************'
    write(*,*) 'input x and precision:'
    read(*,*),x,t
    i=1
    x=x*PI/180.
    sinx=x
    y=x
    do
        i=i+2
        y=-y*x*x/(i-1)/i
        sinx=sinx+y
        if(abs(y)<t) exit
    end do    
    write(*,*) '************************'
    write(*,*) '[do] version'
    print*,"sinx=",sinx 
    i=1

    sinx=x
    y=x                  
    do while(abs(y)>=t)
        i=i+2
        y=-y*x*x/(i-1)/i
        sinx=sinx+y
    end do
    write(*,*) '[do-while] version'
    print*,"sinx=",sinx  
    print*,"sinx=",sin(x)
    end program main